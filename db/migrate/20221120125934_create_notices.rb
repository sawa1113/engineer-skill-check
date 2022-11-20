class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.datetime :deleted_at, null: true,   default: nil
      t.timestamps
    end
  end
end
