# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(username: 'coolguyz3')
u2 = User.create(username: 'coolgurlz3')
c1 = Contact.create(name: 'first_contact', email: 'yo@yoyoyo.yo', user_id: u2.id )
ContactShare.create(contact_id: c1.id, user_id: u1.id)

Comment.create(comment: "you are cool", user_id: u2.id,
  commentable_id: u1.id, commentable_type: u1.class.to_s)
