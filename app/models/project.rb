# frozen_string_literal: true

class Project
  attr_reader :tasks

  def initialize
    @tasks = []
  end
  def done?
    tasks.all?(&:complete?)
  end
end
