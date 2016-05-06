feature 'user signup' do
  scenario 'successfully signing up a user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user@example.com')
    expect(User.first.email).to eq('user@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'stay in the same page when the user enters wrong password' do
  	expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  	expect(current_path).to eq('/users')
  	expect(page).to have_content('Password and confirmation password do not match')
  end
end