require 'rspec'
require 'task'
require 'list'

describe 'Task' do
  it 'initializes with a description' do
    test_task = Task.new('scrub the driveway')
    test_task.should be_an_instance_of Task
  end

  it 'allows you to read the description' do
    test_task = Task.new('scrub the driveway')
    test_task.describe.should eq 'scrub the driveway'
  end

  it 'adds a due date to the task' do
    test_task = Task.new('scrub the driveway')
    test_task.set_due(8,7,2014)
    test_task.due_date.should eq "2014-8-7"
  end

  it 'adds a priority level to the task' do
    test_task = Task.new('scrub the driveway')
    test_task.set_level(4)
    test_task.priority.should eq 4
  end
end

describe 'List' do
  it 'initializes with a description' do
    test_list = List.new('house maintenance')
    test_list.should be_an_instance_of List
  end

  it 'add tasks to the list' do
    test_list = List.new('house maintenance')
    driveway = Task.new('scrub the driveway')
    test_list.add_task(driveway)
    test_list.tasks[0].describe.should eq 'scrub the driveway'
  end

  it 'removes a task from the list' do
    test_list = List.new('house maintenance')
    driveway = Task.new('scrub the driveway')
    pool = Task.new('clean the pool')
    test_list.add_task(driveway)
    test_list.add_task(pool)
    test_list.remove_task(driveway)
    test_list.tasks.length.should eq 1
  end

  it 'sorts the tasks by due date' do
    test_list = List.new('house maintenance')
    driveway = Task.new('scrub the driveway')
    pool = Task.new('clean the pool')
    test_list.add_task(driveway)
    test_list.add_task(pool)
    driveway.set_due(8,10,2014)
    pool.set_due(8,1,2014)
    test_list.by_date.should eq [pool, driveway]
  end

  it 'sorts the tasks by priority' do
    test_list = List.new('house maintenance')
    driveway = Task.new('scrub the driveway')
    pool = Task.new('clean the pool')
    house = Task.new('wash the house')
    test_list.add_task(driveway)
    test_list.add_task(pool)
    test_list.add_task(house)
    driveway.set_level(3)
    pool.set_level(5)
    house.set_level(2)
    test_list.by_priority.should eq [pool, driveway, house]
  end

  it 'sorts the tasks by description' do
    test_list = List.new('house maintenance')
    driveway = Task.new('scrub the driveway')
    pool = Task.new('clean the pool')
    house = Task.new('wash the house')
    test_list.add_task(driveway)
    test_list.add_task(pool)
    test_list.add_task(house)
    test_list.by_description.should eq [pool, driveway, house]
  end

  it 'gives access to deleted tasks' do
    test_list = List.new('house maintenance')
    driveway = Task.new('scrub the driveway')
    pool = Task.new('clean the pool')
    house = Task.new('wash the house')
    test_list.add_task(driveway)
    test_list.add_task(pool)
    test_list.add_task(house)
    test_list.remove_task(pool)
    test_list.deleted_tasks.should eq [pool]
  end
end
