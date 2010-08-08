require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    User.create!(:name => "Example User",
                 :email => "test@test.org",
                 :password => "foobar" )
    5.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password )
    end
    
    User.all(:limit => 6).each do |user|
      3000.times do
        user.posts.create!(:content => Faker::Lorem.sentence(50))
      end
    end
  end
end
