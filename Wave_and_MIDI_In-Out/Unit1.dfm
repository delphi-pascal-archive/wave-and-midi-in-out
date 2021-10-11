object Form1: TForm1
  Left = 225
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Wave and MIDI In-Out'
  ClientHeight = 169
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 62
    Height = 16
    Caption = 'Wave Out:'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 52
    Height = 16
    Caption = 'Wave In:'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 51
    Height = 16
    Caption = 'Midi Out:'
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 41
    Height = 16
    Caption = 'Midi In:'
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 8
    Width = 265
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 0
  end
  object ComboBox2: TComboBox
    Tag = 1
    Left = 80
    Top = 40
    Width = 265
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 1
  end
  object ComboBox3: TComboBox
    Tag = 2
    Left = 80
    Top = 72
    Width = 265
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 2
  end
  object ComboBox4: TComboBox
    Tag = 3
    Left = 80
    Top = 104
    Width = 265
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 3
  end
  object Button1: TButton
    Tag = 1
    Left = 352
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Set as default'
    TabOrder = 4
    OnClick = DefinirDefaut
  end
  object Button2: TButton
    Tag = 2
    Left = 352
    Top = 40
    Width = 113
    Height = 25
    Caption = 'Set as default'
    TabOrder = 5
    OnClick = DefinirDefaut
  end
  object Button3: TButton
    Tag = 3
    Left = 352
    Top = 72
    Width = 113
    Height = 25
    Caption = 'Set as default'
    TabOrder = 6
    OnClick = DefinirDefaut
  end
  object Button4: TButton
    Tag = 4
    Left = 352
    Top = 104
    Width = 113
    Height = 25
    Caption = 'Set as default'
    TabOrder = 7
    OnClick = DefinirDefaut
  end
  object Button5: TButton
    Left = 8
    Top = 136
    Width = 457
    Height = 25
    Caption = 'Exit'
    TabOrder = 8
  end
end
