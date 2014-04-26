class Board

  attr_accessor :is_winner, :cells, :rows, :columns
  attr_reader :possible_numbers


  def initialize(rows, columns)
    @is_winner = false
    @rows = rows
    @columns = columns
    @possible_numbers = (1..(rows * columns)).to_a.shuffle!
    @cells = []
  end

  def populate_board
    begin
      puts "rows: #{rows}, columns: #{columns}"

      columns.times do |column|
        rows.times do |row|

          x = column + 1
          y = row + 1
          value = possible_numbers.pop

          puts "-----> X: #{x}"
          puts "-----> Y: #{y}"
          puts "-----> value: #{value}"

          cell = Cell.new(x, y, value)
          self.cells << cell
        end
      end

    rescue => e
      puts "error #{e.message}"
    end
  end

  def reset_board
    self.cells = []
    populate_board
  end

end