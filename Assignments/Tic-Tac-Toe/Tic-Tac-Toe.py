import tkinter as tk
from tkinter import messagebox
import random

class TicTacToe:
    def __init__(self, master):
        # Initialize the main window
        self.master = master
        self.master.title("Tic Tac Toe")

        # Start the process of asking the number of players
        self.ask_players()

    def ask_players(self):
        # Create a frame to hold player selection UI
        self.players_frame = tk.Frame(self.master, pady=20)
        self.players_frame.pack()

        # Title label
        self.title_label = tk.Label(self.players_frame, text="Tic Tac Toe", font=('Helvetica', 20, 'bold'))
        self.title_label.grid(row=0, column=0, columnspan=2, pady=10)

        # Label prompting user to select the number of players
        self.label = tk.Label(self.players_frame, text="Select the number of players:", font=('Helvetica', 12))
        self.label.grid(row=1, column=0, columnspan=2, pady=10)

        # Buttons for selecting 1 or 2 players
        self.one_player_button = tk.Button(self.players_frame, text="1 Player", font=('Helvetica', 12),
                                           command=lambda: self.start_game(1))
        self.one_player_button.grid(row=2, column=0, padx=10)

        self.two_players_button = tk.Button(self.players_frame, text="2 Players", font=('Helvetica', 12),
                                            command=lambda: self.start_game(2))
        self.two_players_button.grid(row=2, column=1, padx=10)

    def start_game(self, players):
        # Destroy the player selection frame and start the game
        self.players_frame.destroy()
        self.game = Game(self.master, players=players)

class Game:
    def __init__(self, master, players=1):
        # Initialize the game instance
        self.master = master
        self.players = players
        self.board = [" " for _ in range(9)]  # Represents the Tic Tac Toe board
        self.current_player = "X"  # "X" goes first

        # Define colors for players (slightly muted)
        self.player_colors = {"X": "#4285f4", "O": "#ea4335"}

        # Create the game board UI
        self.create_board()

    def create_board(self):
        # Create buttons for the Tic Tac Toe board
        self.buttons = [tk.Button(self.master, text=" ", font=('normal', 20), width=6, height=3,
                                 command=lambda i=i: self.make_move(i)) for i in range(9)]

        # Grid placement for buttons
        for i, button in enumerate(self.buttons):
            row, col = divmod(i, 3)
            button.grid(row=row, column=col, padx=5, pady=5)

    def make_move(self, index):
        # Handle player moves
        if self.board[index] == " ":
            self.board[index] = self.current_player
            self.buttons[index].config(text=self.current_player, state="disabled",
                                       disabledforeground='black', bg=self.player_colors[self.current_player])

            # Check for a winner or a tie
            if self.check_winner():
                messagebox.showinfo("Game Over", f"Player {self.current_player} wins!")
                self.reset_game()
            elif " " not in self.board:
                messagebox.showinfo("Game Over", "It's a tie!")
                self.reset_game()
            else:
                # Switch to the next player's turn
                self.current_player = "O" if self.current_player == "X" else "X"
                # If playing against computer, make a computer move
                if self.players == 1 and self.current_player == "O":
                    self.computer_move()

    def computer_move(self):
        # Computer's move strategy
        # Try to find a winning move, then try to block the opponent, take the center, and make a random move if necessary
        winning_move = self.find_winning_move()
        if winning_move is not None:
            self.make_move(winning_move)
            return

        blocking_move = self.find_blocking_move()
        if blocking_move is not None:
            self.make_move(blocking_move)
            return

        if self.board[4] == " ":
            self.make_move(4)
            return

        empty_corners = [i for i in [0, 2, 6, 8] if self.board[i] == " "]
        if empty_corners:
            computer_choice = random.choice(empty_corners)
            self.make_move(computer_choice)
        else:
            empty_cells = [i for i, val in enumerate(self.board) if val == " "]
            if empty_cells:
                computer_choice = random.choice(empty_cells)
                self.make_move(computer_choice)

    def find_winning_move(self):
        # Look for a winning move
        for i in range(9):
            if self.board[i] == " ":
                temp_board = self.board.copy()
                temp_board[i] = self.current_player
                if self.check_winner(temp_board):
                    return i
        return None

    def find_blocking_move(self):
        # Look for a move to block the opponent
        opponent = "X" if self.current_player == "O" else "O"
        for i in range(9):
            if self.board[i] == " ":
                temp_board = self.board.copy()
                temp_board[i] = opponent
                if self.check_winner(temp_board):
                    return i
        return None

    def check_winner(self, board=None):
        # Check if there's a winner on the board
        if board is None:
            board = self.board

        winning_combinations = [(0, 1, 2), (3, 4, 5), (6, 7, 8),
                                (0, 3, 6), (1, 4, 7), (2, 5, 8),
                                (0, 4, 8), (2, 4, 6)]

        for combo in winning_combinations:
            if board[combo[0]] == board[combo[1]] == board[combo[2]] != " ":
                return True
        return False

    def reset_game(self):
        # Reset the game state
        for button in self.buttons:
            button.config(text=" ", state="normal", disabledforeground='black', bg="SystemButtonFace")
        self.board = [" " for _ in range(9)]
        self.current_player = "X"  # "X" goes first

# Main program
if __name__ == "__main__":
    # Create the main Tkinter window
    root = tk.Tk()
    root.geometry("400x400")
    # Start the Tic Tac Toe game
    game_app = TicTacToe(root)
    root.mainloop()
