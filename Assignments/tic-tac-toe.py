import random

# Define the board as a list of 9 empty strings
board = [" " for i in range(9)]

# Define a function to display the board
def display_board():
    print(" " + board[0] + " | " + board[1] + " | " + board[2] + " ")
    print("---+---+---")
    print(" " + board[3] + " | " + board[4] + " | " + board[5] + " ")
    print("---+---+---")
    print(" " + board[6] + " | " + board[7] + " | " + board[8] + " ")

# Define a function to check if the board is full
def is_full():
    return " " not in board

# Define a function to check if a player has won
def has_won(symbol, current_board):
    # Check rows
    for i in range(0, 9, 3):
        if current_board[i] == current_board[i+1] == current_board[i+2] == symbol:
            return True
    # Check columns
    for i in range(0, 3):
        if current_board[i] == current_board[i+3] == current_board[i+6] == symbol:
            return True
    # Check diagonals
    if current_board[0] == current_board[4] == current_board[8] == symbol:
        return True
    if current_board[2] == current_board[4] == current_board[6] == symbol:
        return True
    # No winner
    return False

# Define a function to get the valid moves
def get_valid_moves():
    moves = []
    for i in range(9):
        if board[i] == " ":
            moves.append(i)
    return moves

# Define a function to get the human player's move
def get_human_move(symbol):
    while True:
        try:
            move = int(input(f"Player {symbol}, enter your move (1-9): ")) - 1
            if move in get_valid_moves():
                return move
            else:
                print("Invalid move. Try again.")
        except ValueError:
            print("Invalid input. Try again.")

# Define a function to get the computer player's move with a more efficient strategy
def get_computer_move(symbol):
    # Check if the computer can win in the next move
    for i in get_valid_moves():
        board_copy = board.copy()
        board_copy[i] = symbol
        if has_won(symbol, board_copy):
            return i

    # Check if the human can win in the next move and block it
    opponent_symbol = "O" if symbol == "X" else "X"
    for i in get_valid_moves():
        board_copy = board.copy()
        board_copy[i] = opponent_symbol
        if has_won(opponent_symbol, board_copy):
            return i

    # Try to take the center
    if 4 in get_valid_moves():
        return 4

    # Try to take a corner
    corners = [0, 2, 6, 8]
    corner_moves = [corner for corner in corners if corner in get_valid_moves()]
    if corner_moves:
        return random.choice(corner_moves)

    # If none of the above, take a random move
    return random.choice(get_valid_moves())

# Define the main function to run the game loop
def main():
    # Display the initial board
    display_board()

    # Choose the symbols for the players
    human_symbol = "X"
    computer_symbol = "O"

    # Ask the user how many players are there
    while True:
        try:
            num_players = int(input("How many players are there? (1 or 2): "))
            if num_players == 1 or num_players == 2:
                break
            else:
                print("Invalid number. Try again.")
        except ValueError:
            print("Invalid input. Try again.")

    # Choose the turn randomly
    turn = random.choice([human_symbol, computer_symbol])

    # Run the game loop until the board is full or someone has won
    while not is_full() and not has_won(human_symbol, board) and not has_won(computer_symbol, board):
        # Display the turn
        print(turn + "'s turn")

        # Get the move depending on the turn and the number of players
        if turn == human_symbol:
            move = get_human_move(turn)
        else:
            if num_players == 1:
                move = get_computer_move(turn)
            else:
                move = get_human_move(turn)

        # Update the board with the move
        board[move] = turn

        # Display the board
        display_board()

        # Switch the turn
        if turn == human_symbol:
            turn = computer_symbol
        else:
            turn = human_symbol

    # Display the result
    if has_won(human_symbol, board):
        print(f"Player {human_symbol} wins!")
    elif has_won(computer_symbol, board):
        print(f"Player {computer_symbol} wins!")
    else:
        print("It's a tie!")

# Call the main function
main()
