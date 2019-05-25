# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  xNums = []
  oNums = []
  x = 0
  while x < board.length do
    if board[x] == "X"
      xNums.push(x)
    elsif board[x] == "O"
      oNums.push(x)
    end
    x += 1
  end
  puts won_helper(xNums)
  puts won_helper(oNums)

end

def won_helper(arr)
  r = 0
  c = 0
  winner = 0
  while r < WIN_COMBINATIONS.length
    while c < WIN_COMBINATIONS[r].length
      if arr.include? WIN_COMBINATIONS[r][c]
        winner += 1
        if winner == 3
          winning_array = []
          x = 0
          while x < WIN_COMBINATIONS[r].length
            winning_array.push(WIN_COMBINATIONS[r][x])
            x += 1
          end
          return winning_array
        else
          c += 1
          next
        end
      end
      c += 1
    end
    c = 0
    r += 1
    winner = 0
  end
  return false
end

def full?(board)
  board.all? do |val|
    val == "X" || val == "O"
  end
end
