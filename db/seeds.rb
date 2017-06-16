100.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  user.identities.build(user_id: user.id, social_uid: Faker::Twitter.user['id_str'], username: "#{user.first_name}#{user.last_name}", social_site: 'Facebook')
  user.identities.build(user_id: user.id, social_uid: Faker::Twitter.user['id_str'], username: "#{user.first_name}#{user.last_name}", social_site: 'Twitter')
  5.times do
    user.posts.build({
      user_id: user.id,
      site: ['Facebook', 'Twitter'].sample,
      content: Faker::Lorem.paragraph(4),
      posting_time: rand(1..23).days.ago,
      link: 'https://www.google.com'
    })
  end
  if user.save
    puts "User: #{user.first_name} #{user.last_name}, created."
  else
    puts "Error while creating users: #{user.errors.messages}"
  end
end
puts 'Added users with identities and posts'

User.first(20).each do |user|
  FederalLegislator.create(user_id: user.id)
end
puts 'Added users to FederalLegislator list'

User.offset(20).first(20).each do |user|
  StateGovernor.create(user_id: user.id)
end
puts 'Added users to StateGovernor list'

clist = CustomList.new(name: Faker::Demographic.demonym)
clist.users << User.offset(40).first(30)
clist.save

clist = CustomList.new(name: Faker::Demographic.demonym)
clist.users << User.offset(70).first(30)
clist.save

puts 'Added CustomLists and users to them.'
