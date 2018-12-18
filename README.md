# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

include following rubygems

    gem faker
    gem rack-mini-profiler
    gem 'redis'
    gem 'redis-namespace'
    gem 'redis-rails'
    gem 'redis-rack-cache`

seed the data

10000.times do
  Article.create(title: Faker::Book.title, content: Faker::SrarWars.quote)
end

add redis configuration in /config/application.rb

  config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }

create initializer redis file /ini../redis.rb

  $redis = Redis::Namespace.new("redis_with_rails", :redis => Redis.new)

create fetcher for retrive data

  
