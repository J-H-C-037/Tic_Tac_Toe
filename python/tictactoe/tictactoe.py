"""
Tic Tac Toe Player
"""

import math

X = "X"
O = "O"
EMPTY = None


def initial_state():
    """
    Returns starting state of the board.
    """
    return [[EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY]]


def player(board):
    """
    Returns player who has the next turn on a board.
    """
    empties = 0

    for i in range(0,3):
        for j in range(0,3):
            if (board[i][j] == Empty): empties += 1

    if (empties == 0): return Empty
    return X if empties % 2 == 1 else O

    raise NotImplementedError


def actions(board):
    """
    Returns set of all possible actions (i, j) available on the board.
    """

    moves = {}

    for i in range(0,3):
        for j in range(0,3):
            if (board[i][j] != Empty): moves.add((i,j))

    return moves

    raise NotImplementedError


def result(board, action):
    """
    Returns the board that results from making move (i, j) on the board.
    """
    resultboard = copy.deep_copy(board)

    if (resultboard[action[0]][action[1]] == Empty):
        resultboard[action[0]][action[1]] = player(board)
    else:
        raise Exception("Impossible move")

    return resultboard


def winner(board):
    """
    Returns the winner of the game, if there is one.
    """

    if (terminal(board) == True and len(actions) != 0):
            return X if (player(board) == O) else O
    else:
        return None

    raise NotImplementedError

def terminal(board):
    """
    Returns True if game is over, False otherwise.
    """

    pattern = [
    [[0,0],[0,1],[0,2]],
    [[1,0],[1,1],[1,2]],
    [[2,0],[2,1],[2,2]],
    [[0,0],[0,1],[0,2]],
    [[1,0],[1,1],[1,2]],
    [[2,0],[2,1],[2,2]],
    [[0,0],[1,1],[2,2]],

    ]

    for i in pattern:
            if ( board[i[0][0]][i[0][1]] == X
            and board[i[1][0]][i[1][1]] == X
            and board[i[2][0]][i[2][1]] == X):

                return True

            elif (board[i[0][0]][i[0][1]] == O
            and board[i[1][0]][i[1][1]] == O
            and board[i[2][0]][i[2][1]] == O):

                return True

    raise NotImplementedError


def utility(board):
    """
    Returns 1 if X has won the game, -1 if O has won, 0 otherwise.
    """

    if (winner(board) == O):
        return -1
    elif (winner(board) == X):
        return 1
    elif (winner(board) == None and terminal(board) == True):
        return 0


    raise NotImplementedError


def minimax(board):
    """
    Returns the optimal action for the current player on the board.
    """
    if (len(actions(board) != 0)):
        return actions(board)[1]
    else:
        return None
    raise NotImplementedError
