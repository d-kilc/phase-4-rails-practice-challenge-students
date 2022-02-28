class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def index
        students = Student.all
        render json: students, status: 200
    end

    def show
        student_id = params[:id]
        student = Student.find student_id
        render json: student, status: 200
    end

    def create
        student = Student.create! students_params
        render json: student, status: 201
    end

    def update
        student_id = params[:id]
        student = Student.find student_id
        student.update! students_params
        # student.save
        render json: student, status: 200
    end

    def destroy
        student_id = params[:id]
        student = Student.find student_id
        student.destroy!
        render json: {}, status: 204
    end

    private

    def students_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def not_found
        render json: {error: 'record not found.'}, status: 404
    end

    def invalid_record
        render json: {error: 'record invalid.'}, status: 422
    end
end
