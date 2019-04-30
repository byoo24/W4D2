# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
cats = Cat.create!( [{name: 'Frosty', color: 'red' }, { name: 'Arby', color: 'orange'}, {name: 'Luke', color: 'green'} ]  )

cat_rental_requests = CatRentalRequest.create!([ { cat_id: Cat.first.id, status: "PENDING", start_date: '2019/05/01', end_date: '2019/05/05' }, { cat_id: Cat.second.id, status: "PENDING" , start_date: '2019/04/29', end_date: '2019/05/03'}, { cat_id: Cat.last.id, status: "PENDING", start_date: '2019/05/03', end_date: '2019/05/06' }  ])

