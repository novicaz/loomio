include Warden::Test::Helpers

def login(user_or_email, password = nil)

  if password.nil?
    #assume email is a user object and password is password
    email = user_or_email.email
    password = 'password'
  else
    email = user_or_email
  end

  visit "/users/sign_in"
  fill_in 'user_email', with: email
  fill_in 'user_password', :with => password
  click_button 'Sign in'
end

def login_automatically(user)
  visit "/users/sign_in"
  fill_in 'user_email', with: user.email
  fill_in 'user_password', :with => 'password'
  click_button 'Sign in'
end

def logout
  find("#user ul.dropdown-menu li:last-child a").click
end

def visit_group_page(groupname)
  @group = Group.find_by_name(groupname)
  visit group_path(@group)
end

def visit_add_subgroup_page(groupname)
  @group = Group.find_by_name(groupname)
  visit add_subgroup_group_path(@group)
end
