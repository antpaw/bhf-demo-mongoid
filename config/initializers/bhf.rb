Bhf.configure do |config|
  config.on_login_fail = :admin_url
end