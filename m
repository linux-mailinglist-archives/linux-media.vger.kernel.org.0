Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40B92A6F8E
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 22:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731053AbgKDVX6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 16:23:58 -0500
Received: from nick.sneptech.io ([178.62.38.78]:41902 "EHLO nick.sneptech.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729828AbgKDVX6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 16:23:58 -0500
X-Greylist: delayed 1081 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Nov 2020 16:23:57 EST
Received: from wolf.philpem.me.uk (200.1.169.217.in-addr.arpa [217.169.1.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mailrelay_wolf@philpem.me.uk)
        by nick.sneptech.io (Postfix) with ESMTPSA id B879ABD097
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=philpem.me.uk;
        s=mail; t=1604523953;
        bh=dd7mVxNuIpZvI+6TUNwDtE5RLRjfRCdFqmRs9comQIc=;
        h=To:From:Subject:Date:From;
        b=GjlR0s+pPfVgyYUbzPW7zy//cFx3+05Psn7jk/xpeoHGwQ3U8vngh/jK2uLWozMNs
         4nwJvwR2gs+89mYyoglf+7Q9w1/k3NzDvi8gXR4+eZBWYW+uCEBu7ICJs6jCMqhY0Z
         OXnYTTFMV6n8sLThnO4pGR90wQoBsABLNtFdsJzo=
Received: from [10.0.0.32] (cheetah.homenet.philpem.me.uk [10.0.0.32])
        by wolf.philpem.me.uk (Postfix) with ESMTPSA id 1E9A42C0274
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 21:05:53 +0000 (GMT)
To:     linux-media@vger.kernel.org
From:   Phil Pemberton <philpem@philpem.me.uk>
Subject: em28xx: Request addition of new USB ID (eb1a:5214, Ion Video Forever
 / USB Vidbox FW)
Autocrypt: addr=philpem@philpem.me.uk; keydata=
 xjMEXydiMhYJKwYBBAHaRw8BAQdAue6h7KZndZe267J4TCZIAZmDLahbJizZtyiS9Uxb3UjN
 JlBoaWwgUGVtYmVydG9uIDxwaGlscGVtQHBoaWxwZW0ubWUudWs+wq0EExYIAD4WIQQNQon0
 YFqZ5eiAzskxZE/eiPALKwUCXydiMgIbAwUJCWYBgAULCQgHAgYVCgkICwIEFgIDAQIeAQIX
 gAAhCRAxZE/eiPALKxYhBA1CifRgWpnl6IDOyTFkT96I8AsrevoBANqzJh4HO5jsJ/Cxz33w
 qnWOFsbTKEoRxKPCUeVcNTVXAP0bToP783EkrigaAXBcZc3LfAVkPzPR/Q1vLWkfXEl6BM44
 BF8nYjISCisGAQQBl1UBBQEBB0AWZyP+QVKm8F6TWiYpHAHtCcCVcfNnysJll3Xz2InCKQMB
 CAfClQQYFggAJhYhBA1CifRgWpnl6IDOyTFkT96I8AsrBQJfJ2IyAhsMBQkJZgGAACEJEDFk
 T96I8AsrFiEEDUKJ9GBameXogM7JMWRP3ojwCyvsBQD/Tw+XfsVRdzg/houUv/j5Kj8gBF5b
 gXqTIiiuQ9vTjaYA/2TpBRlHkxI77paj85xGRhpao2GOIOYTDvO9/X+Iz8AL
Message-ID: <bfdceda1-d01a-9ace-be1d-0573b1a3d279@philpem.me.uk>
Date:   Wed, 4 Nov 2020 21:05:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Can the following device be added to the USB IDs list for em28xx?

USB ID EB1A:5124 (VID 0xeb1a PID 0x5214)
Product - Ion "Video Forever" aka "USB VIDBOX FW"

The capture chipset is an eMPIA EM2860, with Silan SC8113 video decoder,
24C02 EEPROM, and Sigmatel/IDT STAC9752AX-PRG AC97 audio. Inputs are
Composite and S-Video.

Loading the driver with card=67 (Terratec Grabby) produces perfect
working composite video and audio. S-Video is untested as I have no
devices with S-Video out.

Logs below --

--8<--
This is from "modprobe em28xx card=67" followed by "echo eb1a 5124 |
sudo tee /sys/bus/usb/drivers/em28xx/new_id":

[ 2885.676012] usb 2-1.1: New USB device found, idVendor=eb1a,
idProduct=5124, bcdDevice= 1.00
[ 2885.676019] usb 2-1.1: New USB device strings: Mfr=0, Product=1,
SerialNumber=2
[ 2885.676023] usb 2-1.1: Product: USB VIDBOX FW Audio
[ 2885.676026] usb 2-1.1: SerialNumber: USB2.0 VIDBOX FW
[ 2885.676763] em28xx 2-1.1:1.0: New device  USB VIDBOX FW Audio @ 480
Mbps (eb1a:5124, interface 0, class 0)
[ 2885.676773] em28xx 2-1.1:1.0: Video interface 0 found: isoc
[ 2885.736592] em28xx 2-1.1:1.0: chip ID is em2860
[ 2885.898186] em28xx 2-1.1:1.0: EEPROM ID = 1a eb 67 95, EEPROM hash =
0x806f2156
[ 2885.898190] em28xx 2-1.1:1.0: EEPROM info:
[ 2885.898192] em28xx 2-1.1:1.0: AC97 audio (5 sample rates)
[ 2885.898194] em28xx 2-1.1:1.0: 500mA max power
[ 2885.898197] em28xx 2-1.1:1.0: Table at offset 0x24, strings=0x288c,
0x226a, 0x0000
[ 2885.988481] em28xx 2-1.1:1.0: Identified as Terratec Grabby (card=67)
[ 2885.988489] em28xx 2-1.1:1.0: analog set to isoc mode.
[ 2885.995157] em28xx 2-1.1:1.0: Registering V4L2 extension
[ 2886.521100] saa7115 10-0025: saa7113 found @ 0x4a (2-1.1:1.0)
[ 2887.552797] em28xx 2-1.1:1.0: Config register raw data: 0x50
[ 2887.584579] em28xx 2-1.1:1.0: AC97 vendor ID = 0x83847652
[ 2887.600657] em28xx 2-1.1:1.0: AC97 features = 0x6a90
[ 2887.600669] em28xx 2-1.1:1.0: Sigmatel audio processor detected (stac
9752)
[ 2890.721193] em28xx 2-1.1:1.0: V4L2 video device registered as video2
[ 2890.721200] em28xx 2-1.1:1.0: V4L2 VBI device registered as vbi0
[ 2890.721208] em28xx 2-1.1:1.0: V4L2 extension successfully initialized
[ 2890.721212] em28xx: Registered (Em28xx v4l2 Extension) extension
[ 2890.734054] em28xx 2-1.1:1.0: Registering snapshot button...
[ 2890.734118] input: em28xx snapshot button as
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1:1.0/input/input27
[ 2890.734336] em28xx 2-1.1:1.0: Remote control support is not available
for this card.
[ 2890.734338] em28xx: Registered (Em28xx Input Extension) extension

--8<--
This is from the same commands as above, but with no "card=" parameter
passed to the em28xx module:

[ 2478.715488] usbcore: registered new interface driver em28xx
[ 2478.726541] em28xx 2-1.1:1.0: New device  USB VIDBOX FW Audio @ 480
Mbps (eb1a:5124, interface 0, class 0)
[ 2478.726545] em28xx 2-1.1:1.0: Video interface 0 found: isoc
[ 2478.786378] em28xx 2-1.1:1.0: chip ID is em2860
[ 2478.943570] em28xx 2-1.1:1.0: failed to read eeprom (err=-110)
[ 2478.943585] em28xx 2-1.1:1.0: em28xx_i2c_register: em28xx_i2_eeprom
failed! retval [-110]
[ 2478.982865] em28xx 2-1.1:1.0: found i2c device @ 0x0 on bus 0 [???]
[ 2479.022108] em28xx 2-1.1:1.0: found i2c device @ 0x2 on bus 0 [???]
[ 2479.063844] em28xx 2-1.1:1.0: found i2c device @ 0x4 on bus 0 [???]
[ 2479.103847] em28xx 2-1.1:1.0: found i2c device @ 0x6 on bus 0 [???]
[ 2479.143716] em28xx 2-1.1:1.0: found i2c device @ 0x8 on bus 0 [???]
[ 2479.182168] em28xx 2-1.1:1.0: found i2c device @ 0xa on bus 0 [???]
[ 2479.218298] em28xx 2-1.1:1.0: found i2c device @ 0xc on bus 0 [???]
[ 2479.259922] em28xx 2-1.1:1.0: found i2c device @ 0xe on bus 0 [???]
[ 2479.303549] em28xx 2-1.1:1.0: found i2c device @ 0x10 on bus 0 [???]
[ 2479.340003] em28xx 2-1.1:1.0: found i2c device @ 0x12 on bus 0 [???]
[ 2479.379940] em28xx 2-1.1:1.0: found i2c device @ 0x14 on bus 0 [???]
[ 2479.419846] em28xx 2-1.1:1.0: found i2c device @ 0x16 on bus 0 [???]
[ 2479.456535] em28xx 2-1.1:1.0: found i2c device @ 0x18 on bus 0 [???]
[ 2479.495509] em28xx 2-1.1:1.0: found i2c device @ 0x1a on bus 0 [???]
[ 2479.532173] em28xx 2-1.1:1.0: found i2c device @ 0x1c on bus 0 [lgdt330x]
[ 2479.571510] em28xx 2-1.1:1.0: found i2c device @ 0x1e on bus 0 [???]
[ 2479.611384] em28xx 2-1.1:1.0: found i2c device @ 0x20 on bus 0 [???]
[ 2479.651392] em28xx 2-1.1:1.0: found i2c device @ 0x22 on bus 0 [???]
[ 2479.694252] em28xx 2-1.1:1.0: found i2c device @ 0x24 on bus 0 [???]
[ 2479.738252] em28xx 2-1.1:1.0: found i2c device @ 0x26 on bus 0 [???]
[ 2479.779418] em28xx 2-1.1:1.0: found i2c device @ 0x28 on bus 0 [???]
[ 2479.816129] em28xx 2-1.1:1.0: found i2c device @ 0x2a on bus 0 [???]
[ 2479.854099] em28xx 2-1.1:1.0: found i2c device @ 0x2c on bus 0 [???]
[ 2479.895507] em28xx 2-1.1:1.0: found i2c device @ 0x2e on bus 0 [???]
[ 2479.934118] em28xx 2-1.1:1.0: found i2c device @ 0x30 on bus 0 [???]
[ 2479.972288] em28xx 2-1.1:1.0: found i2c device @ 0x32 on bus 0 [???]
[ 2480.010314] em28xx 2-1.1:1.0: found i2c device @ 0x34 on bus 0 [???]
[ 2480.050893] em28xx 2-1.1:1.0: found i2c device @ 0x36 on bus 0 [???]
[ 2480.091720] em28xx 2-1.1:1.0: found i2c device @ 0x38 on bus 0 [???]
[ 2480.131741] em28xx 2-1.1:1.0: found i2c device @ 0x3a on bus 0 [???]
[ 2480.170961] em28xx 2-1.1:1.0: found i2c device @ 0x3c on bus 0 [???]
[ 2480.210344] em28xx 2-1.1:1.0: found i2c device @ 0x3e on bus 0
[remote IR sensor]
[ 2480.250170] em28xx 2-1.1:1.0: found i2c device @ 0x40 on bus 0 [???]
[ 2480.290205] em28xx 2-1.1:1.0: found i2c device @ 0x42 on bus 0 [???]
[ 2480.331960] em28xx 2-1.1:1.0: found i2c device @ 0x44 on bus 0 [???]
[ 2480.370203] em28xx 2-1.1:1.0: found i2c device @ 0x46 on bus 0 [???]
[ 2480.411696] em28xx 2-1.1:1.0: found i2c device @ 0x48 on bus 0 [???]
[ 2480.451878] em28xx 2-1.1:1.0: found i2c device @ 0x4a on bus 0 [saa7113h]
[ 2480.490337] em28xx 2-1.1:1.0: found i2c device @ 0x4c on bus 0 [???]
[ 2480.531074] em28xx 2-1.1:1.0: found i2c device @ 0x4e on bus 0 [???]
[ 2480.571842] em28xx 2-1.1:1.0: found i2c device @ 0x50 on bus 0 [???]
[ 2480.611670] em28xx 2-1.1:1.0: found i2c device @ 0x52 on bus 0 [drxk]
[ 2480.650662] em28xx 2-1.1:1.0: found i2c device @ 0x54 on bus 0 [???]
[ 2480.691573] em28xx 2-1.1:1.0: found i2c device @ 0x56 on bus 0 [???]
[ 2480.731499] em28xx 2-1.1:1.0: found i2c device @ 0x58 on bus 0 [???]
[ 2480.771044] em28xx 2-1.1:1.0: found i2c device @ 0x5a on bus 0 [???]
[ 2480.811851] em28xx 2-1.1:1.0: found i2c device @ 0x5c on bus 0 [???]
[ 2480.850111] em28xx 2-1.1:1.0: found i2c device @ 0x5e on bus 0 [???]
[ 2480.892090] em28xx 2-1.1:1.0: found i2c device @ 0x60 on bus 0
[remote IR sensor]
[ 2480.931932] em28xx 2-1.1:1.0: found i2c device @ 0x62 on bus 0 [???]
[ 2480.968155] em28xx 2-1.1:1.0: found i2c device @ 0x64 on bus 0 [???]
[ 2481.006954] em28xx 2-1.1:1.0: found i2c device @ 0x66 on bus 0 [???]
[ 2481.047579] em28xx 2-1.1:1.0: found i2c device @ 0x68 on bus 0 [???]
[ 2481.087849] em28xx 2-1.1:1.0: found i2c device @ 0x6a on bus 0 [???]
[ 2481.126358] em28xx 2-1.1:1.0: found i2c device @ 0x6c on bus 0 [???]
[ 2481.167706] em28xx 2-1.1:1.0: found i2c device @ 0x6e on bus 0 [???]
[ 2481.207706] em28xx 2-1.1:1.0: found i2c device @ 0x70 on bus 0 [???]
[ 2481.247830] em28xx 2-1.1:1.0: found i2c device @ 0x72 on bus 0 [???]
[ 2481.287831] em28xx 2-1.1:1.0: found i2c device @ 0x74 on bus 0 [???]
[ 2481.325458] em28xx 2-1.1:1.0: found i2c device @ 0x76 on bus 0 [???]
[ 2481.362100] em28xx 2-1.1:1.0: found i2c device @ 0x78 on bus 0 [???]
[ 2481.402105] em28xx 2-1.1:1.0: found i2c device @ 0x7a on bus 0 [???]
[ 2481.440155] em28xx 2-1.1:1.0: found i2c device @ 0x7c on bus 0 [???]
[ 2481.482678] em28xx 2-1.1:1.0: found i2c device @ 0x7e on bus 0 [???]
[ 2481.520591] em28xx 2-1.1:1.0: found i2c device @ 0x80 on bus 0 [msp34xx]
[ 2481.565247] em28xx 2-1.1:1.0: found i2c device @ 0x82 on bus 0 [???]
[ 2481.602146] em28xx 2-1.1:1.0: found i2c device @ 0x84 on bus 0 [???]
[ 2481.643496] em28xx 2-1.1:1.0: found i2c device @ 0x86 on bus 0 [tda9887]
[ 2481.690229] em28xx 2-1.1:1.0: found i2c device @ 0x88 on bus 0 [msp34xx]
[ 2481.734243] em28xx 2-1.1:1.0: found i2c device @ 0x8a on bus 0 [???]
[ 2481.774283] em28xx 2-1.1:1.0: found i2c device @ 0x8c on bus 0 [???]
[ 2481.812157] em28xx 2-1.1:1.0: found i2c device @ 0x8e on bus 0
[remote IR sensor]
[ 2481.850321] em28xx 2-1.1:1.0: found i2c device @ 0x90 on bus 0 [???]
[ 2481.891828] em28xx 2-1.1:1.0: found i2c device @ 0x92 on bus 0 [???]
[ 2481.930334] em28xx 2-1.1:1.0: found i2c device @ 0x94 on bus 0 [???]
[ 2481.971954] em28xx 2-1.1:1.0: found i2c device @ 0x96 on bus 0 [???]
[ 2482.010361] em28xx 2-1.1:1.0: found i2c device @ 0x98 on bus 0 [???]
[ 2482.050192] em28xx 2-1.1:1.0: found i2c device @ 0x9a on bus 0 [???]
[ 2482.091076] em28xx 2-1.1:1.0: found i2c device @ 0x9c on bus 0 [???]
[ 2482.130253] em28xx 2-1.1:1.0: found i2c device @ 0x9e on bus 0 [???]
[ 2482.170352] em28xx 2-1.1:1.0: found i2c device @ 0xa0 on bus 0 [eeprom]
[ 2482.210339] em28xx 2-1.1:1.0: found i2c device @ 0xa2 on bus 0 [???]
[ 2482.250329] em28xx 2-1.1:1.0: found i2c device @ 0xa4 on bus 0 [???]
[ 2482.291677] em28xx 2-1.1:1.0: found i2c device @ 0xa6 on bus 0 [???]
[ 2482.331822] em28xx 2-1.1:1.0: found i2c device @ 0xa8 on bus 0 [???]
[ 2482.370965] em28xx 2-1.1:1.0: found i2c device @ 0xaa on bus 0 [???]
[ 2482.411827] em28xx 2-1.1:1.0: found i2c device @ 0xac on bus 0 [???]
[ 2482.451696] em28xx 2-1.1:1.0: found i2c device @ 0xae on bus 0 [???]
[ 2482.491819] em28xx 2-1.1:1.0: found i2c device @ 0xb0 on bus 0 [tda9874]
[ 2482.531902] em28xx 2-1.1:1.0: found i2c device @ 0xb2 on bus 0 [???]
[ 2482.567970] em28xx 2-1.1:1.0: found i2c device @ 0xb4 on bus 0 [???]
[ 2482.607797] em28xx 2-1.1:1.0: found i2c device @ 0xb6 on bus 0 [???]
[ 2482.644573] em28xx 2-1.1:1.0: found i2c device @ 0xb8 on bus 0 [tvp5150a]
[ 2482.682283] em28xx 2-1.1:1.0: found i2c device @ 0xba on bus 0
[webcam sensor or tvp5150a]
[ 2482.723048] em28xx 2-1.1:1.0: found i2c device @ 0xbc on bus 0 [???]
[ 2482.763093] em28xx 2-1.1:1.0: found i2c device @ 0xbe on bus 0 [???]
[ 2482.803628] em28xx 2-1.1:1.0: found i2c device @ 0xc0 on bus 0 [tuner
(analog)]
[ 2482.842139] em28xx 2-1.1:1.0: found i2c device @ 0xc2 on bus 0 [tuner
(analog)]
[ 2482.882317] em28xx 2-1.1:1.0: found i2c device @ 0xc4 on bus 0 [tuner
(analog)]
[ 2482.922349] em28xx 2-1.1:1.0: found i2c device @ 0xc6 on bus 0 [tuner
(analog)]
[ 2482.962345] em28xx 2-1.1:1.0: found i2c device @ 0xc8 on bus 0 [???]
[ 2483.002425] em28xx 2-1.1:1.0: found i2c device @ 0xca on bus 0 [???]
[ 2483.042824] em28xx 2-1.1:1.0: found i2c device @ 0xcc on bus 0 [???]
[ 2483.083065] em28xx 2-1.1:1.0: found i2c device @ 0xce on bus 0 [???]
[ 2483.123686] em28xx 2-1.1:1.0: found i2c device @ 0xd0 on bus 0 [???]
[ 2483.163071] em28xx 2-1.1:1.0: found i2c device @ 0xd2 on bus 0 [???]
[ 2483.203612] em28xx 2-1.1:1.0: found i2c device @ 0xd4 on bus 0 [???]
[ 2483.242294] em28xx 2-1.1:1.0: found i2c device @ 0xd6 on bus 0 [???]
[ 2483.286287] em28xx 2-1.1:1.0: found i2c device @ 0xd8 on bus 0 [???]
[ 2483.323808] em28xx 2-1.1:1.0: found i2c device @ 0xda on bus 0 [???]
[ 2483.362288] em28xx 2-1.1:1.0: found i2c device @ 0xdc on bus 0 [???]
[ 2483.406272] em28xx 2-1.1:1.0: found i2c device @ 0xde on bus 0 [???]
[ 2483.446287] em28xx 2-1.1:1.0: found i2c device @ 0xe0 on bus 0 [???]
[ 2483.484646] em28xx 2-1.1:1.0: found i2c device @ 0xe2 on bus 0 [???]
[ 2483.526290] em28xx 2-1.1:1.0: found i2c device @ 0xe4 on bus 0 [???]
[ 2483.566137] em28xx 2-1.1:1.0: found i2c device @ 0xe6 on bus 0 [???]
[ 2483.610293] em28xx 2-1.1:1.0: found i2c device @ 0xe8 on bus 0 [???]
[ 2483.654241] em28xx 2-1.1:1.0: found i2c device @ 0xea on bus 0 [???]
[ 2483.698286] em28xx 2-1.1:1.0: found i2c device @ 0xec on bus 0 [???]
[ 2483.738299] em28xx 2-1.1:1.0: found i2c device @ 0xee on bus 0 [???]
[ 2483.778989] em28xx 2-1.1:1.0: found i2c device @ 0xf0 on bus 0 [???]
[ 2483.819758] em28xx 2-1.1:1.0: found i2c device @ 0xf2 on bus 0 [???]
[ 2483.858176] em28xx 2-1.1:1.0: found i2c device @ 0xf4 on bus 0 [???]
[ 2483.899854] em28xx 2-1.1:1.0: found i2c device @ 0xf6 on bus 0 [???]
[ 2483.939815] em28xx 2-1.1:1.0: found i2c device @ 0xf8 on bus 0 [???]
[ 2483.978184] em28xx 2-1.1:1.0: found i2c device @ 0xfa on bus 0 [???]
[ 2484.018129] em28xx 2-1.1:1.0: found i2c device @ 0xfc on bus 0 [???]
[ 2484.059471] em28xx 2-1.1:1.0: found i2c device @ 0xfe on bus 0 [???]
[ 2484.059481] em28xx 2-1.1:1.0: Your board has no unique USB ID and
thus need a hint to be detected.
               You may try to use card=<n> insmod option to workaround that.
               Please send an email with this log to:
                V4L Mailing List <linux-media@vger.kernel.org>
               Board eeprom hash is 0x00000000
               Board i2c devicelist hash is 0x7d2e7f80

Thanks,
-- 
Phil.
philpem@philpem.me.uk
https://www.philpem.me.uk/
