class CreateSiteStates < ActiveRecord::Migration
  def change
    create_table :site_states do |t|
      t.string :state_name, null: false, index: true
      t.string :value, null: false

      t.timestamps null: false
    end
  end
end
