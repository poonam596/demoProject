require 'redis'
$redis = Redis::Namespace.new("demoProject", :redis => Redis.new)
REDIS_CLIENT = Redis.new(host: 'localhost', port: 6379, db: 1)
