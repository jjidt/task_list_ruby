require "./lib/task"
require "./lib/list"
@lists = {}

Shoes.app do
  background gray
  stack {
    background white
    para "Enter a new list"
    flow do
      @user_input = edit_line
      @add_list = button "Create"
      @add_list.click do
        @lists[@user_input.text] = List.new(@user_input.text)
        @word_store = ""
        @lists.each do |i| word_store += " #{i.describe}" end
        @list.replace @word_store
      end
    end
  }
  @list = para ""
end
