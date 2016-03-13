class Odd
	attr_accessor :odd1, :odd2, :oddX

	def initialize(odd1, oddX, odd2)
		@odd1 = odd1
		@oddX = oddX
		@odd2 = odd2
	end


	def viewOdd()
		puts("Odds: Casa - #{odd1} | Empate - #{oddX} | Fora - #{odd2}");
	end

end
