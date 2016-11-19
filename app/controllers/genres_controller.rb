class GenresController < ApplicationController
  def index
	@genres = Genre.all
  end

  def new
	@genre = Genre.new
	@concert = Concert.new
  end

  def create
	@genre = Genre.new(genre_params)
	@genre.save
#	@genre.update(:concert_attributes => {:nom => "testValue"})
	if @genre.save && @genre.save
		redirect_to "concerts#new"
	else
		redirect_to :back
	end
  end
  
  def edit
	@genre = Genre.find(params[:id])
  end
  
	def update
		@genre = Genre.find(params[:id])
		
		if @genre.update(genre_params)
			redirect_to @genre
		else 
			render 'edit'
		end
	end
  

  def show
	@genre = Genre.find(params[:id])
  end
  
	def destroy
		@genre = Genre.find(params[:id])
		@genre.destroy
		
		redirect_to concerts_path
	end
  
  	private
	def genre_params
		params.require(:genre).permit(:nom)
	end

end
