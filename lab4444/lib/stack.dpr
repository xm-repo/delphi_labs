library stack;

uses
  SysUtils, Classes, Windows;

{$R *.res}

type
  TNodePointer = ^TNode;
  TNode = record
    value: integer;
    next: TNodePointer;
  end;

var
  head: TNodePointer;
  N: integer;

function empty: boolean;
begin
  result := (N = 0);
end;

procedure push(value: integer);
var
  newHead: TNodePointer;
begin
  New(newHead);
  newHead^.value := value;
  newHead^.next := head;
  head := newHead;

  N := N + 1;
end;

function top: integer;
begin
  if not empty then
    result := head^.value;
end;

function pop: integer;
var
  temp: TNodePointer;
begin
  if not empty then
  begin
    result := head^.value;
    temp := head;
    head := head^.next;
    Dispose(temp);
    N := N - 1;
  end
end;

procedure clear;
begin

  while not empty do
    pop;

  head:= nil;
  N := 0;
end;

function count: integer;
begin
  result := N;
end;

procedure ThisDLLProc(Reason: integer);
begin
  if Reason = DLL_PROCESS_DETACH then
  begin
    clear;
  end;
end;

exports
  empty,
  push,
  top,
  pop,
  clear,
  count;

begin
  DLLProc := @ThisDLLProc;
end.
