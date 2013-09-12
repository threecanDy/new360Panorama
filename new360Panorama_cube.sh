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
posx="posx.jpg"                          # Positive x-axis picture
posy="posy.jpg"                          # Positive y-axis picture (UP)
posz="posz.jpg"                          # Positive z-axis picture
negx="negx.jpg"                          # Negative x-axis picture
negy="negy.jpg"                          # Negative y-axis picture
negz="negz.jpg"                          # Negative z-axis picture
path_px=${path}${posx}
path_py=${path}${posy}
path_pz=${path}${posz}
path_nx=${path}${negx}
path_ny=${path}${negy}
path_nz=${path}${negz}

curl -i -X POST http://www.threecandy/api/newmodel/ -H "Content-Type: multipart/form-data" -u ${username}:${password} -F "picture=@${path_pict}" -F "posx=@${path_px}" -F "posy=@${path_py}" -F "posz=@${path_pz}" -F "negx=@${path_nx}" -F "negy=@${path_ny}" -F "negz=@${path_nz}" -F "name=${modelName}" -F "category=${category}" -F "description=${description}" -F "tags=${tags}"