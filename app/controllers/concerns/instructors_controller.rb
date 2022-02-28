class InstructorsController < ApplicationController
    
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def index
        instructors = Instructor.all
        render json: instructors, status: 200
    end

    def show
        instructor_id = params[:id]
        instructor = Instructor.find instructor_id
        render json: instructor, status: 200
    end

    def create
        instructor = Instructor.create instructors_params
        render json: instructor, status: 201

    end

    def update
        instructor_id = params[:id]
        instructor = Instructor.find instructor_id
        instructor.update instructors_params
        instructor.save
        render json: instructor, status: 200
    end

    def destroy
        instructor_id = params[:id]
        instructor = Instructor.find instructor_id
        instructor.destroy
        render json: {}, status: 204
    end

    private

    def instructors_params
        params.permit(:name)
    end

    def not_found
        render json: {error: 'record not found.'}, status: 404
    end

    def invalid_record
        render json: {error: 'record invalid.'}, status: 422
    end
end
