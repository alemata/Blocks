class BlocksController < ApplicationController
  def index
    @blocks = Block.paginate :order => 'updated_at DESC', :per_page => 5, :page => params[:page], :conditions => {:shared => true}
  end

  def show
    @block = Block.find(params[:id])
    @revisions = @block.revisions.reverse
    @revisions.shift
  end

  def new
    @block = Block.new
    @revision = @block.revisions.new
  end

  def create
    @block = Block.new(params[:block])
    @block.owner = session[:session_id].to_i
    @block.last_revision = 0

    if !params[:block][:revision_attr][:snippet].blank? && @block.save
      flash[:notice] = "Block was successfully created."
      redirect_to @block
    else
      flash[:error] = "Code can't be empty"
      @revision = @block.revisions.new
      render :action => 'new'
    end
  end

  def edit
    @block = Block.find(params[:id])
    @revision = @block.revisions.last
  end

  def update
    @block = Block.find(params[:id])
    params[:block][:last_revision] = params[:block][:revision_attr][:revision_number].to_i + 1
    if @block.update_attributes(params[:block])
      flash[:notice] = "Successfully updated block."
      redirect_to @block
    else
      render :action => 'edit'
    end
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy
    flash[:notice] = "Successfully destroyed block."
    redirect_to blocks_url
  end
end
