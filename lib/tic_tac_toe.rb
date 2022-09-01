require 'pry'

class TicTacToe
    attr_accessor :play_arrayO, :play_arrayX, :board
    def initialize

        @board = [" "," "," "," "," "," "," "," "," "]
        @play_arrayX = []
        @play_arrayO = []

    end

    WIN_COMBINATIONS = [
        #ROWS
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        #COLUMNS
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        #DIAGONALS
        [0, 4, 8],
        [6, 4, 2]
    ]

    def display_board
        # puts "    1      2      3 "
        puts "   #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "  ----------- "
        puts "   #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "  ----------- "
        puts "   #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
        
    def current_player

        self.turn_count.even? ? "X" : "O"

    end

    def turn_count

        9 - @board.count(" ")

    end

    def move(move, player)

        @board[move] = player

    end

    def input_to_index(move)

        move.to_i - 1

    end
    
    def position_taken?(move)

        @board[move] != (" ")

    end

    def valid_move?(move)

        !self.position_taken?(move) && move.between?(0,10)

    end
  
    def full?
        
        @board.count(" ") == 0

    end

    def turn
        puts "Enter the space you want to move to:"
        move = gets.chomp
        index = input_to_index(move)
        if valid_move?(index)
            if current_player == "X"
                token = "X"
                @play_arrayX.push(index)
            else
                token = "O"
                @play_arrayO = @play_arrayO.push(index)
            end
            @board[index] = token
        else
            turn
        end
        self.display_board
    end

    def won?
        puts self.display_board
        winset = nil

        WIN_COMBINATIONS.any? { |combo| 
        if
            @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            
            winset = combo
        end }
        puts @board[winset[0]]
        winset

    end

    def draw?
        full? && !won?
    end
    
    def over?
        won? || draw?
    end
    
    def winner
        if win?
        winner = @board.last
        end
    end
    
    def play
        turn until over?
        puts won? ? "Congratulations, #{winner}!" : "It's a tie!"
        
    end
end


  
    # WIN_COMBINATIONS = [
    #     #ROWS
    #     [A1, A2, A3],
    #     [B1, B2, B3],
    #     [C1, C2, C3],
    #     #COLUMNS
    #     [A1, B1, C1],
    #     [A2, B2, C2],
    #     [A3, B3, C3],
    #     #DIAGONALS
    #     [A1, B2, C3],
    #     [C1, B2, A3]
    # ]

    # play_board = [A1, A2, A3, B1, B2, B3, C1, C2, C3]

    # def display_board
    #     puts "    1      2      3"
    #     puts "  A #{play_board[0]} | #{play_board[1]} | #{play_board[2]} "
    #     puts "    ------------ "
    #     puts "  B #{play_board[3]} | #{play_board[4]} | #{play_board[5]} "
    #     puts "    ------------ "
    #     puts "  C #{play_board[6]} | #{play_board[7]} | #{play_board[8]} "
    # end

    # play_arrayX=[]
    # play_arrayO=[]

#     def winner
#         if WIN_COMBINATIONS.map { |combo| combo & play_arrayX == play_arrayX}
#         winner = "X"
#         elsif WIN_COMBINATIONS.map { |combo| combo & play_arrayO == play_arrayO}
#         winner = "O"
#         end
#     winner
# end


    # def move(player, move)
    #     if !board.includes(move) and player == X || O do
    #         board.push(move)
    #         move.display_board = player
    #         if player == X
    #             play_arrayX.push(move)
    #         else 
    #            play_arrayO.push(move)
    #         end 
    #     else 
    #         "This move is not valid!"
    #     end
    # end
# 