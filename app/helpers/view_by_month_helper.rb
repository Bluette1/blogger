module ViewByMonthHelper
  def articles_by_month
    months_articles = {}

    articles = Article.order(:created_at)

    articles.each do |article|
      month = article.created_at.strftime('%B').to_sym
      months_articles[month] = [] unless months_articles.key?(month)
      months_articles[month] << article
    end

    months_articles
  end
end
