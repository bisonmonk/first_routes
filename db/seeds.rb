# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  gizmo = User.create!(name: 'Gizmo', email: 'gizmo@gmail.com', username: 'gizm0')
  johnny = User.create!(name: 'Johnny Utah', email: 'jutah@gmail.com', username: 'pointbreak')
  bfast = User.create!(name: 'Breakfast', email: 'bfast@gmail.com', username: '2fast')

  c1 = Contact.create!(user_id: johnny.id, name: 'Breakfast', email: 'bfast@gmail.com')
  c2 = Contact.create!(user_id: bfast.id, name: 'Markov', email: 'markov@gmail.com', favorite: true)

  ContactShare.create!(user_id: gizmo.id, contact_id: c1.id)
  ContactShare.create!(user_id: gizmo.id, contact_id: c2.id)

  Comment.create!(
    author_id: gizmo.id,
    body: 'This person sucks.',
    commentable_id: johnny.id,
    commentable_type: 'User'
  )

  Comment.create!(
    author_id: johnny.id,
    body: 'Man, Breakfast blows.',
    commentable_id: c1.id,
    commentable_type: 'Contact'
  )

  lame = Group.create!(name: 'Lame friends', owner_id: bfast.id)

  GroupContact.create!(group_id: lame.id, contact_id: 2)
end