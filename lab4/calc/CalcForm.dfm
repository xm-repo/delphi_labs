object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
  ClientHeight = 132
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 91
    Width = 53
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
  end
  object Label2: TLabel
    Left = 8
    Top = 21
    Width = 58
    Height = 13
    Caption = #1042#1099#1088#1072#1078#1077#1085#1080#1077
  end
  object ExpressionEdit: TEdit
    Left = 10
    Top = 40
    Width = 410
    Height = 21
    Hint = #1074#1099#1088#1072#1078#1077#1085#1080#1077
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object AnswerEdit: TEdit
    Left = 236
    Top = 88
    Width = 186
    Height = 21
    Hint = #1088#1077#1079#1091#1083#1100#1090#1072#1090
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object AnswerButton: TButton
    Left = 24
    Top = 86
    Width = 97
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 2
    OnClick = AnswerButtonClick
  end
end
