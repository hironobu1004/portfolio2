class MemosController < ApplicationController
    def index
        @notes= Note.all
    
    end
    def new
        
      
    
    end
    def create
        Note.create(title:params["memos"]["title"],body:params["memos"]["body"],category_id:params["memos"]["category_id"])
        redirect_to"/"
    def post   
        @post = Note.new(permit_params)
        @post.save!
        redirect_to"/"
    end    
        

    def permit_params
      params.require(:post).permit(:image)
    end
        
    
    end
    def edit
       @note=Note.find(params["id"])
    
    end
    def update
        note = Note.find(params["id"])
        note.title = params["memos"]["title"]
        note.body = params["memos"]["body"]
        note.category_id =params["memos"]["category_id"]
        note.save
        redirect_to"/"
    
    end
    def destroy
        note = Note.find(params["id"])
        note.destroy
        redirect_to"/"
    end   
    
    def details
        @note=Note.find(params["id"])
    
    end
    
end
