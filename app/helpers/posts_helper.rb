module PostsHelper

  def next
    p1=@post
    Post.find(p1)
  end

end


