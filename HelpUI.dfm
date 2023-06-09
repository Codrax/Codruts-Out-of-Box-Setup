object HelpForm: THelpForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Help and Toubleshooting'
  ClientHeight = 469
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Label2: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 128
    Width = 644
    Height = 57
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Help & Toubleshooting'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -45
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ExplicitLeft = 8
    ExplicitTop = 131
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 185
    Width = 644
    Height = 57
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Use the following tools to get help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 27
    ExplicitTop = 120
  end
  object UserContain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 644
    Height = 81
    Margins.Top = 25
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -67
    Font.Name = 'Segoe Fluent Icons'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    object UserIcon: TLabel
      Left = 0
      Top = 0
      Width = 644
      Height = 81
      Align = alClient
      Alignment = taCenter
      Caption = #59543
      Layout = tlCenter
      ExplicitWidth = 67
      ExplicitHeight = 67
    end
  end
  object CButton1: CButton
    Tag = 1
    Left = 21
    Top = 272
    Width = 300
    Height = 80
    OnClick = HelpSelection
    Allignment = taLeftJustify
    TabOrder = 1
    Color = clBtnFace
    ParentColor = False
    BSegoeIcon = #60613
    ButtonIcon = cicSegoeFluent
    UseAccentColor = acNone
    GradientOptions.Enabled = False
    GradientOptions.Enter = clFuchsia
    GradientOptions.Leave = clRed
    GradientOptions.Down = clMaroon
    ControlStyle = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14123546
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    SubTextFont.Charset = DEFAULT_CHARSET
    SubTextFont.Color = 14322471
    SubTextFont.Height = -11
    SubTextFont.Name = 'Segoe UI'
    SubTextFont.Style = []
    FontAutoSize.Enabled = False
    FontAutoSize.Max = -1
    FontAutoSize.Min = -1
    Text = 'Reinstall default UWP apps'
    SubText = 'Setup a new instalation'
    SubTextEnabled = True
    RoundTransparent = False
    RoundAmount = 0
    State = mbsLeave
    Colors.Enter = 16511461
    Colors.Leave = 14803425
    Colors.Down = 16245964
    Colors.BLine = 14090240
    Preset.Color = clBlue
    Preset.Kind = cbprCustom
    Preset.PenColorAuto = True
    Preset.ApplyOnce = False
    Preset.IgnoreGlobalSync = False
    UnderLine.Enable = False
    UnderLine.UnderLineRound = False
    UnderLine.UnderLineThicknes = 2
    TextColors.Enter = 14322471
    TextColors.Leave = 14322471
    TextColors.Down = 14322471
    TextColors.BLine = clBlack
    Pen.Color = 14803425
    Pen.Width = 3
    Pen.EnableAlternativeColors = True
    Pen.FormSyncedColor = False
    Pen.AltHoverColor = 15389364
    Pen.AltPressColor = 16245964
    Pen.GlobalPresetExcept = False
    Animations.PressAnimation = False
    Animations.PADelay = 2
    Animations.PAShrinkAmount = 6
    Animations.PAAnimateEngine = cbneAtDraw
    Animations.FadeAnimation = True
    Animations.FASpeed = 10
  end
  object CButton2: CButton
    Tag = 2
    Left = 327
    Top = 272
    Width = 300
    Height = 80
    OnClick = HelpSelection
    Allignment = taLeftJustify
    TabOrder = 2
    Color = clBtnFace
    ParentColor = False
    BSegoeIcon = #60392
    ButtonIcon = cicSegoeFluent
    UseAccentColor = acNone
    GradientOptions.Enabled = False
    GradientOptions.Enter = clFuchsia
    GradientOptions.Leave = clRed
    GradientOptions.Down = clMaroon
    ControlStyle = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14123546
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    SubTextFont.Charset = DEFAULT_CHARSET
    SubTextFont.Color = 14322471
    SubTextFont.Height = -11
    SubTextFont.Name = 'Segoe UI'
    SubTextFont.Style = []
    FontAutoSize.Enabled = False
    FontAutoSize.Max = -1
    FontAutoSize.Min = -1
    Text = 'Report bug'
    SubText = 'Report a but in this application'
    SubTextEnabled = True
    RoundTransparent = False
    RoundAmount = 0
    State = mbsLeave
    Colors.Enter = 16511461
    Colors.Leave = 14803425
    Colors.Down = 16245964
    Colors.BLine = 14090240
    Preset.Color = clBlue
    Preset.Kind = cbprCustom
    Preset.PenColorAuto = True
    Preset.ApplyOnce = False
    Preset.IgnoreGlobalSync = False
    UnderLine.Enable = False
    UnderLine.UnderLineRound = False
    UnderLine.UnderLineThicknes = 2
    TextColors.Enter = 14322471
    TextColors.Leave = 14322471
    TextColors.Down = 14322471
    TextColors.BLine = clBlack
    Pen.Color = 14803425
    Pen.Width = 3
    Pen.EnableAlternativeColors = True
    Pen.FormSyncedColor = False
    Pen.AltHoverColor = 15389364
    Pen.AltPressColor = 16245964
    Pen.GlobalPresetExcept = False
    Animations.PressAnimation = False
    Animations.PADelay = 2
    Animations.PAShrinkAmount = 6
    Animations.PAAnimateEngine = cbneAtDraw
    Animations.FadeAnimation = True
    Animations.FASpeed = 10
  end
  object CButton3: CButton
    Tag = 4
    Left = 327
    Top = 358
    Width = 300
    Height = 80
    OnClick = HelpSelection
    Allignment = taLeftJustify
    TabOrder = 3
    Color = clBtnFace
    ParentColor = False
    BSegoeIcon = #63226
    ButtonIcon = cicSegoeFluent
    UseAccentColor = acNone
    GradientOptions.Enabled = False
    GradientOptions.Enter = clFuchsia
    GradientOptions.Leave = clRed
    GradientOptions.Down = clMaroon
    ControlStyle = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14123546
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    SubTextFont.Charset = DEFAULT_CHARSET
    SubTextFont.Color = 14322471
    SubTextFont.Height = -11
    SubTextFont.Name = 'Segoe UI'
    SubTextFont.Style = []
    FontAutoSize.Enabled = False
    FontAutoSize.Max = -1
    FontAutoSize.Min = -1
    Text = 'Get help online'
    SubText = 'View more on www.codrutsoftware.cf'
    SubTextEnabled = True
    RoundTransparent = False
    RoundAmount = 0
    State = mbsLeave
    Colors.Enter = 16511461
    Colors.Leave = 14803425
    Colors.Down = 16245964
    Colors.BLine = 14090240
    Preset.Color = clBlue
    Preset.Kind = cbprCustom
    Preset.PenColorAuto = True
    Preset.ApplyOnce = False
    Preset.IgnoreGlobalSync = False
    UnderLine.Enable = False
    UnderLine.UnderLineRound = False
    UnderLine.UnderLineThicknes = 2
    TextColors.Enter = 14322471
    TextColors.Leave = 14322471
    TextColors.Down = 14322471
    TextColors.BLine = clBlack
    Pen.Color = 14803425
    Pen.Width = 3
    Pen.EnableAlternativeColors = True
    Pen.FormSyncedColor = False
    Pen.AltHoverColor = 15389364
    Pen.AltPressColor = 16245964
    Pen.GlobalPresetExcept = False
    Animations.PressAnimation = False
    Animations.PADelay = 2
    Animations.PAShrinkAmount = 6
    Animations.PAAnimateEngine = cbneAtDraw
    Animations.FadeAnimation = True
    Animations.FASpeed = 10
  end
  object CButton4: CButton
    Tag = 3
    Left = 21
    Top = 358
    Width = 300
    Height = 80
    OnClick = HelpSelection
    Allignment = taLeftJustify
    TabOrder = 4
    Color = clBtnFace
    ParentColor = False
    BSegoeIcon = #59897
    ButtonIcon = cicSegoeFluent
    UseAccentColor = acNone
    GradientOptions.Enabled = False
    GradientOptions.Enter = clFuchsia
    GradientOptions.Leave = clRed
    GradientOptions.Down = clMaroon
    ControlStyle = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14123546
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    SubTextFont.Charset = DEFAULT_CHARSET
    SubTextFont.Color = 14322471
    SubTextFont.Height = -11
    SubTextFont.Name = 'Segoe UI'
    SubTextFont.Style = []
    FontAutoSize.Enabled = False
    FontAutoSize.Max = -1
    FontAutoSize.Min = -1
    Text = 'View log file'
    SubText = 'View the latest installation log file'
    SubTextEnabled = True
    RoundTransparent = False
    RoundAmount = 0
    State = mbsLeave
    Colors.Enter = 16511461
    Colors.Leave = 14803425
    Colors.Down = 16245964
    Colors.BLine = 14090240
    Preset.Color = clBlue
    Preset.Kind = cbprCustom
    Preset.PenColorAuto = True
    Preset.ApplyOnce = False
    Preset.IgnoreGlobalSync = False
    UnderLine.Enable = False
    UnderLine.UnderLineRound = False
    UnderLine.UnderLineThicknes = 2
    TextColors.Enter = 14322471
    TextColors.Leave = 14322471
    TextColors.Down = 14322471
    TextColors.BLine = clBlack
    Pen.Color = 14803425
    Pen.Width = 3
    Pen.EnableAlternativeColors = True
    Pen.FormSyncedColor = False
    Pen.AltHoverColor = 15389364
    Pen.AltPressColor = 16245964
    Pen.GlobalPresetExcept = False
    Animations.PressAnimation = False
    Animations.PADelay = 2
    Animations.PAShrinkAmount = 6
    Animations.PAAnimateEngine = cbneAtDraw
    Animations.FadeAnimation = True
    Animations.FASpeed = 10
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 22
    CustomButtons = <>
  end
end
