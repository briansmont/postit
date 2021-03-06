require 'random_data'
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
    
  )
end
users = User.all


15.times do 
  Topic.create!(
    user: users.sample,
    title: Faker::GameOfThrones.character,
    body: Faker::Lorem.paragraph
  )
end
topics = Topic.all

50.times do 
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all


100.times do 
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Seinfeld.quote
  )
end

admin = User.first
admin.update_attributes!(
  email: 'briansmont830@gmail.com',
  password: 'briansmont830',
  role: 'admin'
)

standard = User.create!(
  email: 'standard@gmail.com',
  password: 'standard',
  role: 'standard'
)

premium = User.create!(
  email: 'premium@gmail.com',
  password: 'premium',
  role: 'premium'
)


puts "Seed finished"

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"