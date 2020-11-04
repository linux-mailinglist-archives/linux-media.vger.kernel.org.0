Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4382A6F66
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 22:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731553AbgKDVLz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 16:11:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:37286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727389AbgKDVLy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 16:11:54 -0500
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 562AD207BB;
        Wed,  4 Nov 2020 21:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604524313;
        bh=0eRE9LZ1V8H9wMX7EiUdfr0Dm59cZOI7yBBZQv7DJeo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Pa0C318van2xeIPwqrZg3/RXdEUdjSG2Ki2mcc++mRldngkCljR8RoDCs5gbqDZuO
         iJyyenPVIFVio4VJW/4qr7ONtDtu+j+qzW+RrOSQYtjYges/C/5aq2aIO+F51YeTNX
         qqcrZRWgAizgBFranz9MqQZ6B4rmHqA/n2yzK7R4=
Date:   Wed, 4 Nov 2020 22:11:48 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Gregor Hlawacek <g.hlawacek@hzdr.de>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Philips Monitor with webcam
Message-ID: <20201104221148.4d5c644d@coco.lan>
In-Reply-To: <40a643d5fd9b6dd387d9cbde3e5ba1796b282f6a.camel@hzdr.de>
References: <51207fd712e3c1001b80c6642021b1a5d5763ade.camel@hzdr.de>
        <20201104170233.0d405dff@coco.lan>
        <59f848e83354ad72c11dacaf571f20a8084baf58.camel@hzdr.de>
        <20201104174554.4bbec36a@coco.lan>
        <b8fcc03ed79873f9e55ab394b4b95140ab8b215b.camel@hzdr.de>
        <20201104210155.353a0d6a@coco.lan>
        <40a643d5fd9b6dd387d9cbde3e5ba1796b282f6a.camel@hzdr.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 04 Nov 2020 21:22:55 +0100
Gregor Hlawacek <g.hlawacek@hzdr.de> escreveu:

> On Wed, 2020-11-04 at 21:01 +0100, Mauro Carvalho Chehab wrote:
> > Em Wed, 04 Nov 2020 20:43:27 +0100
> > Gregor Hlawacek <g.hlawacek@hzdr.de> escreveu:
> >=20
> > I'm c/c Laurent, as he is the author of the UVC driver.
> >  =20
> > > On Wed, 2020-11-04 at 17:45 +0100, Mauro Carvalho Chehab wrote: =20
> > > > Em Wed, 04 Nov 2020 17:25:48 +0100
> > > > Gregor Hlawacek <g.hlawacek@hzdr.de> escreveu:
> > > > =C2=A0  =20
> > > > > On Wed, 2020-11-04 at 17:02 +0100, Mauro Carvalho Chehab
> > > > > wrote:=C2=A0  =20
> > > > > > Em Wed, 04 Nov 2020 14:24:34 +0100
> > > > > > Gregor Hlawacek <g.hlawacek@hzdr.de> escreveu:
> > > > > > =C2=A0=C2=A0=C2=A0  =20
> > > > > > > Hi all
> > > > > > >=20
> > > > > > > I own a Philips Brilliance 241B which has a webcam
> > > > > > > attached.
> > > > > > > The
> > > > > > > device
> > > > > > > is listed as 0412:612b Chicony Electronics Co., Ltd, bubt
> > > > > > > doesn't
> > > > > > > work
> > > > > > > with the latest UVC stock kernel driver. Is there any hope
> > > > > > > to
> > > > > > > get
> > > > > > > this
> > > > > > > supported?
> > > > > > >=20
> > > > > > > uname -a:
> > > > > > > Linux it72 5.9.3-arch1-1 #1 SMP PREEMPT Sun, 01 Nov 2020
> > > > > > > 12:58:59
> > > > > > > +0000
> > > > > > > x86_64 GNU/Linux
> > > > > > >=20
> > > > > > > running Arch Linux on a Lenovo Thinkpad =C2=A0T490s
> > > > > > >=20
> > > > > > > dmesg:
> > > > > > >=20
> > > > > > > [76850.137838] usb 3-1.1.1.2: New USB device found,
> > > > > > > idVendor=3D04f2,
> > > > > > > idProduct=3Db612, bcdDevice=3D 2.10
> > > > > > > [76850.137841] usb 3-1.1.1.2: New USB device strings:
> > > > > > > Mfr=3D1,
> > > > > > > Product=3D2,
> > > > > > > SerialNumber=3D3
> > > > > > > [76850.137843] usb 3-1.1.1.2: Product: USB2.0 FHD UVC
> > > > > > > WebCam
> > > > > > > [76850.137845] usb 3-1.1.1.2: Manufacturer: SunplusIT Inc
> > > > > > > [76850.137846] usb 3-1.1.1.2: SerialNumber: 01.00.00
> > > > > > > [76850.152761] uvcvideo: Found UVC 1.50 device USB2.0 FHD
> > > > > > > UVC
> > > > > > > WebCam
> > > > > > > (04f2:b612)
> > > > > > > [76850.215683] input: USB2.0 FHD UVC WebCam: USB2.0 F as
> > > > > > > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/
> > > > > > > 0000
> > > > > > > :3c:
> > > > > > > 00.0
> > > > > > > /usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-
> > > > > > > 1.1.1.2:1.0/input/input66
> > > > > > > [76850.223642] uvcvideo: Found UVC 1.50 device USB2.0 FHD
> > > > > > > UVC
> > > > > > > WebCam
> > > > > > > (04f2:b612)
> > > > > > > [76850.232499] usb 4-1.1.2: new SuperSpeed Gen 1 USB device
> > > > > > > number
> > > > > > > 5
> > > > > > > using xhci_hcd
> > > > > > > [76850.241004] input: USB2.0 FHD UVC WebCam: IR Camer as
> > > > > > > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/
> > > > > > > 0000
> > > > > > > :3c:
> > > > > > > 00.0
> > > > > > > /usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-
> > > > > > > 1.1.1.2:1.2/input/input67=C2=A0=C2=A0=C2=A0  =20
> > > > > >=20
> > > > > > Hmm... it sounds that the camera was properly detected here.=20
> > > > > >=20
> > > > > > Could you please enclose the contents of the following
> > > > > > command?
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$ v4l2-ctl --all
> > > > > >=20
> > > > > > Thanks,
> > > > > > Mauro=C2=A0=C2=A0=C2=A0  =20
> > > > >=20
> > > > > Hi Mauro=C2=A0
> > > > >=20
> > > > > thanks for the quick answer. Here is the output but I am pretty
> > > > > sure
> > > > > that this come from the integrated laptop camera and not the
> > > > > one in
> > > > > the
> > > > > external monitor=C2=A0  =20
> > > >=20
> > > > Well, you can use "-d" parameter to identify the device, like:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$ v4l2-ctl -d /dev/=
v4l/by-path/pci-0000\:00\:14.0-usb-
> > > > 0\:3.2\:1.0-video-index0 --all
> > > >=20
> > > > The real path depends on your camera - you can take a look at:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$ tree /dev/v4l/
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/dev/v4l/
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 by-id
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 usb-046d_HD_Pro_Webcam_C920_55DA1CCF-video-=
index0 =20
> > > > -> =20
> > > > ../../video0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 usb-046d_HD_Pro_Webcam_C920_55DA1CCF-video-=
index1 =20
> > > > -> =20
> > > > ../../video1
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=E2=94=94=E2=94=80=
=E2=94=80 by-path
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0:3.2:1.0-video-index0 ->
> > > > ../../video0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=94=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0:3.2:1.0-video-index1 ->
> > > > ../../video1
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > In order to check the ones that were detected.
> > > >=20
> > > > Regards,
> > > > Mauro=C2=A0  =20
> > > =E2=94=9C=E2=94=80=E2=94=80 by-id
> > > =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 usb-Chicony_Electro=
nics_Co._Ltd._Integrated_Camera_0001-
> > > video-
> > > index0 -> ../../video0
> > > =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 usb-Chicony_Electro=
nics_Co._Ltd._Integrated_Camera_0001-
> > > video-
> > > index1 -> ../../video1 =20
> >=20
> > Ok. So, /dev/video0 is the video streaming device (and /dev/video1
> > carries on metadata).
> >=20
> >  =20
> > > =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 usb-SunplusIT_Inc_U=
SB2.0_FHD_UVC_WebCam_01.00.00-video-
> > > index0 - =20
> > > > ../../video4=C2=A0  =20
> > > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 usb-SunplusIT_Inc_U=
SB2.0_FHD_UVC_WebCam_01.00.00-video-
> > > index1 - =20
> > > > ../../video5=C2=A0  =20
> > > =E2=94=94=E2=94=80=E2=94=80 by-path
> > > =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0=
:8:1.0-video-index0 -> ../../video0
> > > =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0=
:8:1.0-video-index1 -> ../../video1
> > > =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pci-0000:3c:00.0-usb-0=
:1.1.1.2:1.0-video-index0 ->
> > > ../../video2
> > > =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pci-0000:3c:00.0-usb-0=
:1.1.1.2:1.0-video-index1 ->
> > > ../../video3
> > > =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pci-0000:3c:00.0-usb-0=
:1.1.1.2:1.2-video-index0 ->
> > > ../../video4
> > > =C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 pci-0000:3c:00.0-usb-0=
:1.1.1.2:1.2-video-index1 ->
> > > ../../video5
> > >=20
> > > It seems non of them responds. They are either busy, can not be
> > > opened
> > > or fail to produce any response.
> > >=20
> > > sudo v4l2-ctl -d /dev/v4l/by-id/usb-
> > > sunplusIT_Inc_USB2.0_FHD_UVC_WebCam_01.00.00-video-index0
> > > Failed to open /dev/v4l/by-id/usb-
> > > SunplusIT_Inc_USB2.0_FHD_UVC_WebCam_01.00.00-video-index0: Device
> > > or
> > > resource busy =20
> >=20
> > Weird. It is not usual to receive -EBUSY if there's no other program
> > using the device at the same time.
> >=20
> > Yet, from what I understood, on this device, the camera is hidden
> > inside
> > the monitor until an application tries to use it.
> >=20
> > While uvc driver has support for Linux PM, perhaps this specific
> > device requires some extra command to turn the camera on and to=20
> > open it from the monitor case.
> >=20
> > After you called v4l2-ctl, does any message appears at dmesg?
> >=20
> > Thanks,
> > Mauro =20
>=20
> Hi Mauro
>=20
> no nothing.=C2=A0
>=20
> ls -l /dev/video*=20
> crw-rw----+ 1 root video 81, 0 4. Nov 15:19 /dev/video0
> crw-rw----+ 1 root video 81, 1 4. Nov 15:19 /dev/video1
> crw-rw----+ 1 root video 81, 2 4. Nov 15:19 /dev/video2
> crw-rw----+ 1 root video 81, 3 4. Nov 15:19 /dev/video3
> crw-rw----+ 1 root video 81, 4 4. Nov 15:19 /dev/video4
> crw-rw----+ 1 root video 81, 5 4. Nov 15:19 /dev/video5
>=20
> video0 and 1 are the laptop cam. video2-5 is related to the not working
> one inside the external monitor.

Well, based on the results of your tree command:

$ tree /dev/v4l/
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/dev/v4l/
	=E2=94=9C=E2=94=80=E2=94=80 by-id
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 usb-Chicony_Electronics_=
Co._Ltd._Integrated_Camera_0001-video-index0 -> ../../video0
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 usb-Chicony_Electronics_=
Co._Ltd._Integrated_Camera_0001-video-index1 -> ../../video1
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 usb-SunplusIT_Inc_USB2.0=
_FHD_UVC_WebCam_01.00.00-video-index0 -> ../../video4 =20
	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 usb-SunplusIT_Inc_USB2.0=
_FHD_UVC_WebCam_01.00.00-video-index1 -> ../../video5 =20
	=E2=94=94=E2=94=80=E2=94=80 by-path
	    =E2=94=9C=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0:8:1.0-video-index0 =
-> ../../video0
	    =E2=94=9C=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0:8:1.0-video-index1 =
-> ../../video1
	    =E2=94=9C=E2=94=80=E2=94=80 pci-0000:3c:00.0-usb-0:1.1.1.2:1.0-video-i=
ndex0 -> ../../video2
	    =E2=94=9C=E2=94=80=E2=94=80 pci-0000:3c:00.0-usb-0:1.1.1.2:1.0-video-i=
ndex1 -> ../../video3
	    =E2=94=9C=E2=94=80=E2=94=80 pci-0000:3c:00.0-usb-0:1.1.1.2:1.2-video-i=
ndex0 -> ../../video4
	    =E2=94=94=E2=94=80=E2=94=80 pci-0000:3c:00.0-usb-0:1.1.1.2:1.2-video-i=
ndex1 -> ../../video5

you have:
	- Chicony devices: video0 and video1
	- SunplusIT FHD WebCam: video4 and video5
	- Two other video devnodes (video2 and video3) that didn't return
	  any ID.

=46rom what you mentioned on your first e-mail, the Chicony device is
the webcam mounted inside the Philips monitor. Right?

-

The issue with video2 and video3 can actually put something in
perspective.

When systemd/udev detects a video device, it runs the ruleset at:

	/usr/lib/udev/rules.d/60-persistent-v4l.rules

Which calls a program:

	/usr/lib/udev/v4l_id

via those rules:

	SUBSYSTEMS=3D=3D"usb", IMPORT{builtin}=3D"usb_id"
	KERNEL=3D=3D"video*", ENV{ID_SERIAL}=3D=3D"?*", SYMLINK+=3D"v4l/by-id/$env=
{ID_BUS}-$env{ID_SERIAL}-video-index$attr{index}"

This small program checks the features on all V4L2 devices (a simplified
version of v4l2-ctl --all) and populate the aliases under /dev/v4l.

As it didn't create any nodes at /dev/v4l/by-id for video2 and video3,
perhaps, due to a bug somewhere, this program is locked, and it is keeping
the device opened. If this is the case, you can indeed receive -EBUSY when
trying to access the device nodes.

Another weird thing is that the same USB device at:
=09
	pci-0000:3c:00.0-usb-0:1.1.1.2:1

is creating 4 devnodes instead of two. This command may help to
better understand what's happening:

	$ lsusb -t

But usually USB camera devices have an internal hub, with multiple
ports on it, like my Logitech camera:

/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/16p, 480M
    |__ Port 3: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 4: Dev 5, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 2: Dev 8, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 480M
        |__ Port 2: Dev 8, If 0, Class=3DVideo, Driver=3Duvcvideo, 480M
        |__ Port 2: Dev 8, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio, 480M
        |__ Port 2: Dev 8, If 1, Class=3DVideo, Driver=3Duvcvideo, 480M
        |__ Port 1: Dev 4, If 1, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 1: Dev 4, If 2, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 1: Dev 4, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M

At the above, uvcvideo is used on port 2.

On your case, both port 0 and port 2 seem to be reporting an UVC
camera, which sounds wrong. On a first glance, that sounds to be a
problem at the USB descriptors stored at the device's EEPROM.

Thanks,
Mauro
