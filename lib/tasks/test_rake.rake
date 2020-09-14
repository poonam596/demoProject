namespace :test_rake do
  desc 'This is my First Rake task'
  task task1: :environment do
    print 'Hello First Rake Task'
  end

  desc 'This is my Second Rake task'
  task task2: :environment do
    print 'Hello This is 2nd Rake Task'
  end
end