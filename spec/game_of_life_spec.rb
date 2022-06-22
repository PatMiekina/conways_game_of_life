require "./game_of_life"

describe "rspec" do
    it "true is true" do
        expect(true).to eq(true)
    end
end

# check if output is an array
describe "game of life" do

    it "returns an array if empty input" do
        expect(game_of_life).to be_a_kind_of(Array)
    end

    it "returns an array of arrays if empty input" do
        expect(game_of_life[0]).to be_a_kind_of(Array)
    end

    context "central cell" do
        context "given less than 2 neighbours cell dies" do
            it "cell dies if less than 2 neighbours horizontally" do
                expect(game_of_life([[0, 0, 0], [0, 1, 1], [0, 0, 0]])[1][1]).to eq(0)
            end

            it "cell dies if less than 2 neighbours vertically" do
                expect(game_of_life([[0, 0, 0], [0, 1, 0], [0, 1, 0]])[1][1]).to eq(0)
            end

            it "cell dies if more than 3 neighbours" do
                expect(game_of_life([[0, 1, 0], [1, 1, 1], [0, 1, 0]])[1][1]).to eq(0)
            end

            it "cell revives if 3 neighbours" do
                expect(game_of_life([[0, 1, 0], [0, 0, 1], [0, 1, 0]])[1][1]).to eq(1)
            end

            it "cell lives if 2 neighbours" do
                expect(game_of_life([[0, 0, 0], [1, 1, 0], [0, 1, 0]])[1][1]).to eq(1)
            end
        end
    end

    context "top row cell" do # check middle top cell
        it "cell dies if less than 2 neighbours horizontally" do
            expect(game_of_life([[0, 1, 0], [0, 1, 0], [0, 0, 0]])[0][1]).to eq(0)
        end

        it "cell dies if less than 2 neighbours vertically" do
            expect(game_of_life([[0, 1, 0], [0, 1, 0], [0, 1, 0]])[0][1]).to eq(0)
        end

        # it "cell dies if more than 3 neighbours - impossible" do
        #     expect(game_of_life([[1, 1, 1], [0, 1, 0], [0, 0, 0]])[0][1]).to eq(1)
        # end

        it "cell revives if 3 neighbours" do
            expect(game_of_life([[1, 0, 1], [0, 1, 0], [0, 0, 0]])[0][1]).to eq(1)
        end

        it "cell lives if 2 neighbours" do
            expect(game_of_life([[1, 1, 0], [0, 1, 0], [0, 0, 0]])[0][1]).to eq(1)
        end
    end

    context "top left corner" do
        it "cell dies if less than 2 neighbours horizontally" do
            expect(game_of_life([[1, 1, 1], [0, 0, 0], [0, 0, 0]])[0][0]).to eq(0)
        end

        it "cell dies if less than 2 neighbours vertically" do
            expect(game_of_life([[1, 0, 0], [1, 0, 0], [0, 0, 0]])[0][0]).to eq(0)
        end

        it "cell never revives" do
            expect(game_of_life([[0, 1, 1], [1, 0, 0], [0, 0, 0]])[0][0]).to eq(0)
        end

        it "cell lives if 2 neighbours" do
            expect(game_of_life([[1, 1, 0], [1, 0, 0], [0, 0, 0]])[0][0]).to eq(1)
        end
    end

    context "top right corner" do
        it "cell dies if less than 2 neighbours horizontally" do
            expect(game_of_life([[1, 1, 1], [0, 0, 0], [0, 0, 0]])[0][2]).to eq(0)
        end

        it "cell dies if less than 2 neighbours vertically" do
            expect(game_of_life([[0, 0, 1], [0, 0, 1], [0, 0, 1]])[0][2]).to eq(0)
        end

        it "cell never revives" do
            expect(game_of_life([[0, 1, 0], [0, 0, 1], [0, 0, 1]])[0][2]).to eq(0)
        end

        it "cell lives if 2 neighbours" do
            expect(game_of_life([[0, 1, 1], [0, 0, 1], [0, 0, 0]])[0][2]).to eq(1)
        end
    end

    context "bottom row cell" do
        it "cell dies if less than 2 neighbours horizontally" do
            expect(game_of_life([[0, 0, 0], [0, 0, 0], [0, 1, 1]])[2][1]).to eq(0)
        end

        it "cell dies if less than 2 neighbours vertically" do
            expect(game_of_life([[0, 1, 0], [0, 1, 0], [0, 1, 0]])[2][1]).to eq(0)
        end

        it "cell revives if 3 neighbours" do
            expect(game_of_life([[0, 0, 0], [0, 1, 0], [1, 0, 1]])[2][1]).to eq(1)
        end

        it "cell lives if 2 neighbours" do
            expect(game_of_life([[0, 0, 0], [0, 0, 0], [1, 1, 1]])[2][1]).to eq(1)
        end
    end

    context "bottom left cell" do
        it "cell dies if less than 2 neighbours horizontally" do
            expect(game_of_life([[0, 0, 0], [0, 0, 0], [1, 1, 1]])[2][0]).to eq(0)
        end

        it "cell dies if less than 2 neighbours vertically" do
            expect(game_of_life([[1, 0, 0], [1, 0, 0], [1, 0, 0]])[2][0]).to eq(0)
        end

        it "cell never revives" do
            expect(game_of_life([[1, 0, 0], [1, 0, 0], [0, 1, 1]])[2][0]).to eq(0)
        end

        it "cell lives if 2 neighbours" do
            expect(game_of_life([[0, 0, 0], [1, 0, 0], [1, 1, 0]])[2][0]).to eq(1)
        end
    end

    context "bottom right cell" do
        it "cell dies if less than 2 neighbours horizontally" do
            expect(game_of_life([[0, 0, 0], [0, 0, 0], [1, 1, 1]])[2][2]).to eq(0)
        end

        it "cell dies if less than 2 neighbours vertically" do
            expect(game_of_life([[0, 0, 0], [0, 0, 1], [0, 0, 1]])[2][2]).to eq(0)
        end

        it "cell never revives" do
            expect(game_of_life([[1, 1, 1], [0, 0, 1], [1, 1, 0]])[2][2]).to eq(0)
        end

        it "cell lives if 2 neighbours" do
            expect(game_of_life([[0, 0, 0], [0, 0, 1], [0, 1, 1]])[2][0]).to eq(1)
        end
    end
end


# tests for "cell lives"