class GroupsController < ApplicationController
  before_action :require_logged_in, only: [:create, :new, :join, :leave]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.includes(:owner, :users, trains: [train_options: [:votes]]).find_by(id: params[:id])
  end

  def new
    @group = Group.new
  end

  def destroy
    group = Group.find_by(id: params[:id])
    if group.nil?
      redirect_to :back, notice: "Group doesn't exist"
    elsif group.owner == current_user
      group.delete
      redirect_to dashboard_path, notice: "Group deleted"
    else
      redirect_to :back, notice: "You cant do that"
    end
  end

  def create
    @group = Group.new group_params.merge(owner: current_user)
    if @group.save
      redirect_to group_path(@group), notice: "Group created"
    else
      render :new
    end
  end

  def join
    group = Group.find_by(id: params[:id])
    if group
      group.users << current_user
      redirect_to group_path(group)
    else
      redirect_to :back, notice: "That group you were trying to join doesn't exist"
    end
  end

  def leave
    group = Group.find_by(id: params[:id])
    if group
      group.users -= [current_user]
      redirect_to group_path(group)
    else
      redirect_to :back, notice: "That group you were trying to leave doesn't exist"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
