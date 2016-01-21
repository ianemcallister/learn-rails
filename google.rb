require "google/api_client"
require "google_drive"

# The client ID and client secret you obtained in the step above.
CLIENT_ID = '94780943201'
CLIENT_SECRET = 'n64r6057ne31imngvgbfk2k9kij4vhlk.apps.googleusercontent.com'

# Creates a session. This will prompt the credential via command line for the
# first time and save it to ./stored_token.json file for later usages.
#
# If you are developing a Web app, and you want to ask the user to log in in
# the Web app instead of via command line, follow the example code in:
# http://gimite.net/doc/google-drive-ruby/GoogleDrive.html#method-c-login_with_oauth
session = GoogleDrive.saved_session("./stored_token.json", nil, CLIENT_ID, CLIENT_SECRET)

# Gets list of remote files.
session.files.each do |file|
  p file.title
end

# Uploads a local file.
session.upload_from_file("/path/to/hello.txt", "hello.txt", convert: false)

# Downloads to a local file.
file = session.file_by_title("hello.txt")
file.download_to_file("/path/to/hello.txt")

# Updates content of the remote file.
file.update_from_file("/path/to/hello.txt")