module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def path_follower(user)
    # TODO: フォロワー数をuserから取得して表示
    link_to "Follower　：" + user.follower_users.count.to_s, 
    { controller: :users, action: :follower, id: user.id},
    { :id => "link_id", :class => "link_class"}
  end

  def path_followed(user)
    link_to "Follow　：" + user.following_users.count.to_s, 
    { controller: :users, action: :followed, id: user.id},
    { id: "link_id", class: "link_class"}
  end

end