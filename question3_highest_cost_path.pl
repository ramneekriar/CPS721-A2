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

%%%%% Helper Programs
% Put any helper programs in the space below

% Left has highest cost
findHighestCost(LeftCost, RightCost, MiddleCost, LeftPathList, RightPathList, MiddlePathList, HighestCost, PathList) :- LeftCost >= MiddleCost, LeftCost >= RightCost, HighestCost is LeftCost, PathList=LeftPathList.

% Middle has highest cost
findHighestCost(LeftCost, RightCost, MiddleCost, LeftPathList, RightPathList, MiddlePathList, HighestCost, PathList) :- MiddleCost >= LeftCost, MiddleCost >= RightCost, HighestCost is MiddleCost, PathList=MiddlePathList.

% Right has highest cost
findHighestCost(LeftCost, RightCost, MiddleCost, LeftPathList, RightPathList, MiddlePathList, HighestCost, PathList) :- RightCost >= MiddleCost, RightCost >= LeftCost, HighestCost is RightCost, PathList=RightPathList.

%%%%% RULE: highestCostPath
% Add the rule(s) for highestCostPath below

% Empty
highestCostPath(none, 0, []).
highestCostPath(tree3(Name, 0, none, 0, none, 0, none), 0, [Name]).

% Traverse Left
highestCostPath(tree3(Name,  LeftCost, Left,  MiddleCost, Middle, RightCost, Right), PathCost, [Name|Tail]) :- highestCostPath(Left, LeftTotalCost, LeftPathList), 
                                                                                                                highestCostPath(Right, RightTotalCost, RightPathList), 
                                                                                                                highestCostPath(Middle, MiddleTotalCost, MiddlePathList),
                                                                                                                LC is LeftTotalCost + LeftCost,
                                                                                                                RC is RightTotalCost + RightCost,
                                                                                                                MC is MiddleTotalCost + MiddleCost,
                                                                                                                findHighestCost(LC, RC, MC, LeftPathList, RightPathList, MiddlePathList, HighestCost, PathList),
                                                                                                                PathCost is HighestCost,
                                                                                                                Tail=PathList.

%%%%% TESTS
% Below is a test tree, based on the diagram in the assignment
% You can use it in a query as follows:
%
% ?- testTree(1, X), highestCostPath(X, Cost, Path).
%
% You may also add additional tree below for testing in this way, though we will not mark them.

testTree(1, 
    tree3(a,  % The root node has name a
            2, tree3(b, % Left child of a is b and can be reached with cost 2 
                    3, tree3(e,0, none, 0, none, 0, none),   % Left child of b is e. It is a leaf node
                    5, tree3(f, 0, none, 0, none, 0, none),   % Middle child of b is f. It is a leaf node
                    0, none  % There is no right childe of b
                    ),
            3, tree3(c, 0, none, 0, none, 0, none),  % Middle child of a is c. It is a leaf node
            1, tree3(d,   % Right child of a is d
                    2, tree3(g, 0, none, 0, none,   % Left child of d is g. It has no left or middle child
                            1, tree3(h, 0, none, 0, none, 0, none)),   % The right child of g is h. It is a leaf node
                    0, none, 0, none  % d has no middle or right children
                    )
        )
).

testTree(2,
    tree3(a,
            2, tree3(b, 0, none, 0, none, 0, none),
            3, tree3(c, 0, none, 0, none, 0, none),
            1, tree3(d, 0, none, 0, none, 0, none)
    )
).

%%%%% END
% DO NOT PUT ANY LINES BELOW