xml.kml("xmlns" => "http:// www.opengis.net/kml/2.2") do
  @news_items.each do |news_item|
    xml.Placemark do
      xml.name news_item.headline
      xml.description h(news_item.short_description.strip_and_shorten_character_limit(80)+"...<br/><a href='#{news_item.permalink}'>Read more &raquo;</a>")
      xml.Point do
         xml.coordinates "#{news_item.entity.coordinates?.last[:latitude]},#{news_item.entity.coordinates?[:longitude]},0"
      end
    end
  end
end