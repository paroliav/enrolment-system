json.array!(@courses) do |course|
  json.extract! course, :id, :class_id, :class_name, :starting_date, :max_no_of_students
  json.url course_url(course, format: :json)
end

json.array!(@students) do |student|
  puts student
  json.extract! student, :id, :name
  json.url course_url(student, format: :json)
end
