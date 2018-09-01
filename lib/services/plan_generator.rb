# frozen_string_literal: true

require_relative '../models/routine'

class PlanGenerator
  def initialize(time:, exercises:)
    @routines = exercises
    @max_time = time
  end

  def generate
    [calculate_max_calories, select_routines]
  end

  private

  attr_accessor :dp, :routines, :max_time

  def select_routines
    selected_routines = []
    time = max_time
    m = routines.size
    calories = @dp[m][time]
    while m.positive? && calories.positive?
      if calories != dp[m - 1][time]
        routine = routines[m - 1]
        selected_routines << routine
        calories -= routine.calories
        time -= routine.time
      end
      m -= 1
    end

    selected_routines
  end

  def calculate_max_calories
    @dp = Array.new(routines.size + 1) { Array.new(max_time + 1) }
    (0..max_time).each { |i| dp[0][i] = 0 }

    (1..routines.size).each do |i|
      routine = routines[i - 1]
      (0..max_time).each do |j|
        dp[i][j] = dp[i - 1][j]
        if j - routine.time >= 0
          dp[i][j] = [dp[i][j], dp[i - 1][j - routine.time] + routine.calories].max
        end
      end
    end

    @dp[routines.size][max_time]
  end
end
