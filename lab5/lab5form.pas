unit lab5form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TPluginsForm = class(TForm)
    Label1: TLabel;
    PluginsComboBox: TComboBox;
    FunctionLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    VariableEdit: TEdit;
    AnswerEdit: TEdit;
    CalcButton: TButton;
    procedure PluginsComboBoxSelect(Sender: TObject);
    procedure CalcButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure DiscoverPlugins;
  public
    { Public declarations }
  end;

var
  PluginsForm: TPluginsForm;

type
  StrFunc = function: PChar;
  FloatFunc = function(x: real): real;

implementation

{$R *.dfm}


procedure TPluginsForm.DiscoverPlugins;
var
  F: TSearchRec;
begin
  if FindFirst('plugins/*.dll', faAnyFile, F) = 0 then begin
    repeat
      PluginsComboBox.Items.Add(StringReplace(F.Name, '.dll', '', [rfReplaceAll, rfIgnoreCase]));
    until FindNext(F) <> 0;
    FindClose(F);
  end;
end;

procedure TPluginsForm.FormShow(Sender: TObject);
begin

  Self.DiscoverPlugins;

  PluginsComboBox.Items.Add('missing_library');

  if PluginsComboBox.Items.Count > 0 then
  begin
    PluginsComboBox.ItemIndex := 0;
    Self.PluginsComboBoxSelect(Self);
  end;

end;

procedure TPluginsForm.CalcButtonClick(Sender: TObject);
var
  hDll: THandle;
  DllFile: string;
  PluginFloatFunc: FloatFunc;
begin

  AnswerEdit.Text := '������';

  DllFile := 'plugins/' + PluginsComboBox.Items[PluginsComboBox.ItemIndex] + '.dll';

  hDll := LoadLibrary(PChar(DllFile));
  if hDll = 0 then
  begin
    MessageBox(Self.Handle, PChar('�� ������� ��������� ' + DllFile), PChar('������'), MB_OK + MB_ICONERROR);
    Exit;
  end;

  @PluginFloatFunc := GetProcAddress(hDll, 'FloatFunc');
  if @PluginFloatFunc = nil then
  begin
    MessageBox(Self.Handle, PChar('FloatFunc �� ������� � ' + DllFile), PChar('������'), MB_OK + MB_ICONERROR);
    Exit;
  end;

  try
    AnswerEdit.Text := FloatToStr(RoundTo(PluginFloatFunc(StrToFloat(VariableEdit.Text)), -2));
  except
  end;

  FreeLibrary(HDLL);
end;

procedure TPluginsForm.PluginsComboBoxSelect(Sender: TObject);
var
  hDll: THandle;
  DllFile: string;
  PluginStrFunc: StrFunc;
begin

  AnswerEdit.Text := '';
  FunctionLabel.Caption := '';

  DllFile := 'plugins/' + PluginsComboBox.Items[PluginsComboBox.ItemIndex] + '.dll';

  hDll := LoadLibrary(PChar(DllFile));
  if hDll = 0 then
  begin
    MessageBox(Self.Handle, PChar('�� ������� ��������� ' + DllFile), PChar('������'), MB_OK + MB_ICONERROR);
    Exit;
  end;

  @PluginStrFunc := GetProcAddress(hDll, 'StrFunc');
  if @PluginStrFunc = nil then
  begin
    MessageBox(Self.Handle, PChar('StrFunc �� ������� � ' + DllFile), PChar('������'), MB_OK + MB_ICONERROR);
    Exit;
  end;

  FunctionLabel.Caption := PluginStrFunc;

  FreeLibrary(hDll);
end;

end.
