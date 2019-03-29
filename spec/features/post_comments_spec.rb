require 'rails_helper'

feature 'Posting Comments' do
  background do
    @user = User.create(email: 'user@example.com', password: 'password')
    @admin = AdminUser.create(email: 'admin@example.com', password: 'password')

    @post = Post.create!(title: 'Awesome Blog Post', body: 'Lorem ipsum dolor sit amet', published: true, author: @admin)

    log_in_user
  end

  def log_in_user(email = 'user@example.com', password = 'password')
    reset_session!
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Login'
  end

  # Note this scenario doesn't test the AJAX comment posting.
  scenario 'Posting a comment' do
    visit post_path(@post)

    comment = 'This post is just filler text. Ripped off!'

    fill_in 'comment_body', with: comment
    click_button 'Add comment'

    expect(page).to have_content comment
  end
end
