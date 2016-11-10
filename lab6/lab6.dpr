program lab6;

uses
  Forms,
  l6form in 'l6form.pas' {Lab6Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLab6Form, Lab6Form);
  Application.Run;
end.
