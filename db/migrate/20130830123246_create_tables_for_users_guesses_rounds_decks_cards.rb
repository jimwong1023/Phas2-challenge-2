class CreateTablesForUsersGuessesRoundsDecksCards < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash

      t.timestamps
    end

    create_table :guesses do |t|
      t.string :right_wrong
      t.belongs_to :round
      t.belongs_to :card

      t.timestamps
    end

    create_table :rounds do |t|
      t.string :completion_status
      t.belongs_to :user
      t.belongs_to :deck

      t.timestamps
    end

    create_table :decks do |t|
      t.string :name

      t.timestamps
    end

    create_table :cards do |t|
      t.string :prompt
      t.string :answer
      t.belongs_to :deck

      t.timestamps
    end

  end
end
