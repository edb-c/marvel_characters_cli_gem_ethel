class MarvelCharactersCliGemEthel::CLI

  def call
    puts ""
    puts "Get Some Interesting Information about the Top 10 Marvel Characters"
    puts ""
    main_page = MarvelCharactersCliGemEthel::Scraper.get_main_page

    count = 0

#Provide List View of Characters

    while count < 10
      puts main_page.css('h3')[count].text
      count +=1
    end

    start
  end #end call

  def start
    puts ""
    puts "Please enter a number from 1 to 10."
    puts ""
    input = gets.strip.to_i-1

    build_character(input)
    print_character(input)
    select_another_character

  end #end start

#Create Character

  def build_character(input)
    MarvelCharactersCliGemEthel::Scraper.get_character_info(input)
  end

#Provide Detailed View of Selected Character

  def print_character(input)
     acharacter = MarvelCharactersCliGemEthel::Characters
     puts "Super Name:              #{acharacter.get_super_name}"
     puts "Real Name:               #{acharacter.get_real_name}"
     puts "Character Type:          #{acharacter.get_character_type}"
     puts "Number of Powers:        #{acharacter.get_number_of_powers}"
     puts "List of Powers:   "
     puts acharacter.get_list_of_powers.each{|one_power|  puts one_power.to_s if one_power.to_s != "0"}
     puts ""
     puts '--------------------------------'
  end

  def select_another_character

    puts ""
    puts "Would you like to see another Marvel Character- Enter Y or N?"

    input2 = gets.strip.downcase

    if input2 == "y"
    call
    elsif input2 == "n"
      puts ""
      puts "Thank you for your time! Have a great day!"
      exit
    else
      puts ""
      puts "Invalid Entry - please try again."
      start
    end
  end
end #end Class
