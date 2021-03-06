# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

20.times do
  movies = Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    rating: rand(0..5),
    poster_url: "https://picsum.photos/#{rand(100..300)}"
  )
  movies.save
end
