require_relative 'workout'
require 'csv'
require 'table_print'
require 'pry'

@size = 0
# create a hash of workout info from CSV
def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end
  @size = workouts.size
  workouts

end

# YOUR CODE HERE
data = load_workout_data('workouts.csv')
workouts = []


(1..@size).each do |id|
  workouts << Workout.new(id, data)
end

tp workouts

