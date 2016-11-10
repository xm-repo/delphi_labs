unit CalcForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, stack;

type
  TMainForm = class(TForm)
    ExpressionEdit: TEdit;
    AnswerEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    AnswerButton: TButton;
    procedure AnswerButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.AnswerButtonClick(Sender: TObject);
var
  token: string;
  tokens: TStringList;
begin

  stClear;
  tokens := TStringList.Create;

  AnswerEdit.Text := '������������ ���������';

  try

    ExtractStrings([' '], [], PChar(ExpressionEdit.Text), tokens);

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

    if stCount = 1 then
      AnswerEdit.Text := IntToStr(stPop);

  except
    //do nothing
  end;

  tokens.Free;

end;

end.
