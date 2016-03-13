require_relative 'Observer'

class Apostador
    attr_accessor :email, :betESScoins, :name, :listaApostas
    include Observer

    def initialize(email, betESScoins, name)
        @email = email
        @betESScoins = betESScoins
        @name = name
        @listaApostas = Array.new()
        
    end

    def viewApostador()
        puts("Nome: #{@name}")
        puts("Coins: #{@betESScoins}")
        puts("Email: #{@email}")
        
    end
    
    def verApostasAbertasUtilizador()
        flag=false
        for aposta in listaApostas
            ainda = "Ainda nao aconteceu"
            if aposta.status == ainda
                aposta.viewAposta
                flag=true
            end
        end

        if(!flag)
            puts("Não tem apostas abertas de momento")
        end
    end
    
    def verApostasFechadasUtilizador()
        flag=false
        for aposta in listaApostas
            ainda = "Ainda nao aconteceu"
            if aposta.status != ainda
                aposta.viewAposta
                flag=true
            end
        end
        
        if(!flag) 
            puts("Não há apostas fechadas")
        end

    end

    def update(notification)
        puts("Apostador: #{@name} ganhou #{notification}")
    end

end