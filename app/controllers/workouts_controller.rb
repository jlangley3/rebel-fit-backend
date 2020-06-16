class WorkoutsController < ApplicationController
    def index
        work = Workout.all
        render json: work, include: [:exercises]
    end

    def create
        workout = Workout.create(strong_params)
        exercise = Exercise.where(name: (params[:exercises]))
            workout.exercises << exercise
        render json: workout, include: [:exercises]
    end

    private

    def strong_params
        params.require(:workout).permit(:name, :focus, :work_time, :rest_time, :rounds, :user_id, exercises: [])
    end
end
