module ApplicationHelper
    def gravator_for(user, option = {size: 80})
       gravator_id = Digest::MD5::hexdigest(user.email.downcase)
       size = option[:size]
       gravator_url = "https://secure.gravator.com/avatar/#{gravator_id}?s=#{size}"
       image_tag(gravator_url, alt: user.username, class: "img-circle")
    end
end
