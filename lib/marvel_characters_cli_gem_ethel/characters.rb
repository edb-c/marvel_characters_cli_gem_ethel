class MarvelCharactersCliGemEthel::Characters

  attr_accessor :super_name, :real_name, :character_type, :number_of_powers, :list_of_powers

  @@character_array = []

  def initialize(super_name=nil, real_name=nil, character_type=nil, number_of_powers=nil, list_of_powers)
    @super_name = super_name
    @real_name = real_name
    @character_type = character_type
    @number_of_powers = number_of_powers
    @list_of_powers = list_of_powers
    @@character_array << self
  end

end #end Class
