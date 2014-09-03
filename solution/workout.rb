class Workout
  # YOUR CODE HERE
  def initialize(id, workout_data)
    @id = id
    @date = workout_data[:date]
    @exercises = workout_data[:exercises]
  end

  def id
    @id
  end

  def date
    @date
  end

  def type
    if strength_exercise_percentage >= 0.50
      "strength"
    elsif cardio_exercise_percentage >= 0.50
      "cardio"
    else
      "other"
    end
  end

  def duration
    total = 0.0
    @exercises.each do |exercise|
      total += exercise[:duration_in_min]
    end
    total
  end

  def calories_burned
    calories = 0.0
    @exercises.each do |exercise|
      if exercise[:category] == "cardio"
        if exercise[:intensity] == "high"
          calories += (exercise[:duration_in_min] * 10.0)
        elsif exercise[:intensity] == "medium"
          calories += (exercise[:duration_in_min] * 8.0)
        elsif exercise[:intensity] == "low"
          calories += (exercise[:duration_in_min] * 5.0)
        end
      else
        calories += (exercise[:duration_in_min] * 6.0)
      end
    end
    calories
  end

  private # under private if we need some method to be accessible
  # outside of this class , we can use public .
  # private is pretty similar to protected
  # try to minimize public method so that user can't change or access
  # to method.

  def strength_exercise_percentage
    strength_exercise = 0
    @exercises.each do |exercise|
      if exercise[:category] == "strength"
        strength_exercise += 1
      end
    end
    strength_exercise.to_f / @exercises.length.to_f
  end

  def cardio_exercise_percentage
    cardio_exercise = 0
    @exercises.each do |exercise|
      if exercise[:category] == "cardio"
        cardio_exercise += 1
      end
    end
    cardio_exercise.to_f / @exercises.length.to_f
  end

end # end of class
