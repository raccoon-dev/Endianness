unit Endians;

interface

uses
  System.SysUtils;

{$IFDEF RELEASE}
  {$DEFINE USE_INLINE}
{$ELSE}
  {$UNDEF USE_INLINE}
{$ENDIF}

type TEndiannessType = (BigEndian, LittleEndian);

type TEndianness = class
  public
    // Main functionality:
    class function Machine: TEndiannessType; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function EndianToString(Endian: TEndiannessType): String;
    class procedure Swap(const Value: PByte; const Length: Integer); overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    // Read values from TBytes without any conversion
    class function ReadInt8  (Value: TBytes; const Index: Integer): ShortInt; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function ReadUInt8 (Value: TBytes; const Index: Integer): Byte;     {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function ReadInt16 (Value: TBytes; const Index: Integer): SmallInt; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function ReadUInt16(Value: TBytes; const Index: Integer): Word;     {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function ReadInt32 (Value: TBytes; const Index: Integer): Integer;  {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function ReadUInt32(Value: TBytes; const Index: Integer): Cardinal; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function ReadInt64 (Value: TBytes; const Index: Integer): Int64;    {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function ReadUInt64(Value: TBytes; const Index: Integer): UInt64;   {$IFDEF USE_INLINE}inline;{$ENDIF}

    // Conversion from TBytes
    class function Int8  (const Value: TBytes; const Index: Integer): ShortInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt8 (const Value: TBytes; const Index: Integer): Byte; overload;     {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Int16 (const Value: TBytes; const Index: Integer): SmallInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt16(const Value: TBytes; const Index: Integer): Word; overload;     {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Int32 (const Value: TBytes; const Index: Integer): Integer; overload;  {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt32(const Value: TBytes; const Index: Integer): Cardinal; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Int64 (const Value: TBytes; const Index: Integer): Int64; overload;    {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt64(const Value: TBytes; const Index: Integer): UInt64; overload;   {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function Int8  (const Value: TBytes; const Index: Integer; EndianType: TEndiannessType): ShortInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt8 (const Value: TBytes; const Index: Integer; EndianType: TEndiannessType): Byte; overload;     {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Int16 (const Value: TBytes; const Index: Integer; EndianType: TEndiannessType): SmallInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt16(const Value: TBytes; const Index: Integer; EndianType: TEndiannessType): Word; overload;     {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Int32 (const Value: TBytes; const Index: Integer; EndianType: TEndiannessType): Integer; overload;  {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt32(const Value: TBytes; const Index: Integer; EndianType: TEndiannessType): Cardinal; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Int64 (const Value: TBytes; const Index: Integer; EndianType: TEndiannessType): Int64; overload;    {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt64(const Value: TBytes; const Index: Integer; EndianType: TEndiannessType): UInt64; overload;   {$IFDEF USE_INLINE}inline;{$ENDIF}

    // Signed integers:
    class function Swap(const Value: ShortInt): ShortInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: SmallInt): SmallInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: Integer): Integer; overload;   {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: Int64): Int64; overload;       {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function Swap(const Value: ShortInt; EndianType: TEndiannessType): ShortInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: SmallInt; EndianType: TEndiannessType): SmallInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: Integer; EndianType: TEndiannessType): Integer; overload;   {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: Int64; EndianType: TEndiannessType): Int64; overload;       {$IFDEF USE_INLINE}inline;{$ENDIF}

    // Unsigned integers:
    class function Swap(const Value: Byte): Byte; overload;         {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: Word): Word; overload;         {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: Cardinal): Cardinal; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: UInt64): UInt64; overload;     {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function Swap(const Value: Byte; EndianType: TEndiannessType): Byte; overload;         {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: Word; EndianType: TEndiannessType): Word; overload;         {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: Cardinal; EndianType: TEndiannessType): Cardinal; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Swap(const Value: UInt64; EndianType: TEndiannessType): UInt64; overload;     {$IFDEF USE_INLINE}inline;{$ENDIF}

    // Platform-Dependend integer types:
    class function NativeInt(Value: NativeInt): NativeInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function NativeInt(Value: NativeInt; EndianType: TEndiannessType): NativeInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function NativeUInt(Value: NativeUInt): NativeUInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function NativeUInt(Value: NativeUInt; EndianType: TEndiannessType): NativeUInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function LongInt(Value: LongInt): LongInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function LongInt(Value: LongInt; EndianType: TEndiannessType): LongInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function LongWord(Value: LongWord): LongWord; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function LongWord(Value: LongWord; EndianType: TEndiannessType): LongWord; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    // Platform-Independent integer types:
    class function ShortInt(Value: ShortInt): ShortInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function ShortInt(Value: ShortInt; EndianType: TEndiannessType): ShortInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function SmallInt(Value: SmallInt): SmallInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function SmallInt(Value: SmallInt; EndianType: TEndiannessType): SmallInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function FixedInt(Value: FixedInt): FixedInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function FixedInt(Value: FixedInt; EndianType: TEndiannessType): FixedInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function Integer(Value: Integer): Integer; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Integer(Value: Integer; EndianType: TEndiannessType): Integer; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function Int64(Value: Int64): Int64; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Int64(Value: Int64; EndianType: TEndiannessType): Int64; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function Byte(Value: Byte): Byte; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Byte(Value: Byte; EndianType: TEndiannessType): Byte; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function Word(Value: Word): Word; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Word(Value: Word; EndianType: TEndiannessType): Word; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function FixedUInt(Value: FixedUInt): FixedUInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function FixedUInt(Value: FixedUInt; EndianType: TEndiannessType): FixedUInt; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function Cardinal(Value: Cardinal): Cardinal; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function Cardinal(Value: Cardinal; EndianType: TEndiannessType): Cardinal; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}

    class function UInt64(Value: UInt64): UInt64; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
    class function UInt64(Value: UInt64; EndianType: TEndiannessType): UInt64; overload; {$IFDEF USE_INLINE}inline;{$ENDIF}
end;

implementation

{$INCLUDE jedi.inc}

{ TEndianness }

class function TEndianness.Byte(Value: Byte): Byte;
begin
  Result := Value;
end;

class function TEndianness.Cardinal(Value: Cardinal): Cardinal;
begin
  Result := Value;
  Swap(@Result, 4);
end;

class function TEndianness.FixedInt(Value: FixedInt): FixedInt;
begin
  Result := Value;
  Swap(@Result, 4);
end;

class function TEndianness.FixedUInt(Value: FixedUInt): FixedUInt;
begin
  Result := Value;
  Swap(@Result, 4);
end;

class function TEndianness.Int64(Value: Int64): Int64;
begin
  Result := Value;
  Swap(@Result, 8);
end;

class function TEndianness.Integer(Value: Integer): Integer;
begin
  Result := Value;
  Swap(@Result, 4);
end;

class function TEndianness.LongInt(Value: LongInt): LongInt;
begin
  Result := Value;
{$IFDEF CPU32}
  Swap(@Result, 4);
{$ELSE}
  {$IFDEF WIN64}
  Swap(@Result, 4);
  {$ELSE}
  Swap(@Result, 8);
  {$ENDIF}
{$ENDIF}
end;

class function TEndianness.LongWord(Value: LongWord): LongWord;
begin
  Result := Value;
{$IFDEF CPU32}
  Swap(@Result, 4);
{$ELSE}
  {$IFDEF WIN64}
  Swap(@Result, 4);
  {$ELSE}
  Swap(@Result, 8);
  {$ENDIF}
{$ENDIF}
end;

class function TEndianness.Machine: TEndiannessType;
var
  checkValue: System.Word;
begin
  checkValue := $1234;
  if PByte(@checkValue)^ = $12 then
    Result := TEndiannessType.BigEndian
  else
    Result := TEndiannessType.LittleEndian;
end;

class function TEndianness.NativeInt(Value: NativeInt): NativeInt;
begin
  Result := Value;
{$IFDEF CPU32}
  Swap(@Result, 4);
{$ELSE}
  Swap(@Result, 8);
{$ENDIF}
end;

class function TEndianness.NativeUInt(Value: NativeUInt): NativeUInt;
begin
  Result := Value;
{$IFDEF CPU32}
  Swap(@Result, 4);
{$ELSE}
  Swap(@Result, 8);
{$ENDIF}
end;

class function TEndianness.ShortInt(Value: ShortInt): ShortInt;
begin
  Result := Value;
end;

class function TEndianness.SmallInt(Value: SmallInt): SmallInt;
begin
  Result := Value;
  Swap(@Result, 2);
end;

class procedure TEndianness.Swap(const Value: PByte; const Length: Integer);
var
  i: System.Integer;
  b: System.Byte;
begin
  Assert(Length > 0);
  for i := 1 to Length div 2 do
  begin
    b := (Value + i - 1)^;
    (Value + i - 1)^ := (Value + Length - i)^;
    (Value + Length - i)^ := b;
  end;
end;

class function TEndianness.UInt64(Value: UInt64; EndianType: TEndiannessType): UInt64;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.UInt64(Value)
  else
    Result := Value;
end;

class function TEndianness.UInt64(Value: UInt64): UInt64;
begin
  Result := Value;
  Swap(@Result, 8);
end;

class function TEndianness.Word(Value: Word): Word;
begin
  Result := Value;
  Swap(@Result, 2);
end;

class function TEndianness.Byte(Value: Byte; EndianType: TEndiannessType): Byte;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Byte(Value)
  else
    Result := Value;
end;

class function TEndianness.Cardinal(Value: Cardinal; EndianType: TEndiannessType): Cardinal;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Cardinal(Value)
  else
    Result := Value;
end;

class function TEndianness.EndianToString(Endian: TEndiannessType): String;
begin
  if Endian = TEndiannessType.BigEndian then
    Result := 'Big Endian'
  else
    Result := 'Little Endian';
end;

class function TEndianness.FixedInt(Value: FixedInt; EndianType: TEndiannessType): FixedInt;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.FixedInt(Value)
  else
    Result := Value;
end;

class function TEndianness.FixedUInt(Value: FixedUInt; EndianType: TEndiannessType): FixedUInt;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.FixedUInt(Value)
  else
    Result := Value;
end;

class function TEndianness.Int16(const Value: TBytes; const Index: Integer): SmallInt;
begin
  Result := TEndianness.ReadInt16(Value, Index);
  Result := TEndianness.Swap(Result);
end;

class function TEndianness.Int16(const Value: TBytes; const Index: Integer;
  EndianType: TEndiannessType): SmallInt;
begin
  Result := TEndianness.ReadInt16(Value, Index);
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Swap(Result);
end;

class function TEndianness.Int32(const Value: TBytes; const Index: Integer): Integer;
begin
  Result := TEndianness.ReadInt32(Value, Index);
  Result := TEndianness.Swap(Result);
end;

class function TEndianness.Int32(const Value: TBytes; const Index: Integer;
  EndianType: TEndiannessType): Integer;
begin
  Result := TEndianness.ReadInt32(Value, Index);
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Swap(Result);
end;

class function TEndianness.Int64(const Value: TBytes; const Index: Integer): Int64;
begin
  Result := TEndianness.ReadInt64(Value, Index);
  Result := TEndianness.Swap(Result);
end;

class function TEndianness.Int64(const Value: TBytes; const Index: Integer;
  EndianType: TEndiannessType): Int64;
begin
  Result := TEndianness.ReadInt64(Value, Index);
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Swap(Result);
end;

class function TEndianness.Int8(const Value: TBytes; const Index: Integer): ShortInt;
begin
  Result := TEndianness.ReadInt8(Value, Index);
end;

class function TEndianness.Int8(const Value: TBytes; const Index: Integer;
  EndianType: TEndiannessType): ShortInt;
begin
  Result := TEndianness.ReadInt8(Value, Index);
end;

class function TEndianness.UInt16(const Value: TBytes; const Index: Integer): Word;
begin
  Result := TEndianness.ReadUInt16(Value, Index);
  Result := TEndianness.Swap(Result);
end;

class function TEndianness.UInt16(const Value: TBytes; const Index: Integer;
  EndianType: TEndiannessType): Word;
begin
  Result := TEndianness.ReadUInt16(Value, Index);
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Swap(Result);
end;

class function TEndianness.UInt32(const Value: TBytes; const Index: Integer): Cardinal;
begin
  Result := TEndianness.ReadUInt32(Value, Index);
  Result := TEndianness.Swap(Result);
end;

class function TEndianness.UInt32(const Value: TBytes; const Index: Integer;
  EndianType: TEndiannessType): Cardinal;
begin
  Result := TEndianness.ReadUInt32(Value, Index);
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Swap(Result);
end;

class function TEndianness.UInt64(const Value: TBytes; const Index: Integer): UInt64;
begin
  Result := TEndianness.ReadUInt64(Value, Index);
  Result := TEndianness.Swap(Result);
end;

class function TEndianness.UInt64(const Value: TBytes; const Index: Integer;
  EndianType: TEndiannessType): UInt64;
begin
  Result := TEndianness.ReadUInt64(Value, Index);
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Swap(Result);
end;

class function TEndianness.UInt8(const Value: TBytes; const Index: Integer;
  EndianType: TEndiannessType): Byte;
begin
  Result := TEndianness.ReadUInt8(Value, Index);
end;

class function TEndianness.UInt8(const Value: TBytes; const Index: Integer): Byte;
begin
  Result := TEndianness.ReadUInt8(Value, Index);
end;

class function TEndianness.Int64(Value: Int64; EndianType: TEndiannessType): Int64;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Int64(Value)
  else
    Result := Value;
end;

class function TEndianness.Integer(Value: Integer; EndianType: TEndiannessType): Integer;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Integer(Value)
  else
    Result := Value;
end;

class function TEndianness.LongInt(Value: LongInt; EndianType: TEndiannessType): LongInt;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.LongInt(Value)
  else
    Result := Value;
end;

class function TEndianness.LongWord(Value: LongWord; EndianType: TEndiannessType): LongWord;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.LongWord(Value)
  else
    Result := Value;
end;

class function TEndianness.NativeInt(Value: NativeInt; EndianType: TEndiannessType): NativeInt;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.NativeInt(Value)
  else
    Result := Value;
end;

class function TEndianness.NativeUInt(Value: NativeUInt; EndianType: TEndiannessType): NativeUInt;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.NativeUInt(Value)
  else
    Result := Value;
end;

class function TEndianness.ReadInt16(Value: TBytes; const Index: Integer): SmallInt;
begin
  Result := PSmallInt(@Value[Index])^;
end;

class function TEndianness.ReadInt32(Value: TBytes; const Index: Integer): Integer;
begin
  Result := PInteger(@Value[Index])^;
end;

class function TEndianness.ReadInt64(Value: TBytes; const Index: Integer): Int64;
begin
  Result := PInt64(@Value[Index])^;
end;

class function TEndianness.ReadInt8(Value: TBytes; const Index: Integer): ShortInt;
begin
  Result := PShortInt(@Value[Index])^;
end;

class function TEndianness.ReadUInt16(Value: TBytes; const Index: Integer): Word;
begin
  Result := PWord(@Value[Index])^;
end;

class function TEndianness.ReadUInt32(Value: TBytes; const Index: Integer): Cardinal;
begin
  Result := PCardinal(@Value[Index])^;
end;

class function TEndianness.ReadUInt64(Value: TBytes; const Index: Integer): UInt64;
begin
  Result := PUInt64(@Value[Index])^;
end;

class function TEndianness.ReadUInt8(Value: TBytes; const Index: Integer): Byte;
begin
  Result := Value[Index];
end;

class function TEndianness.ShortInt(Value: ShortInt; EndianType: TEndiannessType): ShortInt;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.ShortInt(Value)
  else
    Result := Value;
end;

class function TEndianness.SmallInt(Value: SmallInt; EndianType: TEndiannessType): SmallInt;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.SmallInt(Value)
  else
    Result := Value;
end;

class function TEndianness.Swap(const Value: Int64): Int64;
begin
  Result := TEndianness.Int64(Value);
end;

class function TEndianness.Swap(const Value: Integer): Integer;
begin
  Result := TEndianness.Integer(Value);
end;

class function TEndianness.Swap(const Value: SmallInt): SmallInt;
begin
  Result := TEndianness.SmallInt(Value);
end;

class function TEndianness.Swap(const Value: ShortInt): ShortInt;
begin
  Result := TEndianness.ShortInt(Value);
end;

class function TEndianness.Swap(const Value: UInt64): UInt64;
begin
  Result := TEndianness.UInt64(Value);
end;

class function TEndianness.Swap(const Value: Cardinal): Cardinal;
begin
  Result := TEndianness.Cardinal(Value);
end;

class function TEndianness.Swap(const Value: Word): Word;
begin
  Result := TEndianness.Word(Value);
end;

class function TEndianness.Swap(const Value: Byte): Byte;
begin
  Result := TEndianness.Byte(Value);
end;

class function TEndianness.Word(Value: Word; EndianType: TEndiannessType): Word;
begin
  if EndianType <> TEndianness.Machine then
    Result := TEndianness.Word(Value)
  else
    Result := Value;
end;

class function TEndianness.Swap(const Value: Int64; EndianType: TEndiannessType): Int64;
begin
  Result := TEndianness.Int64(Value, EndianType);
end;

class function TEndianness.Swap(const Value: Integer; EndianType: TEndiannessType): Integer;
begin
  Result := TEndianness.Integer(Value, EndianType);
end;

class function TEndianness.Swap(const Value: SmallInt; EndianType: TEndiannessType): SmallInt;
begin
  Result := TEndianness.SmallInt(Value, EndianType);
end;

class function TEndianness.Swap(const Value: ShortInt; EndianType: TEndiannessType): ShortInt;
begin
  Result := TEndianness.ShortInt(Value, EndianType);
end;

class function TEndianness.Swap(const Value: UInt64; EndianType: TEndiannessType): UInt64;
begin
  Result := TEndianness.UInt64(Value, EndianType);
end;

class function TEndianness.Swap(const Value: Cardinal; EndianType: TEndiannessType): Cardinal;
begin
  Result := TEndianness.Cardinal(Value, EndianType);
end;

class function TEndianness.Swap(const Value: Word; EndianType: TEndiannessType): Word;
begin
  Result := TEndianness.Word(Value, EndianType);
end;

class function TEndianness.Swap(const Value: Byte; EndianType: TEndiannessType): Byte;
begin
  Result := TEndianness.Byte(Value, EndianType);
end;

end.
