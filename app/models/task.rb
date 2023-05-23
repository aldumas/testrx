# frozen_string_literal: true

class Task
  def initialize
    @complete = false
  end
  def complete?
    @complete
  end

  def mark_completed
    @complete = true
  end
end
