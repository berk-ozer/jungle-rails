class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|

      t.timestamps null: false
    end
  end
end
