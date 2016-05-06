def sign_up(email: 'user@example.com',
            password: 'password1',
            password_confirmation: 'password1')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end