unit HelpUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Cod.Visual.Button, Cod.SysUtils, ShellAPI, Vcl.Clipbrd, Vcl.TitleBarCtrls,
  IOUtils, SetupUnit;

type
  THelpForm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    UserContain: TPanel;
    UserIcon: TLabel;
    CButton1: CButton;
    CButton2: CButton;
    CButton3: CButton;
    CButton4: CButton;
    TitleBarPanel1: TTitleBarPanel;
    procedure HelpSelection(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HelpForm: THelpForm;

implementation

{$R *.dfm}

procedure THelpForm.FormCreate(Sender: TObject);
begin
  // Titlebar
  with CustomTitleBar do
    begin
      Enabled := true;
      Control := TitleBarPanel1;

      SystemColors := false;
      SystemButtons := false;

      CaptionAlignment := taCenter;

      ShowIcon := false;

      PrepareCustomTitleBar(TForm(Self), clBtnFace, clBlack);
    end;
end;

procedure THelpForm.HelpSelection(Sender: TObject);
var
  FileName: string;
begin
  // Case of help
  case CButton(Sender).Tag of
    1: begin
      ShellExecute(0, 'open', 'powershell', nil, nil, 1);

      Clipboard.AsText := 'Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}';


      Sleep(500);
      SimulateKeyPress32( 86, [ssCtrl], false);

      SimulateKeyPress32( 13, [], true);
    end;
    2: ShellRun('https://github.com/Codrax', false);
    3: begin
      FileName := AppData + 'setup.log';

      if TFile.Exists( FileName ) then
        ShellRun( FileName, false )
      else
        Setup.MsgDialog('File not found', 'There is no log file to be found at at:'#13 + FileName);
    end;
    4: ShellRun('https://codrutsoftware.cf/', false);
  end;
end;

end.
