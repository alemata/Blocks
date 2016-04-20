class Revision < ActiveRecord::Base
  has_one :file_type
  belongs_to :block
  #this is a test

  validates_presence_of :snippet, :revision_number
end
