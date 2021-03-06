class WorkoutsController < ApplicationController
    def index
        workouts = Workout.all
        render json: workouts, include: [:exercises]
    end

    def show
        workout = Workout.find(params[:id])
        render json: workout, include: [:exercises]
    end

    def create
        workout = Workout.create(strong_params)
        exercise = Exercise.where(name: (params[:exercises]))
            workout.exercises << exercise
        render json: workout, include: [:exercises]
    end

    def destroy  
        workout = Workout.find(params[:id]) 
        workout.destroy
        render json: workout, include: [:exercises] 
    end

    private

    def strong_params
        params.require(:workout).permit(:name, :focus, :work_time, :rest_time, :rounds, :user_id, exercises: [])
    end
end
