class CommentsController < ApplicationController
  def create
    puts "saving new comment"
    comment = Comment.new
    #comment.author_id = params.fetch("query_author_id")
    comment.author_id = params.fetch("uid")
    comment.venue_id = params.fetch("query_venue_id")
    comment.body = params.fetch("query_body")
    if (comment.save)
      puts "saved"
    else
      puts "error saving"
    end
    
    redirect_to("/venues/#{comment.venue_id}")
  end
end
