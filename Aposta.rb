class Aposta
	def initialize(apostador, montante=0, resultado, oddActual)
		@apostador = apostador
		@montante = montante
		@resultado = resultado
		@oddFixada = oddActual
        @status = "Ainda nao aconteceu"
	end
    
    def viewAposta()  
        puts("Apostador - #{@apostador.email} | Montante - #{@montante} | Resultado - #{@resultado} | Odd - #{@oddFixada.odd1}, #{@oddFixada.oddX}, #{@oddFixada.odd2}, | Status - #{@status}")
    end
end