class StudentsController < ApplicationController
  include HTTParty
  base_uri 'teremstudents.s3-ap-southeast-2.amazonaws.com'

  def get_students
    self.class.get('/students.json', {})
  end


  def index
    @students = get_students
    render json: JSON.parse(@students)
  end

  def add_student
    @student_course = StudentCourse.new(student_params)

    if @student_course.save
      render json: "Successfully Added"
    else
      render json: @student_course.errors, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.permit(:student_id, :class_id, :student_name)
  end

end
