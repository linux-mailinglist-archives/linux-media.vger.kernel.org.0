Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5642441A46E
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 02:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238390AbhI1A7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 20:59:25 -0400
Received: from mailrelay1-3.pub.mailoutpod1-cph3.one.com ([46.30.212.10]:61593
        "EHLO mailrelay1-3.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238379AbhI1A7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 20:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=20191106;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
         message-id:references:to:from:subject:from;
        bh=oD4kEnr3Q8AcmDcUVD4MiI81vrftIQDRxSjaRmsL6fo=;
        b=MKls8fcvYTWJJFRBuTJo1s8ZkKlPozQW2EojQks5mdEfm05OdXOTy1cMe31UZRKXsAkGgL4ciQ05z
         T8NvxZyXdenrDt0Qr0h1hqaKFCseHFbEIqf71e1ou8baT9N/uZ4RH1ohKyo/Zs9GDml4g9ikol/ijP
         Iq723Q4l8Rp/Wmmm2PHwtIsoUowfF85ChYeZicOn0zWy4ueAFSk9kcuqKMAMp9JFqUs6Z1QJZNifmw
         6r4SWOajPAwFIE5SDm6fhw/5CRr2hR4qhvf9BEFVPd/cddNehuoHIYh/Yn+630OpPuZCz+03qnjyKJ
         A/3a7+JP5/pWi0Cv3xbVSLGWE+ilP8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=rsa1;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
         message-id:references:to:from:subject:from;
        bh=oD4kEnr3Q8AcmDcUVD4MiI81vrftIQDRxSjaRmsL6fo=;
        b=zE4/T753ppVEwebnLpmw50SNBRQILVCgYZlgaIIiwCxmIG9BRoSW/xXbx5nSWPbmup7i+M5/Q3o+y
         AJL1bi4Gz09yj/kJTpNAmSqS4ItkeaEudkJeI8ZdprtZ255ZyGUWDsJzpfu7JwO0nSO8ksfMKmrSIL
         SnmRtkaqeSxhaMe5sUwnXaOTKf4gj545aAAoDYIlrz90FEJRSg8+WjHTv9MtLK5Zk0M0wsNKsrT7sC
         /DFYWghYp0JvZkaJlQSJobq3vCeXqAz3Qi4/WLz696Un0bFHk0ExsAEh4hdLzLhPAcMyZLXrYgC2f8
         +c+/I6FC6ylvM3gxrdpnRqI/e4nR0iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=mida.se; s=ed1;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
         message-id:references:to:from:subject:from;
        bh=oD4kEnr3Q8AcmDcUVD4MiI81vrftIQDRxSjaRmsL6fo=;
        b=dx/XBXAymaiD87/xAbu2PM0SCFYFmz5R7odKUzUO7FGV5e8sKw8qIWU0iYjx/HRATsDtyScgBjqlG
         rCwyV9pAQ==
X-HalOne-Cookie: fe06fccd0fa61b0a65cd0cb8dec1b22399dff7ce
X-HalOne-ID: 167508ce-1ff7-11ec-b7d2-d0431ea8a283
Received: from [192.168.1.108] (2.64.99.63.mobile.tre.se [2.64.99.63])
        by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 167508ce-1ff7-11ec-b7d2-d0431ea8a283;
        Tue, 28 Sep 2021 00:57:43 +0000 (UTC)
Subject: Re: Error Terratec Cinergy T2 after USB disconnect or sleep
From:   rkardell <rkardell@mida.se>
To:     linux-media@vger.kernel.org
References: <500b3efc-5937-8ac4-bf7b-669b9ebc029a@mida.se>
Message-ID: <9a2465f6-befb-2c13-74b4-6eb9d05597c6@mida.se>
Date:   Tue, 28 Sep 2021 02:57:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <500b3efc-5937-8ac4-bf7b-669b9ebc029a@mida.se>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: sv-FI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The problem is that the module used count is incremented 1 time but 
decremented 2 times by dvb_frontend. I guess there is a reason for the 
call to dvb_prontend_put() twice, but to change that as suggested by 
ref: https://linuxtv.org/pipermail/linux-dvb/2007-November/021577.html 
affects other modules.

The best solution is to insert a call to try_module_get(THIS_MODULE) in 
cinergyt2_frontend_attach() to prevent the module to be unloaded. This 
change makes CinergyT2 to behave as expected after sleep and if 
disconnected and connected again.


Den 2021-09-21 kl. 04:18, skrev rkardell:
> Terratec Cinergy T2 driver leaves lsmod used cnt at -1, after sleep or 
> usb reconnect.
> Driver can’t be removed with rmmod and modprobe -r crashes kernel.
> After reconnect or wake up after sleep, cinergyt2 seems to be properly 
> initialized, but can’t be used by kaffeine. The system must be 
> restarted to be able to use the CinergyT2 again.
> The only way to avoid this is to manually stop the driver with rmmod 
> before disconnect or sleep.
> Tested on Thinkpad X131e Ubuntu Mate 21.04 5.11.0-34-generic x86_64
> and several other.
> The only reference to the problem that I have found is this: 
> https://linuxtv.org/pipermail/linux-dvb/2007-November/021577.html
> Anyone have any ideas how to solve the problem or how to proceed?
>
>
> Dmesg after connect
>  1882.116982] usb 1-1.2: new high-speed USB device number 3 using 
> ehci-pci
> [ 1882.225758] usb 1-1.2: config 1 interface 0 altsetting 0 bulk 
> endpoint 0x1 has invalid maxpacket 64
> [ 1882.225772] usb 1-1.2: config 1 interface 0 altsetting 0 bulk 
> endpoint 0x81 has invalid maxpacket 64
> [ 1882.226486] usb 1-1.2: New USB device found, idVendor=0ccd, 
> idProduct=0038, bcdDevice= 1.06
> [ 1882.226497] usb 1-1.2: New USB device strings: Mfr=1, Product=2, 
> SerialNumber=0
> [ 1882.226501] usb 1-1.2: Product: Cinergy T²
> [ 1882.226504] usb 1-1.2: Manufacturer: TerraTec GmbH
> [ 1882.406083] dvb-usb: found a 'Mod TerraTec/qanu USB2.0 Highspeed 
> DVB-T Receiver' in warm state.
> [ 1882.409674] dvb-usb: will pass the complete MPEG2 transport stream 
> to the software demuxer.
> [ 1882.410117] dvbdev: DVB: registering new adapter (Mod TerraTec/qanu 
> USB2.0 Highspeed DVB-T Receiver)
> [ 1882.410127] usb 1-1.2: media controller created
> [ 1882.410554] dvbdev: dvb_create_media_entity: media entity 
> 'dvb-demux' registered.
> [ 1882.411406] usb 1-1.2: DVB: registering adapter 0 frontend 0 
> (TerraTec/qanu USB2.0 Highspeed DVB-T Receiver)...
> [ 1882.411413] dvbdev: dvb_create_media_entity: media entity 
> 'TerraTec/qanu USB2.0 Highspeed DVB-T Receiver' registered.
> [ 1882.412361] input: IR-receiver inside an USB DVB receiver as 
> /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/input/input26
> [ 1882.412475] dvb-usb: schedule remote query interval to 50 msecs.
> [ 1882.415543] dvb-usb: Mod TerraTec/qanu USB2.0 Highspeed DVB-T 
> Receiver successfully initialized and connected.
> [ 1882.415644] usbcore: registered new interface driver cinergyT2
>
> lsmod after connect
> Module                  Size  Used by
> dvb_usb_cinergyT2      20480  0
> dvb_usb                28672  1 dvb_usb_cinergyT2
> dvb_core              139264  1 dvb_usb
>
> lsusb -v after connect
> Bus 001 Device 003: ID 0ccd:0038 TerraTec Electronic GmbH Cinergy T² 
> DVB-T Receiver
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          255 Vendor Specific Class
>   bDeviceSubClass       255 Vendor Specific Subclass
>   bDeviceProtocol       255 Vendor Specific Protocol
>   bMaxPacketSize0        64
>   idVendor           0x0ccd TerraTec Electronic GmbH
>   idProduct          0x0038 Cinergy T² DVB-T Receiver
>   bcdDevice            1.06
>   iManufacturer           1 TerraTec GmbH
>   iProduct                2 Cinergy T²
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0027
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              476mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass    255 Vendor Specific Subclass
>       bInterfaceProtocol      0
>       iInterface              3 Highspeed Bulk Transfer
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          255 Vendor Specific Class
>   bDeviceSubClass       255 Vendor Specific Subclass
>   bDeviceProtocol       255 Vendor Specific Protocol
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> can't get debug descriptor: Resource temporarily unavailable
> cannot read device status, Resource temporarily unavailable (11)
>
> dmesg after sleep
>  2085.595303] PM: suspend entry (deep)
> [ 2086.182808] Filesystems sync: 0.587 seconds
> [ 2086.317346] Freezing user space processes ... (elapsed 0.003 
> seconds) done.
> [ 2086.321013] OOM killer disabled.
> [ 2086.321015] Freezing remaining freezable tasks ... (elapsed 0.023 
> seconds) done.
> [ 2086.344118] printk: Suspending console(s) (use no_console_suspend 
> to debug)
> [ 2086.349168] dvb-usb: Mod TerraTec/qanu USB2.0 Highspeed DVB- 
> successfully deinitialized and disconnected.
>
> Dmesg after wake up
> [ 2089.580989] usb 1-1.2: reset high-speed USB device number 3 using 
> ehci-pci
> [ 2089.690369] PM: dpm_run_callback(): usb_dev_resume+0x0/0x20 returns -5
> [ 2089.690387] PM: Device 1-1.2 failed to resume async: error -5
> [ 2090.029351] OOM killer enabled.
> [ 2090.029359] Restarting tasks ...
> [ 2090.033135] usb 1-1.2: USB disconnect, device number 3
> [ 2090.060292] done.
> [ 2090.113373] usb 1-1.2: new high-speed USB device number 4 using 
> ehci-pci
> [ 2090.229368] usb 1-1.2: config 1 interface 0 altsetting 0 bulk 
> endpoint 0x1 has invalid maxpacket 64
> [ 2090.229378] usb 1-1.2: config 1 interface 0 altsetting 0 bulk 
> endpoint 0x81 has invalid maxpacket 64
> [ 2090.229865] usb 1-1.2: New USB device found, idVendor=0ccd, 
> idProduct=0038, bcdDevice= 1.06
> [ 2090.229870] usb 1-1.2: New USB device strings: Mfr=1, Product=2, 
> SerialNumber=0
> [ 2090.229872] usb 1-1.2: Product: Cinergy T²
> [ 2090.229875] usb 1-1.2: Manufacturer: TerraTec GmbH
> [ 2090.230563] dvb-usb: found a 'Mod TerraTec/qanu USB2.0 Highspeed 
> DVB-T Receiver' in warm state.
> [ 2090.234126] dvb-usb: will pass the complete MPEG2 transport stream 
> to the software demuxer.
> [ 2090.234250] dvbdev: DVB: registering new adapter (Mod TerraTec/qanu 
> USB2.0 Highspeed DVB-T Receiver)
> [ 2090.234258] usb 1-1.2: media controller created
> [ 2090.234851] dvbdev: dvb_create_media_entity: media entity 
> 'dvb-demux' registered.
> [ 2090.235745] usb 1-1.2: DVB: registering adapter 0 frontend 0 
> (TerraTec/qanu USB2.0 Highspeed DVB-T Receiver)...
> [ 2090.235757] dvbdev: dvb_create_media_entity: media entity 
> 'TerraTec/qanu USB2.0 Highspeed DVB-T Receiver' registered.
> [ 2090.236844] input: IR-receiver inside an USB DVB receiver as 
> /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/input/input30
> [ 2090.237399] dvb-usb: schedule remote query interval to 50 msecs.
> [ 2090.239994] dvb-usb: Mod TerraTec/qanu USB2.0 Highspeed DVB-T 
> Receiver successfully initialized and connected.
> [ 2090.571073] PM: suspend exit
>
> lsmod after wake up
> Module                  Size  Used by
> dvb_usb_cinergyT2      20480  -1
> dvb_usb                28672  1 dvb_usb_cinergyT2
> dvb_core              139264  1 dvb_usb
>
> lsusb -v after wake up
> Bus 001 Device 004: ID 0ccd:0038 TerraTec Electronic GmbH Cinergy T² 
> DVB-T Receiver
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          255 Vendor Specific Class
>   bDeviceSubClass       255 Vendor Specific Subclass
>   bDeviceProtocol       255 Vendor Specific Protocol
>   bMaxPacketSize0        64
>   idVendor           0x0ccd TerraTec Electronic GmbH
>   idProduct          0x0038 Cinergy T² DVB-T Receiver
>   bcdDevice            1.06
>   iManufacturer           1 TerraTec GmbH
>   iProduct                2 Cinergy T²
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0027
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              476mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass    255 Vendor Specific Subclass
>       bInterfaceProtocol      0
>       iInterface              3 Highspeed Bulk Transfer
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          255 Vendor Specific Class
>   bDeviceSubClass       255 Vendor Specific Subclass
>   bDeviceProtocol       255 Vendor Specific Protocol
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> can't get debug descriptor: Resource temporarily unavailable
> cannot read device status, Resource temporarily unavailable (11)
>
>
>

