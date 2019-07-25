require "pry"

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(location)
    location.to_i - 1.to_i
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index].include?("X") || @board[index].include?("O")
  end
  
  def valid_move?(position)
    position <= 8 && position >= 0 && !position_taken?(position)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end
  
  def turn
    puts "Choose a position between 1-9."
    display_board
    index = gets.strip
    position = input_to_index(index)
    if valid_move?(position)
      @board[position] = current_player
    else
      turn
    end
  end
  
  def won?
    won = false
    WIN_COMBINATIONS.each do |win|
      if win.map {|el| @board[el] == "X" }.all?
        won = win
      elsif win.map {|el| @board[el] == "O" }.all?
        won = win
      end
    end
    won
  end
  
  def full?
    full = false
    if (0...9).to_a.all? { |num| position_taken?(num) } && !won?
      full = true
    end
    full
  end
  
  def draw?
end