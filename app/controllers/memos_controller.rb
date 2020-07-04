class MemosController < ApplicationController
    def index
        @notes= Note.all
    
    end
    def new
        
      
    
    end
    def create
        Note.create(title:params["memos"]["title"],body:params["memos"]["body"],category_id:params["memos"]["category_id"],image:params["memos"]["image"])
        redirect_to"/all"

        
    
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
        redirect_to"/all"
    
    end
    def destroy
        note = Note.find(params["id"])
        note.destroy
        redirect_to"/all"
    end   
    
    def details
        @note=Note.find(params["id"])
    
    end
    
end
