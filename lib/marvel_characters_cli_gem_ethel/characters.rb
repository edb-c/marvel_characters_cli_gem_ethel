class MarvelCharactersCliGemEthel::Characters

  attr_accessor :number, :super_name, :real_name, :character_type, :number_of_powers, :list_of_powers

  @@character_array = []

  def initialize
    @@character_array << self
#    binding.pry
  end

  def self.character_array
    @@character_array << self
  end

end #end Class
