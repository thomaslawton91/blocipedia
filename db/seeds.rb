# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end

users = User.all

50.times do
  Wiki.create(
  title: Faker::Cat.breed,
  body: Faker::Cat.name,
  private: Faker::Boolean.boolean,
  user: users.sample
  )
end

me = User.create(
email: 'thomaslawton91@gmail.com',
password: '111111'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
