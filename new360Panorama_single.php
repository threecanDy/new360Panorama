<?php
 
/* Check cURL installation in php.ini file */
$username="John";                          # your threecanDy username
$password="TfjsnUF887";                    # your password
$modelName="Kitchen";                      # threecanDy panorama name
$description="Fashion kitchen interiors";  # panorama description
$category="6";                             # Category ID - see API browsable endpoint for details
$tags="kitchen table,cookers,fridge";      # tags comma separated
$path="./panoramas/kitchen/";              # path to your folder files 
$picture="thumbnail.png";                  # thumbail of the 360 panorama      
$panorama="panorama.jpg";                  # Panorama picture
 
$data = array(
    "name"               => $modelName,
    "description"        => $description,
    "category"           => $category,
    "tags"               => $tags,
    "picture"            => "@".$path.$picture,
    "singlePanoramaImg"  => "@".$path.$panorama
);
 
$cInit = curl_init();
curl_setopt_array($cInit, array(
    CURLOPT_RETURNTRANSFER => 1,
    CURLOPT_URL            => "http://www.threecandy/api/newmodel/",
    CURLOPT_POST           => 1,
    CURLOPT_HTTPAUTH       => CURLAUTH_ANY
    CURLOPT_USERPWD        => "$username:$password",
    CURLOPT_POSTFIELDS     => $data
));
 
$response = curl_exec($cInit);
$resultStatus = curl_getinfo($cInit);
curl_close($cInit);

if($resultStatus['http_code'] == 200) {
    echo $response;
} else {
    echo 'Call Failed '.print_r($resultStatus);                         
}

?>