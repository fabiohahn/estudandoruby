class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
    @titulo = titulo
    @preco = preco
    @ano_lancamento = ano_lancamento
    @possui_reimpressao = possui_reimpressao

    @preco = calcula_preco(preco)
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  private

  def calcula_preco(base)
    if @ano_lancamento < 2006
      if @possui_reimpressao
        base * 0.9
      else
        base * 0.95
      end
    elsif @ano_lancamento <= 2010
      base * 0.96
    else
      base
    end
  end
end

module Contador
  def << livro
    push livro
    if @maximo_necessario.nil? || @maximo_necessario < size
      @maximo_necessario = size
    end
    self
  end

  attr_reader :maximo_necessario
end

class Estoque
  #attr_reader :livros #nao eh bom expor as variaveis membro, mande o objeto fazer e nao peca seus dados

  def initialize
    @livros = []
    @livros.extend Contador #modulo incluido dinamicamente (em tempo de execucao)
  end

  def exporta_csv
    @livros.each do |livro|
      puts "#{livro.titulo}, #{livro.ano_lancamento}"
    end
  end

  def mais_baratos_que(valor)
    @livros.select do |livro|
      livro.preco <= valor
    end
  end

  def total
    @livros.size
  end

  def << livro
    @livros << livro if livro
  end

  def remove livro
    @livros.delete livro
  end

  def maximo_necessario
    @livros.maximo_necessario
  end
end

algoritimos = Livro.new("Algoritimos", 100, 1988, true)
arquitetura = Livro.new("Introducao a Arquitetura e Design de Software", 70, 2011, true)
programmer = Livro.new("The Pragmatic Programer", 100, 1999, true)
ruby = Livro.new("Programming Ruby", 100, 2004, true)

estoque = Estoque.new
#estoque.livros << algoritimos
#puts estoque.livros.maximo_necessario

estoque << algoritimos
puts estoque.maximo_necessario
estoque << arquitetura << programmer
puts estoque.maximo_necessario
estoque << ruby
puts estoque.maximo_necessario
estoque.remove algoritimos
puts estoque.maximo_necessario

#numbers = []
#numbers.extend Contador
#numbers << 13
#numbers << 15
#numbers << 17 << 19
#puts numbers.maximo_necessario

#class Array #cuidado ao reabrir classes do ruby (cuidado para manter a compatibilidade)
#  attr_reader :maximo_necessario
#  def << livro
#    push livro
#    if @maximo_necessario.nil? || @maximo_necessario < size
#      @maximo_necessario = size
#    end
#    self
#  end
#end

#def initialize
#  @livros = []
#
#  def @livros.<< livro
#    push livro
#    if @maximo_necessario.nil? || @maximo_necessario < size
#      @maximo_necessario = size
#    end
#    self
#  end
#
#  def @livros.maximo_necessario
#    @maximo_necessario
#  end
#end
