# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Downward diagonal
  [2,4,6]  # Upward diagonal
] 

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]
      if board[combination[0]] == "X" || board[combination[0]] == "O"
        return combination
      end
    end
  end
  return nil
end

def winner(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]
      if board[combination[0]] == "X"
        return "X"
      elsif board[combination[0]] == "O"
        return "O"
      end
    end
  end
  return nil
end

def full?(board)
  return [0,1,2,3,4,5,6,7,8].all? {|index| position_taken?(board,index)}
end

def over?(board)
  winner(board) != nil || full?(board) == true
end

def draw?(board)
  winner(board) == nil && full?(board) == true
end