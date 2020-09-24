require "C:/ruby files/Games/Tic_Tac_Toe.rb"

require "pry"


describe TicTacToe do
  describe "#self.winner" do
    it "assess correctly when player 2 won" do
      expect(TicTacToe.winner(["  _X_", "|_O_", "|_X_"], ["  _4_", "|_O_", "|_X_"], ["   7 ", "| O ", "| O "], "O")).to eql(true)
    end

    it "asess correctly when player 1 won" do
      expect(TicTacToe.winner(["  _X_", "|_O_", "|_X_"], ["  _4_", "|_O_", "|_X_"], ["   7 ", "| 8 ", "| X "], "X")).to eql(true)
    end

    it "asess correctly when nobody won" do
      expect(TicTacToe.winner(["  _X_", "|_O_", "|_X_"], ["  _4_", "|_5_", "|_X_"], ["   7 ", "| O ", "| O "], "O")).to eql(false)
    end
  end
end
