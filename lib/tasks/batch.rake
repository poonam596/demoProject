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
    redis = redis.new
    redis.set("mykey", "hello world")
    redis.get("mykey")
  end
end
