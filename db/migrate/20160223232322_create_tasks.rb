class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.integer :project_id
      t.integer :position
      t.boolean :progress, default: false
      t.string :name

      t.timestamps null: false
    end
  end
end
