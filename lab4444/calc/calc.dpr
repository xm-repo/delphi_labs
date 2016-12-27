program calc;

uses
  Forms,
  CalcForm in 'CalcForm.pas' {MainForm},
  stack in 'stack.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
