class User < ActiveRecord::Base
  has_many :proficiencies
  has_many :skills, :through => :proficiencies
  # Remember to create a migration!

  def proficiency_for(skill)
    proficiency_rating = Proficiency.where(skill_id: skill.id, user_id: self.id).first.rating

    proficiency_rating
  end

  def set_proficiency_for(skill, rating_level)
    proficiency_id = Proficiency.where(skill_id: skill.id, user_id: self.id).first.id
    Proficiency.update(proficiency_id, rating: rating_level)
  end

end
