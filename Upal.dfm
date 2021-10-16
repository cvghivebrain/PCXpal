object Form1: TForm1
  Left = 313
  Top = 109
  Caption = 'PCXpal 4.1 by Hivebrain'
  ClientHeight = 363
  ClientWidth = 331
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000000200000000
    0000000000000000000000000000000000000000800000800000008080008000
    00008000800080800000C0C0C000808080000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000FF0FF0770CC000000000000000000000FF0FF0770CC000000000000000
    00000000000000000000000000000000000000CC0880770FF000000000000000
    000000CC0880770FF00000000000000000000000000000000000000000000000
    000000FF0550880FF000000000000000000000FF0550880FF000000000000000
    00000000000000000000000000000000000000770770FF055000000000000000
    000000770770FF05500000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8003FFFF8003FFFF80
    03FFFF8003FFFF8003FFFF8003FFFF8003FFFF8003FFFF8003FFFF8003FFFF80
    03FFFF8003FFFF8003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000800000000000000000000000000000000000000000000000000080000080
    000000808000800000008000800080800000C0C0C000808080000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    000000000000000000000000000000FF0FF0770CC00000FF0FF0770CC0000000
    00000000000000CC0880770FF00000CC0880770FF000000000000000000000FF
    0550880FF00000FF0550880FF000000000000000000000770770FF0550000077
    0770FF05500000000000000000000000000000000000FFFF0000FFFF00008003
    0000800300008003000080030000800300008003000080030000800300008003
    000080030000800300008003000080030000FFFF0000}
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object opnPCX: TLabel
    Left = 16
    Top = 312
    Width = 72
    Height = 16
    Caption = 'PCX Image'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnPCXClick
    OnMouseMove = opnPCXMouseMove
    OnMouseLeave = opnPCXMouseLeave
  end
  object lblImport: TLabel
    Left = 16
    Top = 160
    Width = 56
    Height = 16
    Caption = 'Import:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object opnJasc: TLabel
    Left = 16
    Top = 248
    Width = 96
    Height = 16
    Caption = 'Jasc Palette'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnJascClick
    OnMouseMove = opnJascMouseMove
    OnMouseLeave = opnJascMouseLeave
  end
  object pbPreview: TPaintBox
    Left = 40
    Top = 16
    Width = 256
    Height = 128
    Color = clWhite
    ParentColor = False
    OnPaint = pbPreviewPaint
  end
  object lblExport: TLabel
    Left = 168
    Top = 160
    Width = 56
    Height = 16
    Caption = 'Export:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object opnTPL: TLabel
    Left = 16
    Top = 328
    Width = 112
    Height = 16
    Caption = 'Tile Layer Pro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnTPLClick
    OnMouseMove = opnTPLMouseMove
    OnMouseLeave = opnTPLMouseLeave
  end
  object makTPL: TLabel
    Left = 168
    Top = 216
    Width = 112
    Height = 16
    Caption = 'Tile Layer Pro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = makTPLClick
    OnMouseMove = makTPLMouseMove
    OnMouseLeave = makTPLMouseLeave
  end
  object opnBMP: TLabel
    Left = 16
    Top = 184
    Width = 72
    Height = 16
    Caption = 'BMP Image'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnBMPClick
    OnMouseMove = opnBMPMouseMove
    OnMouseLeave = opnBMPMouseLeave
  end
  object opnGens: TLabel
    Left = 16
    Top = 232
    Width = 104
    Height = 16
    Caption = 'GS* SaveState'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnGensClick
    OnMouseMove = opnGensMouseMove
    OnMouseLeave = opnGensMouseLeave
  end
  object opnMS: TLabel
    Left = 16
    Top = 280
    Width = 120
    Height = 16
    Caption = 'MS RIFF Palette'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnMSClick
    OnMouseMove = opnMSMouseMove
    OnMouseLeave = opnMSMouseLeave
  end
  object opnGIF: TLabel
    Left = 16
    Top = 216
    Width = 72
    Height = 16
    Caption = 'GIF Image'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnGIFClick
    OnMouseMove = opnGIFMouseMove
    OnMouseLeave = opnGIFMouseLeave
  end
  object opnMSD: TLabel
    Left = 16
    Top = 296
    Width = 104
    Height = 16
    Caption = 'MSD SaveState'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnMSDClick
    OnMouseMove = opnMSDMouseMove
    OnMouseLeave = opnMSDMouseLeave
  end
  object opnMD: TLabel
    Left = 16
    Top = 264
    Width = 144
    Height = 16
    Caption = 'Mega Drive Palette'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnMDClick
    OnMouseMove = opnMDMouseMove
    OnMouseLeave = opnMDMouseLeave
  end
  object opnGGD: TLabel
    Left = 16
    Top = 200
    Width = 104
    Height = 16
    Caption = 'GGD SaveState'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = opnGGDClick
    OnMouseMove = opnGGDMouseMove
    OnMouseLeave = opnGGDMouseLeave
  end
  object makJasc: TLabel
    Left = 168
    Top = 184
    Width = 96
    Height = 16
    Caption = 'Jasc Palette'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = makJascClick
    OnMouseMove = makJascMouseMove
    OnMouseLeave = makJascMouseLeave
  end
  object makMD: TLabel
    Left = 168
    Top = 200
    Width = 144
    Height = 16
    Caption = 'Mega Drive Palette'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = makMDClick
    OnMouseMove = makMDMouseMove
    OnMouseLeave = makMDMouseLeave
  end
  object boxLine1: TCheckBox
    Left = 16
    Top = 24
    Width = 17
    Height = 17
    Caption = 'boxLine1'
    Checked = True
    State = cbChecked
    TabOrder = 0
    OnClick = boxLine1Click
  end
  object boxLine2: TCheckBox
    Left = 16
    Top = 56
    Width = 17
    Height = 17
    Caption = 'boxLine2'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = boxLine2Click
  end
  object boxLine3: TCheckBox
    Left = 16
    Top = 88
    Width = 17
    Height = 17
    Caption = 'boxLine3'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = boxLine3Click
  end
  object boxLine4: TCheckBox
    Left = 16
    Top = 120
    Width = 17
    Height = 17
    Caption = 'boxLine4'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = boxLine4Click
  end
  object lstData: TListBox
    Left = 56
    Top = 24
    Width = 121
    Height = 113
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object dlgOpen: TOpenDialog
    Filter = 'PCX Images (*.pcx)|*.pcx|All Files|*.*'
    Left = 264
    Top = 24
  end
  object dlgSave: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 224
    Top = 24
  end
end
