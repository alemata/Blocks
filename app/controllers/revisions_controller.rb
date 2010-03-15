class RevisionsController < ApplicationController

  def show
    @block = Block.find(params[:block_id])
    @revision = Revision.find(params[:id])
    @revisions = @block.revisions.reverse
    @revisions.shift
  end
end
