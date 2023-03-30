task sample_data: :environment do 

    p "creating sample data"

    if Rails.env.development?
      FollowRequest.destroy_all
      User.destroy_all 
      #delete all records for now 
    end 

    12.times do 
      name = Faker::Name.first_name.downcase
      u = User.create(
        email: "#{name}@example.com", 
        username: name,
        password: "password", 
        private: [true, false].sample 
      )
    end 

    users = User.all

       users.each do |first_user|
        users.each do |second_user| 
          if rand < 0.75
            first_user.sent_follow_requests.create(
              recipient: second_user, 
              status: FollowRequest.statuses.values.sample 
            ) 
          end   
        end 
      end 

       users.each do |second_user|
          users.each do |first_user| 
          if rand < 0.75
            second_user.sent_follow_requests.create(
              recipient: first_user, 
              status: FollowRequest.statuses.values.sample 
            ) 
          end   
        end 
      end 

      #break 

    users.each do |user|
      rand(15).times do 
        photo = user.own_photos.create(
          caption: Faker::Quote.jack_handey,
          image: "https://robohash.org/#{rand(9999)}"
        )
        p "hi"
      
        users.follower.each do |follower|
          if rand <0.5 
            photo.fans << follower 
          end 

        if rand < 0.25 
          photo.comments.create(
            body: Faker::Quote.jack_handey,
            author: follower 
          )
       end 
      end 
    end 
  end 

    p "#{FollowRequest.count} users have been created."
    p "#{User.count} users have been created"
    p "#{Photo.count} Photos" 
    p "#{Like.count} likes" 
    p "#{Comment.count} comments"
    
  end 