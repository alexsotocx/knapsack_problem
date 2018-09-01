# frozen_string_literal: true

class Routine
  attr_accessor :id, :name, :time, :calories

  def initialize(id:, name:, average_span:, average_calorie_consumption:)
    @id = id
    @name = name
    @time = average_span
    @calories = average_calorie_consumption
  end

  def to_h
    {
      id: id,
      name: name,
      average_span: time,
      average_calorie_consumption: calories
    }
  end
end
