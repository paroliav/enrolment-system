# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Course.create([{class_id: 'CS201', class_name: 'Software Architecture Design', starting_date: Date.today, max_no_of_students: 4},
               {class_id: 'CS105', class_name: 'Information Security', starting_date: Date.today+12, max_no_of_students: 6},
               {class_id: 'CS301', class_name: 'Mobile Apps', starting_date: Date.today+13, max_no_of_students: 8},
               {class_id: 'CS102', class_name: 'Web Technologies', starting_date: Date.today+20, max_no_of_students: 9},
               {class_id: 'CS203', class_name: 'Managing Software Projects', starting_date: Date.today, max_no_of_students: 10}])