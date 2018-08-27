require 'open-uri'
require 'nokogiri'

class MarvelCharactersCliGemEthel::Scraper

  def self.get_main_page
    main_url= "https://comicvine.gamespot.com/profile/theoptimist/lists/top-100-marvel-characters/32199/"
    document = open(main_url)
    content = document.read
    parsed_main_page= Nokogiri::HTML(content)

    input = 0
    while input < 10
      @a_super_character = MarvelCharactersCliGemEthel::Characters.new
      @a_super_character.super_name = parsed_main_page.css('h3')[input].text.split[1]
      input +=1
    end
    parsed_main_page
  #  binding.pry
  end

  def self.get_character_info(input)

    base_character_url = "https://comicvine.gamespot.com"
    character_url = self.get_main_page.css('div#default-content a')[input]["href"]
    final_character_url = "#{base_character_url}#{character_url}"
    document2 = open(final_character_url)
    content2 = document2.read
    character_page = Nokogiri::HTML(content2)

   @a_super_character_array = MarvelCharactersCliGemEthel::Characters.character_array
   puts "In get_character_info   - @a_super_character_array object id  #{@a_super_character_array.object_id}"
    @a_super_character_array[input].real_name  = character_page.css('div.wiki-details').css('table').css('tr')[1].css('td').css('div').css('span').text
    @a_super_character_array[input].character_type = character_page.css('div.wiki-details').css('table').css('tr')[6].css('td').css('div').css('span').text
    @a_super_character_array[input].number_of_powers = character_page.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').length
    @a_super_character_array[input].list_of_powers =  character_page.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').children

  end

end #class
