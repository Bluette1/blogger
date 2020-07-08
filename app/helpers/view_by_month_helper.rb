# frozen_string_literal: true

module ViewByMonthHelper
  def articles_by_month
    months_articles = {}
    p 'paramsggggggggggggggg', params
    p 'paramsggggggggggggggg&&&&&&&&&&&&', params[:id]
    articles = Article.order(:created_at)

    articles.each do |article|
      month = article.created_at.strftime('%B').to_sym
      # month.to_sym
      months_articles[month] = [] unless months_articles.key?(month)
      months_articles[month] << article
    end
    p months_articles, '@months_articles:::::::::::::::::::::::::::::'
    months_articles
  end
end
