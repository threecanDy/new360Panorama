from poster.encode import multipart_encode               # "easy_install poster" to install poster module
from poster.streaminghttp import register_openers
import urllib2, json, base64
 
username="John"                          # your threecanDy username
password="TfjsnUF887"                    # your password
modelName="Kitchen"                      # threecanDy panorama name
description="Fashion kitchen interiors"  # panorama description
category="6"                             # Category ID - see API browsable endpoint for details
tags="kitchen table,cookers,fridge"      # tags comma separated
path="./panoramas/kitchen/"              # path to your folder files 
picture="thumbnail.png"                  # thumbail of the 360 panorama
posx="posx.jpg"                          # Positive x-axis picture
posy="posy.jpg"                          # Positive y-axis picture (UP)
posz="posz.jpg"                          # Positive z-axis picture
negx="negx.jpg"                          # Negative x-axis picture
negy="negy.jpg"                          # Negative y-axis picture
negz="negz.jpg"                          # Negative z-axis picture

register_openers()

data = {
    'name': modelName,
    'description': description,
    'category': category,
    'tags': tags,
    'picture': open(path+picture),
    'posx': open(path+posx),
    'posy': open(path+posy),
    'posz': open(path+posz),
    'negx': open(path+negx),
    'negy': open(path+negy),
    'negz': open(path+negz)
}
 
datagen, headers = multipart_encode(data)

request = urllib2.Request("http://www.threecandy/api/newmodel/", datagen, headers)
base64string = base64.encodestring('%s:%s' % (username, password))[:-1]
request.add_header("Authorization", "Basic %s" % base64string)

print urllib2.urlopen(request).read()