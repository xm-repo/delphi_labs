program lab5;

uses
  Forms,
  lab5form in 'lab5form.pas' {PluginsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPluginsForm, PluginsForm);
  Application.Run;
end.
