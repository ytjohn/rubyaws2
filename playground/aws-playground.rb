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

#@amazon_owned_images = ec2.images.with_owner('amazon')
#for amazon in @amazon_owned_images
#  print amazon.id, ", ", amazon.architecture, ", ", amazon.owner_alias, "\n"
#  print amazon.name, ": ", amazon.description, "\n"
#  #print amazon.location, "\n"
#end

#?> ec2.instances.create(:image_id => 'ami-50409a39')
#=> <AWS::EC2::Instance id:i-61d9e71d>
#
#    ?> i = ec2.instances["i-61d9e71d"]
#=> <AWS::EC2::Instance id:i-61d9e71d>
#
#    j = ec2.instances["i-5bbf8127"]
#=> <AWS::EC2::Instance id:i-5bbf8127>
#
#    ?> j.status
#=> :running
#
#?> j.stop
#=> nil
#
#?> j.status
#=> :stopping
#
#?> j.terminate
#=> nil
#
#?> j.status
#=> :shutting_down

#i = ec2.instances.create(:image_id => 'ami-50409a39', :security_groups => 'quick-start-1',:instance_type => 't1.micro', :key_name => 'freshdesk' )

#?> i.ip_address
#=> "23.20.255.52"
#
#i.dns_name
#=> "ec2-23-20-255-52.compute-1.amazonaws.com"

# official ubuntu 12.04.1 LTS 64-bit image:  ami-9c78c0f5
#i = ec2.instances.create(:image_id => 'ami-9c78c0f5', :security_groups => 'quick-start-1',:instance_type => 't1.micro', :key_name => 'freshdesk' )
