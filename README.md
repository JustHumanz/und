<p align="center"> <b> Script Downloader file </b> </p>

all download file will be save in ~/Downloads/aria2
# How to install 

sudo wget https://raw.githubusercontent.com/JustHumanz/und/master/und -P /usr/local/bin/ && sudo chmod +x /usr/local/bin/und

usage:                              und -d [link] <br />
usage download from google drive:   und -g [file_id] <br />

Optional arguments: <br />

    -d, --download  download file 
    -c, --check     Check request file 
    -s, --speed     Speed test 
    -g,             Downloads from google drive
    -h, --h, --help show this help message and exit 
    -v, --version   display version 

example <br />
~> und -d https://speed.hetzner.de/100MB.bin 
<br />
~> und -g 16MpBTosMm5ieJ_iEiak2qcQrB_XpJ_jB (download file from google drive)
<br />
Original link https://drive.google.com/file/d/ >> 16MpBTosMm5ieJ_iEiak2qcQrB_XpJ_jB <<  (that's was ID file)

