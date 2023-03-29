class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: {to_table: users}
        #add in {to_table :users} because the author is the user, not a table called 'Author" 
      t.references :photo, null: false, foreign_key: true 
      t.text :body, null:false 

      t.timestamps
    end
  end
end
