class Livro
	attr_reader :titulo, :preco, :ano_lancamento

	def initialize(titulo, preco, ano_lancamento)
		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento

		@preco = calcula_preco(preco)
	end

	private
		def calcula_preco(base)
			if @ano_lancamento < 2000
				base * 0.7
			else
				base
			end
		end

end

def livro_para_newsletter(livro)
	if livro.ano_lancamento < 1999
		puts "Newsletter/Liquidacao"
		puts livro.titulo
		puts livro.preco
	end
end

algoritimos = Livro.new("Algoritimos", 100, 1998)
livro_para_newsletter(algoritimos)