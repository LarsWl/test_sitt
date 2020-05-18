# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)u

0.upto 100 do |i|
  Test.create(name: "test_name_#{i}", param_1: "param_1_#{i}", param_2: "param_2_#{i}")
end
