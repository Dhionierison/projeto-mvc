module ProductsHelper
  require 'net/http'
  require 'json'

  PIXABAY_API_KEY = 'YOUR_PIXABAY_API_KEY'

  def fetch_pixabay_image(query)
    url = URI("https://pixabay.com/api/?key=#{PIXABAY_API_KEY}&q=#{URI.encode_www_form_component(query)}&image_type=photo&per_page=1")
    response = Net::HTTP.get(url)
    begin
      json = JSON.parse(response)
      if json['hits'] && json['hits'].any?
        json['hits'][0]['webformatURL']
      else
        'https://via.placeholder.com/300x200?text=Imagem+não+disponível'
      end
    rescue JSON::ParserError
      'https://via.placeholder.com/300x200?text=Imagem+não+disponível'
    end
  end
end
