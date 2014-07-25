class List
  def initialize(description)
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def tasks
    @tasks
  end

  def remove_task(task)
    @deleted_tasks = Array.new(0)
    @deleted_tasks << @tasks.delete(task)
  end

  def deleted_tasks
    @deleted_tasks
  end

  def by_date
    @tasks.sort {|a, b| a.due_date <=> b.due_date}
  end

  def by_priority
    @tasks.sort {|a, b| b.priority <=> a.priority}
  end

  def by_description
    @tasks.sort {|a, b| a.describe <=> b.describe}
  end
end
