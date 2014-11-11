class Poster < ActiveRecord::Base
  has_many :tweets

  def as_json(params)
    super(params.merge({:only => [:name, :id], :include => :tweets}))
  end
end
