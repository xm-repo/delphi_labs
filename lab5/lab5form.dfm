object PluginsForm: TPluginsForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'plugins'
  ClientHeight = 118
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Plugin'
  end
  object FunctionLabel: TLabel
    Left = 8
    Top = 48
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 6
    Height = 13
    Caption = 'x'
  end
  object Label3: TLabel
    Left = 176
    Top = 80
    Width = 18
    Height = 13
    Caption = 'f(x)'
  end
  object PluginsComboBox: TComboBox
    Left = 42
    Top = 13
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnSelect = PluginsComboBoxSelect
  end
  object VariableEdit: TEdit
    Left = 20
    Top = 77
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object AnswerEdit: TEdit
    Left = 200
    Top = 77
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object CalcButton: TButton
    Left = 262
    Top = 11
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = CalcButtonClick
  end
end
