class Skill < ActiveRecord::Base
  # Remember to create a migration!
  has_many :proficiencies
  has_many :users, :through => :proficiencies

  validates :name, uniqueness: true

  def user_with_proficiency(rating_level)
    self.proficiencies.where(rating: rating_level).first.user.name
  end
end
