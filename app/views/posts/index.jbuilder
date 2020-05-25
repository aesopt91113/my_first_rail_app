json.posts @posts do | post |
  json.partial! 'posts/show', post: post

  json.user do
    json.partial! 'users/show', user: post.user
  end
end
