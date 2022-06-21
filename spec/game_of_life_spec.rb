# 5x5 grid
describe "rspec" do
    it "true equals true" do
        expect(true).to eq(true)
    end
end

describe "game of life" do
    it "returns output as an array with empty input" do
        expect(game_of_life().class).to eq(Array)
    end

    it "returns output as an array with input" do
        expect(game_of_life([0, 0, 1]).class).to eq(Array)
    end

    # check if there is growth with an array as an input
    context "cells die when 1 or 0 neighbours" do
        it "cell dies when 0 neighbours" do
            expect(game_of_life([0, 1, 0])).to eq([0, 0, 0])
        end
        it "cell dies when 1 neighbour" do
            expect(game_of_life([0, 1, 1])).to eq([0, 0, 0])
        end
    end
    context "cell lives when 2-3 neighbours" do
        it "cell lives when 2 neighbours" do
            expect(game_of_life([1, 1, 1])).to eq([0, 1, 0])
        end
    end
end

def game_of_life(cells = [])
    # if no neighbours - cell dies
    cells_new =  []
    cells.each_with_index do |cell, index|
        if cells[index - 1] == 0 || cells[index + 1] == 0

            cells_new << 0
        end
        if cells[index - 1] == 1 && cells[index + 1] == 1
            cells_new << 1
        end
    end
    cells_new
end



# [[0, 0, 1, 0, 0],
#  [0, 0, 1, 0, 0],
#  [0, 0, 1, 0, 0],
#  [0, cell, 1, 0, 0],
#  [0, 0, 1, 0, 0]]

# access cell -> array[3][1]