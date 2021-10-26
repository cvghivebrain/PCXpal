unit Upal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UAbout;

type
  TForm1 = class(TForm)
    boxLine1: TCheckBox;
    boxLine2: TCheckBox;
    boxLine3: TCheckBox;
    boxLine4: TCheckBox;
    dlgOpen: TOpenDialog;
    opnPCX: TLabel;
    lblImport: TLabel;
    opnJasc: TLabel;
    lstData: TListBox;
    pbPreview: TPaintBox;
    lblExport: TLabel;
    opnTPL: TLabel;
    makTPL: TLabel;
    dlgSave: TSaveDialog;
    opnBMP: TLabel;
    opnGens: TLabel;
    opnMS: TLabel;
    opnGIF: TLabel;
    opnMSD: TLabel;
    opnMD: TLabel;
    opnGGD: TLabel;
    makJasc: TLabel;
    makMD: TLabel;
    lblAbout: TLabel;
    procedure opnPCXMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnPCXMouseLeave(Sender: TObject);
    procedure opnPCXClick(Sender: TObject);
    procedure opnJascMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnJascMouseLeave(Sender: TObject);
    procedure opnJascClick(Sender: TObject);
    procedure pbPreviewPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure opnTPLMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnTPLMouseLeave(Sender: TObject);
    procedure opnTPLClick(Sender: TObject);
    procedure makTPLMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure makTPLMouseLeave(Sender: TObject);
    procedure makTPLClick(Sender: TObject);
    procedure boxLine1Click(Sender: TObject);
    procedure boxLine2Click(Sender: TObject);
    procedure boxLine3Click(Sender: TObject);
    procedure boxLine4Click(Sender: TObject);
    procedure opnBMPMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnBMPMouseLeave(Sender: TObject);
    procedure opnBMPClick(Sender: TObject);
    procedure opnGensMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnGensMouseLeave(Sender: TObject);
    procedure opnGensClick(Sender: TObject);
    procedure opnMSMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnMSMouseLeave(Sender: TObject);
    procedure opnMSClick(Sender: TObject);
    procedure opnGIFMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnGIFMouseLeave(Sender: TObject);
    procedure opnGIFClick(Sender: TObject);
    procedure opnMSDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnMSDMouseLeave(Sender: TObject);
    procedure opnMSDClick(Sender: TObject);
    procedure opnMDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnMDMouseLeave(Sender: TObject);
    procedure opnMDClick(Sender: TObject);
    procedure opnGGDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure opnGGDMouseLeave(Sender: TObject);
    procedure opnGGDClick(Sender: TObject);
    procedure makJascMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure makJascMouseLeave(Sender: TObject);
    procedure makJascClick(Sender: TObject);
    procedure makMDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure makMDMouseLeave(Sender: TObject);
    procedure makMDClick(Sender: TObject);
    procedure lblAboutMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblAboutMouseLeave(Sender: TObject);
    procedure lblAboutClick(Sender: TObject);
  private
    { Private declarations }
    procedure EmptyPal;
    procedure DrawPal;
    function ggdToPal(ggc: byte): byte;
    function PalToMd(col: byte): byte;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  myFile: File;
  Parray: array[0..191] of byte;  //64 colours, 3 bytes per colour
  Ticks: array[0..3] of boolean;  //tick box states
  Pindex, Tindex: integer;

{ draw preview palette }

procedure TForm1.pbPreviewPaint(Sender: TObject);
begin
  DrawPal;
end;

procedure TForm1.DrawPal;
var pe, pl: integer;
begin
  for pl := 0 to 3 do
    begin
    for pe := 0 to 15 do
      begin
      pbPreview.Canvas.Pen.Color := rgb(Parray[(pe*3)+(pl*48)], Parray[((pe*3)+1)+(pl*48)], Parray[((pe*3)+2)+(pl*48)]);
      pbPreview.Canvas.Brush.Color := pbPreview.Canvas.Pen.Color;
      pbPreview.Canvas.Rectangle((pe*16), (pl*32), ((pe*16)+16), ((pl*32)+32));
      end;
    end;
end;

{ clean array }

procedure TForm1.EmptyPal;
begin
  for Pindex := 0 to 191 do
    Parray[Pindex] := 127;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  EmptyPal;
  for Tindex := 0 to 3 do
    Ticks[Tindex] := true;
end;

{ get tick box states }

procedure TForm1.boxLine1Click(Sender: TObject);
begin
  Ticks[0] := not Ticks[0];
end;
procedure TForm1.boxLine2Click(Sender: TObject);
begin
  Ticks[1] := not Ticks[1];
end;
procedure TForm1.boxLine3Click(Sender: TObject);
begin
  Ticks[2] := not Ticks[2];
end;
procedure TForm1.boxLine4Click(Sender: TObject);
begin
  Ticks[3] := not Ticks[3];
end;

{ import PCX image routines }

procedure TForm1.opnPCXMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnPCX.Font.Color := clYellow;
end;

procedure TForm1.opnPCXMouseLeave(Sender: TObject);
begin
  opnPCX.Font.Color := clWhite;
end;

procedure TForm1.opnPCXClick(Sender: TObject);
begin
  dlgOpen.Filter := 'PCX Images (*.pcx)|*.pcx|All Files|*.*';
  if dlgOpen.Execute then
    begin
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    Seek(myFile, FileSize(myFile)-768);   //PCX palette address
    Pindex := 0;  //start at 0 in array
    while (not eof(myFile)) and (Pindex < 192) do
      begin
      BlockRead(myFile, Parray[Pindex], 1);     //red
      BlockRead(myFile, Parray[Pindex+1], 1);   //green
      BlockRead(myFile, Parray[Pindex+2], 1);   //blue
      Pindex := Pindex+3;
      end;
    CloseFile(myFile);
    DrawPal;
    end;
end;

{ import Jasc palette routines }

procedure TForm1.opnJascMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnJasc.Font.Color := clYellow;
end;

procedure TForm1.opnJascMouseLeave(Sender: TObject);
begin
  opnJasc.Font.Color := clWhite;
end;

procedure TForm1.opnJascClick(Sender: TObject);
var
  cols, palKount, posn: integer;
  tstJasc: byte;
  s: string;
begin
  dlgOpen.Filter := 'Jasc Palettes (*.pal)|*.pal|Jasc Palettes (*.PspPalette)|*.PspPalette|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    BlockRead(myFile, tstJasc, 1);
    CloseFile(myFile);
    if tstJasc = $4A then   //does the file start with 'J'?
      begin
      lstData.Items.LoadFromFile(dlgOpen.FileName);
      Pindex := 0;
      cols := 63;
      if lstData.Items[2] = '256' then    //check if palette format is 256
        cols := 63;
      if lstData.Items[2] = '16' then     //check if 16
        cols := 15;
      for palKount := 0 to cols do
        begin
        s := lstData.Items[palKount+3];
        posn := pos(' ', s);    //find 'space'
        if posn > 0 then
        Parray[Pindex] := StrToInt(copy(s, 1, posn-1));   //red
        delete(s, 1, posn);
        posn := pos(' ', s);    //find second 'space'
        if posn > 0 then
        Parray[Pindex+1] := StrToInt(copy(s, 1, posn-1)); //green
        delete(s, 1, posn);
        Parray[Pindex+2] := StrToInt(s);                  //blue
        Pindex := Pindex+3;
        end;
      end
    else
      ShowMessage('Palette not in Jasc format');
    end;
    DrawPal;
end;

{ import Tile Layer Pro palette routines }

procedure TForm1.opnTPLMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnTPL.Font.Color := clYellow;
end;

procedure TForm1.opnTPLMouseLeave(Sender: TObject);
begin
  opnTPL.Font.Color := clWhite;
end;

procedure TForm1.opnTPLClick(Sender: TObject);
var tstTPL: byte;
begin
  dlgOpen.Filter := 'TLP Palettes (*.tpl)|*.tpl|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    BlockRead(myFile, tstTPL, 1);
    CloseFile(myFile);
    if tstTPL = $54 then  //does the file start with 'T'?
      begin
      AssignFile(myFile, dlgOpen.FileName);
      Reset(myFile, 1);
      Seek(myFile, 4);    //TPL palette data
      Pindex := 0;        //start at 0 in palette array
      while (Pindex < 192) and not eof(myFile) do
        begin
        BlockRead(myFile, Parray[Pindex], 1);
        inc(Pindex);
        end;
      CloseFile(myFile);
      end
    else ShowMessage('Palette not in Tile Layer Pro format');
    end;
    DrawPal;
end;

{ import BMP image routines }

procedure TForm1.opnBMPMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnBMP.Font.Color := clYellow;
end;

procedure TForm1.opnBMPMouseLeave(Sender: TObject);
begin
  opnBMP.Font.Color := clWhite;
end;

procedure TForm1.opnBMPClick(Sender: TObject);
var
  tstBMP, typeLo, typeHi: byte;
  typeAll, palKount: integer;
begin
  dlgOpen.Filter := 'BMP Images (*.bmp)|*.bmp|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    BlockRead(myFile, tstBMP, 1);
    if tstBMP = $42 then      //does the file start with 'B'?
      begin
      Seek(myFile, $2E);      //check BMP colour depth
      BlockRead(myFile, typeLo, 1);
      BlockRead(myFile, typeHi, 1);
      typeAll := (typeHi*$100)+typeLo;
      if (typeAll < 2) or (typeAll > 256) then ShowMessage('BMP contains no palette')
      else
        begin
        if typeAll > 64 then typeAll := 64;
        Seek(myFile, $36);
        Pindex := 0;
        for palKount := 0 to (typeAll-1) do
          begin
          BlockRead(myFile, Parray[Pindex+2], 1); //blue
          BlockRead(myFile, Parray[Pindex+1], 1); //green
          BlockRead(myFile, Parray[Pindex], 1);   //red
          Pindex := Pindex+3;
          Seek(myFile, FilePos(myFile)+1);        //skip blank byte
          end;
        end;
      end
    else ShowMessage('Image is not a valid BMP');
    CloseFile(myFile);
    DrawPal;
    end;
end;

{ import MS RIFF palette routines }

procedure TForm1.opnMSMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnMS.Font.Color := clYellow;
end;

procedure TForm1.opnMSMouseLeave(Sender: TObject);
begin
  opnMS.Font.Color := clWhite;
end;

procedure TForm1.opnMSClick(Sender: TObject);
var tstpal: byte;
begin
  dlgOpen.Filter := 'MS RIFF Palettes (*.pal)|*.pal|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    BlockRead(myFile, tstpal, 1);
    Pindex := 0;
    if tstpal = $52 then        //does the file start with 'R'?
      begin
      Seek(myFile, $18);
      while (FilePos(myFile) <> FileSize(myFile)-4) and (Pindex < 192) do
        begin
        BlockRead(myFile, Parray[Pindex], 1);   //blue
        BlockRead(myFile, Parray[Pindex+1], 1); //green
        BlockRead(myFile, Parray[Pindex+2], 1); //red
        Pindex := Pindex+3;
        Seek(myFile, FilePos(myFile)+1);        //skip blank byte
        end;
      end
    else ShowMessage('This is not a palette file');
    CloseFile(myFile);
    DrawPal;
    end;
end;

{ import Gens/Genecyst savestate }

procedure TForm1.opnGensMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnGens.Font.Color := clYellow;
end;

procedure TForm1.opnGensMouseLeave(Sender: TObject);
begin
  opnGens.Font.Color := clWhite;
end;

procedure TForm1.opnGensClick(Sender: TObject);
var
  tstGens, r, b, g: byte;
  palKount: integer;
begin
  dlgOpen.Filter := 'GS* SaveStates (*.gs*)|*.gs*|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    BlockRead(myFile, tstGens, 1);
    if tstGens = $47 then         //does the file start with 'G'?
      begin
      Seek(myFile, $112);
      Pindex := 0;
      for palKount := 0 to 63 do
        begin
        BlockRead(myFile, g, 1);  //read green-red byte
        r := g and $F;            //red = low nybble
        Parray[Pindex] := r shl 4;
        g := g and $F0;           //green = high nybble
        Parray[Pindex+1] := g;
        BlockRead(myFile, b, 1);  //read blue byte
        Parray[Pindex+2] := b shl 4;
        Pindex := Pindex+3;
        end;
      DrawPal;
      end
    else ShowMessage('This is not a savestate');
    CloseFile(myFile);
    end;
end;

{ import raw Mega Drive palette rountines }

procedure TForm1.opnMDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnMD.Font.Color := clYellow;
end;

procedure TForm1.opnMDMouseLeave(Sender: TObject);
begin
  opnMD.Font.Color := clWhite;
end;

procedure TForm1.opnMDClick(Sender: TObject);
var r, g, b: byte;
begin
  dlgOpen.Filter := 'Raw Mega Drive Palettes (*.bin)|*.bin|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    Pindex := 0;
    while (not eof(myFile)) and (Pindex < 192) do
      begin
      BlockRead(myFile, b, 1);
      Parray[Pindex+2] := b shl 4;
      BlockRead(myFile, g, 1);
      r := g and $F;
      Parray[Pindex] := r shl 4;
      Parray[Pindex+1] := g and $F0;
      Pindex := Pindex+3;
      end;
    DrawPal; 
    CloseFile(myFile);
    end;
end;

{ import GIF image routines }

procedure TForm1.opnGIFMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnGIF.Font.Color := clYellow;
end;

procedure TForm1.opnGIFMouseLeave(Sender: TObject);
begin
  opnGIF.Font.Color := clWhite;
end;

procedure TForm1.opnGIFClick(Sender: TObject);
var tstGIF, typeGIF, depth: byte;
begin
  dlgOpen.Filter := 'GIF Images (*.gif)|*.gif|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    BlockRead(myFile, tstGIF, 1);
    if tstGIF = $47 then        //does file start with 'G'?
      begin
      Seek(myFile, $A);
      BlockRead(myFile, typeGIF, 1);
      typeGIF := typeGIF shr 4;
      depth := 0;
      if typeGIF = 8 then depth := 2
      else if typeGIF = 9 then depth := 3
      else if (typeGIF=$A) or (typeGIF=$B) then depth := 16
      else if typeGIF = $C then depth := 32
      else if typeGIF > $C then depth := 64
      else ShowMessage('GIF contains no palette');
      if depth > 0 then
        begin
        Seek(myFile, $D);
        for Pindex := 0 to ((depth*3)-1) do
          BlockRead(myFile, Parray[Pindex], 1);
        DrawPal;
        end;
      end
    else ShowMessage('This is not a GIF image');
    CloseFile(myFile);
    end;
end;

{ import SMS Massage savestate }

procedure TForm1.opnMSDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnMSD.Font.Color := clYellow;
end;

procedure TForm1.opnMSDMouseLeave(Sender: TObject);
begin
  opnMSD.Font.Color := clWhite;
end;

procedure TForm1.opnMSDClick(Sender: TObject);
var
  tstMSD, msc, r, g, b: byte;
  palkount: integer;
begin
  dlgOpen.Filter := 'Massage SaveStates (*.msd)|*.msd|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    BlockRead(myFile, tstMSD, 1);
    if tstMSD = $53 then       //does file start with 'S'?
      begin
      Seek(myFile, $6081);
      Pindex := 0;
      for palkount := 0 to 31 do
        begin
        BlockRead(myFile, msc, 1);
        r := msc shr 4;
        if r = 0 then r := 0
        else if r = 1 then r := 80
        else if r = 2 then r := 175
        else r := 255;
        g := (msc and $F) shr 2;
        if g = 0 then g := 0
        else if g = 1 then g := 80
        else if g = 2 then g := 175
        else g := 255;
        b := msc and 3;
        if b = 0 then b := 0
        else if b = 1 then b := 80
        else if b = 2 then b := 175
        else b := 255;
        Parray[Pindex] := r;    //red
        Parray[Pindex+1] := g;  //green
        Parray[Pindex+2] := b;  //blue
        Pindex := Pindex+3;
        end;
      DrawPal;
      end
    else ShowMessage('This is not a savestate');
    CloseFile(myFile);
    end;
end;

{ import GG Massage savestate }

procedure TForm1.opnGGDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  opnGGD.Font.Color := clYellow;
end;

procedure TForm1.opnGGDMouseLeave(Sender: TObject);
begin
  opnGGD.Font.Color := clWhite;
end;

procedure TForm1.opnGGDClick(Sender: TObject);
var
  tstGGD, r, g, b: byte;
  palkount: integer;
begin
  dlgOpen.Filter := 'Massage SaveStates (*.ggd)|*.ggd|All Files|*.*';
  if dlgOpen.Execute then
    begin
    EmptyPal;
    AssignFile(myFile, dlgOpen.FileName);
    Reset(myFile, 1);
    BlockRead(myFile, tstGGD, 1);
    if tstGGD = $53 then       //does file start with 'S'?
      begin
      Seek(myFile, $6081);
      Pindex := 0;
      for palkount := 0 to 31 do
        begin
        BlockRead(myFile, g, 1);
        r := g and $F;
        g := g shr 4;
        BlockRead(myFile, b, 1);
        Parray[Pindex] := ggdToPal(r);
        Parray[Pindex+1] := ggdToPal(g);
        Parray[Pindex+2] := ggdToPal(b);
        Pindex := Pindex+3;
        end;
      end
    else ShowMessage('This is not a savestate');
    CloseFile(myFile);
    end;
end;

function TForm1.ggdToPal(ggc: byte): byte;
begin
  if (ggc = 0) or (ggc = 1) then Result := 0
  else if (ggc = 2) or (ggc = 2) then Result := 36
  else if (ggc = 4) or (ggc = 5) then Result := 72
  else if (ggc = 6) or (ggc = 7) then Result := 109
  else if (ggc = 8) or (ggc = 9) then Result := 145
  else if (ggc = $A) or (ggc = $B) then Result := 192
  else if (ggc = $C) or (ggc = $D) then Result := 218
  else Result := 255;
end;

{ export Tile Layer Pro palette }

procedure TForm1.makTPLMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  makTPL.Font.Color := clYellow;
end;

procedure TForm1.makTPLMouseLeave(Sender: TObject);
begin
  makTPL.Font.Color := clWhite;
end;

procedure TForm1.makTPLClick(Sender: TObject);
begin
  dlgSave.Filter := 'TLP Palettes (*.tpl)|*.tpl|All Files|*.*';
  dlgSave.DefaultExt := 'tpl';
  if dlgSave.Execute then
    begin
    AssignFile(myFile, dlgSave.FileName);
    ReWrite(myFile, 1);
    BlockWrite(myFile, 'TPL', 3);   //write TPL header
    Pindex := 0;
    BlockWrite(myFile, Pindex, 1);  //write TPL header
    for Tindex := 0 to 3 do
      begin
      if Ticks[Tindex] = true then  //check tick box
        begin
        for Pindex := (Tindex*48) to ((Tindex*48)+47) do
          BlockWrite(myFile, Parray[Pindex], 1);
        end;
      end;
    CloseFile(myFile);
    end
end;

{ export Jasc palette }

procedure TForm1.makJascMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  makJasc.Font.Color := clYellow;
end;

procedure TForm1.makJascMouseLeave(Sender: TObject);
begin
  makJasc.Font.Color := clWhite;
end;

procedure TForm1.makJascClick(Sender: TObject);
var
  padsize, padkount, palkount: integer;
  jFile: textfile;
begin
  dlgSave.Filter := 'Jasc Palettes (*.pal)|*.pal|All Files|*.*';
  dlgSave.DefaultExt := 'pal';
  if dlgSave.Execute then
    begin
    AssignFile(jFile, dlgSave.FileName);
    ReWrite(jFile);
    WriteLn(jFile, 'JASC-PAL');    //write header
    WriteLn(jFile, '0100');
    WriteLn(jFile, '256');
    for Tindex := 0 to 3 do
      begin
      if Ticks[Tindex] = true then  //check tick box
        begin
        Pindex := Tindex*48;
        for palkount := 0 to 15 do
          begin
          WriteLn(jFile, IntToStr(Parray[Pindex])+' '+IntToStr(Parray[Pindex+1])+' '+IntToStr(Parray[Pindex+2]));
          Pindex := Pindex+3;
          end;
        end;
      end;
    padsize := 0;
    if Ticks[0] = false then padsize := 1;
    if Ticks[1] = false then padsize := padsize+1;
    if Ticks[2] = false then padsize := padsize+1;
    if Ticks[3] = false then padsize := padsize+1;
    for padkount := 1 to ((padsize*16)+192) do
      WriteLn(jFile, '0 0 0');
    CloseFile(jFile);
    end;
end;

{ export raw Mega Drive palette }

procedure TForm1.makMDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  makMD.Font.Color := clYellow;
end;

procedure TForm1.makMDMouseLeave(Sender: TObject);
begin
  makMD.Font.Color := clWhite;
end;

procedure TForm1.makMDClick(Sender: TObject);
var
  r, g, b, gr: byte;
  palkount: integer;
begin
  dlgSave.Filter := 'Raw Mega Drive Palettes (*.bin)|*.bin|All Files|*.*';
  dlgSave.DefaultExt := 'bin';
  if dlgSave.Execute then
    begin
    AssignFile(myFile, dlgSave.FileName);
    ReWrite(myFile, 1);
    for Tindex := 0 to 3 do
      begin
      if Ticks[Tindex] = true then  //check tick box
        begin
        Pindex := Tindex*48;
        for palkount := 0 to 15 do
          begin
          r := PalToMd(Parray[Pindex]);
          g := PalToMd(Parray[Pindex+1]);
          b := PalToMd(Parray[Pindex+2]);
          gr := (g shl 4) + r;
          BlockWrite(myFile, b, 1);
          BlockWrite(myFile, gr, 1);
          Pindex := Pindex+3;
          end;
        end;
      end;
    CloseFile(myFile);
    end;
end;

function TForm1.PalToMd(col: byte): byte;
begin
  if col <= 31 then Result := 0
  else if (col > 31) and (col <= 62) then Result := 2
  else if (col > 62) and (col <= 93) then Result := 4
  else if (col > 93) and (col <= 124) then Result := 6
  else if (col > 124) and (col <= 155) then Result := 8
  else if (col > 155) and (col <= 186) then Result := $A
  else if (col > 186) and (col <= 217) then Result := $C
  else Result := $E;
end;

{ about button }

procedure TForm1.lblAboutMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lblAbout.Font.Color := clYellow;
end;

procedure TForm1.lblAboutMouseLeave(Sender: TObject);
begin
  lblAbout.Font.Color := clWhite;
end;

procedure TForm1.lblAboutClick(Sender: TObject);
var NewForm: TForm2;
begin
  NewForm := TForm2.Create(Self);
  NewForm.Caption := 'About';
  NewForm.ShowModal;
end;

end.
