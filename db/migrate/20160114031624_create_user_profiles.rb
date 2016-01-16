class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, index: true 
      t.string :area
      t.string :bio

      t.timestamps null: false
    end
  end
end
