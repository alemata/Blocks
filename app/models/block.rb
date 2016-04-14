class Block < ActiveRecord::Base
  has_many  :revisions, :dependent => :destroy
  named_scope :visible_for_all, :conditions => {:shared => true}
  validates_presence_of :owner
  #Testt

  def revisions_without_first
    self.revisions.reverse.slice(1..-1)
  end

  #Virtual method
  def revision_attr=(revision_attr)
    revision_attr[:revision_number] = revision_attr[:revision_number].to_i + 1
    revisions.build(revision_attr)
  end
end
