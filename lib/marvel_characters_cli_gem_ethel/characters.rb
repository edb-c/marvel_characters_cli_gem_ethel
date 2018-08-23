class MarvelCharactersCliGemEthel::Characters

  attr_accessor :number, :super_name, :real_name, :character_type, :number_of_powers, :list_of_powers

  @@character_array = []

  def initialize(number = nil, super_name=nil, real_name=nil, character_type=nil, number_of_powers=nil, list_of_powers)
puts "in initialize"
puts super_name
    @number = number
    @@super_name = super_name
    @@real_name = real_name
    @@character_type = character_type
    @@number_of_powers = number_of_powers
    @@list_of_powers = list_of_powers
    @@character_array << self
  end

  def self.get_super_name
    @@super_name
  end

  def self.get_real_name
    @@real_name
  end

  def self.get_character_type
    @@character_type
  end

  def self.get_number_of_powers
    @@number_of_powers
  end

  def self.get_list_of_powers
    @@list_of_powers
  end

end #end Class
