# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



1000.times do |n|
  u=Car.create!(
  make: Faker::Name.unique.first_name,
  year: Faker::Time.between(Date.today - 1000, Date.today),
  model:  Faker::Lorem.paragraph(2),
  color: ["red","green","blue"].sample,
  created_at: Faker::Time.between(Date.today - 1000, Date.today)
  )
end