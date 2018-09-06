class PostMailer < ApplicationMailer
    def post_mail(post)
         @post = post
         mail to: "test@test.com", subject: "投稿完了のお知らせ"
    end
end