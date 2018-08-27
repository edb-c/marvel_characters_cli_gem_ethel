class MarvelCharactersCliGemEthel::CLI

  def call
    puts ""
    puts "Get Some Interesting Information about the Top 10 Marvel Characters"
    puts ""
    MarvelCharactersCliGemEthel::Scraper.get_main_page

#Provide List View of Characters
    input = 0
    while input < 10
      #puts "#{input+1}. #{MarvelCharactersCliGemEthel::Characters.character_array[input].super_name}"
      @a_super_character_array = MarvelCharactersCliGemEthel::Characters.character_array
      puts "#{input+1}. #{@a_super_character_array[input].super_name}"
      input +=1
    end

    start
  end #end call

  def start
    puts ""
    puts "Please enter a number from 1 to 10."
    puts ""
    input = gets.strip.to_i

#Validate input
    if (1..10).include?(input)
      build_character(input-1)
      print_character(input-1)
      select_another_character
    else
      puts "Invalid Entry, please try again."
      start
    end

  end #end start

#If it has NOT been built before

  def build_character(input)
    if @a_super_character_array[input].real_name == nil
      puts "The field @a_super_character_array[input].real_name is blank, calling get_character_info"
      MarvelCharactersCliGemEthel::Scraper.get_character_info(input)
    else
      puts "Character Already created - skipping to print_character method"
    end
  end

#Provide Detailed View of Selected Character

  def print_character(input)

     #acharacter = MarvelCharactersCliGemEthel::Characters.character_array[input]
     puts "Super Name:              #{@a_super_character_array[input].super_name}"
     puts "Real Name:               #{@a_super_character_array[input].real_name}"
     puts "Character Type:          #{@a_super_character_array[input].character_type}"
     puts "Number of Powers:        #{@a_super_character_array[input].number_of_powers}"
     puts "List of Powers:   "
     puts @a_super_character_array[input].list_of_powers
     puts ""
     puts '--------------------------------'
  end

  def select_another_character

    puts ""
    puts "Would you like to see another Marvel Character- Enter Y or N?"

    input2 = gets.strip.downcase

    if input2 == "y"
      start
    elsif input2 == "n"
      puts ""
      puts "Thank you for your time! Have a great day!"
      exit
    else
      puts ""
      puts "Invalid Entry - please try again."
      select_another_character
    end
  end
end #end Class
