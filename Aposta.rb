require_relative "Apostador"
require_relative "Odd"

class Aposta
    attr_accessor :apostador, :montante, :resultado, :oddFixada, :status, :dataAposta, :eventoId, :equipa1, :equipa2
	def initialize(eventoId,equipa1,equipa2,apostador, montante=0, resultado, oddActual, dataAposta)
        @eventoId=eventoId
        @equipa1=equipa1
        @equipa2=equipa2
		@apostador = apostador
		@montante = montante
		@resultado = resultado
		@oddFixada = oddActual
        @status = "Ainda nao aconteceu"
        @dataAposta = dataAposta
	end
    
    def viewAposta()
        puts("APOSTA:")
        puts("Apostador - #{@apostador.email}")
        puts("EventoId - #{eventoId}")
        puts("Equipas - Casa: #{equipa1} | Fora: #{equipa2}");
        puts("Odd - #{@oddFixada.odd1} | #{@oddFixada.oddX} | #{@oddFixada.odd2}") 
        puts("Montante - #{@montante}")
        puts("Resultado - #{@resultado}")
        puts("Status - #{@status}")
        puts("Data Aposta - #{@dataAposta}")
        puts("\n")
    end

end