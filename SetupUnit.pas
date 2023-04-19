unit SetupUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Math, Vcl.TitleBarCtrls,
  Cod.Visual.Button, Cod.Dialogs, Cod.SysUtils, Cod.Types, ShellAPI,
  Cod.Visual.Image, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Cod.ColorUtils, Cod.Visual.CheckBox, Vcl.ControlList,
  CFX.Checkbox, Vcl.VirtualImage, Vcl.Imaging.jpeg, Cod.Files, IOUtils,
  Cod.visual.GlassBlur, Cod.Visual.Slider, CFX.StandardIcons, Cod.Registry;

type
  TInsItem = record
    Name: string;
    Img: integer;

    Description: string;

    Unins: string;
    Params: string;

    Toggled: boolean;
  end;

  TSetup = class(TForm)
    StartAttention: TTimer;
    Panel1: TPanel;
    BottomNavigation: TPanel;
    Panel3: TPanel;
    CButton5: CButton;
    CButton4: CButton;
    CButton3: CButton;
    Button_Prev: CButton;
    Button_Next: CButton;
    Shape1: TShape;
    Panel4: TPanel;
    ImageContainer: TPanel;
    Preview: CImage;
    Items: TPanel;
    PageTitle: TLabel;
    PanelsContainer: TPanel;
    Image1: TImage;
    ItemsImages: TImageCollection;
    SwitchNewPicture: TTimer;
    Panel_Install: TPanel;
    Panel_Uninstall: TPanel;
    Panel_Presets: TPanel;
    CButton1: CButton;
    CButton2: CButton;
    CButton6: CButton;
    CButton7: CButton;
    Label1: TLabel;
    Label2: TLabel;
    UninstallList: TControlList;
    FXCheckBox1: FXCheckBox;
    Label3: TLabel;
    UninsImages: TImageCollection;
    VirtualImage1: TVirtualImage;
    InsImages: TImageCollection;
    InstallList: TControlList;
    FXCheckBox2: FXCheckBox;
    Label4: TLabel;
    VirtualImage2: TVirtualImage;
    Panel_Personalise: TPanel;
    Label5: TLabel;
    Personalise_DarkApps: CCheckBox;
    Personalise_DarkSystem: CCheckBox;
    Label6: TLabel;
    Panel5: TPanel;
    CImage4: CImage;
    CImage3: CImage;
    CImage2: CImage;
    CImage1: CImage;
    StockWallpapers: TImageCollection;
    Panel_Explorer: TPanel;
    Label7: TLabel;
    Explorer_Hidden: CCheckBox;
    Explorer_Extensions: CCheckBox;
    Explorer_system: CCheckBox;
    Explorer_Checkboxes: CCheckBox;
    Label8: TLabel;
    Explorer_To: TComboBox;
    Explorer_encrypt: CCheckBox;
    Panel_Tweaks: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Tweaks_meetNow: CCheckBox;
    Tweaks_AlignTB: TComboBox;
    Tweaks_Search: TComboBox;
    Label11: TLabel;
    Panel_Tools: TPanel;
    Label14: TLabel;
    Panel_Confirm: TPanel;
    Label16: TLabel;
    Panel6: TPanel;
    CImage5: CImage;
    Label15: TLabel;
    Panel7: TPanel;
    CImage6: CImage;
    Label17: TLabel;
    Panel8: TPanel;
    CImage7: CImage;
    Label18: TLabel;
    Panel9: TPanel;
    CImage8: CImage;
    Label19: TLabel;
    CButton8: CButton;
    CButton9: CButton;
    CButton10: CButton;
    CButton11: CButton;
    Panel_Applying: TPanel;
    Label20: TLabel;
    Panel_Done: TPanel;
    Label21: TLabel;
    Panel10: TPanel;
    Progress1: FXStandardIcon;
    Label22: TLabel;
    Panel11: TPanel;
    Label23: TLabel;
    Progress2: FXStandardIcon;
    Panel12: TPanel;
    Label24: TLabel;
    Progress3: FXStandardIcon;
    Panel13: TPanel;
    Label25: TLabel;
    Progress4: FXStandardIcon;
    Panel14: TPanel;
    Label26: TLabel;
    Progress5: FXStandardIcon;
    Panel15: TPanel;
    Label27: TLabel;
    WorkStatus: TLabel;
    ApplyStep: TTimer;
    Label12: TLabel;
    Personalise_StarMenu: CSlider;
    Label13: TLabel;
    Tweaks_Widgets: CCheckBox;
    CButton12: CButton;
    procedure FormCreate(Sender: TObject);
    procedure StartAttentionTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SubButtonClick(Sender: TObject);
    procedure PageNav(Sender: TObject);
    procedure SwitchNewPictureTimer(Sender: TObject);
    procedure PresetSelector(Sender: TObject);
    procedure UninstallListBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure UninstallListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InstallListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InstallListBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure CImage1Click(Sender: TObject);
    procedure ToolsLink(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CButton12Click(Sender: TObject);
    procedure InstallListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UninstallListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  protected
    { Protected declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrepareForm(Dialog: boolean);
    procedure PrepareTitlebar(Dialog: boolean);

    procedure LoadPageData(Index: integer);
    procedure FinishStep;

    procedure StartInstalation;

    procedure FinishSetup;

    function BooleantoDWORD(Value: boolean): integer;

    function PageCount: integer;
    procedure OpenPage(Index: integer; Instant: boolean = false);

    function MsgDialog(const Title, Text: string; Kind: CMessageType = ctInformation;
                       Buttons: TMsgDlgButtons = [mbOk]): integer;
  end;

const
  MAX_POS = 50;

  // Constant Information
  PAGES_NAMES: TArray<string> = ['Select Preset', 'Install Apps',
      'Remove Bloatware', 'Personalise', 'Windows Explorer', 'System Tweaks',
      'Tools', 'All Ready?', 'Applying your settings', 'Everything is done!'];

var
  UninstallItems: array[0..22] of TInsItem = (
    (Name:'Microsoft OneDrive';
      Img: 1;

      Unins:'';
      Params:'onedrive';
    ),
    (Name:'Microsoft Edge';
      Img: 2;

      Unins:'Get-AppxPackage -AllUsers Microsoft.MicrosoftEdge.Stable | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Microsoft Cortana';
      Img: 3;

      Unins:'Get-AppxPackage -AllUsers Microsoft.549981C3F5F10 | Remove-AppPackage';
      Params:'';
    ),
    (Name:'3D Viewer';
      Img: 4;

      Unins:'Get-AppxPackage -AllUsers Microsoft.Microsoft3DViewer | Remove-AppPackage';
      Params:'';
    ),
    (Name:'Movies & TV';
      Img: 5;

      Unins:'Get-AppxPackage -AllUsers Microsoft.ZuneVideo | Remove-AppPackage';
      Params:'';
    ),
    (Name:'Feedback Hub';
      Img: 6;

      Unins:'Get-AppxPackage -AllUsers Microsoft.WindowsFeedbackHub | Remove-AppPackage';
      Params:'';
    ),
    (Name:'Mail & Calendar';
      Img: 7;

      Unins:'Get-AppxPackage -AllUsers *windowscommunicationsapps* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Office 365';
      Img: 8;

      Unins:'Get-AppxPackage -AllUsers *officehub* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Mixed Reality Portal';
      Img: 9;

      Unins:'Get-AppxPackage -AllUsers *mixedreality* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'One Note';
      Img: 10;

      Unins:'Get-AppxPackage -AllUsers *onenote* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Paint 3D';
      Img: 11;

      Unins:'Get-AppxPackage -AllUsers Microsoft.MsPaint | Remove-AppxPackage';
      Params:'';
      // Microsoft.MsPaint is Paint 3d and Microsoft.Paint is Normal Paint :|
    ),
    (Name:'Skype';
      Img: 12;

      Unins:'Get-AppxPackage -AllUsers *skype* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Solitare';
      Img: 13;

      Unins:'Get-AppxPackage -AllUsers *microsoftsolitaire* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Tips';
      Img: 14;

      Unins:'Get-AppxPackage -AllUsers *getstarted* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Weather';
      Img: 15;

      Unins:'Get-AppxPackage -AllUsers *bingweather* | Remove-AppPackage';
      Params:'';
    ),
    (Name:'Xbox';
      Img: 16;

      Unins:'Get-AppxPackage -AllUsers *gamingapp* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'News';
      Img: 17;

      Unins:'Get-AppxPackage -AllUsers *bingnews* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Windows Maps';
      Img: 18;

      Unins:'Get-AppxPackage -AllUsers *windowsmaps* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Getting Started';
      Img: 19;

      Unins:'Get-AppxPackage -AllUsers *getstarted* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Clip Champ';
      Img: 20;

      Unins:'Get-AppxPackage -AllUsers *clipchamp* | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Microsoft Teams';
      Img: 21;

      Unins:'Get-AppxPackage -AllUsers MicrosoftTeams | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Get Help';
      Img: 22;

      Unins:'Get-AppxPackage -AllUsers Microsoft.GetHelp | Remove-AppxPackage';
      Params:'';
    ),
    (Name:'Microsoft Whiteboard';
      Img: 23;

      Unins:'Get-AppxPackage -AllUsers Microsoft.Whiteboard | Remove-AppxPackage';
      Params:'';
    )
    );

  InstallItems: array[0..9] of TInsItem = (
    (Name:'Firefox';
      Img: 1;

      Unins:'winget install Mozilla.Firefox';
      Params:'';
    ),
    (Name:'7 Zip';
      Img: 2;

      Unins:'winget install 7Zip.7Zip';
      Params:'';
    ),
    (Name:'Virus Total Uploader';
      Img: 3;

      Unins:'winget install VirusTotal.VirusTotalUploader';
      Params:'';
    ),
    (Name:'Discord';
      Img: 4;

      Unins:'';
      Params:'winget install Discord.Discord';
    ),
    (Name:'Steam';
      Img: 5;

      Unins:'winget install Valve.Steam';
      Params:'';
    ),
    (Name:'Power Toys';
      Img: 6;

      Unins:'winget install Microsoft.PowerToys';
      Params:'';
    ),
    (Name:'Epic Games';
      Img: 7;

      Unins:'EpicGames.EpicGamesLauncher';
      Params:'';
    ),
    (Name:'Chrome (non privacy focused)';
      Img: 8;

      Unins:'winget install Google.Chrome';
      Params:'';
    ),
    (Name:'Cinebench';
      Img: 9;

      Unins:'winget install Cinebench';
      Params:'';
    ),
    (Name:'Free Download Manager';
      Img: 10;

      Unins:'winget install SoftDeluxe.FreeDownloadManager';
      Params:'';
    )
    );


  Setup: TSetup;

  // Log
  AppLog: TStringList;

  EnableDebugConsole: boolean;

  // System
  DebugMode: boolean;
  AppData: string;

  // UI Variabiles
  IsDialog: boolean;

  CurrentPage: integer;

  AnimPosition: integer;
  SwitchProgress: integer;

  TheWorkPanel: TPanel;
  TTB: TTitleBarPanel;

implementation

uses
  BlankBG;

{$R *.dfm}

function TSetup.MsgDialog(const Title, Text: string; Kind: CMessageType;
  Buttons: TMsgDlgButtons): integer;
var
  Dialog: CDialog;
begin
  Dialog := CDialog.Create;

  // Text
  Dialog.Title := Title;
  Dialog.Text := Text;

  // Colors & Design
  Dialog.EnableFooter := false;
  Dialog.GlobalSyncTogle := false;

  Dialog.FormColor := clWhite;
  Dialog.TextFont.Color := clBlack;

  Dialog.ButtonDesign.Preset.Kind := cbprCustom;
  Dialog.ButtonDesign.Preset.Color := GetAccentColor(true);
  Dialog.ButtonDesign.UnderLine.Enable := false;

  // Dialog
  Dialog.Buttons := Buttons;
  Dialog.Kind := Kind;

  // Execute
  Result := Dialog.Execute;

  Dialog.Free;
end;

procedure TSetup.OpenPage(Index: integer; Instant: boolean);
var
  I: integer;
begin
  if Index = PageCount then
    FinishSetup;

  if (Index < 0) or (Index >= PageCount) then
    Exit;

  // Debug
  if DebugMode then
    Instant := DebugMode;

  // Select
  CurrentPage := Index;

  // Buttons
  Button_Prev.Visible := (CurrentPage > 0) and (CurrentPage < PageCount - 1);

  if CurrentPage = PageCount - 1 then
    Button_Next.Text := 'Finish'
  else
    Button_Next.Text := 'Next';

  // Panel
  TheWorkPanel := nil;
  with PanelsContainer do
    for I := 0 to ControlCount - 1 do
      if Controls[I] is TPanel then
        with TPanel(Controls[I]) do
        begin
          Visible := false;

          if Tag = CurrentPage then
            TheWorkPanel := TPanel(PanelsContainer.Controls[I]);
        end;

  // Title and Image Animation
  SwitchNewPicture.Enabled := false;
  if Instant then
    begin
      LoadPageData(CurrentPage);

      if TheWorkPanel <> nil then
        TheWorkPanel.Show;

      FinishStep;
    end
  else
    begin
      SwitchProgress := -50;
      SwitchNewPicture.Enabled := true;
    end;
end;

procedure TSetup.SubButtonClick(Sender: TObject);
begin
  case CButton(Sender).Tag of
    1: if MsgDialog( 'Are you sure', 'Exit the setup?', ctQuestion, [mbYes, mbNo]) = mrYes then
      Application.MainForm.Close;
    2: ShellExecute(0, 'open', 'www.codrutsoftware.cf', nil, nil, 0);
    3: EnableDebugConsole := MsgDialog( 'Enable debug console', 'Show the command console? This will disable logging for instalations', ctQuestion, [mbYes, mbNo]) = mrYes;
  end;
end;

procedure TSetup.SwitchNewPictureTimer(Sender: TObject);
var
  Opaq: integer;
begin
  Inc(SwitchProgress);

  Opaq := 0;
  if SwitchProgress > 25 then
    Opaq := (SwitchProgress - 25) * 4;
  if SwitchProgress < -25 then
    Opaq := (abs(SwitchProgress) - 25) * 4;

  // Opacity
  PageTitle.Font.Color := ColorBlend($00F4F4F4, clBlack, 100 - Opaq);
  Preview.Opacity := trunc((Opaq / 100) * 255);

  // Switch to new data
  if SwitchProgress = 0 then
    LoadPageData(Currentpage);

  // Reset
  if SwitchProgress >= 50 then
    begin
      SwitchNewPicture.Enabled := false;

      if TheWorkPanel <> nil then
        TheWorkPanel.Show;

      FinishStep;
    end;
end;

procedure TSetup.UninstallListBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin
  Label3.Caption := UninstallItems[AIndex].Name;
  VirtualImage1.ImageIndex := UninstallItems[AIndex].Img;
  FXCheckBox1.IsChecked := UninstallItems[AIndex].Toggled;
end;

procedure TSetup.UninstallListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if UninstallList.ItemIndex <> -1 then
    if Key = 13 then
      begin
        UninstallItems[UninstallList.ItemIndex].Toggled := not UninstallItems[UninstallList.ItemIndex].Toggled;
        UninstallList.Repaint;
      end;
end;

procedure TSetup.UninstallListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if UninstallList.ScreenToClient(Mouse.CursorPos).X >= FXCheckBox1.Left then
    begin
      UninstallItems[UninstallList.HotItemIndex].Toggled := not UninstallItems[UninstallList.HotItemIndex].Toggled;
      UninstallList.Repaint;
    end;
end;

procedure TSetup.ToolsLink(Sender: TObject);
var
  Link: string;
begin
  // Open Link
  case CButton(Sender).Tag of
    1: Link := 'https://www.codrutsoftware.cf/';
    2: Link := 'https://learn.microsoft.com/en-us/sysinternals/';
    3: Link := 'https://www.nirsoft.net/';
    4: Link := 'https://winaero.com/';
  end;

  ShellExecute( 0, 'open', PChar(Link), nil, nil, 0);

  if not IsDialog then
    begin
      WindowState := wsMinimized;
      Backdrop.WindowState := wsMinimized;
    end;
end;

function TSetup.BooleantoDWORD(Value: boolean): integer;
begin
  if Value then
    Result := 1
  else
    Result := 0;
end;

procedure TSetup.CButton12Click(Sender: TObject);
begin
  // Finalise Log!
  AppLog.SaveToFile( AppData + 'setup.log' );

  // Open Log
  ShellRun(AppData + 'setup.log', false);
end;

procedure TSetup.CImage1Click(Sender: TObject);
var
  I, Index: integer;
  FileName: string;
  P: TPicture;
begin
  // Inflate
  with CImage(Sender) do
    begin
      with TPanel(Parent) do
        begin
          for I := 0 to ControlCount - 1 do
            if Controls[I] is CImage then
              if CImage(Controls[I]).Width <> 70 then
                CImage(Controls[I]).Inflate(-5, -5, -5, -5);
        end;

      Inflate(5, 5, 5, 5);

      Index := Tag - 1;
      if (Index < StockWallpapers.Count) and (Index >= 0) then
        begin
          P := TPicture.Create;
          try
            P.Assign( StockWallpapers.Images.Items[Index].SourceImages[0].Image );

            FileName := TPath.Combine(AppData, 'export_wallpaper.jpeg');
            P.SaveToFile( FileName );

            SetWallpaper(FileName);

            // Nice Effect
            if not IsDialog then
              begin
                FileName := GetWallpaperName(0, true);

                // Wait for Image to finish writing
                Sleep(500);
                if IsFileInUse(FileName) then
                  repeat
                    Sleep(1000);
                  until not IsFileInUse(FileName);

                // Show control
                Backdrop.AeroBlurGlass.Show;
                Backdrop.AeroBlurGlass.BringToFront;
                Backdrop.AeroBlurGlass.RebuildImage;
                Backdrop.AeroBlurGlass.ReDraw;
              end;
          finally
            P.Free;
          end;
        end;
    end;
end;

procedure TSetup.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

procedure TSetup.FinishSetup;
begin
  if IsDialog then
    Application.MainForm.Close
  else
    begin
      Self.AlphaBlendValue := 0;

      // Close Anim
      TheAnim := 100;
      Backdrop.FinalFade.Enabled := true;
    end;
end;

procedure TSetup.FinishStep;
begin
  // After Load
  if CurrentPage = 8 then
    begin
      StartInstalation;
    end;
end;

procedure TSetup.FormActivate(Sender: TObject);
begin
  if not IsDialog then
    if Backdrop.WindowState = wsMinimized then
      Backdrop.WindowState := wsMaximized;
end;

procedure TSetup.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.MainForm.Close;
end;

procedure TSetup.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  AnimPosition := 0;

  // Log
  AppLog := TStringList.Create;

  // Data
  AppData := GetPathInAppData('Codrut Setup', true);

  // Debug
  for I := 1 to ParamCount do
    if GetParameter(I) = '-debug' then
      DebugMode := true;


  // Uninstall Items
  UninstallList.ItemCount := Length(UninstallItems);
  InstallList.ItemCount := Length(InstallItems);

  // Fix UI Bugs
  FXCheckBox1.UpdateTheme(false);
  FXCheckBox2.UpdateTheme(false);
end;

procedure TSetup.InstallListBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin
  Label4.Caption := InstallItems[AIndex].Name;
  VirtualImage2.ImageIndex := InstallItems[AIndex].Img;
  FXCheckBox2.IsChecked := InstallItems[AIndex].Toggled;
end;

procedure TSetup.InstallListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if InstallList.ItemIndex <> -1 then
    if Key = 13 then
      begin
        InstallItems[InstallList.ItemIndex].Toggled := not InstallItems[InstallList.ItemIndex].Toggled;
        InstallList.Repaint;
      end;
end;

procedure TSetup.InstallListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if InstallList.ScreenToClient(Mouse.CursorPos).X >= FXCheckBox1.Left then
    begin
      InstallItems[InstallList.HotItemIndex].Toggled := not InstallItems[InstallList.HotItemIndex].Toggled;
      InstallList.Repaint;
    end;
end;

procedure TSetup.LoadPageData(Index: integer);
var
  BMP: TBitMap;
begin
  // Title
  PageTitle.Caption := PAGES_NAMES[CurrentPage];

  // Image
  if CurrentPage < ItemsImages.Count then
    begin
      BMP := ItemsImages.GetBitmap(CurrentPage, 512, 512);
      try
        Preview.Picture.Assign( BMP );
      finally
        BMP.Free;
      end;
    end;
end;

function TSetup.PageCount: integer;
begin
  Result := Length(PAGES_NAMES);
end;

procedure TSetup.PageNav(Sender: TObject);
begin
  // Page navigation
  if CButton(Sender).Tag = 1 then
    OpenPage( CurrentPage + 1 )
  else
    OpenPage( CurrentPage - 1 );
end;

procedure TSetup.PrepareForm(Dialog: boolean);
begin
  Show;

  if Dialog then
    FormStyle := fsNormal
  else
    FormStyle := fsStayOnTop;

  Self.StartAttention.Enabled := true;
  PrepareTitlebar(Dialog);
end;

procedure TSetup.PrepareTitlebar(Dialog: boolean);
begin
  IsDialog := Dialog;

  // Create
  TTB := TTitleBarPanel.Create(Self);
  TTB.Parent := Self;

  // Apply Settings
  with CustomTitleBar do
    begin
      Enabled := true;

      Control := TTB;
      ShowIcon := false;
      CaptionAlignment := taCenter;

      SystemColors := false;
      SystemButtons := false;
    end;

  // Dialog
  with CustomTitleBar do
    if Dialog then
      begin
        BorderIcons := [biSystemMenu];
      end
    else
      begin
        BorderIcons := [];
        SystemHeight := false;
        Control := nil;

        ShowCaption := false;
        ShowIcon := false;
        SystemButtons := false;

        Height := 1;
      end;

  // Page
  OpenPage(0, true);
end;

procedure TSetup.PresetSelector(Sender: TObject);
var
  I: Integer;
begin
  // Apply a base preset beforehand
  (* Install *)
  for I := 0 to High(InstallItems) do
    InstallItems[I].Toggled := true;

  (* Uninstall *)
  for I := 0 to High(UninstallItems) do
    UninstallItems[I].Toggled := true;

  (* Personalise *)
  Personalise_DarkSystem.Checked := true;
  Personalise_DarkApps.Checked := true;
  Personalise_StarMenu.Position := 1;

  (* Explorer *)
  Explorer_Extensions.Checked := true;
  Explorer_Checkboxes.Checked := true;
  Explorer_Hidden.Checked := true;
  Explorer_system.Checked := false;

  Explorer_encrypt.Checked := true;

  Explorer_To.ItemIndex := 0;

  (* Tweaks *)
  Tweaks_Widgets.Checked := true;
  Tweaks_meetNow.Checked := true;

  Tweaks_AlignTB.ItemIndex := 0;
  Tweaks_Search.ItemIndex := 0;

  // Select Preset
  case CButton(Sender).Tag of
    1: // Windows Default
    begin
      (* Install *)
      for I := 0 to High(InstallItems) do
        InstallItems[I].Toggled := false;

      (* Uninstall *)
      for I := 0 to High(UninstallItems) do
        UninstallItems[I].Toggled := false;

      (* Personalise *)
      Personalise_DarkSystem.Checked := false;
      Personalise_DarkApps.Checked := false;

      (* Explorer *)
      Explorer_Extensions.Checked := false;
      Explorer_Checkboxes.Checked := false;
      Explorer_Hidden.Checked := false;

      Explorer_encrypt.Checked := false;

      Explorer_To.ItemIndex := 1;

      (* Tweaks *)
      Tweaks_Widgets.Checked := false;
      Tweaks_meetNow.Checked := false;

      Tweaks_AlignTB.ItemIndex := 1;
      Tweaks_Search.ItemIndex := 2;
    end;
    2: // My Choice
    begin
      (* Install *)
      InstallItems[3].Toggled := false;
      InstallItems[6].Toggled := false;
      InstallItems[7].Toggled := false;

      (* Uninstall *)
      UninstallItems[0].Toggled := false;
      UninstallItems[5].Toggled := false;
      UninstallItems[14].Toggled := false;
      UninstallItems[15].Toggled := false;
      UninstallItems[21].Toggled := false;

      (* Explorer *)
      Explorer_To.ItemIndex := 1;
    end;
    3: // Balanced
    begin
      (* Install *)
      InstallItems[7].Toggled := false;
      InstallItems[8].Toggled := false;

      (* Uninstall *)
      UninstallItems[0].Toggled := false;
      UninstallItems[4].Toggled := false;
      UninstallItems[5].Toggled := false;
      UninstallItems[6].Toggled := false;
      UninstallItems[9].Toggled := false;
      UninstallItems[13].Toggled := false;
      UninstallItems[14].Toggled := false;
      UninstallItems[15].Toggled := false;
      UninstallItems[18].Toggled := false;
      UninstallItems[21].Toggled := false;

      (* Explorer *)
      Explorer_Checkboxes.Checked := false;
      Explorer_Hidden.Checked := false;

      Explorer_encrypt.Checked := false;

      (* Tweaks *)
      Tweaks_Widgets.Checked := false;

      Tweaks_AlignTB.ItemIndex := 1;

      Tweaks_Search.ItemIndex := 1;
    end;
    4: // Advanced User
    begin
      (* Install *)
      InstallItems[3].Toggled := false;
      InstallItems[4].Toggled := false;
      InstallItems[6].Toggled := false;
      InstallItems[7].Toggled := false;
      InstallItems[9].Toggled := false;

      (* Personalise *)
      Personalise_StarMenu.Position := 0;
    end;
  end;

  // Next Page
  PageNav(Button_Next);
end;

procedure TSetup.StartAttentionTimer(Sender: TObject);
begin
  Inc(AnimPosition);

  Self.AlphaBlendValue := trunc( Power( 255, AnimPosition / MAX_POS) );

  if AnimPosition = MAX_POS then
    begin
      StartAttention.Enabled := false;

      // Fix Titlebar
      if not IsDialog then
        CustomTitleBar.Height := 0;
    end;
end;

procedure TSetup.StartInstalation;
var
  Reg: TWinRegistry;
  ValueInt: integer;
  I: integer;
  Item: FXStandardIcon;

  Location: string;
  FileList: TArray<string>;
begin
  // Prepare
  Application.ProcessMessages;
  BottomNavigation.Enabled := false;

  // Reset Icons
  for I := 1 to 5 do
    begin
      Item := FXStandardIcon(FindComponent('Progress' + I.ToString));

      if Item <> nil then
        Item.SelectedIcon := ciconInformation;
    end;

  // Apps
  WorkStatus.Caption := 'Installing apps';
  AppLog.Add( '-' + WorkStatus.Caption  );
  Application.ProcessMessages;

  for I := 0 to High(InstallItems) do
    with InstallItems[I] do
      if Toggled then
        begin
          // Work
          WorkStatus.Caption := 'Installing ' + Name + '...';
          Application.ProcessMessages;

          AppLog.Add( '-' + WorkStatus.Caption  );
          AppLog.Add( '- WINGET OUTPUT:'  );
          AppLog.Add( ' - - - - - - - - - -'  );

          // Install
          if Unins <> '' then
            begin
              AppLog.Add(                    { No source confirmation! }
                PowerShellGetOutput(Unins + ' --accept-package-agreements', EnableDebugConsole, true, not EnableDebugConsole).Text
                );
            end;
          AppLog.Add( ' - - - - - - - - - -'  );
        end;

  Progress1.SelectedIcon := ciconCheckmark;

  // Bloatware
  WorkStatus.Caption := 'Uninstalling bloatware';
  AppLog.Add( '-' + WorkStatus.Caption  );
  Application.ProcessMessages;

  for I := 0 to High(UninstallItems) do
    with UninstallItems[I] do
      if Toggled then
        begin
          // Work
          WorkStatus.Caption := 'Uninstalling ' + Name + '...';
          Application.ProcessMessages;

          AppLog.Add( '-' + WorkStatus.Caption  );

          // Special App
          if Params <> '' then
            begin
              if Params = 'onedrive' then
                begin
                  Location := ReplaceWinPath('%localappdata%\Microsoft\OneDrive\');

                  FileList := TDirectory.GetFiles(Location, 'OneDriveSetup.exe', TSearchOption.soAllDirectories);

                  if Length(FileList) > 0 then
                    ShellRun(FileList[0], false, '-uninstall', true);
                end;

            end;

          // Uninstall
          if Unins <> '' then
            begin
              PowerShellGetOutput(Unins, EnableDebugConsole, true, false);
            end;
        end;

  Progress2.SelectedIcon := ciconCheckmark;

  // Personalise
  WorkStatus.Caption := 'Applying personalization';
  Application.ProcessMessages;
  AppLog.Add( '-' + WorkStatus.Caption  );

  Reg := TWinRegistry.Create;
  Reg.ResetRegistryMode;
  try
    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize',
      'AppsUseLightTheme', BooleanToDWORD(not Personalise_DarkApps.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize',
       'SystemUsesLightTheme', BooleanToDWORD(not Personalise_DarkSystem.Checked));

    case Personalise_StarMenu.Position of
      0: ValueInt := 1;
      2: ValueInt := 2;
      else ValueInt := 0;
    end;

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize',
       'Start_Layout', ValueInt);

    // Notify Windows that the system theme has changed
    SendMessage(HWND_BROADCAST, WM_THEMECHANGED, 0, 0);
  finally
    Reg.Free;
  end;

  Progress3.SelectedIcon := ciconCheckmark;

  // Explorer
  WorkStatus.Caption := 'Applying Explorer Settings';
  Application.ProcessMessages;
  AppLog.Add( '-' + WorkStatus.Caption  );

  Reg := TWinRegistry.Create;
  Reg.ResetRegistryMode;
  try
    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'HideFileExt', BooleanToDWORD(not Explorer_Extensions.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'AutoCheckSelect', BooleanToDWORD(Explorer_Checkboxes.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'Hidden', BooleanToDWORD(Explorer_Hidden.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'ShowSuperHidden', BooleanToDWORD(Explorer_System.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'ShowEncryptCompressedColor', BooleanToDWORD(Explorer_Encrypt.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'ShowEncryptCompressedColor', BooleanToDWORD(Explorer_Encrypt.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'LaunchTo', Explorer_To.ItemIndex + 1);

    // Notify Windows that settings were changed
    SendMessage(HWND_BROADCAST, WM_THEMECHANGED, 0, 0);
  finally
    Reg.Free;
  end;

  (*With Tweak*)

  // Tweaks
  WorkStatus.Caption := 'Applying Tweaks';
  Application.ProcessMessages;
  AppLog.Add( '-' + WorkStatus.Caption  );

  Reg := TWinRegistry.Create;
  Reg.ResetRegistryMode;
  try
    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'TaskbarDa', BooleanToDWORD(not Tweaks_Widgets.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'TaskbarMn', BooleanToDWORD(not Tweaks_meetNow.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'TaskbarAl', Tweaks_AlignTB.ItemIndex);

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
      'Hidden', BooleanToDWORD(Explorer_Hidden.Checked));

    Reg.WriteValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search',
      'SearchboxTaskbarMode', Tweaks_Search.ItemIndex);

    // Notify Windows that the system theme has changed
    SendMessage(HWND_BROADCAST, WM_THEMECHANGED, 0, 0);
  finally
    Reg.Free;
  end;

  Progress4.SelectedIcon := ciconCheckmark;

  // Finish
  WorkStatus.Caption := 'Finishing up...';
  AppLog.Add( '-' + WorkStatus.Caption  );
  Application.ProcessMessages;

  // Done!!!!!
  MessageBeep(0);
  Progress5.SelectedIcon := ciconCheckmark;
  Application.ProcessMessages;
  BottomNavigation.Enabled := true;
end;

end.
