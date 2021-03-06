class NoticiaController < ApplicationController
  before_action :set_noticium, only: [:show, :edit, :update, :destroy]
  before_action :usuario_nao_logado
  before_action :usuario_correto, only: [:edit, :update]
  before_action :usuario_correto_ou_admin, only: [:destroy]

  # GET /noticia
  # GET /noticia.json
  def index
    @noticia = Noticium.all
  end

  # GET /noticia/1
  # GET /noticia/1.json
  def show
    @comentario = Comentario.new
    #@comentarios = @noticium.titulo
  end

  # GET /noticia/new
  def new
    @noticium = Noticium.new
  end

  # GET /noticia/1/edit
  def edit
  end

  # POST /noticia
  # POST /noticia.json
  def create
    @noticium = Noticium.new(noticium_params)

    respond_to do |format|
      if @noticium.save
        format.html { redirect_to feed_path, notice: 'Noticia criada com exito.' }
        format.json { render :show, status: :created, location: @noticium }
      else
        format.html { render "feed" }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticia/1
  # PATCH/PUT /noticia/1.json
  def update
    respond_to do |format|
      if @noticium.update(noticium_params)
        format.html { redirect_to @noticium, notice: 'Noticia atualizada com exito.' }
        format.json { render :show, status: :ok, location: @noticium }
      else
        format.html { render :edit }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1
  # DELETE /noticia/1.json
  def destroy
    @noticium.destroy
    respond_to do |format|
      format.html { redirect_to noticia_url, notice: 'Noticia excluída com exito.' }
      format.json { head :no_content }
    end
  end

  # GET / feed
  def feed
    @noticium = Noticium.new
    @noticium = Noticium.all.order(updated_at: :desc).paginate(:page => params[:page],
       :per_page => 10)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticium
      @noticium = Noticium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticium_params
      params.require(:noticium).permit(:usuario_id, :titulo, :texto, :categoria, :image, :data_public)
    end


        def usuario_correto
          if current_user != @noticium.usuario
            flash[:notice] = "Não permitido."
            redirect_to noticium_path
            end
        end

        def usuario_correto_ou_admin
          if !current_user.admin && current_user != @noticium.usuario
            flash[:notice] = "Não permitido."
            redirect_to noticium_path
            end
        end



end
