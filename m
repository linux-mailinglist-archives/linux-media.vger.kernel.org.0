Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A56F4C408D
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 21:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfJAS6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 14:58:47 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:43054 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfJAS6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 14:58:47 -0400
Received: by mail-wr1-f44.google.com with SMTP id q17so16800075wrx.10
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2019 11:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=JwaxlQNGcZAITN25s0L0uK8zyJ2KeNjAHv/bGu+ED1c=;
        b=PA3LExfDMseIfosHWjzA3gvLHYsjtx6z/ftog3UNVRTLmIIOV4iWtWW9VYgGqUOneA
         kAVXsVjKFkE6IT/vaubMDjKUukie8bwJbghTntyfJzbJEWW4e0Hc93InT5TT54BjqIjD
         OQp9R6e3x0+TjiBg64YY0i6ZtYvWOurBs/BHOFX+qFL6CvCs3htpzmGjzRVhzMXWWhCp
         9aZPjrS85F5eyBzpCcDjMKCsSctA7lgV83oshAwoxwOyvpdvsZDIn0nlfETsRYhjbW4N
         N+HQOOIuJjSq8Nttc78WQiXNFHkxbbd/e2doO/tdm3aG0LEUKg9vqHVMSXO33+RYW4VE
         6fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=JwaxlQNGcZAITN25s0L0uK8zyJ2KeNjAHv/bGu+ED1c=;
        b=eZa74Ry0ZBjdRfkQnHwKLx6xeGxM6w4YVZLl166b3J4HBGgGlHZBbDZoVkV2irdzmG
         0Q1dePmZ5W51QVUxcJgSEZ0S2JbuTGunpZaT5NfMtBQ73g0LmTwatjh3cXjLN8Ex1Ch3
         jaXe/PB9mqLamhHTszomGE2xP/RGQSBzaEOOTYL8L9MfriH0Rqv4EU2YXsAT7Bja++L+
         4fwaS0JWmkb1rcZO90PdF/+HKoLmCp9mBX5oc1CJJMxPgh8YU9Wb9HPcdOZuBj6FOy64
         KX7UXgqupb+bA8Y8JD7dTHa7vREz5A3mjmAnopEquaszmJjvKD3IS6hyqhc7CoS4MIsR
         SK5A==
X-Gm-Message-State: APjAAAVbvjru+m72+rsMY7aRuD24Rmwl4VN200Mdj1Qivqe9SaA+dGbX
        7hPHaRrSblRo8dXPMm8joI/toJD4vnLCu5+rBhlPo2Q3oGBR8gfWTOibVK11xB0z0iH6G4onxx/
        S65omlG8WPLBM/9FeVOVUoRJ3D2qh8KCpYFQ7MQ==
X-Google-Smtp-Source: APXvYqww7V8qMX9e8z9iUHME+iJNUagPDZS+tf9XYPcFKmJtpj3Lmv9CQSreq/R+LRATJ6c/nSuMX60R47pCUMI4Clo=
X-Received: by 2002:a5d:684a:: with SMTP id o10mr18654913wrw.23.1569956321550;
 Tue, 01 Oct 2019 11:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1UX-aaPVAnESgzyOx7chBFHPSDun0_4=Do4tjXZabhMg@mail.gmail.com>
In-Reply-To: <CAJ+vNU1UX-aaPVAnESgzyOx7chBFHPSDun0_4=Do4tjXZabhMg@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 1 Oct 2019 11:58:26 -0700
Message-ID: <CAJ+vNU1UdhbPSMZBOeW3XXBkALdNP8_Rk8T=bzeR9KpdqKC8VQ@mail.gmail.com>
Subject: Re: PureThermal2 UVC video camera: Failed to submit URB 0 (-28)
To:     linux-media <linux-media@vger.kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 26, 2019 at 3:47 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Greetings,
>
> I'm running into an issue with a USB UVC Full speed camera, the
> PureThermal2 [1] on an IMX6 based ARM board.
>
> What I find is that I get two video devices registered (the first one
> is the expected device, and I'm not clear what the 2nd one is). When I
> try to capture a single frame I get 'Failed to submit URB 0 (-28)'
> which historically has been due to a bandwidth issue. I encounter this
> on the IMX6 EHCI host as well as the OTG host when no other devices
> are connected (no hubs either). I've tested with both a 4.20 kernel
> and a 5.3 kernel.
>
> If I plug this device into another board I have based on an OcteonTX
> ARM64 cpu with a fairly modern 4.14 kernel and I find that a single
> video device gets registered and I can capture just fine.
>
> Here are some details:
> lsusb reports: 1e4e:0100 Cubeternet WebCam
>
> working system with 4.14 kernel hot-inserting the camera:
> [  495.163276] usb 1-1.2: new full-speed USB device number 6 using xhci_h=
cd
> [  495.291685] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> (1e4e:0100)
> [  495.300543] input: PureThermal (fw:v1.2.2): PureTh as
> /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1=
/1-1.2/1-1.2:1.0/input/input1
> [  496.731214] usb 1-1.2: USB disconnect, device number 6
> [  496.987294] usb 1-1.2: new full-speed USB device number 7 using xhci_h=
cd
> [  497.115683] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> (1e4e:0100)
> [  497.124182] input: PureThermal (fw:v1.2.2): PureTh as
> /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1=
/1-1.2/1-1.2:1.0/input/input2
> root@bionic-newport:~# for i in $(ls -1d
> /sys/class/video4linux/video*); do echo $i:$(cat $i/name); done
> /sys/class/video4linux/video0:PureThermal (fw:v1.2.2): PureTh
> root@bionic-newport:~# v4l2-ctl --device=3D/dev/video0 --allDriver Info
> (not using libv4l2):
> Driver name   : uvcvideo
> Card type     : PureThermal (fw:v1.2.2): PureTh
> Bus info      : usb-0000:00:10.0-1.2
> Driver version: 4.14.4
> Capabilities  : 0x84200001
> Video Capture
> Streaming
> Extended Pix Format
> Device Capabilities
> Device Caps   : 0x04200001
> Video Capture
> Streaming
> Extended Pix Format
> Priority: 2
> Video input : 0 (Camera 1: ok)
> Format Video Capture:
> Width/Height      : 160/120
> Pixel Format      : 'UYVY'
> Field             : None
> Bytes per Line    : 320
> Size Image        : 38400
> Colorspace        : sRGB
> Transfer Function : Default (maps to sRGB)
> YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> Quantization      : Default (maps to Limited Range)
> Flags             :
> Crop Capability Video Capture:
> Bounds      : Left 0, Top 0, Width 160, Height 120
> Default     : Left 0, Top 0, Width 160, Height 120
> Pixel Aspect: 1/1
> Selection: crop_default, Left 0, Top 0, Width 160, Height 120
> Selection: crop_bounds, Left 0, Top 0, Width 160, Height 120
> Streaming Parameters Video Capture:
> Capabilities     : timeperframe
> Frames per second: 9.000 (9/1)
> Read buffers     : 0
>                      brightness 0x00980900 (int)    : min=3D0 max=3D255
> step=3D1 default=3D128 value=3D128
>                        contrast 0x00980901 (int)    : min=3D0 max=3D255
> step=3D1 default=3D128 value=3D128
> root@bionic-newport:~# v4l2-ctl --device=3D/dev/video0 --stream-mmap
> --stream-to=3Dx.raw --stream-count=3D1
> <
> root@bionic-newport:~# ls -l x.raw
> -rw-r--r-- 1 root root 38400 Sep 26 22:25 x.raw
>
> non-working system with 5.3 kernel hot-inserting the device
> [   54.252434] usb 2-1: new full-speed USB device number 2 using ci_hdrc
> [   54.463017] usb 2-1: New USB device found, idVendor=3D1e4e,
> idProduct=3D0100, bcdDevice=3D 2.00
> [   54.463097] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [   54.463114] usb 2-1: Product: PureThermal (fw:v1.2.2)
> [   54.463130] usb 2-1: Manufacturer: GroupGets
> [   54.463145] usb 2-1: SerialNumber: 801f001c-5102-3038-3835-39340000000=
0
> [   54.470265] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> (1e4e:0100)
> [   54.480219] uvcvideo 2-1:1.0: Entity type for entity Extension 3
> was not initialized!
> [   54.480315] uvcvideo 2-1:1.0: Entity type for entity Processing 2
> was not initialized!
> [   54.480342] uvcvideo 2-1:1.0: Entity type for entity Extension 4
> was not initialized!
> [   54.480366] uvcvideo 2-1:1.0: Entity type for entity Extension 5
> was not initialized!
> [   54.480388] uvcvideo 2-1:1.0: Entity type for entity Extension 6
> was not initialized!
> [   54.480409] uvcvideo 2-1:1.0: Entity type for entity Extension 7
> was not initialized!
> [   54.480431] uvcvideo 2-1:1.0: Entity type for entity Extension 21
> was not initialized!
> [   54.480452] uvcvideo 2-1:1.0: Entity type for entity Extension 254
> was not initialized!
> [   54.480473] uvcvideo 2-1:1.0: Entity type for entity Camera 1 was
> not initialized!
> [   54.481802] input: PureThermal (fw:v1.2.2): PureTh as
> /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1:1.0=
/input/input1
> [   55.733320] usb 2-1: USB disconnect, device number 2
> [   56.252329] usb 2-1: new full-speed USB device number 3 using ci_hdrc
> [   56.462977] usb 2-1: New USB device found, idVendor=3D1e4e,
> idProduct=3D0100, bcdDevice=3D 2.00
> [   56.462998] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [   56.463015] usb 2-1: Product: PureThermal (fw:v1.2.2)
> [   56.463030] usb 2-1: Manufacturer: GroupGets
> [   56.463044] usb 2-1: SerialNumber: 801f001c-5102-3038-3835-39340000000=
0
> [   56.466135] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> (1e4e:0100)
> [   56.473750] uvcvideo 2-1:1.0: Entity type for entity Extension 3
> was not initialized!
> [   56.473784] uvcvideo 2-1:1.0: Entity type for entity Processing 2
> was not initialized!
> [   56.473807] uvcvideo 2-1:1.0: Entity type for entity Extension 4
> was not initialized!
> [   56.473829] uvcvideo 2-1:1.0: Entity type for entity Extension 5
> was not initialized!
> [   56.473851] uvcvideo 2-1:1.0: Entity type for entity Extension 6
> was not initialized!
> [   56.473875] uvcvideo 2-1:1.0: Entity type for entity Extension 7
> was not initialized!
> [   56.473898] uvcvideo 2-1:1.0: Entity type for entity Extension 21
> was not initialized!
> [   56.473919] uvcvideo 2-1:1.0: Entity type for entity Extension 254
> was not initialized!
> [   56.473941] uvcvideo 2-1:1.0: Entity type for entity Camera 1 was
> not initialized!
> [   56.475097] input: PureThermal (fw:v1.2.2): PureTh as
> /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1:1.0=
/input/input2
> root@bionic-armhf:~# for i in $(ls -1d /sys/class/video4linux/video*);
> do echo $i:$(cat $i/name); done
> /sys/class/video4linux/video0:ipu1_csi0 capture
> /sys/class/video4linux/video1:ipu1_ic_prpenc capture
> /sys/class/video4linux/video10:PureThermal (fw:v1.2.2): PureTh
> /sys/class/video4linux/video2:ipu1_ic_prpvf capture
> /sys/class/video4linux/video3:ipu1_csi1 capture
> /sys/class/video4linux/video4:ipu2_csi0 capture
> /sys/class/video4linux/video5:ipu2_ic_prpenc capture
> /sys/class/video4linux/video6:ipu2_ic_prpvf capture
> /sys/class/video4linux/video7:ipu2_csi1 capture
> /sys/class/video4linux/video8:ipu_ic_pp csc/scaler
> /sys/class/video4linux/video9:PureThermal (fw:v1.2.2): PureTh
> ^^^^ why 2 video devices for this camera when the working system only had=
 1?
> root@bionic-armhf:~# v4l2-ctl --device=3D/dev/video9 --all
> Driver Info (not using libv4l2):
> Driver name   : uvcvideo
> Card type     : PureThermal (fw:v1.2.2): PureTh
> Bus info      : usb-ci_hdrc.1-1
> Driver version: 5.3.0
> Capabilities  : 0x84A00001
> Video Capture
> Metadata Capture
> Streaming
> Extended Pix Format
> Device Capabilities
> Device Caps   : 0x04200001
> Video Capture
> Streaming
> Extended Pix Format
> Priority: 2
> Video input : 0 (Camera 1: ok)
> Format Video Capture:
> Width/Height      : 160/120
> Pixel Format      : 'UYVY'
> Field             : None
> Bytes per Line    : 320
> Size Image        : 38400
> Colorspace        : sRGB
> Transfer Function : Default (maps to sRGB)
> YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> Quantization      : Default (maps to Limited Range)
> Flags             :
> Crop Capability Video Capture:
> Bounds      : Left 0, Top 0, Width 160, Height 120
> Default     : Left 0, Top 0, Width 160, Height 120
> Pixel Aspect: 1/1
> Selection: crop_default, Left 0, Top 0, Width 160, Height 120
> Selection: crop_bounds, Left 0, Top 0, Width 160, Height 120
> Streaming Parameters Video Capture:
> Capabilities     : timeperframe
> Frames per second: 9.000 (9/1)
> Read buffers     : 0
>                      brightness 0x00980900 (int)    : min=3D0 max=3D255
> step=3D1 default=3D128 value=3D128
>                        contrast 0x00980901 (int)    : min=3D0 max=3D255
> step=3D1 default=3D128 value=3D128
> root@bionic-armhf:~# v4l2-ctl --device=3D/dev/video9 --stream-mmap
> --stream-to=3Dx.raw --stream-count=3D1
> [  134.601561] uvcvideo: Failed to submit URB 0 (-28).
> VIDIOC_STREAMON: failed: No space left on device
> ^^^ the issue
> root@bionic-armhf:~# v4l2-ctl --device=3D/dev/video10 --all
> Driver Info (not using libv4l2):
> Driver name   : uvcvideo
> Card type     : PureThermal (fw:v1.2.2): PureTh
> Bus info      : usb-ci_hdrc.1-1
> Driver version: 5.3.0
> Capabilities  : 0x84A00001
> Video Capture
> Metadata Capture
> Streaming
> Extended Pix Format
> Device Capabilities
> Device Caps   : 0x04A00000
> Metadata Capture
> Streaming
> Extended Pix Format
> Priority: 2
> root@bionic-armhf:~# v4l2-ctl --device=3D/dev/video10 --stream-mmap
> --stream-to=3Dx.raw --stream-count=3D1
> unsupported stream type
> ^^^ no idea what this 2nd video device is
>
> I'm also not clear why the device enumerates then disconnects and
> enumerates again when plugged in but this happens on the system it
> works on as well and I've seen similar things with other devices.
>

I have found that if I enumerate the camera through a PCIe based XHCI
host controller it still registers the 2 v4l2 devices but in this case
I can capture fine. So it would appear that this has something to do
with the IMX6 ci_hdrc controller. The -ENOSPC is getting returned from
drivers/usb/host/ehci-sched.c:iso_stream_schedule()

I feel perhaps this is something basic I don't understand regarding
USB URB scheduling but I don't get why it occurs on the IMX6 ci_hdrc
controller on not an XHCI controller.

Regards,

Tim

--=20


CONFIDENTIALITY NOTICE: This email constitutes an electronic=20
communication within the meaning of the Electronic Communications Privacy=
=20
Act, 18 U.S.C. 2510, and its disclosure is strictly limited to the named=20
recipient(s) intended by the sender of this message. This email, and any=20
attachments, may contain confidential and/or proprietary information. If=20
you are not a named recipient, any copying, using, disclosing or=20
distributing to others the information in this email and attachments is=20
STRICTLY PROHIBITED. If you have received this email in error, please=20
notify the sender immediately and permanently delete the email, any=20
attachments, and all copies thereof from any drives or storage media and=20
destroy any printouts or hard copies of the email and attachments.

=C2=A0


EXPORT COMPLIANCE NOTICE: This email and any attachments may contain=20
technical data subject to U.S export restrictions under the International=
=20
Traffic in Arms Regulations (ITAR) or the Export Administration Regulations=
=20
(EAR). Export or transfer of this technical data and/or related information=
=20
to any foreign person(s) or entity(ies), either within the U.S. or outside=
=20
of the U.S., may require advance export authorization by the appropriate=20
U.S. Government agency prior to export or transfer. In addition, technical=
=20
data may not be exported or transferred to certain countries or specified=
=20
designated nationals identified by U.S. embargo controls without prior=20
export authorization. By accepting this email and any attachments, all=20
recipients confirm that they understand and will comply with all applicable=
=20
ITAR, EAR and embargo compliance requirements.
