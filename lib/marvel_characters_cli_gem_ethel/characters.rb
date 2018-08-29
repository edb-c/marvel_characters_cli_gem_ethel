class MarvelCharactersCliGemEthel::Characters

  attr_accessor :number, :super_name, :url, :real_name, :character_type, :number_of_powers, :list_of_powers

  @@all = []

  def initialize
    @@all << self
#    binding.pry
  end

  def self.all
    @@all
  end

end #end Class
