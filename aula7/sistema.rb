require_relative "livro"
require_relative "revista"
require_relative "ebook"
require_relative "estoque"

algoritimos = Livro.new("Algoritimos", 100, 1988, true, "", true)
arquitetura = Livro.new("Introducao a Arquitetura e Design de Software", 70, 2011, true, "", false)
programmer = Livro.new("The Pragmatic Programer", 100, 1999, true, "", false)
ruby = Livro.new("Programming Ruby", 100, 2004, true, "", false)
revista = Revista.new("Revista de Ruby", 10, 2013, true, "Revistas", 3)
ebook = Ebook.new("Ebook", 30, 2014, "Ebook",)

estoque = Estoque.new
estoque << algoritimos << algoritimos << ruby << programmer << arquitetura << ruby << ruby << revista
estoque << ebook
estoque.vende ruby
estoque.vende algoritimos
estoque.vende algoritimos
estoque.vende algoritimos
estoque.vende algoritimos
estoque.vende ruby
estoque.vende ruby
estoque.vende revista
estoque.vende ebook

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts estoque.ebook_que_mais_vendeu_por_titulo.titulo
puts estoque.respond_to?("ebook_que_mais_vendeu_por_titulo")
