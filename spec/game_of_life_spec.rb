describe "rspec" do
    it "true is true" do
        expect(true).to eq(true)
    end
end

describe "game of life" do
    it "output is an array" do
        expect(game).to be_a(Array)
    end

    it "output isn't empty if there is an input" do
        expect(game([0, 0, 0])).not_to be_empty
    end

    context "live cell with less than 2 neighbours dies" do
        it "live cell has one neighbour" do
            expect(game([1, 1, 0])).to eq([0, 0, 0])
        end
        it "live cell has 0 neighbours" do
            expect(game([0, 1, 0])).to eq([0, 0, 0])
        end
    end

    context "live cell with 2-3 cells lives" do
        it "live cell has 2 neighbours" do
            expect(game([1, 1, 1])).to eq([0, 1, 0])
        end
    end
end

def game(cells = [])
    cells_out = cells
    cells.each_with_index do |cell, index|
        if cell == 1
            if cells[index + 1] == 1 && cells[index - 1] == 1
                cells_out[index] = 1
            end
            if cells[index - 1] == 0 || cells[index + 1] == 0
                cells_out[index] = 0
            end
        end
    end
    cells_out
end
