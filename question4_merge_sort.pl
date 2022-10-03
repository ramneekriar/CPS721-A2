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

%%%%% RULE: listLength
% Add the rule(s) for listLength below

listLength(listTerm(empty_list, empty_list), 0).
listLength(listTerm(H, empty_list), 1).
listLength(listTerm(H, T), X) :- listLength(T, M), X is 1 + M.

%%%%% RULE: divideList
% Add the rule(s) for divideList below
% divideList(ListTerm, Num, FirstHalf, SecondHalf)
% FirstHalf contains first Num elements of ListTerm, and SecondHalf contains the remaining.

divideList(listTerm(empty_list, empty_list), Num, listTerm(empty_list, empty_list), listTerm(empty_list, empty_list)).
divideList(ListTerm, Num, FirstHalf, SecondHalf) :- acc(ListTerm, Num, empty_list, FirstHalf_Rev, SecondHalf), reverseListTerm(FirstHalf_Rev, FirstHalf).

%%%%% RULE: mergeSortedLists
% Add the rule(s) for mergeSortedLists below
% mergeSortedLists(SortedListTerm1, SortedListTerm2, MergedList)

mergeSortedLists(empty_list, empty_list, empty_list).
mergeSortedLists(empty_list, LT, LT).
mergeSortedLists(LT, empty_list, LT).

%%%%% Helpers
% Add any additional helpers below

% divideList Helpers
acc(ListTerm, 0, FirstHalf, FirstHalf, ListTerm).
acc(listTerm(H, T), Num, FH_listTerm, FirstHalf, SecondHalf) :- Num > 0, New_Num is (Num - 1), acc(T, New_Num, listTerm(H, FH_listTerm), FirstHalf, SecondHalf).  

reverseListTerm(LT1, LT2) :- rev(LT1, empty_list, LT2).
rev(empty_list, LT, LT).
rev(listTerm(H, T), FH_listTerm, FirstHalf) :- rev(T, listTerm(H, FH_listTerm), FirstHalf).

%%%%% RULE: mergeSort
% Add the rule(s) for mergeSort below


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
