def draw?
        self.board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won? 
            self.board.cells[won?[0]]
        end
    end
    
    def turn
        input = current_player.move(self.board)
        
        if(self.board.valid_move?(input))
            self.board.update(input, current_player)
            puts ""
            self.board.display
            puts ""
        else
            puts ""
            puts "Incorrect move."
            puts ""
            self.board.display
            puts ""
            turn
        end

    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end      
    end
end