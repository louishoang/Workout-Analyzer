require_relative 'workout'
require 'csv'
require 'table_print'

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

  workouts
end

# YOUR CODE HERE
require 'pry'
workouts = load_workout_data("workouts.csv")

workout_data = []
workouts.each do |id, workout|
  workout_data << Workout.new(id, workout)
end

# workouts.each do |id, workout_data|
#   workout = Workout.new(id, workout_data)

#   puts "#{workout.id}"
#   puts "#{workout.date}"
#   puts "#{workout.type}"
#   puts "#{workout.duration}"
#   puts "#{workout.calories_burned}"
# end

tp(workout_data, :id, :date, :type, :duration ,:calories_burned)
