#!/bin/bash

username="John"                          # your threecanDy username
password="TfjsnUF887"                    # your password
modelName="Kitchen"                      # threecanDy panorama name
description="Fashion kitchen interiors"  # panorama description
category="6"                             # Category ID - see API browsable endpoint for details
tags="kitchen table,cookers,fridge"      # tags comma separated
path="./panoramas/kitchen/"              # path to your folder files 
picture="thumbnail.png"                  # thumbail of the 360 panorama
path_pict=${path}${picture}		 
panorama="panorama.jpg"                  # Panorama picture
path_f1=${path}${panorama}

curl -i -X POST http://www.threecandy/api/newmodel/ -H "Content-Type: multipart/form-data" -u ${username}:${password} -F "picture=@${path_pict}" -F "singlePanoramaImg=@${path_f1}" -F "name=${modelName}" -F "category=${category}" -F "description=${description}" -F "tags=${tags}"