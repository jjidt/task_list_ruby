require 'rspec'
require 'task'

describe 'Task' do
  it 'initializes with a description' do
    test_task = Task.new('scrub the driveway')
    test_task.should be_an_instance_of Task
  end


end
