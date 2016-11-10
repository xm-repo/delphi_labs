unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, Registry;

type
  TLab3Form = class(TForm)
    TextToSave: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BackgroundColorBox: TColorBox;
    CloseButton: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BackgroundColorBoxSelect(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);

  private
    procedure SaveINI;
    procedure ReadINI;
    procedure SaveReg;
    procedure ReadReg;
  public
    { Public declarations }
  end;

var
  Lab3Form: TLab3Form;

implementation

{$R *.dfm}

procedure TLab3Form.SaveINI;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'my.ini');
  IniFile.WriteInteger('POSITION', 'top', self.Top);
  IniFile.WriteInteger('POSITION', 'left', self.Left);
  IniFile.WriteInteger('FORM', 'color', BackgroundColorBox.Selected);
  IniFile.WriteString('VALUES', 'text', TextToSave.Text);
  IniFile.Free;
end;

procedure TLab3Form.ReadINI;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'my.ini');
  Self.Top := IniFile.ReadInteger('POSITION', 'top', self.Top);
  Self.Left := IniFile.ReadInteger('POSITION', 'left', self.Left);
  Self.Color := IniFile.ReadInteger('FORM', 'color', Self.Color);
  BackgroundColorBox.Selected := IniFile.ReadInteger('FORM', 'color', Self.Color);
  TextToSave.Text := IniFile.ReadString('VALUES', 'text', TextToSave.Text);
  IniFile.Free;
end;

procedure TLab3Form.SaveReg;
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  Registry.RootKey := HKEY_CURRENT_USER;
  Registry.OpenKey('Software\AGU\lab3', true);
  Registry.WriteInteger('top', self.Top);
  Registry.WriteInteger('left', self.Left);
  Registry.WriteInteger('color', BackgroundColorBox.Selected);
  Registry.WriteString('text', TextToSave.Text);
  Registry.CloseKey;
  Registry.Free;
end;

procedure TLab3Form.ReadReg;
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  Registry.RootKey := HKEY_CURRENT_USER;
  Registry.OpenKey('Software\AGU\lab3', true);

  if Registry.ValueExists('top') then
  begin
    Self.Top := Registry.ReadInteger('top');
  end;

  if Registry.ValueExists('left') then
  begin
    Self.Left := Registry.ReadInteger('left');
  end;

  if Registry.ValueExists('color') then
  begin
    Self.Color := Registry.ReadInteger('color');
    BackgroundColorBox.Selected := Registry.ReadInteger('color');
  end;

  if Registry.ValueExists('text') then
  begin
    TextToSave.Text := Registry.ReadString('text');
  end;

  Registry.CloseKey;
  Registry.Free;
end;

procedure TLab3Form.CloseButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TLab3Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.SaveINI;
  Self.SaveReg;
end;

procedure TLab3Form.FormShow(Sender: TObject);
begin
  //Self.ReadINI;
  Self.ReadReg;
end;

procedure TLab3Form.BackgroundColorBoxSelect(Sender: TObject);
begin
  Self.Color := BackgroundColorBox.Selected;
end;

end.
