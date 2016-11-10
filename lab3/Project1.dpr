program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Lab3Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLab3Form, Lab3Form);
  Application.Run;
end.
