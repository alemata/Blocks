# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blocks_session',
  :secret      => '36c8f0c2331adb7d99d6dc793999addd13ce9046201ded749a18ce7198efeea2924ce34b41e015547dd7f03b31f465c25c1e9ccf3f6945aa3caed1e3b6be1df3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
