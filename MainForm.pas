unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Cod.Animations,
  Vcl.ExtCtrls, Cod.ColorUtils, Cod.Visual.Button, BlankBG, SetupUnit, HelpUI;

type
  TPrepareForm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    AnimTick: TTimer;
    UserContain: TPanel;
    UserIcon: TLabel;
    CButton1: CButton;
    CButton2: CButton;
    CButton3: CButton;
    CButton4: CButton;
    procedure FormCreate(Sender: TObject);
    procedure AnimTickTimer(Sender: TObject);
    procedure MoveFormBy(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StartSelection(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  Tranzitions: TArray<string> = [#$E753, #$F1AD, #$F7BB, #$F158, #$F133, #$F0B9, #$ED59, #$EC44];

var
  PrepareForm: TPrepareForm;

  AnItem: integer;
  AnProgress: integer;

implementation

{$R *.dfm}

procedure TPrepareForm.StartSelection(Sender: TObject);
var
  Option: integer;
begin
  Option := CButton(Sender).tag;

  // Anim
  AnimTick.Enabled := false;

  // Exit
  if Option = 3 then
    begin
      Self.Close;

      Exit;
    end;

  // Help
  if Option = 4 then
    begin
      HelpForm := THelpForm.Create(Application);
      try
        HelpForm.ShowModal;
      finally
        HelpForm.Free;
      end;

      Exit;
    end;

  // Backdrop
  if Option = 1 then
    begin
      Backdrop.Show;

      Backdrop.AnimFade.Enabled := true;
    end
  else
    begin
      Setup.PrepareForm(true);
    end;

  // UI
  Hide;
end;

procedure TPrepareForm.FormCreate(Sender: TObject);
begin
  // Animation
  AnItem := 0;
  AnProgress := 0;
end;

procedure TPrepareForm.MoveFormBy(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Self.Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
end;

procedure TPrepareForm.AnimTickTimer(Sender: TObject);
var
  Opaq: integer;
begin
  Inc(AnProgress);

  Opaq := 0;
  if AnProgress > 50 then
    Opaq := (AnProgress - 50) * 2;
  if AnProgress < -50 then
    Opaq := (abs(AnProgress) - 50) * 2;

  // Opacity
  UserIcon.Font.Color := ColorBlend(Self.Color, clBlack, Opaq);

  // Reset
  if AnProgress >= 100 then
    begin
      AnProgress := -100;
      Inc(AnItem);

      if AnItem > High(Tranzitions) then
        AnItem := 0;

      UserIcon.Caption := Tranzitions[AnItem];
    end;
end;

end.
