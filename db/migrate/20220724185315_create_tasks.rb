class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.bigint :id
      t.string :description
      t.boolean :isUrgent
      t.boolean :isDone

      t.timestamps
    end
  end
end
