object Lab3Form: TLab3Form
  Left = 0
  Top = 0
  HelpType = htKeyword
  BorderStyle = bsDialog
  Caption = 'lab3'
  ClientHeight = 197
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 29
    Height = 13
    Caption = #1058#1077#1082#1089#1090
  end
  object Label2: TLabel
    Left = 8
    Top = 77
    Width = 26
    Height = 13
    Caption = #1062#1074#1077#1090
  end
  object TextToSave: TEdit
    Left = 8
    Top = 40
    Width = 410
    Height = 21
    Hint = #1090#1077#1082#1089#1090
    TabOrder = 0
  end
  object BackgroundColorBox: TColorBox
    Left = 8
    Top = 96
    Width = 145
    Height = 22
    ItemHeight = 16
    TabOrder = 1
    OnSelect = BackgroundColorBoxSelect
  end
  object CloseButton: TButton
    Left = 312
    Top = 152
    Width = 106
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = CloseButtonClick
  end
end
