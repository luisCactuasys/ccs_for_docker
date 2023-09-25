FROM ubuntu

  

RUN dpkg --add-architecture i386

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y libc6:i386 libasound2 libusb-0.1-4 libstdc++6 libxt6 libncurses5 libcanberra-gtk-module unzip wget software-properties-common build-essential ca-certificates curl libgconf-2-4 libdbus-glib-1-2 libpython2.7 python2.7 libxtst6 at-spi2-core binutils python3-pip libtinfo5 git

COPY download/CCS12.4.0.00007_linux-x64.tar.gz /FromTi/CCS12.4.0.00007_linux-x64.tar.gz

RUN cd /FromTi/; tar -xzpvf /FromTi/CCS12.4.0.00007_linux-x64.tar.gz

COPY download/simplelink_cc2640r2_sdk_5_30_00_03.run /FromTi/simplelink_cc2640r2_sdk_5_30_00_03.run
   
# Install the SDK    
    WORKDIR /FromTi

    RUN chmod +x /FromTi/simplelink_cc2640r2_sdk_5_30_00_03.run

    RUN ./simplelink_cc2640r2_sdk_5_30_00_03.run  --unattendedmodeui none --mode unattended --prefix /root/ti

# Install CCS

    RUN ./CCS12.4.0.00007_linux-x64/ccs_setup_12.4.0.00007.run --unattendedmodeui none --debuglevel 2 --mode unattended --enable-components PF_CC2X --prefix /root/ti

