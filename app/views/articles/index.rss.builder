xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'Blogger Articles'
    xml.description 'Articles From Blogger Authors'
    xml.link articles_path

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.body
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link article_path(article)
        xml.guid article_path(article)
      end
    end
  end
end
