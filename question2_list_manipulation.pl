% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Karanvir Heer
%%%%% NAME: Ramneek Riar
%%%%% NAME: Shruti Sharma
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% RULE: listMap
% Add the rule(s) for part a below
% listMap(KeysList, ValuesMap, Key, Value)
% Check if Key and Value are in the same spot in their respective lists

listMap([Key | KeyTail], [Value | ValueTail], Key, Value). 
listMap([KeyHead | KeyTail], [ValueHead | ValueTail], Key, Value) :- listMap(KeyTail, ValueTail, Key, Value).

%%%%% RULE: encodeList
% Add the rule(s) for part b below
% encodeList(List, MapKeysList, MapValuesList, EncodedList)

encodeList([], MapKeysList, MapValuesList, []).
encodeList([ListHead|ListTail], MapKeysList, MapValuesList, [EncodedVal|EncodedTail]) :- listMap(MapKeysList, MapValuesList, ListHead, EncodedVal), encodeList(ListTail, MapKeysList, MapValuesList, EncodedTail).

%%%%% RULE: consecutiveCount
%  Add the rule(s) for part c below 
consecutiveCount([], 0).
consecutiveCount([Head], 0).
consecutiveCount([Head1, Head2 | Tail], Count) :- \+ Head1=Head2, consecutiveCount([Head2|Tail], Count).
consecutiveCount([Head1, Head2 | Tail], Count) :- consecutiveCount([Head2|Tail], OtherCount), Head1=Head2, Count is 1 + OtherCount.

%%%%% RULE: splitOnInt
%  Add the rule(s) for part d below 
splitOnInt([], Value, [], []).
splitOnInt([ListHead|ListTail], Value, [ListHead|SmallerTail], NoSmallerList) :- ListHead =< Value, splitOnInt(ListTail, Value, SmallerTail, NoSmallerList).
splitOnInt([ListHead|ListTail], Value, NoLargerList, [ListHead|LargerTail]) :- ListHead > Value, splitOnInt(ListTail, Value, NoLargerList, LargerTail).

%%%%% RULE: incAverage
% Add the rule(s) for part e below
incAverage([], 0, 0).
incAverage([Head|Tail], Average, NumElements) :- incAverage(Tail, PrevAverage, ElemCount), NumElements is ElemCount + 1, Average is (PrevAverage + ((Head - PrevAverage) / NumElements)).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW