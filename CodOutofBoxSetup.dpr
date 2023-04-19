program CodOutofBoxSetup;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {PrepareForm},
  BlankBG in 'BlankBG.pas' {Backdrop},
  SetupUnit in 'SetupUnit.pas' {Setup},
  HelpUI in 'HelpUI.pas' {HelpForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrepareForm, PrepareForm);
  Application.CreateForm(TBackdrop, Backdrop);
  Application.CreateForm(TSetup, Setup);
  Application.Run;
end.
