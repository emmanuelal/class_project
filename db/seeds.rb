# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Reviewer.destroy_all
Book.destroy_all

Book.create! [
            {name:"Eloquent Ruby",author:"Russ Olsen"},
            {name:"Begginnin Ruby",author:"Peter Copper"},
            {name:"Metaprogramming Ruby 2",author:"Paollo Perrota"},
            {name:"The Ruby Programming langugue ",author:"David Flagon"}
            

            ]

 100.times {|index| Book.create! name:"Book#{index}", author:"Author#{index}" }            
           

eloquent = Book.find_by name:"Eloquent Ruby"
eloquent.notes.create! [
   { title:"Wow",  note:"Great book to learn Ruby" },
   { title:"Funny",note:"Doesn't put you to sleep" }

]

reviewers = Reviewer.create! [
   {name: "Joe", password:"Alanta"},
   {name:"Jim", password:"BlinkBlink12"}
]

Book.all.each do |book|
	book.reviewer = reviewers.sample
	book.save!
end
