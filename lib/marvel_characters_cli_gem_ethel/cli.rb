class MarvelCharactersCliGemEthel::CLI

  def call
    puts ""
    puts "Get Some Interesting Information about the Top 10 Marvel Characters"
    puts ""
    MarvelCharactersCliGemEthel::Scraper.get_main_page

#Provide List View of Characters

    input = 0

    while input < 10
      puts "#{input+1}. #{MarvelCharactersCliGemEthel::Characters.all[input].super_name}"
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
    if MarvelCharactersCliGemEthel::Characters.all[input].real_name == nil
      MarvelCharactersCliGemEthel::Scraper.get_character_info(input)
    end
  end

#Provide Detailed View of Selected Character

  def print_character(input)
     puts ""
     puts "Super Name:              #{MarvelCharactersCliGemEthel::Characters.all[input].super_name}"
     puts "Real Name:               #{MarvelCharactersCliGemEthel::Characters.all[input].real_name}"
     puts "Character Type:          #{MarvelCharactersCliGemEthel::Characters.all[input].character_type}"
     puts "Number of Powers:        #{MarvelCharactersCliGemEthel::Characters.all[input].number_of_powers}"
     puts "List of Powers:   "
     puts MarvelCharactersCliGemEthel::Characters.all[input].list_of_powers
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
