Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4CF51A3528
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 15:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgDINwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 09:52:36 -0400
Received: from reetspetit.info ([212.83.164.73]:41044 "EHLO reetspetit.info"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgDINwf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 09:52:35 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Apr 2020 09:52:34 EDT
Received: (qmail 8885 invoked by uid 453); 9 Apr 2020 13:45:53 -0000
X-Virus-Checked: by ClamAV 0.100.3 on reetspetit.info
X-Virus-Found: No
Authentication-Results: reetspetit.info; auth=pass (plain) smtp.auth=john
Received: from 239.red-80-59-216.staticip.rima-tde.net (HELO home.reetspetit.net) (80.59.216.239)
 by reetspetit.info (qpsmtpd/0.96) with ESMTPSA (ECDHE-RSA-AES256-SHA encrypted); Thu, 09 Apr 2020 15:45:53 +0200
Received: (qmail 12405 invoked by uid 453); 9 Apr 2020 13:45:50 -0000
X-Virus-Checked: by ClamAV 0.100.2 on reetspetit.net
X-Virus-Found: No
Received: from xubuntu-8300-1.reetspetit.net (HELO xubuntu-8300-1) (192.168.10.147)
 by reetspetit.net (qpsmtpd/0.96) with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted); Thu, 09 Apr 2020 15:45:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=safeandsoundit.co.uk; h=date:from:to:subject:message-id:mime-version:content-type; s=default; bh=jaoW1mktEIpbYzY4qfL5HXnDWrgafsMGuqxKp2horz4=; b=JThtHkWi1+fG7cJK8P+PPLPVg/RqP4bacaf6B4IO2TUjkSsU375gXoqhRZ3zwXEIAHNMyCoiZABOmdG2W/C21h0E/wtql/H9qDFxJ6Obqk1ZnwZ72ZzCnvC0RqBlUbCnUgfV9LIP25FoLQQhf+Ix/hGBKdy47DJ7ZpsESgaISECVFa3Z8PV9Ivme6IqP4SZni7/3hQRJne9sjoK/83RphKwzrv1dW3syk1s1GZDM+luHH58oFgKE37mmLpip+0jG/p/euT9u1G3tOLUV7I0aKbjpRFh0FvJLJQ3+Z5y/97iFMucWNDAYE40jxq7JiAafZX1esykfMCVDP58tmP8ZEg==
Date:   Thu, 9 Apr 2020 15:45:49 +0200
From:   John Crisp <jcrisp@safeandsoundit.co.uk>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: ezCap startup options
Message-ID: <20200409154549.70739e7d@xubuntu-8300-1>
Organization: SafeAndSound
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/jCfSbsOnONcSB/e5l/EFdlP"; protocol="application/pgp-signature"
Original-Authentication-Results: reetspetit.net; auth=pass (login) smtp.auth=jcrisp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/jCfSbsOnONcSB/e5l/EFdlP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

I have an old unbranded ezCap USB device and an old wifi infra red
webcam and with some time on my hands I wanted to hook it up to a
Pi/raspian to watch my swallows nesting :-)=20

It has taken me a while to get it to automatically load the module and I
am not sure I have done it the right way. There are various odd musings
on the interwebs and I saw this on the mailing list:

https://www.spinics.net/lists/linux-media/msg63928.html

This seems to get it to load on start up.=20

My question is, is there a better/cleaner way?

/etc/modprode.d/em28xxoptions.conf
options em28xx card=3D9

rc.local:
echo eb1a 5124 | tee /sys/bus/usb/drivers/em28xx/new_id

card 64 throws an i2c error as below but seems to work.

(I have not tested S-Video or sound)

I did try a udev rule but that didn't seem to work.

Any suggestions appreciated.

B. Rgds
John


Initial boot:

usb 1-1.5: new high-speed USB device number 4 using dwc_otg
usb 1-1.5: config 1 interface 0 altsetting 1 endpoint 0x82 has invalid
wMaxPacketSize 0=20
usb 1-1.5: config 1 interface 0 altsetting 1 endpoint
0x84 has invalid wMaxPacketSize 0=20
usb 1-1.5: config 1 interface 0 altsetting 2 endpoint 0x84 has invalid
wMaxPacketSize 0=20
usb 1-1.5: config 1 interface 0 altsetting 3 endpoint 0x84 has invalid
wMaxPacketSize 0=20
usb 1-1.5: config 1 interface 0 altsetting 4 endpoint 0x84 has invalid
wMaxPacketSize 0=20
usb 1-1.5: config 1 interface 0 altsetting 5 endpoint 0x84 has invalid
wMaxPacketSize 0=20
usb 1-1.5: config 1 interface 0 altsetting 6 endpoint 0x84 has invalid
wMaxPacketSize 0=20
usb 1-1.5: config 1 interface 0 altsetting 7 endpoint 0x84 has invalid
wMaxPacketSize 0=20
usb 1-1.5: New USB device found, idVendor=3Deb1a, idProduct=3D5124,
bcdDevice=3D 1.00=20
usb 1-1.5: New USB device strings: Mfr=3D0, Product=3D1, SerialNumber=3D2=20
usb 1-1.5: Product: USB VIDBOX FW Audio=20
usb 1-1.5: SerialNumber: USB2.0 VIDBOX FW

media: Linux media interface: v0.10
videodev: Linux video capture interface: v2.00
usbcore: registered new interface driver em28xx


After tee in rc.local

card=3D9
em28xx 1-1.5:1.0: New device  USB VIDBOX FW Audio @ 480 Mbps
(eb1a:5124, interface 0, class 0) em28xx 1-1.5:1.0: Video interface 0
found: isoc em28xx 1-1.5:1.0: chip ID is em2860
em28xx 1-1.5:1.0: EEPROM ID =3D 1a eb 67 95, EEPROM hash =3D 0x806f2156
em28xx 1-1.5:1.0: EEPROM info:
em28xx 1-1.5:1.0: 	AC97 audio (5 sample rates)
em28xx 1-1.5:1.0: 	500mA max power
em28xx 1-1.5:1.0: 	Table at offset 0x24, strings=3D0x288c, 0x226a,
0x0000 em28xx 1-1.5:1.0: Identified as Pinnacle Dazzle DVC
90/100/101/107 / Kaiser Baas Video to DVD maker / Kworld DVD Maker 2 /
Plextor ConvertX PX-AV100U em28xx 1-1.5:1.0: analog set to isoc mode.
em28xx 1-1.5:1.0: Registering V4L2 extension saa7115 3-0025: saa7113
found @ 0x4a (1-1.5:1.0) em28xx 1-1.5:1.0: Config register raw data:
0x50 em28xx 1-1.5:1.0: AC97 vendor ID =3D 0x83847652
em28xx 1-1.5:1.0: AC97 features =3D 0x6a90
em28xx 1-1.5:1.0: Sigmatel audio processor detected (stac 9752)
em28xx 1-1.5:1.0: V4L2 video device registered as video0
em28xx 1-1.5:1.0: V4L2 VBI device registered as vbi0
em28xx 1-1.5:1.0: V4L2 extension successfully initialized
em28xx: Registered (Em28xx v4l2 Extension) extension

card=3D64

em28xx 1-1.5:1.0: New device  USB VIDBOX FW Audio @ 480 Mbps
(eb1a:5124, interface 0, class 0) em28xx 1-1.5:1.0: Video interface 0
found: isoc em28xx 1-1.5:1.0: chip ID is em2860
em28xx 1-1.5:1.0: EEPROM ID =3D 1a eb 67 95, EEPROM hash =3D 0x806f2156
em28xx 1-1.5:1.0: EEPROM info:
em28xx 1-1.5:1.0: 	AC97 audio (5 sample rates)
em28xx 1-1.5:1.0: 	500mA max power
em28xx 1-1.5:1.0: 	Table at offset 0x24, strings=3D0x288c, 0x226a,
0x0000 em28xx 1-1.5:1.0: Identified as Easy Cap Capture DC-60 (card=3D64)
em28xx 1-1.5:1.0: analog set to isoc mode.
em28xx 1-1.5:1.0: Registering V4L2 extension
em28xx 1-1.5:1.0: write to i2c device at 0x4a failed with unknown error
(status=3D1) saa7115 3-0025: saa7113 found @ 0x4a (1-1.5:1.0)
em28xx 1-1.5:1.0: Config register raw data: 0x50
em28xx 1-1.5:1.0: AC97 vendor ID =3D 0x83847652
em28xx 1-1.5:1.0: AC97 features =3D 0x6a90
em28xx 1-1.5:1.0: Sigmatel audio processor detected (stac 9752)
em28xx 1-1.5:1.0: V4L2 video device registered as video0
em28xx 1-1.5:1.0: V4L2 VBI device registered as vbi0
em28xx 1-1.5:1.0: V4L2 extension successfully initialized
raspberrypi kernel: [  162.191774] em28xx: Registered (Em28xx v4l2
Extension) extension


--=20
John Crisp

--Sig_/jCfSbsOnONcSB/e5l/EFdlP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEjK6/QfNffar/UqviTxujxO/QWskFAl6PJw0ACgkQTxujxO/Q
Wsng3Af/SPn6yHWjZcQGZbBYHh0iL+6CfyNJ6W8T8mpzCJNQ7cUcAmJlgbbIg/Vo
aFw/l+Jyeju5LnaZD5lhpY4+XhNyBl+Az0CgxjQbbyDC+phvK9LAdazRlUAbZxWq
yQ1fwux1XCUthfh1KZNhlBL8/mLcFaaciGG2uvUX0F66duB13AsLYfSwjC+lXXU/
kB11m+Uixrwkk0UoHcY94WrFaFfGC8iSpSufvsG2hdL3Rbxk4UtkZzchuTPuOmzP
CeViajtMjOYD10GJCtsNPug0xxGl+rdn5A0Okct18XSjsMBslhor5QUHeseeURCY
1cwUOE2y7YQ1ny1+My+X6miirRMQmQ==
=9wAd
-----END PGP SIGNATURE-----

--Sig_/jCfSbsOnONcSB/e5l/EFdlP--
