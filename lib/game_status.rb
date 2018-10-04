# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    moves = [board[combination[0]], board[combination[1]], board[combination[2]]]
    if moves.all?{|move| (move == "X")} || moves.all?{|move| (move == "O")}
      return combination
    end
  end
  return false
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  # Returns if the board is full and no win exists, then true
  # returns if the board is not won and not full, then false
  # if won, then false
  return !(board.won?) || (board.won? || board.full?) || (board.full? && !(board.won?))
end