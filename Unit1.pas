unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Layouts;

type
  TFormMain = class(TForm)
    Layout1: TLayout;
    MemoLog: TMemo;
    ButtonRun: TButton;
    procedure ButtonRunClick(Sender: TObject);
  private
    procedure Log(const Text: String);
    function ArrayToString(const Bytes: TBytes; const Prefix: String = ''; const Separator: String = ''): String;
  public
    procedure Test0;
    procedure Test1;
    procedure Test2;
    procedure Test3;
    procedure Test4;
    procedure Test5;
  end;

var
  FormMain: TFormMain;

implementation

uses
  Endians;

{$R *.fmx}

function TFormMain.ArrayToString(const Bytes: TBytes; const Prefix: String; const Separator: String): String;
var
  i: Integer;
begin
  Result := Prefix;
  for i := Low(Bytes) to High(Bytes) do
  begin
    Result := Result + IntToHex(Bytes[i], 2);
    if i < High(Bytes) then
      Result := Result + Separator;
  end;
end;

procedure TFormMain.ButtonRunClick(Sender: TObject);
begin
  MemoLog.Lines.Clear;

  Test0;
  Test1;
  Test2;
  Test3;
  Test4;
  Test5;
end;

procedure TFormMain.Log(const Text: String);
begin
  MemoLog.Lines.Append(Text);
  MemoLog.GoToTextEnd;
end;

procedure TFormMain.Test0;
begin
  Log('----------');
  Log('Current machine endianness:');
  Log(TEndianness.EndianToString(TEndianness.Machine));
end;

procedure TFormMain.Test1;
begin
  Log(sLineBreak + '----------');
  Log('Test for the 8-bit integers doesn''t make any sense. It''s here just to handle all integer types.');
  Log(sLineBreak + 'Checking 8 bit integers. Just swap.');
  Log('Signed integer -128   = 0x' + IntToHex(TEndianness.ShortInt(-128)));
  Log('Signed integer 127    = 0x' + IntToHex(TEndianness.ShortInt( 127)));
  Log('Unsigned integer 255  = 0x' + IntToHex(TEndianness.Byte(     255)));
  Log('Unsigned integer 0x12 = 0x' + IntToHex(TEndianness.Byte(     $12)));

  Log(sLineBreak + 'Checking 8 bit integers. Conversion to Big Endian.');
  Log('Signed integer -128   = 0x' + IntToHex(TEndianness.ShortInt(-128, TEndiannessType.BigEndian)));
  Log('Signed integer 127    = 0x' + IntToHex(TEndianness.ShortInt( 127, TEndiannessType.BigEndian)));
  Log('Unsigned integer 255  = 0x' + IntToHex(TEndianness.Byte(     255, TEndiannessType.BigEndian)));
  Log('Unsigned integer 0x12 = 0x' + IntToHex(TEndianness.Byte(     $12, TEndiannessType.BigEndian)));

  Log(sLineBreak + 'Checking 8 bit integers. Conversion to Little Endian.');
  Log('Signed integer -128   = 0x' + IntToHex(TEndianness.ShortInt(-128, TEndiannessType.LittleEndian)));
  Log('Signed integer 127    = 0x' + IntToHex(TEndianness.ShortInt( 127, TEndiannessType.LittleEndian)));
  Log('Unsigned integer 255  = 0x' + IntToHex(TEndianness.Byte(     255, TEndiannessType.LittleEndian)));
  Log('Unsigned integer 0x12 = 0x' + IntToHex(TEndianness.Byte(     $12, TEndiannessType.LittleEndian)));
end;

procedure TFormMain.Test2;
begin
  Log(sLineBreak + '----------');
  Log(sLineBreak + 'Checking 16 bit integers. Just swap.');
  Log('Signed integer -32768   = 0x' + IntToHex(TEndianness.SmallInt(-32768)));
  Log('Signed integer 32767    = 0x' + IntToHex(TEndianness.SmallInt( 32767)));
  Log('Unsigned integer 65535  = 0x' + IntToHex(TEndianness.Word(     65535)));
  Log('Unsigned integer 0x1234 = 0x' + IntToHex(TEndianness.Word(     $1234)));

  Log(sLineBreak + 'Checking 16 bit integers. Conversion to Big Endian.');
  Log('Signed integer -32768   = 0x' + IntToHex(TEndianness.SmallInt(-32768, TEndiannessType.BigEndian)));
  Log('Signed integer 32767    = 0x' + IntToHex(TEndianness.SmallInt( 32767, TEndiannessType.BigEndian)));
  Log('Unsigned integer 65535  = 0x' + IntToHex(TEndianness.Word(     65535, TEndiannessType.BigEndian)));
  Log('Unsigned integer 0x1234 = 0x' + IntToHex(TEndianness.Word(     $1234, TEndiannessType.BigEndian)));

  Log(sLineBreak + 'Checking 16 bit integers. Conversion to Little Endian.');
  Log('Signed integer -32768   = 0x' + IntToHex(TEndianness.SmallInt(-32768, TEndiannessType.LittleEndian)));
  Log('Signed integer 32767    = 0x' + IntToHex(TEndianness.SmallInt( 32767, TEndiannessType.LittleEndian)));
  Log('Unsigned integer 65535  = 0x' + IntToHex(TEndianness.Word(     65535, TEndiannessType.LittleEndian)));
  Log('Unsigned integer 0x1234 = 0x' + IntToHex(TEndianness.Word(     $1234, TEndiannessType.LittleEndian)));
end;

procedure TFormMain.Test3;
begin
  Log(sLineBreak + '----------');
  Log(sLineBreak + 'Checking 32 bit integers. Just swap.');
  Log('Signed integer -2147483648  = 0x' + IntToHex(TEndianness.FixedInt(-2147483648)));
  Log('Signed integer 2147483647   = 0x' + IntToHex(TEndianness.FixedInt( 2147483647)));
  Log('Unsigned integer 4294967295 = 0x' + IntToHex(TEndianness.Cardinal( 4294967295)));
  Log('Unsigned integer 0x12345678 = 0x' + IntToHex(TEndianness.Cardinal( $12345678)));

  Log(sLineBreak + 'Checking 32 bit integers. Conversion to Big Endian.');
  Log('Signed integer -2147483648  = 0x' + IntToHex(TEndianness.FixedInt(-2147483648, TEndiannessType.BigEndian)));
  Log('Signed integer 2147483647   = 0x' + IntToHex(TEndianness.FixedInt( 2147483647, TEndiannessType.BigEndian)));
  Log('Unsigned integer 4294967295 = 0x' + IntToHex(TEndianness.Cardinal( 4294967295, TEndiannessType.BigEndian)));
  Log('Unsigned integer 0x12345678 = 0x' + IntToHex(TEndianness.Cardinal( $12345678,  TEndiannessType.BigEndian)));

  Log(sLineBreak + 'Checking 32 bit integers. Conversion to Little Endian.');
  Log('Signed integer -2147483648  = 0x' + IntToHex(TEndianness.FixedInt(-2147483648, TEndiannessType.LittleEndian)));
  Log('Signed integer 2147483647   = 0x' + IntToHex(TEndianness.FixedInt( 2147483647, TEndiannessType.LittleEndian)));
  Log('Unsigned integer 4294967295 = 0x' + IntToHex(TEndianness.Cardinal( 4294967295, TEndiannessType.LittleEndian)));
  Log('Unsigned integer 0x12345678 = 0x' + IntToHex(TEndianness.Cardinal( $12345678,  TEndiannessType.LittleEndian)));
end;

procedure TFormMain.Test4;
begin
  Log(sLineBreak + '----------');

  Log(sLineBreak + 'Checking 64 bit integers. Just swap.');
  Log('Signed integer -9223372036854775808   = 0x' + IntToHex(TEndianness.Int64(-9223372036854775808)));
  Log('Signed integer 9223372036854775807    = 0x' + IntToHex(TEndianness.Int64( 9223372036854775807)));
  Log('Unsigned integer 18446744073709551615 = 0x' + IntToHex(TEndianness.UInt64(18446744073709551615)));
  Log('Unsigned integer 0x1234567890123456   = 0x' + IntToHex(TEndianness.UInt64($1234567890ABCDEF)));

  Log(sLineBreak + 'Checking 64 bit integers. Conversion to Big Endian.');
  Log('Signed integer -9223372036854775808   = 0x' + IntToHex(TEndianness.Int64(-9223372036854775808,  TEndiannessType.BigEndian)));
  Log('Signed integer 9223372036854775807    = 0x' + IntToHex(TEndianness.Int64( 9223372036854775807,  TEndiannessType.BigEndian)));
  Log('Unsigned integer 18446744073709551615 = 0x' + IntToHex(TEndianness.UInt64(18446744073709551615, TEndiannessType.BigEndian)));
  Log('Unsigned integer 0x1234567890123456   = 0x' + IntToHex(TEndianness.UInt64($1234567890ABCDEF,    TEndiannessType.BigEndian)));

  Log(sLineBreak + 'Checking 64 bit integers. Conversion to Little Endian.');
  Log('Signed integer -9223372036854775808   = 0x' + IntToHex(TEndianness.Int64(-9223372036854775808,  TEndiannessType.LittleEndian)));
  Log('Signed integer 9223372036854775807    = 0x' + IntToHex(TEndianness.Int64( 9223372036854775807,  TEndiannessType.LittleEndian)));
  Log('Unsigned integer 18446744073709551615 = 0x' + IntToHex(TEndianness.UInt64(18446744073709551615, TEndiannessType.LittleEndian)));
  Log('Unsigned integer 0x1234567890123456   = 0x' + IntToHex(TEndianness.UInt64($1234567890ABCDEF,    TEndiannessType.LittleEndian)));
end;

procedure TFormMain.Test5;
var
  arr: TBytes;
begin
  Log(sLineBreak + '----------');

  SetLength(arr, 10);
  try
    arr[0] := $DD;
    arr[1] := $67; // UInt64 (LE)
    arr[2] := $45;
    arr[3] := $23;
    arr[4] := $01;
    arr[5] := $EF; // Cardinal (LE)
    arr[6] := $CD;
    arr[7] := $AB; // Word (LE)
    arr[8] := $89; // Byte
    arr[9] := $DD;

    Log('Input table: ' + ArrayToString(arr, '0x', ' 0x'));
    Log('Start index: 1');

    Log(sLineBreak + 'Checking TBytes with signed integers.');

    Log(sLineBreak + 'Just read.');
    Log('Just read 8 bit integer: 0x'  + IntToHex(TEndianness.ReadInt8 (arr, 8)));
    Log('Just read 16 bit integer: 0x' + IntToHex(TEndianness.ReadInt16(arr, 7)));
    Log('Just read 32 bit integer: 0x' + IntToHex(TEndianness.ReadInt32(arr, 5)));
    Log('Just read 64 bit integer: 0x' + IntToHex(TEndianness.ReadInt64(arr, 1)));

    Log(sLineBreak + 'Just convert.');
    Log('Just convert 8 bit integer: 0x'  + IntToHex(TEndianness.Int8 (arr, 8)));
    Log('Just convert 16 bit integer: 0x' + IntToHex(TEndianness.Int16(arr, 7)));
    Log('Just convert 32 bit integer: 0x' + IntToHex(TEndianness.Int32(arr, 5)));
    Log('Just convert 64 bit integer: 0x' + IntToHex(TEndianness.Int64(arr, 1)));

    Log(sLineBreak + 'Conversion to Big Endian.');
    Log('Conversion to Big Endian 8 bit integer: 0x'  + IntToHex(TEndianness.Int8 (arr, 8, TEndiannessType.BigEndian)));
    Log('Conversion to Big Endian 16 bit integer: 0x' + IntToHex(TEndianness.Int16(arr, 7, TEndiannessType.BigEndian)));
    Log('Conversion to Big Endian 32 bit integer: 0x' + IntToHex(TEndianness.Int32(arr, 5, TEndiannessType.BigEndian)));
    Log('Conversion to Big Endian 64 bit integer: 0x' + IntToHex(TEndianness.Int64(arr, 1, TEndiannessType.BigEndian)));

    Log(sLineBreak + 'Conversion to Little Endian.');
    Log('Conversion to Little Endian 8 bit integer: 0x'  + IntToHex(TEndianness.Int8 (arr, 8, TEndiannessType.LittleEndian)));
    Log('Conversion to Little Endian 16 bit integer: 0x' + IntToHex(TEndianness.Int16(arr, 7, TEndiannessType.LittleEndian)));
    Log('Conversion to Little Endian 32 bit integer: 0x' + IntToHex(TEndianness.Int32(arr, 5, TEndiannessType.LittleEndian)));
    Log('Conversion to Little Endian 64 bit integer: 0x' + IntToHex(TEndianness.Int64(arr, 1, TEndiannessType.LittleEndian)));

    Log(sLineBreak + 'Checking TBytes with unsigned integers.');

    Log(sLineBreak + 'Just read.');
    Log('Just read 8 bit integer: 0x'  + IntToHex(TEndianness.ReadUInt8 (arr, 8)));
    Log('Just read 16 bit integer: 0x' + IntToHex(TEndianness.ReadUInt16(arr, 7)));
    Log('Just read 32 bit integer: 0x' + IntToHex(TEndianness.ReadUInt32(arr, 5)));
    Log('Just read 64 bit integer: 0x' + IntToHex(TEndianness.ReadUInt64(arr, 1)));

    Log(sLineBreak + 'Just convert.');
    Log('Just convert 8 bit integer: 0x'  + IntToHex(TEndianness.UInt8 (arr, 8)));
    Log('Just convert 16 bit integer: 0x' + IntToHex(TEndianness.UInt16(arr, 7)));
    Log('Just convert 32 bit integer: 0x' + IntToHex(TEndianness.UInt32(arr, 5)));
    Log('Just convert 64 bit integer: 0x' + IntToHex(TEndianness.UInt64(arr, 1)));

    Log(sLineBreak + 'Conversion to Big Endian.');
    Log('Conversion to Big Endian 8 bit integer: 0x'  + IntToHex(TEndianness.UInt8 (arr, 8, TEndiannessType.BigEndian)));
    Log('Conversion to Big Endian 16 bit integer: 0x' + IntToHex(TEndianness.UInt16(arr, 7, TEndiannessType.BigEndian)));
    Log('Conversion to Big Endian 32 bit integer: 0x' + IntToHex(TEndianness.UInt32(arr, 5, TEndiannessType.BigEndian)));
    Log('Conversion to Big Endian 64 bit integer: 0x' + IntToHex(TEndianness.UInt64(arr, 1, TEndiannessType.BigEndian)));

    Log(sLineBreak + 'Conversion to Little Endian.');
    Log('Conversion to Little Endian 8 bit integer: 0x'  + IntToHex(TEndianness.UInt8 (arr, 8, TEndiannessType.LittleEndian)));
    Log('Conversion to Little Endian 16 bit integer: 0x' + IntToHex(TEndianness.UInt16(arr, 7, TEndiannessType.LittleEndian)));
    Log('Conversion to Little Endian 32 bit integer: 0x' + IntToHex(TEndianness.UInt32(arr, 5, TEndiannessType.LittleEndian)));
    Log('Conversion to Little Endian 64 bit integer: 0x' + IntToHex(TEndianness.UInt64(arr, 1, TEndiannessType.LittleEndian)));

  finally
    SetLength(arr, 0);
  end;
end;

end.
