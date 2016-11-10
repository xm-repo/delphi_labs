program lab21;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows;

function CmdExec(const Cmd: string): Integer;
// ���������� ����������� ���������� � ��������� ��� ���������� � ��������� ���� ��������
var
  Rlst: LongBool;
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  ExitCode: Cardinal;
begin
  FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0); // ���������� ��������� ������
  with StartUpInfo do
  begin
    cb := SizeOf(TStartUpInfo);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := SW_SHOWNORMAL;
  end; {with}
  Rlst := CreateProcess(
      nil,
      PChar(Cmd), // �������
      nil,
      nil,
      False, // ���� ������������ �������� ��������
      NORMAL_PRIORITY_CLASS, // ����� �������� �������� ��������
      nil,
      nil, // ������� ���� � �������
      StartUpInfo, // ��������� STARTUPINFO
      ProcessInfo // ��������� PROCESS_INFORMATION
    );
  if Rlst then begin // ���� ������ ������ �������
    with ProcessInfo do begin
      WaitForInputIdle(hProcess, INFINITE); // ���� ���������� �������������
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE); // ���� ���������� ��������
      GetExitCodeProcess(ProcessInfo.hProcess, ExitCode); // �������� ��� ����������
      CloseHandle(hThread); // ��������� ���������� ��������
      CloseHandle(hProcess); // ��������� ���������� ������
    end; {with}
  end else begin // ������ ���������� �������
    WriteLn('Error: ', GetLastError, ' > ', Cmd);
    ExitCode := 0;
  end; {if}
  Result := Integer(ExitCode); // ���������� ��� �������� � ����������� � ���� Integer
end; {func CmdExec}


var
  inFile, outFile : TextFile;
  integers : string;
begin

  AssignFile(inFile, ParamStr(1));
  Reset(inFile);

  AssignFile(outFile, ParamStr(2));
  Rewrite(outFile);

  while not Eof(inFile) do
  begin
    Readln(inFile, integers);
    Writeln(outFile, CmdExec('lab2.exe ' + integers));
  end;

  CloseFile(inFile);
  CloseFile(outFile);

  WinExec(PChar('notepad.exe ' + ParamStr(2)), SW_SHOWNORMAL);  

end.

{
��� ����� ������ �����-������?
��� � ������� Windows ������������ ��������������� ������ ������ � ����? > >>
��� � ������� Windows ������������ ����� ����� �� �����? <
����� ��������� � Delphi ��������� ��������� ��������� � �������� ��������� ��� ��������? Halt
��� �������� �������� ���� �������� � ������� Windows? echo %errorlevel%
����� ���������� ������� ������� ���������� �� ����� ���������? Halt
}
