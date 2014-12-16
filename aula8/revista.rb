require_relative "produto"

class Revista
  Import Produto

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, numero)
    super(titulo, preco, ano_lancamento, editora, numero)
    @possui_reimpressao = possui_reimpressa
    @numero = numero
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  def matches?(query)
    ["revista", "impresso"].include?(query)
  end
end
