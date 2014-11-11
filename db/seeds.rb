# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  poster = Poster.create(name: Faker::Internet.user_name)
  rand(10).times do
    poster.tweets.create(content: Faker::Lorem.sentence)
  end
end
