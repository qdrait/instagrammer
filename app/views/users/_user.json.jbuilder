json.extract! user, :id, :email, :password_digest, :name, :tel_no, :gender, :website, :profile, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
