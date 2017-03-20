-module (pkcs5).

-export ([pad/1]).
-export ([unpad/1]).

pad(Bin) ->
  Diff = byte_size(Bin) rem 8,
  pad(Bin, 8-Diff).

pad(Bin, 1) ->
  <<Bin/binary,1>>;
pad(Bin, 2) ->
  <<Bin/binary,2,2>>;
pad(Bin, 3) ->
  <<Bin/binary,3,3,3>>;
pad(Bin, 4) ->
  <<Bin/binary,4,4,4,4>>;
pad(Bin, 5) ->
  <<Bin/binary,5,5,5,5,5>>;
pad(Bin, 6) ->
  <<Bin/binary,6,6,6,6,6,6>>;
pad(Bin, 7) ->
  <<Bin/binary,7,7,7,7,7,7,7>>;
pad(Bin, 8) ->
  <<Bin/binary,8,8,8,8,8,8,8,8>>.

unpad(<<>>) ->
  <<>>;
unpad(Bin) ->
  Last = binary:last(Bin),
  Size = byte_size(Bin) - Last,
  RemSize = Size rem 8,

  case Bin of
    <<Data:Size/binary,1>> when RemSize == 7 -> Data;
    <<Data:Size/binary,2,2>> when RemSize == 6 -> Data;
    <<Data:Size/binary,3,3,3>> when RemSize == 5 -> Data;
    <<Data:Size/binary,4,4,4,4>> when RemSize == 4 -> Data;
    <<Data:Size/binary,5,5,5,5,5>> when RemSize == 3 -> Data;
    <<Data:Size/binary,6,6,6,6,6,6>> when RemSize == 2 -> Data;
    <<Data:Size/binary,7,7,7,7,7,7,7>> when RemSize == 1 -> Data;
    <<Data:Size/binary,8,8,8,8,8,8,8,8>> when RemSize == 0 -> Data;
    _ -> erlang:error(bad_padding)
  end.
