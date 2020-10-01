unit TestIntegerHashList;

interface

uses
  DUnitX.TestFramework,
  HashList;

type

  [TestFixture]
  TTestIntegerHashList = class(TObject)
  strict private
    IntegerHashList: THashList<Integer>;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('TestAdicionar1Registro', '1')]
    [TestCase('TestAdicionar10Registros', '10')]
    procedure DeveAdicionarRegistrosDeFormaUnitaria(const AQuantidadeRegistros: Integer);
    [Test]
    [TestCase('TestAdicionar1Registro', '1')]
    [TestCase('TestAdicionar100Registros', '100')]
    procedure DeveAdicionarRegistrosDeMultipla(const AQuantidadeRegistros: Integer);
  end;

implementation

{ TTestHashList }

procedure TTestIntegerHashList.Setup;
begin
  IntegerHashList := THashList<Integer>.Create;
end;

procedure TTestIntegerHashList.TearDown;
begin
  IntegerHashList.Free;
end;

procedure TTestIntegerHashList.DeveAdicionarRegistrosDeFormaUnitaria(const AQuantidadeRegistros: Integer);
begin
  for var I: Integer := 1 to AQuantidadeRegistros do
  begin
    IntegerHashList.Add(I);
  end;

  Assert.AreEqual(AQuantidadeRegistros, IntegerHashList.Count, 'Quantidade de registros diferente do esperado!');
  for var I: Integer := 1 to AQuantidadeRegistros do
  begin
    Assert.Contains<Integer>(IntegerHashList.Values, I, 'Registro não encontrado!');
  end;
end;

procedure TTestIntegerHashList.DeveAdicionarRegistrosDeMultipla(const AQuantidadeRegistros: Integer);
var
  aArrayInteger: TArray<Integer>;
begin
  aArrayInteger := [];
  for var I: Integer := 1 to AQuantidadeRegistros do
  begin
    aArrayInteger := aArrayInteger + [I];
  end;

  IntegerHashList.Add(aArrayInteger);
  Assert.AreEqual(AQuantidadeRegistros, IntegerHashList.Count, 'Quantidade de registros diferente do esperado!');
  for var I: Integer := 1 to AQuantidadeRegistros do
  begin
    Assert.Contains<Integer>(IntegerHashList.Values, I, 'Registro não encontrado!');
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TTestIntegerHashList);

end.
