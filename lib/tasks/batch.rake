namespace :batch do
  desc "This is a Cron Job Task"
  task send_messages: :environment do
    print 'Hello First Crontab Task'
  end

  desc "This is a Cron Job Task2"
  task current_date: :environment do
    print DateTime.now
  end

  desc "This is Redis Task"
  task redis_task: :environment do
    redis = Redis.new
    redis.set("mykey", "hello world")
    local = redis.get("mykey")
    print local
     
  end

  desc "Connecting to Redis Cluster"
  task redis_cluster:  :environment do
    nodes = (6001..6006).map { |port| "redis://127.0.0.1:#{port}" }
    p nodes
    redis = Redis.new(cluster: nodes)
    p redis
    redis.set("redis_cluster_connection", "yes")
    redis_clu =redis.get("redis_cluster_connection")
    p redis_clu
  end

  desc "This is Hash Example"
  task redis_hash: :environment do
    redis = Redis.new
    redis.hset("Books", "Redis_for_Beginner", "This Book is for Beginners")
    redis_book = redis.hgetall("Books")
    p redis_book
  end

  desc "This is Redis Example"
  task redis_tasks: :environment do
    redis = Redis.new
    redis.set("hello", "world")
    redis_ok= redis.get("hello")
    p redis_ok
    redis.set("count", 10)
    count= redis.get("count")
    p count
    multiple=redis.mget("hello","count")
    p multiple
    inc = redis.incr("count")
    p inc
    dec = redis.decr("count")
    p dec
  end

  desc "This is Redis Delete Example"
  task redis_del: :environment do
    redis = Redis.new
    redis.set("hello", "Okay")
    new_ex= redis.get("hello")
    p new_ex
    delete= redis.del("hello")
    p delete
  end

  desc "This is Redis Expire Example"
  task redis_exp: :environment do
    redis = Redis.new
    redis.set("hello", "world")
    exp= redis.get("hello")
    p exp
    expi= redis.expire("hello", 20)
    p expi
  end

  desc "This is Redis Multiple values  Example"
  task redis_rena: :environment do
    redis = Redis.new
    redis.hset("name","max","city","pune")
    rena=redis.hgetall()
    p rena
  end

end

