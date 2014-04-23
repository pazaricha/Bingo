class Board

  attr_accessor :is_winner, :size, :cells
  POSSIBLE_NUBMERS = [1, 2, 3, 4, 5, 6, 7, 8, 9]


  def initialize(size)
    @is_winner = false
    @size = size
    @cells = []
  end

  def populate_board
    begin
      rows, columns = self.size.first, self.size.last
      
      puts "rows: #{rows}, columns: #{columns}"

      rows.times do |column|
        columns.times do |row|

          x = column + 1
          y = row + 1

          puts "-----> X: #{x}"
          puts "-----> Y: #{y}"
          
          value = generate_random_value(columns, rows, x, y)
          cell = Cell.new(x, y, value)
          self.cells << cell
        end
      end

      columns.times do |column|
        rows.times do |row|
          x = column + 1
          y = row + 1
          puts x
          puts y
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

  private

  def generate_random_value(columns, rows, current_x, current_y)
    # 10, 10, 1, 1
    previous_x_cell = current_x > 1 ? current_x - 1 : nil # 1
    next_x_cell = current_x < columns ? current_x + 1 : nil # 2
    previous_y_cell = current_y > 1 ? current_y - 1 : nil # 3
    next_y_cell = current_y < rows ? current_y + 1 : nil # 4

    rand_range = POSSIBLE_NUBMERS - [previous_x_cell, next_x_cell, previous_y_cell, next_y_cell]
    rand(rand_range.first..rand_range.last)
  end

end