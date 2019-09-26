Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 685DDBFB6A
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 00:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfIZWr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 18:47:58 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:52141 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfIZWr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 18:47:58 -0400
Received: by mail-wm1-f54.google.com with SMTP id 7so4495257wme.1
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 15:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=pDuLqIXNHI7uQWvt2R7nmfh5ZPBsCVlat4wR82Uy37A=;
        b=r9dt17yYfBgwZJUP2Pv20J9smcN3b1Q0Jafor9/VGWCAI+Q6d3V/DXMwdkEFL1Q0HW
         lPSvDMZmERKbicmGml9AxyDfp7QeIdXDn2axXZ/9MmLB2UOacdJ89WZn4g+c7cTo7l+6
         xoGopv9rhTnF0glDFW0/m8aSKKwLjEdbLviiLwRv0k6P1ni2T1Xf9F233UPO5NTV8pGP
         twJDr3jyA1MhlXud4fI2RVZcZIdsgVIQtm6lzz9+yNxj1Gmm+CNLZpVfcVfZZL7Z9AmA
         KU/Ly7ut2jSEiiiCYfHa+FCOQpEJ5HA81qYLdux2VhGKw0jiYjO59lNkcwEP2gL+dt0N
         t4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pDuLqIXNHI7uQWvt2R7nmfh5ZPBsCVlat4wR82Uy37A=;
        b=pvMDJkuWq1EUhncYbd1Y/alyKkDKVbVApxv/EH+BrtJoqXDiLzJBZmqTOBNXRnWX+n
         JLu4F3scpozBr2UXlKTjv1h91waOeA4AA395z4z5PlvXDAqATCrIg7injCkKyMHBNq1Y
         enz3E0gigMLsZSG4eWiVQ/Cz/gKL5Di9UGtdbS2TdRDttRZyG/Li1wJW0lbF63ovhMOT
         9j9Xt/jDvOhDuZGJBmhySCSGbI3iXl6+McAf7Z1esPoN7gWt1iSn8jlD90my37rPIuXU
         Wv9lysAKjeaQPzCJlBapY5S91HcQJXq2uZ0bsF/vHGX7GFTBhxY8xR/lYFExhkFVojwM
         9YjQ==
X-Gm-Message-State: APjAAAW/QAfiKEurfQyvJQRCmNuhgai0Qmq6FvGEjf7yPQrRsve1Vq+/
        8wzl1Xi4laAZYTDswoE5R4JttwIxuisEq0B1Fy8iJ/v5w7Q=
X-Google-Smtp-Source: APXvYqwoB3Xvg0iZlftOxZL4Od4vILUDvxFYriyD8AWUATX7SWIN1PugDoCILf7OI1hYu5KoXdx1Sf8mY5or6k1tIao=
X-Received: by 2002:a05:600c:2059:: with SMTP id p25mr5013038wmg.50.1569538073901;
 Thu, 26 Sep 2019 15:47:53 -0700 (PDT)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 26 Sep 2019 15:47:43 -0700
Message-ID: <CAJ+vNU1UX-aaPVAnESgzyOx7chBFHPSDun0_4=Do4tjXZabhMg@mail.gmail.com>
Subject: PureThermal2 UVC video camera: Failed to submit URB 0 (-28)
To:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

I'm running into an issue with a USB UVC Full speed camera, the
PureThermal2 [1] on an IMX6 based ARM board.

What I find is that I get two video devices registered (the first one
is the expected device, and I'm not clear what the 2nd one is). When I
try to capture a single frame I get 'Failed to submit URB 0 (-28)'
which historically has been due to a bandwidth issue. I encounter this
on the IMX6 EHCI host as well as the OTG host when no other devices
are connected (no hubs either). I've tested with both a 4.20 kernel
and a 5.3 kernel.

If I plug this device into another board I have based on an OcteonTX
ARM64 cpu with a fairly modern 4.14 kernel and I find that a single
video device gets registered and I can capture just fine.

Here are some details:
lsusb reports: 1e4e:0100 Cubeternet WebCam

working system with 4.14 kernel hot-inserting the camera:
[  495.163276] usb 1-1.2: new full-speed USB device number 6 using xhci_hcd
[  495.291685] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
(1e4e:0100)
[  495.300543] input: PureThermal (fw:v1.2.2): PureTh as
/devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input1
[  496.731214] usb 1-1.2: USB disconnect, device number 6
[  496.987294] usb 1-1.2: new full-speed USB device number 7 using xhci_hcd
[  497.115683] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
(1e4e:0100)
[  497.124182] input: PureThermal (fw:v1.2.2): PureTh as
/devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input2
root@bionic-newport:~# for i in $(ls -1d
/sys/class/video4linux/video*); do echo $i:$(cat $i/name); done
/sys/class/video4linux/video0:PureThermal (fw:v1.2.2): PureTh
root@bionic-newport:~# v4l2-ctl --device=/dev/video0 --allDriver Info
(not using libv4l2):
Driver name   : uvcvideo
Card type     : PureThermal (fw:v1.2.2): PureTh
Bus info      : usb-0000:00:10.0-1.2
Driver version: 4.14.4
Capabilities  : 0x84200001
Video Capture
Streaming
Extended Pix Format
Device Capabilities
Device Caps   : 0x04200001
Video Capture
Streaming
Extended Pix Format
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
Width/Height      : 160/120
Pixel Format      : 'UYVY'
Field             : None
Bytes per Line    : 320
Size Image        : 38400
Colorspace        : sRGB
Transfer Function : Default (maps to sRGB)
YCbCr/HSV Encoding: Default (maps to ITU-R 601)
Quantization      : Default (maps to Limited Range)
Flags             :
Crop Capability Video Capture:
Bounds      : Left 0, Top 0, Width 160, Height 120
Default     : Left 0, Top 0, Width 160, Height 120
Pixel Aspect: 1/1
Selection: crop_default, Left 0, Top 0, Width 160, Height 120
Selection: crop_bounds, Left 0, Top 0, Width 160, Height 120
Streaming Parameters Video Capture:
Capabilities     : timeperframe
Frames per second: 9.000 (9/1)
Read buffers     : 0
                     brightness 0x00980900 (int)    : min=0 max=255
step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=255
step=1 default=128 value=128
root@bionic-newport:~# v4l2-ctl --device=/dev/video0 --stream-mmap
--stream-to=x.raw --stream-count=1
<
root@bionic-newport:~# ls -l x.raw
-rw-r--r-- 1 root root 38400 Sep 26 22:25 x.raw

non-working system with 5.3 kernel hot-inserting the device
[   54.252434] usb 2-1: new full-speed USB device number 2 using ci_hdrc
[   54.463017] usb 2-1: New USB device found, idVendor=1e4e,
idProduct=0100, bcdDevice= 2.00
[   54.463097] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   54.463114] usb 2-1: Product: PureThermal (fw:v1.2.2)
[   54.463130] usb 2-1: Manufacturer: GroupGets
[   54.463145] usb 2-1: SerialNumber: 801f001c-5102-3038-3835-393400000000
[   54.470265] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
(1e4e:0100)
[   54.480219] uvcvideo 2-1:1.0: Entity type for entity Extension 3
was not initialized!
[   54.480315] uvcvideo 2-1:1.0: Entity type for entity Processing 2
was not initialized!
[   54.480342] uvcvideo 2-1:1.0: Entity type for entity Extension 4
was not initialized!
[   54.480366] uvcvideo 2-1:1.0: Entity type for entity Extension 5
was not initialized!
[   54.480388] uvcvideo 2-1:1.0: Entity type for entity Extension 6
was not initialized!
[   54.480409] uvcvideo 2-1:1.0: Entity type for entity Extension 7
was not initialized!
[   54.480431] uvcvideo 2-1:1.0: Entity type for entity Extension 21
was not initialized!
[   54.480452] uvcvideo 2-1:1.0: Entity type for entity Extension 254
was not initialized!
[   54.480473] uvcvideo 2-1:1.0: Entity type for entity Camera 1 was
not initialized!
[   54.481802] input: PureThermal (fw:v1.2.2): PureTh as
/devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1:1.0/input/input1
[   55.733320] usb 2-1: USB disconnect, device number 2
[   56.252329] usb 2-1: new full-speed USB device number 3 using ci_hdrc
[   56.462977] usb 2-1: New USB device found, idVendor=1e4e,
idProduct=0100, bcdDevice= 2.00
[   56.462998] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   56.463015] usb 2-1: Product: PureThermal (fw:v1.2.2)
[   56.463030] usb 2-1: Manufacturer: GroupGets
[   56.463044] usb 2-1: SerialNumber: 801f001c-5102-3038-3835-393400000000
[   56.466135] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
(1e4e:0100)
[   56.473750] uvcvideo 2-1:1.0: Entity type for entity Extension 3
was not initialized!
[   56.473784] uvcvideo 2-1:1.0: Entity type for entity Processing 2
was not initialized!
[   56.473807] uvcvideo 2-1:1.0: Entity type for entity Extension 4
was not initialized!
[   56.473829] uvcvideo 2-1:1.0: Entity type for entity Extension 5
was not initialized!
[   56.473851] uvcvideo 2-1:1.0: Entity type for entity Extension 6
was not initialized!
[   56.473875] uvcvideo 2-1:1.0: Entity type for entity Extension 7
was not initialized!
[   56.473898] uvcvideo 2-1:1.0: Entity type for entity Extension 21
was not initialized!
[   56.473919] uvcvideo 2-1:1.0: Entity type for entity Extension 254
was not initialized!
[   56.473941] uvcvideo 2-1:1.0: Entity type for entity Camera 1 was
not initialized!
[   56.475097] input: PureThermal (fw:v1.2.2): PureTh as
/devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1:1.0/input/input2
root@bionic-armhf:~# for i in $(ls -1d /sys/class/video4linux/video*);
do echo $i:$(cat $i/name); done
/sys/class/video4linux/video0:ipu1_csi0 capture
/sys/class/video4linux/video1:ipu1_ic_prpenc capture
/sys/class/video4linux/video10:PureThermal (fw:v1.2.2): PureTh
/sys/class/video4linux/video2:ipu1_ic_prpvf capture
/sys/class/video4linux/video3:ipu1_csi1 capture
/sys/class/video4linux/video4:ipu2_csi0 capture
/sys/class/video4linux/video5:ipu2_ic_prpenc capture
/sys/class/video4linux/video6:ipu2_ic_prpvf capture
/sys/class/video4linux/video7:ipu2_csi1 capture
/sys/class/video4linux/video8:ipu_ic_pp csc/scaler
/sys/class/video4linux/video9:PureThermal (fw:v1.2.2): PureTh
^^^^ why 2 video devices for this camera when the working system only had 1?
root@bionic-armhf:~# v4l2-ctl --device=/dev/video9 --all
Driver Info (not using libv4l2):
Driver name   : uvcvideo
Card type     : PureThermal (fw:v1.2.2): PureTh
Bus info      : usb-ci_hdrc.1-1
Driver version: 5.3.0
Capabilities  : 0x84A00001
Video Capture
Metadata Capture
Streaming
Extended Pix Format
Device Capabilities
Device Caps   : 0x04200001
Video Capture
Streaming
Extended Pix Format
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
Width/Height      : 160/120
Pixel Format      : 'UYVY'
Field             : None
Bytes per Line    : 320
Size Image        : 38400
Colorspace        : sRGB
Transfer Function : Default (maps to sRGB)
YCbCr/HSV Encoding: Default (maps to ITU-R 601)
Quantization      : Default (maps to Limited Range)
Flags             :
Crop Capability Video Capture:
Bounds      : Left 0, Top 0, Width 160, Height 120
Default     : Left 0, Top 0, Width 160, Height 120
Pixel Aspect: 1/1
Selection: crop_default, Left 0, Top 0, Width 160, Height 120
Selection: crop_bounds, Left 0, Top 0, Width 160, Height 120
Streaming Parameters Video Capture:
Capabilities     : timeperframe
Frames per second: 9.000 (9/1)
Read buffers     : 0
                     brightness 0x00980900 (int)    : min=0 max=255
step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=255
step=1 default=128 value=128
root@bionic-armhf:~# v4l2-ctl --device=/dev/video9 --stream-mmap
--stream-to=x.raw --stream-count=1
[  134.601561] uvcvideo: Failed to submit URB 0 (-28).
VIDIOC_STREAMON: failed: No space left on device
^^^ the issue
root@bionic-armhf:~# v4l2-ctl --device=/dev/video10 --all
Driver Info (not using libv4l2):
Driver name   : uvcvideo
Card type     : PureThermal (fw:v1.2.2): PureTh
Bus info      : usb-ci_hdrc.1-1
Driver version: 5.3.0
Capabilities  : 0x84A00001
Video Capture
Metadata Capture
Streaming
Extended Pix Format
Device Capabilities
Device Caps   : 0x04A00000
Metadata Capture
Streaming
Extended Pix Format
Priority: 2
root@bionic-armhf:~# v4l2-ctl --device=/dev/video10 --stream-mmap
--stream-to=x.raw --stream-count=1
unsupported stream type
^^^ no idea what this 2nd video device is

I'm also not clear why the device enumerates then disconnects and
enumerates again when plugged in but this happens on the system it
works on as well and I've seen similar things with other devices.

Any ideas?

Best Regards,

Tim
[1] https://groupgets.com/manufacturers/getlab/products/purethermal-2-flir-lepton-smart-i-o-module
