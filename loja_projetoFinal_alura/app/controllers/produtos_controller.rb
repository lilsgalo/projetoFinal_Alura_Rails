class ProdutosController < ApplicationController

  before_action :set_produto, only: [:edit, :update, :destroy]

  def index
    @produtos = Produto.order(name: :asc)
    @produto_desconto = Produto.order(:price).limit 1
  end

  def new
    @produto = Produto.new
    @departamento = Departamento.all
  end

  def edit
    rendering :edit
  end

  def update
    if @produto.update produto_params
      flash[:notice] = "Produto atualizado com sucesso!"
      redirect_to root_path
    else
      rendering :edit
    end
  end

  def create
    @produto = Produto.new produto_params
    if @produto.save
      # flash serve para dar uma mensagem de confirmação para o usuário
      flash[:notice] = "Produto criado com sucesso!"
      redirect_to root_path
    else
      rendering :new
    end
  end

  def destroy
    @produto.destroy
    redirect_to root_path
  end
  
  def search
    @nome = params[:nome]
    @produtos = Produto.where "name like ?", "%#{@nome}%"
  end


  private

  def produto_params
    params.require(:produto).permit(:name, :description, :departamento_id, :price, :quantity)
  end

  def set_produto
    @produto = Produto.find(params[:id])
  end

  def rendering(view)
    @departamento = Departamento.all
    render view
  end
end