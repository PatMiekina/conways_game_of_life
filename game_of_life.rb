def game_of_life(cells = [[]])
    cells_output = cells.map {|row| row.dup}
    cells_output = cells_output.each_with_index do |row, r_index|
        row.each_with_index do |cell, c_index|
            # top_cell = cells[r_index - 1][c_index] || 0
            # bottom_cell = cells[r_index + 1][c_index] || 0
            # right_cell = cells[r_index][c_index + 1] || 0
            # left_cell = cells[r_index][c_index - 1] || 0
            
            # for middle cells
            if r_index >= 1 && r_index < (cells.size - 1)  && c_index > 0 && c_index < (row.size - 1)
                # puts "original cell: #{cell}"
                # puts "top cell original: #{cells[r_index][c_index - 1]}"
                if cell == 1
                    # cell dies if less than 2 neighbours
                    cells_output[r_index][c_index] = 0 if [cells[r_index][c_index - 1], cells[r_index][c_index + 1], cells[r_index - 1][c_index], cells[r_index + 1][c_index]].count(1) < 2
                    # cell dies if 3 or more neighbours
                    cells_output[r_index][c_index] = 0 if [cells[r_index][c_index - 1], cells[r_index][c_index + 1], cells[r_index - 1][c_index], cells[r_index + 1][c_index]].count(1) > 3
                else
                    # cell revives if 3 neighbours
                    cells_output[r_index][c_index] = 1 if [cells[r_index][c_index - 1], cells[r_index][c_index + 1], cells[r_index - 1][c_index], cells[r_index + 1][c_index]].count(1) == 3
                end
            end
            # for top cells
            if r_index == 0
                if cell == 1
                    # top cell dies if less than 2 neighbours
                    cells_output[r_index][c_index] = 0 if [cells[r_index][c_index - 1], cells[r_index][c_index + 1], cells[r_index + 1][c_index]].count(1) < 2 && c_index != 0 && c_index != (row.size - 1)
                    # top left cell dies if less than 2 neighbours
                    # puts "top right corner neighbours sum: #{[cells[r_index][c_index - 1], cells[r_index + 1][c_index]].count(1)}" if c_index == (row.size - 1)
                    cells_output[r_index][c_index] = 0 if [cells[r_index][c_index + 1], cells[r_index + 1][c_index]].count(1) < 2  && c_index == 0
                    # # top right cell dies if less than 2 neighbours
                    cells_output[r_index][c_index] = 0 if [cells[r_index][c_index - 1], cells[r_index + 1][c_index]].count(1) < 2 && c_index == (row.size - 1)
                    puts "neighbours count: #{[cells[r_index][c_index - 1], cells[r_index + 1][c_index]].count(1) if c_index == (row.size - 1)}"
                end
                if cell == 0
                    # top cell revives if 3 neighbours
                    cells_output[r_index][c_index] = 1 if [cells[r_index][c_index - 1], cells[r_index][c_index + 1], cells[r_index + 1][c_index]].count(1) == 3 && c_index != 0 && c_index != (row.size - 1)
                end
            end

            if r_index == (row.size - 1)
                if cell == 1
                    # bottom cell dies if less than 2 neighbours
                    cells_output[r_index][c_index] = 0 if [cells[r_index][c_index - 1], cells[r_index][c_index + 1], cells[r_index - 1][c_index]].count(1) < 2
                    # bottom left cell dies if less than 2 neighbours
                    cells_output[r_index][c_index] = 0 if [cells[r_index][c_index + 1], cells[r_index - 1][c_index]].count(1) < 2 && c_index == 0
                    # bottom right cell dies if less than 2 neighbours
                    cells_output[r_index][c_index] = 0 if [cells[r_index][c_index - 1], cells[r_index - 1][c_index]].count(1) < 2 && c_index == (row.size - 1)
                    puts "count #{[cells[r_index][c_index - 1], cells[r_index - 1][c_index]].count(1)}"
                end
                if cell == 0
                    # bottom cell revives if 3 neighbours
                    cells_output[r_index][c_index] = 1 if [cells[r_index][c_index - 1], cells[r_index][c_index + 1], cells[r_index - 1][c_index]].count(1) == 3  && c_index != 0 && c_index != (row.size - 1)
                end
            end
        end
    end
    cells_output
end

# def cell_dies(row_index, cell_index, array)
#     array[row_index][cell_index] = 0
# end
# def cell_dies(row_index, cell_index, array)
#     array[row_index][cell_index] = 0
# end

# def ignore_right
# end

# def ignore_top
# end

# def ignore_left
# end
# def ignore_bottom
# end

# def toggle_cell(array, row_index, column_index)
#     if array[row_index][column_index] == 0
#         array[row_index][column_index] = 1
#     else
#         array[row_index][column_index] = 1
#     end
# end

# puts game_of_life([[1, 1, 1], [0, 0, 0], [0, 0, 0]])[0][2]