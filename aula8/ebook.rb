require_relative "produto"

class Ebook
  Import Produto

  def matches?(query)
    ["ebook", "digital"].include?(query)
  end
end
