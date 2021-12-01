class Audition < ActiveRecord::Base
  belongs_to :role

  def call_back
    self.update(hired: true)
    # self.hired = false
    # self.save
  end
end