module ArticlesHelper
  def fetch_article_redis
    articles = $redis.get('articles')
    if articles.nil?
      articles = Article.all.to_json
      $redis.set('articles',articles)
      $redis.expire('articles', 5.hour.to_i)
    end
    JSON.load articles
  end
end
