# This is a theorteically flawed chef recipe.  This installs anything apple thinks
# is a good idea.  Please understand why you shouldn't use this before using it.

last_update_touchfile = "/tmp/last_software_update"

execute "Check & install all available OS X updates from Apple" do
  command "softwareupdate -i -a && touch #{last_update_touchfile}"
  not_if { File.exists?(last_update_touchfile) && File.new(last_update_touchfile).mtime > Time.now-60*24 }
end