object Lab6Form: TLab6Form
  Left = 0
  Top = 0
  Caption = 'lab6'
  ClientHeight = 293
  ClientWidth = 426
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
    Left = 8
    Top = 24
    Width = 117
    Height = 13
    Caption = #1055#1086#1079#1080#1094#1080#1103' '#1082#1091#1088#1089#1086#1088#1072' '#1084#1099#1096#1080
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 56
    Height = 13
    Caption = #1050#1083#1072#1089#1089' '#1086#1082#1085#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 56
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1086#1082#1085#1072
  end
  object CursorPositionLabel: TLabel
    Left = 144
    Top = 24
    Width = 3
    Height = 13
  end
  object WindowClassEdit: TEdit
    Left = 88
    Top = 53
    Width = 330
    Height = 21
    TabOrder = 0
  end
  object WindowTextEdit: TEdit
    Left = 88
    Top = 85
    Width = 330
    Height = 21
    TabOrder = 1
  end
  object ChildWindowsMemo: TMemo
    Left = 8
    Top = 128
    Width = 410
    Height = 157
    TabOrder = 2
  end
  object Lab6Timer: TTimer
    Interval = 2000
    OnTimer = Lab6TimerTimer
    Left = 360
    Top = 224
  end
end
