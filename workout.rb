class Workout
  # YOUR CODE HERE
  attr_reader :id
  def initialize(id, data)
    @id = id
    @data = data
  end

  def date
    @data[@id][:date]
  end

  def type
    strength = 0
    cardio = 0
    other = 0
    @data[@id][:exercises].each do |exercise|
      if exercise[:category] == "cardio"
        cardio += 1
      elsif exercise[:category] == "strength"
        strength += 1
      else
        other += 1
      end
    end
    total = (cardio + strength + other).to_f
    if strength.to_f / total >= 0.5
      "Strength"
    elsif cardio.to_f / total >= 0.5
      "Cardio"
    elsif  other.to_f / total >= 0.5
      "Other"
    end
  end

  def duration
    duration = 0
    @data[@id][:exercises].each do |exercise|
      duration += exercise[:duration_in_min]
    end
    duration
  end

  def total_calories_burned
    calories = 0
     @data[@id][:exercises].each do |exercise|
      if exercise[:intensity] == "low" || exercise[:category] == "strength"
        exercise[:calories_burned] = exercise[:duration_in_min] * 5
      elsif exercise[:intensity] == "high"
        exercise[:calories_burned] = exercise[:duration_in_min] * 10
      elsif exercise[:intensity] == "medium"
        exercise[:calories_burned] = exercise[:duration_in_min] * 8
      else exercise[:intensity] == ""
        exercise[:calories_burned] = exercise[:duration_in_min] * 6
      end
    end
    @data[@id][:exercises].each do |exercise|
      calories += exercise[:calories_burned]
    end
    calories
  end
end

