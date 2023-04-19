unit BlankBG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cod.Visual.Button, Vcl.Imaging.pngimage,
  Cod.Visual.Image, Vcl.ExtCtrls, Math, Cod.Animations, SetupUnit,
  Cod.Visual.GlassBlur;

type
  TBackdrop = class(TForm)
    Logo: CImage;
    AnimFade: TTimer;
    TheBackground: CImage;
    BackInit: TTimer;
    FinalFade: TTimer;
    AeroBlurGlass: CGlassBlur;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AnimFadeTimer(Sender: TObject);
    procedure BackInitTimer(Sender: TObject);
    procedure FinalFadeTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RecenterLogo;
    procedure InitiateBackground;
  end;

const
  TOTAL_STEP = 255;
  START_STEP = 200;

var
  Backdrop: TBackdrop;

  TheAnim: integer;
  MaxSize: integer;

implementation

{$R *.dfm}

procedure TBackdrop.AnimFadeTimer(Sender: TObject);
begin
  Inc(TheAnim);

  Logo.Opacity := round(((TheAnim - START_STEP) / (TOTAL_STEP - START_STEP)) * 255);

  Logo.Width := trunc( Power( MaxSize, TheAnim / TOTAL_STEP) );
  Logo.Height := Logo.Width;

  RecenterLogo;

  if TheAnim >= TOTAL_STEP then
    begin
      AnimFade.Enabled := false;

      BackInit.Enabled := true;
    end;
end;

procedure TBackdrop.BackInitTimer(Sender: TObject);
begin
  InitiateBackground;
  BackInit.Enabled := false;
end;

procedure TBackdrop.FinalFadeTimer(Sender: TObject);
begin
  Dec(TheAnim);

  AlphaBlendValue := trunc((TheAnim / 100) * 255);

  if TheAnim <= 0 then
    begin
      FinalFade.Enabled := true;

      Application.MainForm.Close;
    end;
end;

procedure TBackdrop.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Setup.Visible or Setup.StartAttention.Enabled or AnimFade.Enabled then
    CanClose := false;
end;

procedure TBackdrop.FormCreate(Sender: TObject);
begin
  TheAnim := START_STEP;
  MaxSize := round(Height / 2.2);

  Logo.Width := 1;
  Logo.Height := 1;
end;

procedure TBackdrop.FormResize(Sender: TObject);
begin
  RecenterLogo;
end;

procedure TBackdrop.InitiateBackground;
var
  Anim: TIntAni;
begin
  // Background
  TheBackground.BringToFront;
  TheBackground.Opacity := 0;
  TheBackground.Show;

  Anim := TIntAni.Create;

  Anim.Duration := 10;
  Anim.Step := 10;

  Anim.AniKind := akIn;
  Anim.AniFunctionKind := afkExpo;

  Anim.StartValue := 0;
  Anim.DeltaValue := 255;

  Anim.OnSync := procedure(Value: integer)
  begin
    TheBackground.Opacity := Value;
  end;

  Anim.FreeOnTerminate := true;
  Anim.Start;

  // Initate 2nd Form
  Setup.PrepareForm(false);
end;

procedure TBackdrop.RecenterLogo;
begin
  Logo.Left := Width div 2 - Logo.Width div 2;
  Logo.Top := Height div 2 - Logo.Height div 2;
end;

end.
