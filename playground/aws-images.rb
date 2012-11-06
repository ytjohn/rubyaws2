require 'rubygems'
require 'aws-sdk'
require 'yaml'

config = YAML::load_file('../config/aws.yml')
@access_key = config["aws"]["access_key_id"]
@secret_key = config["aws"]["secret_access_key"]

print "ak: ", @access_key
print "sk: ", @secret_key


ec2 = AWS::EC2.new(
    :access_key_id => @access_key,
    :secret_access_key => @secret_key)

# ami-50409a39 = ubuntu 12.04 i386

@amazon_owned_images = ec2.images.with_owner('amazon')
for amazon in @amazon_owned_images
  print amazon.id, ", ", amazon.architecture, ", ", amazon.owner_alias, "\n"
  print amazon.name, ": ", amazon.description, "\n"
  #print amazon.location, "\n"
end

#ec2.
#ec2.
#ec2.images.
#@images = ec2.describe_images(:image_id => 'ami-50409a39' )


