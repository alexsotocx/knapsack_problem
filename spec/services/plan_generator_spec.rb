# frozen_string_literal: true

require 'spec_helper'
require 'services/plan_generator'
RSpec.describe PlanGenerator do
  subject { described_class.new(time: max_time, exercises: exercises) }

  let(:exercises) do
    [
      Routine.new(id: '404c1873-96e5-4767-899a-c28697b4ccd4', name: 'Squats', average_span: 20, average_calorie_consumption: 120),
      Routine.new(id: '075fe124-5b39-4276-b0ac-de4fd5b38f6f', name: 'Arm curls', average_span: 10, average_calorie_consumption: 25),
      Routine.new(id: '2085747a-eee5-445a-85fc-92da51709a41', name: 'Plank', average_span: 2, average_calorie_consumption: 10),
      Routine.new(id: '81fd3a46-e736-4498-9094-f5d7730d1409', name: 'Jumping jacks', average_span: 10, average_calorie_consumption: 35)
    ]
  end

  let(:max_time) { 30 }

  describe '#generate' do
    it 'returns the max possible burned calories in given time limit' do
      expect(subject.generate[0]).to eq(155)
    end

    it 'returns the selected routines with max calories in the time limit' do
      routines = subject.generate[1].map(&:name)
      expect(routines).to include('Squats', 'Jumping jacks')
    end

    context 'with small time limit' do
      let(:max_time) { 1 }

      it 'does not find a routine for the user' do
        expect(subject.generate[0]).to eq(0)
      end

      it 'does not find a routine for the user' do
        expect(subject.generate[1]).to be_empty
      end
    end

    context 'with no routines' do
      let(:exercises) { [] }

      it 'does not find a routine for the user' do
        expect(subject.generate[0]).to eq(0)
      end

      it 'does not find a routine for the user' do
        expect(subject.generate[1]).to be_empty
      end
    end
  end
end
