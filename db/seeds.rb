puts 'Creating 5 products...'
5.times do |i|
  product = Product.create!(
    name: Faker::Company.name,
    tagline: Faker::Company.catch_phrase
  )
  puts "#{i + 1}. #{product.name}"
end
puts 'Finished!'

puts 'Creating user...'
User.create!(
  email: "user@user.com",
  first_name: "John",
  last_name: "Doe",
  password: 123456
)
