Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2AE352E46
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 19:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbhDBRaF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 2 Apr 2021 13:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBRaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 13:30:04 -0400
X-Greylist: delayed 539 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 02 Apr 2021 10:30:02 PDT
Received: from nwxrelay.clusters.de (mxa.nwxi.net [IPv6:2a00:1418:2a00:204::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904CEC0613E6
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 10:30:02 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at avscan.clusters.de
Received: from mailer.nwxi.net (mailer.nwxi.net [94.136.164.4])
        by nwxrelay.clusters.de (8.14.4/8.14.4/Debian-4+wheezy1) with ESMTP id 132HL2Zh029943
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Fri, 2 Apr 2021 19:21:02 +0200
Received: from [192.168.2.132] (HSI-KBW-109-192-197-076.hsi6.kabel-badenwuerttemberg.de [109.192.197.76])
        (authenticated bits=0)
        by mailer.nwxi.net (8.14.4/8.14.4/Debian-4+wheezy1) with ESMTP id 132HKvkM004638
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Fri, 2 Apr 2021 19:21:01 +0200
From:   "Christopher Ott" <mail@christopher-ott.de>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Pi4 & Terratec Cinergy HTC - drxk & em28xx issues
Date:   Fri, 02 Apr 2021 17:20:54 +0000
Message-Id: <em1b74acac-cfaa-4c39-be3a-5183ed055307@desktop-bnq4ue3>
Reply-To: "Christopher Ott" <mail@christopher-ott.de>
User-Agent: eM_Client/8.1.1060.0
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey guys,

I don't know if this is the right place to ask for some help - I really 
hope it is.

I use 2 Terratec Cinergy HTC DVB-C sticks with tvheadend. Now I switched 
my NAS hardware from an old Synology NAS to a Raspberry Pi 4 
Openmediavault NAS system. Both sticks worked well with Synology. but 
with the Raspberry Pi environment it's difficult. I tried it with 2 
different Pi4s. I still get a connection and a signal, but running both 
sticks simultaniously is spamming the logs, crashing the system and 
sometimes the video and audio quality is dropping.

I thought building a new kernel with your media build will solve my 
issues, but after that it is still the same.

My kernel version: Linux 5.10.17-v7l+ armv7l

My syslog:

>[  252.382976] usb 1-1.1: new high-speed USB device number 4 using 
>xhci_hcd
>[  252.724028] usb 1-1.1: config 1 interface 0 altsetting 1 endpoint 
>0x82 has invalid wMaxPacketSize 0
>[  252.724367] usb 1-1.1: New USB device found, idVendor=0ccd, 
>idProduct=00b2, bcdDevice= 1.00
>[  252.724375] usb 1-1.1: New USB device strings: Mfr=3, Product=1, 
>SerialNumber=2
>[  252.724383] usb 1-1.1: Product: Cinergy HTC Stick
>[  252.724390] usb 1-1.1: Manufacturer: TERRATEC
>[  252.724396] usb 1-1.1: SerialNumber: 123456789ABCD
>[  252.769246] em28xx 1-1.1:1.0: New device TERRATEC  Cinergy HTC Stick 
>@ 480 Mbps (0ccd:00b2, interface 0, class 0)
>[  252.769256] em28xx 1-1.1:1.0: Audio interface 0 found (Vendor Class)
>[  252.769264] em28xx 1-1.1:1.0: Video interface 0 found: isoc
>[  252.769272] em28xx 1-1.1:1.0: DVB interface 0 found: isoc
>[  252.833131] em28xx 1-1.1:1.0: chip ID is em2884
>[  252.909513] em28xx 1-1.1:1.0: EEPROM ID = 26 00 00 00, EEPROM hash = 
>0xfebadddc
>[  252.909521] em28xx 1-1.1:1.0: EEPROM info:
>[  252.909529] em28xx 1-1.1:1.0:        microcode start address = 
>0x0004, boot configuration = 0x00
>[  252.916136] em28xx 1-1.1:1.0:        I2S audio, 5 sample rates
>[  252.916145] em28xx 1-1.1:1.0:        500mA max power
>[  252.916153] em28xx 1-1.1:1.0:        Table at offset 0x27, 
>strings=0x249a, 0x1c6a, 0x1486
>[  252.992738] em28xx 1-1.1:1.0: Identified as Terratec Cinergy HTC 
>Stick (card=82)
>[  252.992751] em28xx 1-1.1:1.0: Currently, V4L2 is not supported on 
>this model
>[  252.992758] em28xx 1-1.1:1.0: dvb set to isoc mode.
>[  252.993788] usbcore: registered new interface driver em28xx
>[  253.008940] em28xx 1-1.1:1.0: Binding audio extension
>[  253.008951] em28xx 1-1.1:1.0: em28xx-audio.c: Copyright (C) 2006 
>Markus Rechberger
>[  253.008959] em28xx 1-1.1:1.0: em28xx-audio.c: Copyright (C) 
>2007-2016 Mauro Carvalho Chehab
>[  253.009003] em28xx 1-1.1:1.0: Endpoint 0x83 high-speed on intf 0 alt 
>7 interval = 8, size 196
>[  253.009012] em28xx 1-1.1:1.0: Number of URBs: 1, with 64 packets and 
>192 size
>[  253.009734] em28xx 1-1.1:1.0: Audio extension successfully 
>initialized
>[  253.009743] em28xx: Registered (Em28xx Audio Extension) extension
>[  253.031262] WARNING: You are using an experimental version of the 
>media stack.
>                 As the driver is backported to an older kernel, it 
>doesn't offer
>                 enough quality for its usage in production.
>                 Use it with care.
>                Latest git patches (needed if you report a bug to 
>linux-media@vger.kernel.org):
>                 97b34809ec240d82c82af97626c2071a4062e0e6 media: 
>staging: atomisp: reduce kernel stack usage
>                 21ad53f206a95eda09a7b3780fb2f0b30ded314a media: 
>staging: media: omap4iss: code style - avoid macro argument precedence 
>issues
>                 ee06162d98c399eb4ffc03d7b1141469177bee5a media: 
>staging: media: ipu3: code style fix - missing a blank line after 
>declarations
>[  253.034561] em28xx 1-1.1:1.0: Binding DVB extension
>[  253.643633] drxk: status = 0x639260d9
>[  253.643643] drxk: detected a drx-3926k, spin A3, xtal 20.250 MHz
>[  257.687047] drxk: DRXK driver version 0.9.4300
>[  257.720560] drxk: frontend initialized.
>[  257.742838] tda18271 12-0060: creating new instance
>[  257.745066] tda18271: TDA18271HD/C2 detected @ 12-0060
>[  258.224637] dvbdev: DVB: registering new adapter (1-1.1:1.0)
>[  258.224669] em28xx 1-1.1:1.0: DVB: registering adapter 0 frontend 0 
>(DRXK DVB-C DVB-T)...
>[  258.224700] dvbdev: dvb_create_media_entity: media entity 'DRXK 
>DVB-C DVB-T' registered.
>[  258.228146] dvbdev: dvb_create_media_entity: media entity 
>'dvb-demux' registered.
>[  258.244401] em28xx 1-1.1:1.0: DVB extension successfully initialized
>[  258.244424] em28xx: Registered (Em28xx dvb Extension) extension
>[  258.265551] em28xx_rc: disagrees about version of symbol 
>rc_register_device
>[  258.265574] em28xx_rc: Unknown symbol rc_register_device (err -22)
>[  258.265603] em28xx_rc: disagrees about version of symbol rc_keydown
>[  258.265621] em28xx_rc: Unknown symbol rc_keydown (err -22)
>[  258.265648] em28xx_rc: disagrees about version of symbol 
>rc_free_device
>[  258.265665] em28xx_rc: Unknown symbol rc_free_device (err -22)
>[  258.265701] em28xx_rc: disagrees about version of symbol 
>rc_allocate_device
>[  258.265717] em28xx_rc: Unknown symbol rc_allocate_device (err -22)
>[  258.265782] em28xx_rc: disagrees about version of symbol 
>rc_unregister_device
>[  258.265799] em28xx_rc: Unknown symbol rc_unregister_device (err -22)
>[  258.328048] tda18271: performing RF tracking filter calibration
>[  260.743241] tda18271: RF tracking filter calibration complete
>[  260.743372] em28xx 1-1.1:1.0: DVB: adapter 0 frontend 0 frequency 0 
>out of range (47000000..864000000)
>[  364.894422] em28xx 1-1.1:1.0: read from i2c device at 0x52 failed 
>with unknown error (status=108)
>[  364.894434] drxk: i2c read error at addr 0x29
>[  364.894442] drxk: Error -5 on get_qam_signal_to_noise
>[  366.894751] em28xx 1-1.1:1.0: read from i2c device at 0x52 failed 
>with unknown error (status=102)
>[  366.894767] drxk: i2c read error at addr 0x29
>[  366.894780] drxk: Error -5 on get_qam_signal_to_noise
>[  447.909286] em28xx 1-1.1:1.0: read from i2c device at 0x52 failed 
>with unknown error (status=155)
>[  447.909304] drxk: i2c read error at addr 0x29
>[  456.910675] em28xx 1-1.1:1.0: read from i2c device at 0x52 failed 
>with unknown error (status=196)
>[  456.910693] drxk: i2c read error at addr 0x29
>[  471.904849] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  471.904857] drxk: Error -22 on get_qam_lock_status
>[  471.904865] drxk: Error -22 on get_lock_status
>[  474.905258] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  474.905266] drxk: Error -22 on get_qam_lock_status
>[  474.905273] drxk: Error -22 on get_lock_status
>[  476.905638] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  476.905650] drxk: Error -22 on get_qam_lock_status
>[  476.905663] drxk: Error -22 on get_lock_status
>[  477.905881] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  477.905894] drxk: Error -22 on get_qam_lock_status
>[  477.905906] drxk: Error -22 on get_lock_status
>[  479.906355] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  479.906371] drxk: Error -22 on get_qam_lock_status
>[  479.906386] drxk: Error -22 on get_lock_status
>[  503.909738] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  503.909747] drxk: Error -22 on get_qam_lock_status
>[  503.909754] drxk: Error -22 on get_lock_status
>[  506.910199] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  506.910211] drxk: Error -22 on get_qam_lock_status
>[  506.910223] drxk: Error -22 on get_lock_status
>[  515.591453] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  515.591465] drxk: Error -22 on get_qam_lock_status
>[  515.591472] drxk: Error -22 on get_lock_status
>[  519.512044] drxk: ERROR: -32000
>                 while sending cmd 0x0205 with params:
>[  519.512052] drxk: Error -22 on get_qam_lock_status
>[  519.512060] drxk: Error -22 on get_lock_status

lsusb -v:

>Bus 001 Device 004: ID 0ccd:00b2 TerraTec Electronic GmbH
>Couldn't open device, some information will be missing
>Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x0ccd TerraTec Electronic GmbH
>   idProduct          0x00b2
>   bcdDevice            1.00
>   iManufacturer           3
>   iProduct                1
>   iSerial                 2
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0131
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol    255
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0001  1x 1 bytes
>         bInterval              11
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0000  1x 0 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0000  1x 0 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0000  1x 0 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       1
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol    255
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0001  1x 1 bytes
>         bInterval              11
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0000  1x 0 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x00c4  1x 196 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x03ac  1x 940 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       2
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol    255
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0001  1x 1 bytes
>         bInterval              11
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0ad0  2x 720 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x00c4  1x 196 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x03ac  1x 940 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       3
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol    255
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0001  1x 1 bytes
>         bInterval              11
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0c00  2x 1024 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x00c4  1x 196 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x03ac  1x 940 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       4
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol    255
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0001  1x 1 bytes
>         bInterval              11
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x1300  3x 768 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x00c4  1x 196 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x03ac  1x 940 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       5
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol    255
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0001  1x 1 bytes
>         bInterval              11
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x1380  3x 896 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x00c4  1x 196 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x03ac  1x 940 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       6
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol    255
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0001  1x 1 bytes
>         bInterval              11
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x13c0  3x 960 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x00c4  1x 196 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x03ac  1x 940 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       7
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol    255
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0001  1x 1 bytes
>         bInterval              11
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x1400  3x 1024 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x00c4  1x 196 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            1
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x03ac  1x 940 bytes
>         bInterval               1

Please tell me if you need more information. Thanks for your support & 
enjoy the easter weekend

Chris

