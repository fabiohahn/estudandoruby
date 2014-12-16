require_relative "contador"

class Estoque
  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  #def quantidade_de_vendas_de_titulo produto
  #  @vendas.count {|venda| venda.titulo == produto.titulo}
  #end

  def quantidade_de_vendas_por(produto, &campo)
    @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
  end

  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select {|l| l.tipo == tipo}.sort {|v1,v2|
        quantidade_de_vendas_por(v1, &campo) <=>
          quantidade_de_vendas_por(v2, &campo)
    }.last
  end

  def livro_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("livro", &:titulo)
  end

  def livro_que_mais_vendeu_por_ano
    que_mais_vendeu_por("livro", &:ano_lancamento)
  end

  def livro_que_mais_vendeu_por_editora
    que_mais_vendeu_por("livro", &:editora)
  end

  def revista_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("revista", &:titulo)
  end

  def revista_que_mais_vendeu_por_ano
    que_mais_vendeu_por("revista", &:ano_lancamento)
  end

  def revista_que_mais_vendeu_por_editora
    que_mais_vendeu_por("revista", &:editora)
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

  def vende livro #antigo remove
    @livros.delete livro
    @vendas << livro
  end

  def maximo_necessario
    @livros.maximo_necessario
  end
end

#def livro_que_mais_vendeu_por(&campo)
#  @vendas.sort {|v1,v2|
#      quantidade_de_vendas_por(v1, &campo) <=>
#        quantidade_de_vendas_por(v2, &campo)
#  }.last
#end

#def livro_que_mais_vendeu_por_titulo
#  livro_que_mais_vendeu_por(&:titulo)
#end

#def livro_que_mais_vendeu_por_ano
#  livro_que_mais_vendeu_por(&:ano_lancamento)
#end

#def livro_que_mais_vendeu_por_editora
#  livro_que_mais_vendeu_por(&:editora)
#end

#def livro_que_mais_vendeu_por_titulo
  #@vendas.sort {|v1,v2|
  #  quantidade_de_vendas_de_titulo(v1) <=>
  #    quantidade_de_vendas_de_titulo(v2)
  #}.last

#  @vendas.sort {|v1,v2|
#    quantidade_de_vendas_por(v1, &:titulo) <=>
#      quantidade_de_vendas_por(v2, &:titulo)
#  }.last
#end

#def livro_que_mais_vendeu_por_ano
#  @vendas.sort {|v1,v2|
#    quantidade_de_vendas_por(v1, &:ano_lancamento) <=>
#      quantidade_de_vendas_por(v2, &:ano_lancamento)
#  }.last
#end

#def livro_que_mais_vendeu_por_editora
#  @vendas.sort {|v1,v2|
#    quantidade_de_vendas_por(v1, &:editora) <=>
#      quantidade_de_vendas_por(v2, &:editora)
#  }.last
#end
