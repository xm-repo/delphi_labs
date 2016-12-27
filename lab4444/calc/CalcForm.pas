unit CalcForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, stack;

type
  TMainForm = class(TForm)
    ExprEdit: TEdit;
    AnswEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    AnswButton: TButton;
    procedure AnswButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.AnswButtonClick(Sender: TObject);
var
  token: string;
  tokens: TStringList;
begin

  stClear;

  tokens := TStringList.Create;
  ExtractStrings([' '], [], PChar(ExprEdit.Text), tokens);

  for token in tokens do
    begin
      if (token = '+') then
        stPush(stPop + stPop)
      else if (token = '-') then
        stPush(- stPop + stPop)
      else if (token = '*') then
        stPush(stPop * stPop)
      else
        stPush(StrToInt(token))
    end;

  AnswEdit.Text := IntToStr(stPop);

  tokens.Free;

end;

end.
