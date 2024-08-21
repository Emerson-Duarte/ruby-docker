class TestRedisJob < ApplicationJob
  queue_as :default

  def perform(*args)
    redis = Redis.new(url: ENV['REDIS_URL'])
    redis.incr("counter")
    puts "Counter is now: #{redis.get("counter")}"
  end
end
