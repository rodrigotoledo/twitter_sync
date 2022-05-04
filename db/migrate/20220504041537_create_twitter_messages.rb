class CreateTwitterMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :twitter_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :timeline_id
      t.json :data

      t.timestamps
    end
  end
end
