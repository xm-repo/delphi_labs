unit stack;

interface
  function stEmpty: boolean;
  procedure stPush(value: integer);
  function stTop: integer;
  function stPop: integer;
  procedure stClear;
  function stCount: integer;

implementation

const
  stackDll = 'stack.dll';

function stEmpty; external stackDll name 'empty';
procedure stPush; external stackDll name 'push';
function stTop; external stackDll name 'top';
function stPop; external stackDll name 'pop';
procedure stClear; external stackDll name 'clear';
function stCount; external stackDll name 'count';

end.
