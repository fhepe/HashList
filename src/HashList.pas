unit HashList;

interface

uses
  Generics.Collections;

type
  THashList<TKey> = class
  strict private
    oDicionario: TDictionary<TKey, Boolean>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(const Key: TKey); overload;
    procedure Add(const Keys: TArray<TKey>); overload;
    procedure Remove(const Key: TKey); overload;
    procedure Remove(const Keys: TArray<TKey>); overload;
    function Contains(const Key: TKey): Boolean;
    function Count: Integer;
    function Values: TArray<TKey>;
    procedure Clear;
  end;

implementation

{ THashList<TKey> }

constructor THashList<TKey>.Create;
begin
  oDicionario := TDictionary<TKey, Boolean>.Create;
end;

destructor THashList<TKey>.Destroy;
begin
  oDicionario.Free;

  inherited;
end;

procedure THashList<TKey>.Add(const Key: TKey);
begin
  oDicionario.AddOrSetValue(Key, True);
end;

procedure THashList<TKey>.Add(const Keys: TArray<TKey>);
var
  Key: TKey;
begin
  for Key in Keys do
  begin
    oDicionario.AddOrSetValue(Key, True);
  end;
end;

procedure THashList<TKey>.Clear;
begin
  oDicionario.Clear;
end;

function THashList<TKey>.Contains(const Key: TKey): Boolean;
begin
  Result := oDicionario.ContainsKey(Key);
end;

function THashList<TKey>.Count: Integer;
begin
  Result := oDicionario.Count;
end;

procedure THashList<TKey>.Remove(const Key: TKey);
begin
  oDicionario.Remove(Key);
end;

procedure THashList<TKey>.Remove(const Keys: TArray<TKey>);
var
  Key: TKey;
begin
  for Key in Keys do
  begin
    oDicionario.Remove(Key);
  end;
end;

function THashList<TKey>.Values: TArray<TKey>;
begin
  Result := oDicionario.Keys.ToArray;
end;

end.
