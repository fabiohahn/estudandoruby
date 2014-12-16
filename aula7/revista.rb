require_relative "produto"

class Revista
  Import Produto

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, numero)
    @titulo = titulo
    @preco = preco
    @ano_lancamento = ano_lancamento
    @possui_reimpressao = possui_reimpressao
    @preco = calcula_preco(preco)
    @editora = editora
    @numero = numero
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  def matches?(query)
    ["revista", "impresso"].include?(query)
  end
end
