class CreateStudentCourses < ActiveRecord::Migration
  def change
    create_table :student_courses do |t|
      t.string :student_id
      t.string :class_id
      t.string :student_name

      t.timestamps null: false
    end
  end
end
