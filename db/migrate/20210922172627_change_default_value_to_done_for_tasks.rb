class ChangeDefaultValueToDoneForTasks < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tasks, :done, from: nil, to: false
  end
end
