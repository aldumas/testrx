# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task do
  describe "completion" do
    let(:task) { Task.new }

    it "does not have a new task as complete" do
      expect(task).not_to be_complete
    end

    it "allows us to complete a task" do
      task.mark_completed(Time.now)
      expect(task).to be_complete
    end
  end

  describe "velocity" do
    let(:task) { Task.new(size: 3) }

    it "does not count an incomplete task toward velocity" do
      expect(task).not_to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(0)
    end

    it "counts a recently completed task toward velocity" do
      task.mark_completed(1.day.ago)

      expect(task).to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(task.size)
    end

    it "does not count a task completed longer than 3 weeks ago toward velocity" do
      task.mark_completed(4.weeks.ago)

      expect(task).not_to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(0)
    end
  end
end
