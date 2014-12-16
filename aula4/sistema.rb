require_relative "livro"
require_relative "estoque"

algoritimos = Livro.new("Algoritimos", 100, 1988, true, "", "livro")
arquitetura = Livro.new("Introducao a Arquitetura e Design de Software", 70, 2011, true, "", "livro")
programmer = Livro.new("The Pragmatic Programer", 100, 1999, true, "", "livro")
ruby = Livro.new("Programming Ruby", 100, 2004, true, "", "livro")
revista = Livro.new("Revista de Ruby", 10, 2013, true, "Revistas", "revista")

estoque = Estoque.new
estoque << algoritimos << algoritimos << ruby << programmer << arquitetura << ruby << ruby << revista
estoque.vende ruby
estoque.vende algoritimos
estoque.vende algoritimos
estoque.vende algoritimos
estoque.vende algoritimos
estoque.vende ruby
estoque.vende ruby
estoque.vende revista

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.livro_que_mais_vendeu_por_ano.titulo
puts estoque.livro_que_mais_vendeu_por_editora.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo

#estoque << algoritimos
#puts estoque.maximo_necessario
#estoque << arquitetura << programmer
#puts estoque.maximo_necessario
#estoque << ruby
#puts estoque.maximo_necessario
#estoque.remove algoritimos
#puts estoque.maximo_necessario
