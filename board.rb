class Board

  attr_accessor :is_winner, :size, :cells, :rows, :columns

  POSSIBLE_NUBMERS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize(size)
    @is_winner = false
    @size = size
    @rows = @size.first
    @columns = @size.last
    @cells = []
  end

  def populate_board
    begin
      puts "rows: #{rows}, columns: #{columns}"

      columns.times do |column|
        rows.times do |row|

          x = column + 1
          y = row + 1

          puts "-----> X: #{x}"
          puts "-----> Y: #{y}"

          value = generate_random_value(x, y)
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

  private

  def generate_random_value(current_x, current_y)
    puts "attributes: #{columns}, #{rows}, #{current_x}, #{current_y}"
    
    impossible_numbers = []

    # 10, 10, 1, 1
    previous_x_cell = if current_x > 1 
      cells.detect { |cell| cell.pos_x == current_x - 1 && cell.pos_y == current_y }
    else
      nil
    end
    puts "previous_x_cell: #{previous_x_cell}"

    next_x_cell = if current_x < columns 
      cells.detect { |cell| cell.pos_x == current_x + 1 && cell.pos_y == current_y }  
    else 
      nil
    end
    puts "next_x_cell: #{next_x_cell}"
    
    previous_y_cell = if current_y > 1 
      cells.detect { |cell| cell.pos_x == current_x && cell.pos_y == current_y - 1 }   
    else 
      nil 
    end 
    puts "previous_y_cell: #{previous_y_cell}"
    
    next_y_cell = if current_y < rows 
      cells.detect { |cell| cell.pos_x == current_x && cell.pos_y == current_y + 1  }   
    else 
      nil 
    end 
    puts "next_y_cell: #{next_y_cell}"

    impossible_numbers << previous_x_cell.value unless previous_x_cell.nil?
    impossible_numbers << next_x_cell.value unless next_x_cell.nil?
    impossible_numbers << previous_y_cell.value unless previous_y_cell.nil?
    impossible_numbers << next_y_cell.value unless next_y_cell.nil?

    puts "impossible_numbers: #{impossible_numbers}"
    puts "POSSIBLE_NUBMERS - impossible_numbers: #{POSSIBLE_NUBMERS} - #{impossible_numbers}"

    rand_range = POSSIBLE_NUBMERS - impossible_numbers
    puts "rand_range: #{rand_range}"

    random_value = rand(rand_range.first..rand_range.last)
    puts "random_value: #{random_value}"
    random_value
  end



end