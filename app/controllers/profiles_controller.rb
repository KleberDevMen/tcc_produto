class ProfilesController < ApplicationController
  # before_action :authenticate_user!
  # load_and_authorize_resource

  before_action :set_profile, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_combos, only: [:new, :edit, :update, :create]

  # GET /profiles
  def index
    @q = Profile.all.ransack(params[:q])
    @profiles = @q.result.page(params[:page])
  end

  # GET /profiles/1
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    @profile.permissions = params[:permissoes]
    if @profile.save
      redirect_to @profile, notice: t('notice.created')
    else
      render :new
    end
  end

  # PATCH/PUT /profiles/1
  def update

    @profile.name = params[:profile][:name]
    @profile.description = params[:profile][:description]
    @profile.permissions = params[:permissoes]
    if @profile.save
      redirect_to @profile, notice: t('notice.updated')
    else
      render :edit
    end
  end

  # DELETE /profiles/1
  def destroy
    if @profile.destroy
      render json: nil, status: :ok
    else
      render json: nil, status: :internal_server_error
    end
  end

  def toggle_status
    if @profile.active
      if @profile.update(active: false)
        redirect_to profiles_url, notice: t('notice.disabled')
      end
    else
      if @profile.update(active: true)
        redirect_to profiles_url, notice: t('notice.activated')
      end
    end
  end

  private

  #Método que carrega todos os controllers da aplicaçAo
  def set_combos

    contrl = [
      AcademicWorksController,
      CoursesController,
      IdeasController,
      IdeaCategoriesController,
      TeachersController,
      MenusController,
      ProfilesController,
      UsersController
    ]

    @controllers = contrl.map { |a| { controller: a, metodos: a.action_methods } }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def profile_params
    params.require(:profile).permit(:name, :description, :permissions, :status)
  end
end
