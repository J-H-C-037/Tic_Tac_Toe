
require "date"

date = Date.today.to_s

puts "Welcome, today is #{date}"

class TicTacToe

  $line_2 = "  _1_.|_2_.|_3_".split(".")
  $line_3 = "  _4_.|_5_.|_6_".split(".")
  $line_4 = "   7 .| 8 .| 9 ".split(".")

    def self.start_game
      puts "Hello, this is Tic-tac-toe"
      puts $line_1
      print $line_2[0]; print $line_2[1]; puts $line_2[2]
      print $line_3[0]; print $line_3[1]; puts $line_3[2]
      print $line_4[0]; print $line_4[1]; puts $line_4[2]
      puts "In order to put your mark, type the corresponding square"
      puts "To end the game: type \"exit\""
      puts "To restart another game: type \"restart\""
      self.putMark()
    end
    @@occupied_spots = 0
    @@count = 0
    @@win = false
    def self.putMark()
      while @@win == false
        puts "Put your command here (exit and restart). If not, put a mark on: "
        if @@count % 2 == 0
          @mark = "X"
        else
          @mark = "O"
        end
        @@count += 1
        x = gets.chomp.to_s
        if x == "exit"
          @@win = true
        elsif x == "restart"
          $line_2 = "  _1_.|_2_.|_3_".split(".")
          $line_3 = "  _4_.|_5_.|_6_".split(".")
          $line_4 = "   7 .| 8 .| 9 ".split(".")
          @@count = 0
          @@occupied_spots = 0
          @@win = false
          self.start_game
        end
        @@x = x.to_i
        spots = []
        for i in 1..9
          spots.append(i)
        end
        if spots.include?(@@x) && self.checkMark(@@x)
          case x
          when "1"
            $line_2[0] = "  _#{@mark}_"
          when "2"
            $line_2[1] = "|_#{@mark}_"
          when "3"
            $line_2[2] =  "|_#{@mark}_"
          when "4"
            $line_3[0] =  "  _#{@mark}_"
          when "5"
            $line_3[1] =  "|_#{@mark}_"
          when "6"
            $line_3[2] =  "|_#{@mark}_"
          when "7"
            $line_4[0] =  "   #{@mark} "
          when "8"
            $line_4[1] =  "| #{@mark} "
          when "9"
            $line_4[2] =  "| #{@mark} "
          end
          @@occupied_spots += 1
        else
          puts "Invalid address"
          @@count -=1
        end
        print $line_2[0]; print $line_2[1]; puts $line_2[2]
        print $line_3[0]; print $line_3[1]; puts $line_3[2]
        print $line_4[0]; print $line_4[1]; puts $line_4[2]

        self.checkWinner($line_2, $line_3, $line_4, @mark)
        if @@occupied_spots == 9
          puts "Draw"
        end
      end
    end

    def self.checkMark(grid)
      if grid > 0 && grid < 4
        if $line_2[grid-1].include?("X") || $line_2[grid-1].include?("O")
          return false
        else
          return true
        end
      elsif grid > 3 && grid < 7
        if $line_3[grid-4].include?("X") || $line_3[grid-4].include?("O")
          return false
        else
          return true
        end
      elsif grid > 6 && grid < 10
        if $line_4[grid-7].include?("X") || $line_4[grid-7].include?("O")
          return false
        else
          return true
        end
      else
        return false
      end
    end
    def self.winner(line_1, line_2, line_3, mark)
        if line_1[0].include?(mark) && line_1[1].include?(mark) && line_1[2].include?(mark)
          return true
        elsif line_2[0].include?(mark) && line_2[1].include?(mark)&& line_2[2].include?(mark)
          return true
        elsif line_3[0].include?(mark) && line_3[1].include?(mark)&& line_3[2].include?(mark)
          return true
        elsif line_1[0].include?(mark) && line_2[0].include?(mark)&& line_3[0].include?(mark)
          return true
        elsif line_1[1].include?(mark) && line_2[1].include?(mark)&& line_3[1].include?(mark)
          return true
        elsif line_1[2].include?(mark) && line_2[2].include?(mark)&& line_3[2].include?(mark)
          return true
        elsif line_1[0].include?(mark) && line_2[1].include?(mark)&& line_3[2].include?(mark)
          return true
        elsif line_1[2].include?(mark) && line_2[1].include?(mark)&& line_3[0].include?(mark)
          return true
        else
          return false
        end
    end
    def self.checkWinner(line_1, line_2, line_3, mark)
      if self.winner(line_1, line_2, line_3, mark)
        if @@count % 2 == 1
          puts "The Winner is Player 1. Congratulations!"
        else
          puts "The Winner is Player 2. Congratulations!"
        end
      end
    end
end

TicTacToe.start_game
