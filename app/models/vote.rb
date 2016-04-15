class Vote < ActiveRecord::Base
  belongs_to :comment
end
