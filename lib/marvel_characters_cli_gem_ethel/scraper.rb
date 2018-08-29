class MarvelCharactersCliGemEthel::Scraper

  def self.get_main_page
    main_url= "https://comicvine.gamespot.com/profile/theoptimist/lists/top-100-marvel-characters/32199/"
    document = open(main_url)
    content = document.read
    parsed_main_page= Nokogiri::HTML(content)

    input = 0
    while input < 10
      character = MarvelCharactersCliGemEthel::Characters.new
      character.super_name = parsed_main_page.css('h3')[input].text.split[1]
      base_character_url = "https://comicvine.gamespot.com"
      character_url = parsed_main_page.css('div#default-content a')[input]["href"]
      character.url = "#{base_character_url}#{character_url}"
      input +=1
    end
  #  binding.pry
  end

  def self.get_character_info(input)

    document2 = open(MarvelCharactersCliGemEthel::Characters.all[input].url)
    content2 = document2.read
    character_page = Nokogiri::HTML(content2)

    MarvelCharactersCliGemEthel::Characters.all[input].real_name  = character_page.css('div.wiki-details').css('table').css('tr')[1].css('td').css('div').css('span').text
    MarvelCharactersCliGemEthel::Characters.all[input].character_type = character_page.css('div.wiki-details').css('table').css('tr')[6].css('td').css('div').css('span').text
    MarvelCharactersCliGemEthel::Characters.all[input].number_of_powers = character_page.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').length
    MarvelCharactersCliGemEthel::Characters.all[input].list_of_powers =  character_page.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').children

  end

end #class
