class Livro
	#attr_accessor :titulo, :preco, :ano_lancamento
	attr_reader :titulo, :preco, :ano_lancamento

	#ttr_reader :titulo, :ano_lancamento
	attr_accessor :preco

	def initialize(titulo, preco, ano_lancamento)
		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento

		@preco = calcula_preco(preco)

		#@preco *= 0.7 if ano_lancamento < 2000

		#if ano_lancamento < 2000
		#	@preco *= 0.7
		#end
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

#def aplica_promocoes(livro)
#	if livro.ano_lancamento < 2000
#		livro.preco *= 0.7
#	end
#end

algoritimos = Livro.new("Algoritimos", 100, 1998)

#aplica_promocoes(algoritimos)
livro_para_newsletter(algoritimos)


#livro_rails = Livro.new(70, "Agile Web Development with Rails", 2011)
##livro_rails.preco = 70
##livro_rails.titulo = "Agile Web Development with Rails"
##livro_rails.ano_lancamento = 2011

#livro_ruby = Livro.new(60, "Programming Ruby 1.9", 2010)
##livro_ruby.preco = 60
##livro_ruby.titulo = "Programming Ruby 1.9"
##livro_ruby.ano_lancamento = 2010

#def imprime_nota_fiscal(livros)
#	livros.each do |livro|
#		puts "Titulo: #{livro.titulo} - #{livro.preco}"
#	end
#end

#livros = [livro_rails, livro_ruby]
#imprime_nota_fiscal livros
