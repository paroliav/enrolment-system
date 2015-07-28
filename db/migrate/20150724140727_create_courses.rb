class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :class_id
      t.string :class_name
      t.date :starting_date
      t.integer :max_no_of_students

      t.timestamps null: false
    end
  end
end
