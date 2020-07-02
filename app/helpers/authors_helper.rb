module AuthorsHelper
    def author_params
        params.require(:author).permit(:title, :body, :tag_list, :image)
    end
end
