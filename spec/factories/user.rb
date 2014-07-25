FactoryGirl.define do
  factory :user do
    name {"Bob"}
    email {"bob@gmail.com"}
    total_xp {100}
    encrypted_password {"password"}
    remember_created_at {Time.now}
    sign_in_count {3}
    current_sign_in_at {Time.now}
    last_sign_in_at {Time.now}
    current_sign_in_ip {"1010101"}
    last_sign_in_ip {"98989898"}

  end
end
