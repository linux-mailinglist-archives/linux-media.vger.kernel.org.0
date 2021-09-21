Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FF5412BB6
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 04:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238337AbhIUC0J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 22:26:09 -0400
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com ([46.30.212.13]:55448
        "EHLO mailrelay4-3.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347269AbhIUCUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 22:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=20191106;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=5ONa+kUWa0Qdx5TbsBRV23ynQOXLygQ8NFt9QwKEb0c=;
        b=gLbenNdcf8tGCzxCn/X3NclMSl1mW4utYIg9vY2KdsOwdZ1jyBUNZQ/dQBLtO18PRibhW+oe+1lYt
         fQRHdZn0nDO6cVXEq8HY13G70Fw2Rkxiweuh5gmRDSw8gmBJ4Evn0r46XILfbe43XFOpV39qxUf4w7
         t4xz2j2dJywuDMEaUjooyU5628tE3IGbHy8LJxtkAmKtG25yDdFVhROBmlmFfdN7YH6CeFppsqV7Sy
         O8xY/LKyQiehPUT+jFIKptG3SMYRYtEM2Mvc9/tsuZpqA64PsWi8JuJI80yT5B4VfhJq4AlsUib7q5
         DHYb8SBc669tSzxnWHT/QqyLRkTXukw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=rsa1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=5ONa+kUWa0Qdx5TbsBRV23ynQOXLygQ8NFt9QwKEb0c=;
        b=X/UBbWD/tODQjBPVzTl+1nM6sdMM7MNfuLcfNlfn7q0s/L/KxMUDlAJZDAh/mQQUoqp+qB4aBBUkX
         pcZ4M41TU0JP92f67bCkb9TzrCzbvANbDcP/DRLfsWHKu9xL3M3h9aNCGUfQ+npXfEA896pvott1BB
         KsNT2eTuOKZ/fZo1TV0/DiIsMSXJWf/mweP1I7J2SjXHgTlq2gQlh7J4k0wvqDwUG7xR8oSOaDFyjd
         1f6xhz6k50vbTNn53aYGGpkHO3Ow/mHRizPY4MFxSoZQZfvFQ6LQFIu8Fdmfl+BbArxeYkFuctm239
         LFiRxPfWI8+7OG9AjQigfVMjg4UOd0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=mida.se; s=ed1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=5ONa+kUWa0Qdx5TbsBRV23ynQOXLygQ8NFt9QwKEb0c=;
        b=RtSAHGxGVSmP0m12/KwTtdAtbr6N54xqNslMH/b6l+QqGzF9futhehXmDe8Y8TYx+HdOvx0AHAQRm
         lsKhGRwCw==
X-HalOne-Cookie: 4840cff84d55f9ba1c07070c2e6c05717792bb0e
X-HalOne-ID: 39131147-1a82-11ec-adfc-d0431ea8bb10
Received: from [192.168.1.108] (2.64.99.63.mobile.tre.se [2.64.99.63])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 39131147-1a82-11ec-adfc-d0431ea8bb10;
        Tue, 21 Sep 2021 02:18:35 +0000 (UTC)
To:     linux-media@vger.kernel.org
From:   rkardell <rkardell@mida.se>
Subject: Error Terratec Cinergy T2 after USB disconnect or sleep
Message-ID: <500b3efc-5937-8ac4-bf7b-669b9ebc029a@mida.se>
Date:   Tue, 21 Sep 2021 04:18:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: sv-FI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Terratec Cinergy T2 driver leaves lsmod used cnt at -1, after sleep or 
usb reconnect.
Driver can’t be removed with rmmod and modprobe -r crashes kernel.
After reconnect or wake up after sleep, cinergyt2 seems to be properly 
initialized, but can’t be used by kaffeine. The system must be restarted 
to be able to use the CinergyT2 again.
The only way to avoid this is to manually stop the driver with rmmod 
before disconnect or sleep.
Tested on Thinkpad X131e Ubuntu Mate 21.04 5.11.0-34-generic x86_64
and several other.
The only reference to the problem that I have found is this: 
https://linuxtv.org/pipermail/linux-dvb/2007-November/021577.html
Anyone have any ideas how to solve the problem or how to proceed?


Dmesg after connect
  1882.116982] usb 1-1.2: new high-speed USB device number 3 using ehci-pci
[ 1882.225758] usb 1-1.2: config 1 interface 0 altsetting 0 bulk 
endpoint 0x1 has invalid maxpacket 64
[ 1882.225772] usb 1-1.2: config 1 interface 0 altsetting 0 bulk 
endpoint 0x81 has invalid maxpacket 64
[ 1882.226486] usb 1-1.2: New USB device found, idVendor=0ccd, 
idProduct=0038, bcdDevice= 1.06
[ 1882.226497] usb 1-1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[ 1882.226501] usb 1-1.2: Product: Cinergy T²
[ 1882.226504] usb 1-1.2: Manufacturer: TerraTec GmbH
[ 1882.406083] dvb-usb: found a 'Mod TerraTec/qanu USB2.0 Highspeed 
DVB-T Receiver' in warm state.
[ 1882.409674] dvb-usb: will pass the complete MPEG2 transport stream to 
the software demuxer.
[ 1882.410117] dvbdev: DVB: registering new adapter (Mod TerraTec/qanu 
USB2.0 Highspeed DVB-T Receiver)
[ 1882.410127] usb 1-1.2: media controller created
[ 1882.410554] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' 
registered.
[ 1882.411406] usb 1-1.2: DVB: registering adapter 0 frontend 0 
(TerraTec/qanu USB2.0 Highspeed DVB-T Receiver)...
[ 1882.411413] dvbdev: dvb_create_media_entity: media entity 
'TerraTec/qanu USB2.0 Highspeed DVB-T Receiver' registered.
[ 1882.412361] input: IR-receiver inside an USB DVB receiver as 
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/input/input26
[ 1882.412475] dvb-usb: schedule remote query interval to 50 msecs.
[ 1882.415543] dvb-usb: Mod TerraTec/qanu USB2.0 Highspeed DVB-T 
Receiver successfully initialized and connected.
[ 1882.415644] usbcore: registered new interface driver cinergyT2

lsmod after connect
Module                  Size  Used by
dvb_usb_cinergyT2      20480  0
dvb_usb                28672  1 dvb_usb_cinergyT2
dvb_core              139264  1 dvb_usb

lsusb -v after connect
Bus 001 Device 003: ID 0ccd:0038 TerraTec Electronic GmbH Cinergy T² 
DVB-T Receiver
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          255 Vendor Specific Class
   bDeviceSubClass       255 Vendor Specific Subclass
   bDeviceProtocol       255 Vendor Specific Protocol
   bMaxPacketSize0        64
   idVendor           0x0ccd TerraTec Electronic GmbH
   idProduct          0x0038 Cinergy T² DVB-T Receiver
   bcdDevice            1.06
   iManufacturer           1 TerraTec GmbH
   iProduct                2 Cinergy T²
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0027
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              476mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           3
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol      0
       iInterface              3 Highspeed Bulk Transfer
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass          255 Vendor Specific Class
   bDeviceSubClass       255 Vendor Specific Subclass
   bDeviceProtocol       255 Vendor Specific Protocol
   bMaxPacketSize0        64
   bNumConfigurations      1
can't get debug descriptor: Resource temporarily unavailable
cannot read device status, Resource temporarily unavailable (11)

dmesg after sleep
  2085.595303] PM: suspend entry (deep)
[ 2086.182808] Filesystems sync: 0.587 seconds
[ 2086.317346] Freezing user space processes ... (elapsed 0.003 seconds) 
done.
[ 2086.321013] OOM killer disabled.
[ 2086.321015] Freezing remaining freezable tasks ... (elapsed 0.023 
seconds) done.
[ 2086.344118] printk: Suspending console(s) (use no_console_suspend to 
debug)
[ 2086.349168] dvb-usb: Mod TerraTec/qanu USB2.0 Highspeed DVB- 
successfully deinitialized and disconnected.

Dmesg after wake up
[ 2089.580989] usb 1-1.2: reset high-speed USB device number 3 using 
ehci-pci
[ 2089.690369] PM: dpm_run_callback(): usb_dev_resume+0x0/0x20 returns -5
[ 2089.690387] PM: Device 1-1.2 failed to resume async: error -5
[ 2090.029351] OOM killer enabled.
[ 2090.029359] Restarting tasks ...
[ 2090.033135] usb 1-1.2: USB disconnect, device number 3
[ 2090.060292] done.
[ 2090.113373] usb 1-1.2: new high-speed USB device number 4 using ehci-pci
[ 2090.229368] usb 1-1.2: config 1 interface 0 altsetting 0 bulk 
endpoint 0x1 has invalid maxpacket 64
[ 2090.229378] usb 1-1.2: config 1 interface 0 altsetting 0 bulk 
endpoint 0x81 has invalid maxpacket 64
[ 2090.229865] usb 1-1.2: New USB device found, idVendor=0ccd, 
idProduct=0038, bcdDevice= 1.06
[ 2090.229870] usb 1-1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[ 2090.229872] usb 1-1.2: Product: Cinergy T²
[ 2090.229875] usb 1-1.2: Manufacturer: TerraTec GmbH
[ 2090.230563] dvb-usb: found a 'Mod TerraTec/qanu USB2.0 Highspeed 
DVB-T Receiver' in warm state.
[ 2090.234126] dvb-usb: will pass the complete MPEG2 transport stream to 
the software demuxer.
[ 2090.234250] dvbdev: DVB: registering new adapter (Mod TerraTec/qanu 
USB2.0 Highspeed DVB-T Receiver)
[ 2090.234258] usb 1-1.2: media controller created
[ 2090.234851] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' 
registered.
[ 2090.235745] usb 1-1.2: DVB: registering adapter 0 frontend 0 
(TerraTec/qanu USB2.0 Highspeed DVB-T Receiver)...
[ 2090.235757] dvbdev: dvb_create_media_entity: media entity 
'TerraTec/qanu USB2.0 Highspeed DVB-T Receiver' registered.
[ 2090.236844] input: IR-receiver inside an USB DVB receiver as 
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/input/input30
[ 2090.237399] dvb-usb: schedule remote query interval to 50 msecs.
[ 2090.239994] dvb-usb: Mod TerraTec/qanu USB2.0 Highspeed DVB-T 
Receiver successfully initialized and connected.
[ 2090.571073] PM: suspend exit

lsmod after wake up
Module                  Size  Used by
dvb_usb_cinergyT2      20480  -1
dvb_usb                28672  1 dvb_usb_cinergyT2
dvb_core              139264  1 dvb_usb

lsusb -v after wake up
Bus 001 Device 004: ID 0ccd:0038 TerraTec Electronic GmbH Cinergy T² 
DVB-T Receiver
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          255 Vendor Specific Class
   bDeviceSubClass       255 Vendor Specific Subclass
   bDeviceProtocol       255 Vendor Specific Protocol
   bMaxPacketSize0        64
   idVendor           0x0ccd TerraTec Electronic GmbH
   idProduct          0x0038 Cinergy T² DVB-T Receiver
   bcdDevice            1.06
   iManufacturer           1 TerraTec GmbH
   iProduct                2 Cinergy T²
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0027
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              476mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           3
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol      0
       iInterface              3 Highspeed Bulk Transfer
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass          255 Vendor Specific Class
   bDeviceSubClass       255 Vendor Specific Subclass
   bDeviceProtocol       255 Vendor Specific Protocol
   bMaxPacketSize0        64
   bNumConfigurations      1
can't get debug descriptor: Resource temporarily unavailable
cannot read device status, Resource temporarily unavailable (11)



