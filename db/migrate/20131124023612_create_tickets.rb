class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :summary
      t.text :problem
      t.text :response

      t.timestamps
    end
  end
end
