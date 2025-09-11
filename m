Return-Path: <linux-media+bounces-42247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7023B527D7
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 06:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F981C800B5
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 04:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D05623D7CA;
	Thu, 11 Sep 2025 04:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=passmail.net header.i=@passmail.net header.b="rDtIaOhw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-107164.simplelogin.co (mail-107164.simplelogin.co [79.135.107.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22122C86D
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 04:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757566532; cv=pass; b=A9dS+lBCETCUzjiN1qJjLhpnkSslSwX1HbKiFKZV/H2JqaZvxUIQAA3xnoN0eedLN9AxWe+tx0V3BFc3/+WJIgMFl1dlLnjsr93qn0s7YXSDJrVOzbAp3SeA8rOj7P9ppwGzb5Axe7iwm8k9sF/hO+n6kikPQ3zpCvs7KW7X7Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757566532; c=relaxed/simple;
	bh=h3GKcaLMgwo7xfV/r9jp+dckJNf8JDNK8Xbfx9OC/aU=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=pv4zxKbum2XNglLftYxyC0jEhBdNgUq4b+0s2vwE+CpKHE4KYfyF0ZtBm4IbRVxLyB1aq0ahzcKJtzdopVDj9ICBdiikBwNKyzUMzCn727Mukcef0xUiIee0bxBMl8QcHotTanwrQp41pQK2MkAmLvMPVsOhHNRZAYzFIk0FbHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=passmail.net; spf=pass smtp.mailfrom=passmail.net; dkim=pass (1024-bit key) header.d=passmail.net header.i=@passmail.net header.b=rDtIaOhw; arc=pass smtp.client-ip=79.135.107.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=passmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=passmail.net
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1757565431;
	cv=none; b=iDTaSeEgxxp7+ivCeqvzrirWhWKuoQ6f0D93M5EpRqWhtc7XdO1H70KiaEomiZ2226c4diXzBzMrFRNlUS+vGhKGKc6LJMgeDAHd0MMXP5TCpGIQUBAVf6TynFIVszwwjb/Epye5CWSqQS3iJY2fN+4rD+hn9nchbSt5aQm7dU6emv+HkbAEmk++r64QtDzrKYZ85c9B8gVAzIAvHrG2jVPW98U3OqHKnlEHJ/decwYDtdjLcvpDPa57qWKrB6C/1pvEpDPjK80989rFzfwzC+aN6t0xSxOTw5x9vCHJuD84+c8RgyCxtK5pboz+LRqav1wXx4GlG9F0CR+i1DvwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1757565431; c=relaxed/simple;
	bh=h3GKcaLMgwo7xfV/r9jp+dckJNf8JDNK8Xbfx9OC/aU=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=yS7EBrFm35J26hdExN7/mMZDlAFp1xdMj67UjkHqxKGfh4TCWRTyoHe5vIWY2wDvnLMtpkI3lhx75PPUgdHAfMsDb6fG4JeIIA4+DZejTiiox3EEbjY70nNs3naeFez1akGG0V7W91aaDwNbK23oesQilCQQuIMlHWPtftk4KswmNTQmNwgq8HKr3yWXsqCGy/szZJkecSvM2brLpOfQKn2RtmummX4FiHWSWxaQSTxJZ+0xwf0imOgQKwqQB57XZ3H3x7j2GScLUt3n9VUkWtpRjVoyliKldcqutyju5++GZB6dlVyPXIIz7MO0rRoDT6lJ34HmxzTP+EdXbnv+jA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=passmail.net;
	s=dkim; t=1757565431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtt7r3bcFLqHCOzNqLHfa4vhbaAVK9OjIqLO66L7aOQ=;
	b=rDtIaOhwQTeNlp3NYBrSFoFS9qPllwvzpvc72CoKG3Yko0Dw4hMvtaetar9N3y5VWRD6s9
	ITtPqylIb9RRXzGiRkI4MTAfnokfBPCl3OPSjdJlReJ/8EaixmfPvTibWaW28wR3bvG3SS
	ENziR7p57x5UTKALctkrINB8P10DkfE=
Date: Thu, 11 Sep 2025 04:37:04 +0000
Subject: Re: [PATCH] driver/media: add 'com.useeplus.protocol' USB camera V4L2
 driver
In-Reply-To: <38925b932506d2a6bcd2e2f94b052a7e25694068.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: useeplus.l4qli@passmail.net
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: mchehab@kernel.org,linux-media@vger.kernel.org
Message-ID: <175756543070.7.16346912768806976771.898252898@passmail.net>
References: <175703815458.6.14698369738764855320.888629330@passmail.net>
 <38925b932506d2a6bcd2e2f94b052a7e25694068.camel@ndufresne.ca>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 898252904
X-SimpleLogin-Want-Signing: yes

Hi,

> A first step in validating your driver is to run through v4l2-compliance =
test.
> This is part of v4l2-utils [0] project. We recommend building from source=
 so
> you are running the latest version.

Indeed, I forgot to include the report in the original email. I've copied i=
t at the end of this email. There's one trivial error (fail: v4l2-test-buff=
ers.cpp(774): Expected EBUSY, got 22), and I'll happily send you the update=
d patch once we've assessed that everything else is OK.

> Share the resulting report here. Its also nice to extend a bit more, sinc=
e most
> of the reviewers don't know about these cameras. Le us know what features=
 the
> camera have and what you have implemented.

Here's a quick recap, let me know if you want more information.

```
The 'com.useeplus.protocol' protocol is used in mutiple cheap=20
borescope/endoscope cameras (exemple:https://www.amazon.com/dp/B0DMK6P7V5 )=
. There are also reports of this
being used in camera glasses products. Our guess is some company made a
new silicon and it is shipping in multiple camera products.

Instead of using the standard UVC protocol, they use a proprietary=20
protocol, provided by the UseePlus App (as well as some clones). This
explains why the Amazon link above mentions "Don't fit computer.".
Multiple people report they would like a way to use it on their
computer, e.g.https://forums.opensuse.org/t/external-usb-camera-in-endoscop=
e/175342 ,
as well as the forks of the userspace driver we based our code on.

The cameras offer a very basic interface, which does not allow for any=20
configuration (fixed resolution / framerate / ...). Tldr of the
protocol: send a magic USB frame, then loop reading from an USB endpoint
which streams JPEG frames.

'com.useeplus.protocol' products usually have a dual camera system: the=20
current camera can be switched by long-pressing a button - but the
switch is fully hardware-side, therefore this is transparent to the
driver. We could not find a way to switch the camera through software.
The button press itself can be detected, but we are not sure if this is
useful to implement, so the relevant code is commented in the driver
source with a short explanation.
```

Best,
Amaury

v4l2 report:

```
v4l2-compliance 1.31.0-5388, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc46fc8771bf 2025-09-03 09:02:46

Compliance test for supercamera device /dev/video4:

Driver Info:
        Driver name      : supercamera
        Card type        : Geek szitman: supercamera
        Bus info         : usb-0000:00:14.0-1.4
        Driver version   : 6.12.10
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video4 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
                warn: v4l2-test-formats.cpp(1485): S_PARM is supported for =
buftype 1, but not for ENUM_FRAMEINTERVALS
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
                fail: v4l2-test-buffers.cpp(774): Expected EBUSY, got 22
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for supercamera device /dev/video4: 48, Succeeded: 47, Failed: 1, War=
nings: 1
```




On Wednesday, September 10th, 2025 at 1:52 AM, Nicolas Dufresne - nicolas a=
t ndufresne.ca <nicolas_at_ndufresne_ca_yuwktb@passmail.net> wrote:

>=20
>=20
> Hi,
>=20
> Le vendredi 05 septembre 2025 =C3=A0 02:09 +0000, useeplus.l4qli@passmail=
.net a =C3=A9crit=C2=A0:
>=20
> > Add a driver for the 'Geek szitman supercamera' ('com.useeplus.protocol=
'
> > protocol)
> >=20
> > This patch adds a V4L2 driver for USB cameras using the proprietary
> > 'com.useeplus.protocol' protocol.
> > The driver builds upon the work of
> > https://github.com/hbens/geek-szitman-supercamera=C2=A0(owned by one of=
 the
> > authors of this driver), and draws inspiration from the "usbtv" and
> > "gspca" drivers present in the linux kernel.
> >=20
> > Signed-off-by: Amaury Barral useeplus.l4qli@passmail.net
> > Co-developed-by: Hadrien Barral hadrien.barral@univ-eiffel.fr
> > Signed-off-by: Hadrien Barral hadrien.barral@univ-eiffel.fr
> > ---
> > Note: this is my first time writing such a driver. I have tested it
> > to the extent of my capabilities (multiple and fast disconnections and
> > reconnections, video streaming using ffplay and firefox) and identified
> > no bugs on my end. However my setup does not allow me to test, for
> > instance, features such as connecting several such devices on the same
> > computer.
>=20
>=20
> A first step in validating your driver is to run through v4l2-compliance =
test.
> This is part of v4l2-utils [0] project. We recommend building from source=
 so
> you are running the latest version.
>=20
> https://git.linuxtv.org/v4l-utils.git/
>=20
> Share the resulting report here. Its also nice to extend a bit more, sinc=
e most
> of the reviewers don't know about these cameras. Le us know what features=
 the
> camera have and what you have implemented.
>=20
> regards,
> Nicolas
>=20
> > diff -uprN linux-master/drivers/media/usb/Kconfig
> > linux-master-modified/drivers/media/usb/Kconfig
> > --- linux-master/drivers/media/usb/Kconfig=C2=A0=C2=A0=C2=A0 2025-08-18
> > 07:22:10.000000000 +0900
> > +++ linux-master-modified/drivers/media/usb/Kconfig=C2=A0=C2=A0=C2=
=A0 2025-09-04
> > 11:29:37.667388721 +0900
> > @@ -17,6 +17,7 @@ source "drivers/media/usb/gspca/Kconfig"
> > =C2=A0=C2=A0source "drivers/media/usb/pwc/Kconfig"
> > =C2=A0=C2=A0source "drivers/media/usb/s2255/Kconfig"
> > =C2=A0=C2=A0source "drivers/media/usb/usbtv/Kconfig"
> > +source "drivers/media/usb/useeplus/Kconfig"
> > =C2=A0=C2=A0source "drivers/media/usb/uvc/Kconfig"
> >=20
> > endif
> > diff -uprN linux-master/drivers/media/usb/Makefile
> > linux-master-modified/drivers/media/usb/Makefile
> > --- linux-master/drivers/media/usb/Makefile=C2=A0=C2=A0=C2=A0 2025-08-1=
8
> > 07:22:10.000000000 +0900
> > +++ linux-master-modified/drivers/media/usb/Makefile=C2=A0=C2=A0=C2=
=A0 2025-09-04
> > 11:30:14.977994923 +0900
> > @@ -30,3 +30,4 @@ obj-$(CONFIG_VIDEO_HDPVR) +=3D hdpvr/
> > =C2=A0=C2=A0obj-$(CONFIG_VIDEO_PVRUSB2) +=3D pvrusb2/
> > =C2=A0=C2=A0obj-$(CONFIG_VIDEO_STK1160) +=3D stk1160/
> > =C2=A0=C2=A0obj-$(CONFIG_VIDEO_USBTV) +=3D usbtv/
> > +obj-$(CONFIG_VIDEO_USEEPLUS) +=3D useeplus/
> > diff -uprN linux-master/drivers/media/usb/useeplus/Kconfig
> > linux-master-modified/drivers/media/usb/useeplus/Kconfig
> > --- linux-master/drivers/media/usb/useeplus/Kconfig=C2=A0=C2=A0=C2=
=A0 1970-01-01
> > 09:00:00.000000000 +0900
> > +++ linux-master-modified/drivers/media/usb/useeplus/Kconfig 2025-09-03
> > 21:11:01.080048349 +0900
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config VIDEO_USEEPLUS
> > +=C2=A0=C2=A0=C2=A0 tristate "UseePlus cameras support"
> > +=C2=A0=C2=A0=C2=A0 depends on VIDEO_DEV
> > +=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_VMALLOC
> > +
> > +=C2=A0=C2=A0=C2=A0 help
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is a video4linux2 driver for UseeP=
lus based cameras.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Currently only supports the following h=
ardware:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Geek szitman supercamera, USB-ID 2ce3=
:3828.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a module, cho=
ose M here: the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module will be called useeplus
> > diff -uprN linux-master/drivers/media/usb/useeplus/Makefile
> > linux-master-modified/drivers/media/usb/useeplus/Makefile
> > --- linux-master/drivers/media/usb/useeplus/Makefile=C2=A0=C2=A0=C2=
=A0 1970-01-01
> > 09:00:00.000000000 +0900
> > +++ linux-master-modified/drivers/media/usb/useeplus/Makefile 2025-09-0=
3
> > 21:11:01.080048349 +0900
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +useeplus-y :=3D supercamera.o
> > +
> > +obj-$(CONFIG_VIDEO_USEEPLUS) +=3D supercamera.o
> > diff -uprN linux-master/drivers/media/usb/useeplus/supercamera.c
> > linux-master-modified/drivers/media/usb/useeplus/supercamera.c
> > --- linux-master/drivers/media/usb/useeplus/supercamera.c 1970-01-01
> > 09:00:00.000000000 +0900
> > +++ linux-master-modified/drivers/media/usb/useeplus/supercamera.c
> > 2025-09-03 21:11:01.080048349 +0900
> > @@ -0,0 +1,805 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * supercamera_v4l2.c - V4L2 driver for "Geek szitman supercamera" USB
> > + *=C2=A0 endoscope
> > + *
> > + * This driver supports USB cameras that use the proprietary
> > + *=C2=A0 "com.useeplus.protocol". The camera shows up as a standard V4=
L2 video
> > + *=C2=A0 device.
> > + *
> > + * The camera uses a basic protocol where JPEG frames are split across
> > + *=C2=A0 multiple USB packets.
> > + * Each USB packet has a 5-byte header (magic 0xBBAA + camera ID + len=
gth)
> > + *=C2=A0 followed by a camera frame with a 7-byte header
> > + *=C2=A0 (frame ID + camera number + flags) and then JPEG data.
> > + *=C2=A0 We accumulate the JPEG data until the frame ID changes, then =
deliver
> > + *=C2=A0 the complete frame.
> > + *
> > + * Currently, we only supports the following hardware:
> > + *=C2=A0=C2=A0 Name: Geek szitman supercamera (from USB descriptors)
> > + *=C2=A0=C2=A0 USB ID: 2ce3:3828
> > + *=C2=A0=C2=A0 Resolution: 640x480 JPEG only
> > + *=C2=A0=C2=A0 Frame rate: ~30 FPS
> > + *
> > + * This driver is based on patterns from usbtv and gspca drivers.
> > + /
> > +
> > +#include <linux/module.h>
> > +#include <linux/usb.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/wait.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/videobuf2-vmalloc.h>
> > +
> > +#define DRIVER_NAME "supercamera"
> > +
> > +#define USB_VENDOR_ID_SUPERCAMERA 0x2ce3
> > +#define USB_PRODUCT_ID_SUPERCAMERA 0x3828
> > +
> > +#define CONTROL_INTERFACE_NUMBER 0
> > +#define VIDEO_INTERFACE_NUMBER 1
> > +#define VIDEO_INTERFACE_ALTERNATE_SETTING 1
> > +
> > +#define ENDPOINT_1_IN 0x81
> > +#define ENDPOINT_1_OUT 0x01
> > +#define ENDPOINT_2_IN 0x82
> > +#define ENDPOINT_2_OUT 0x02
> > +
> > +#define URB_BUFFER_SIZE 0x1000
> > +#define MAX_URBS 4
> > +
> > +#define UPP_USB_MAGIC 0xBBAA
> > +#define UPP_CAMID_7 7
> > +
> > +#define CAMERA_WIDTH 640
> > +#define CAMERA_HEIGHT 480
> > +#define CAMERA_FRAME_SIZE (CAMERA_WIDTH * CAMERA_HEIGHT * 3)
> > +
> > +/ USB interface descriptors constants for this device /
> > +#define DEVICE_INTERFACE_NUMBER 0x1
> > +#define DEVICE_INTERFACE_CLASS 0xff
> > +#define DEVICE_INTERFACE_SUBCLASS 0xf0
> > +#define DEVICE_INTERFACE_PROTOCOL 0x01
> > +
> > +/ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D DATA MODELS =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D /
> > +
> > +/ USB frame header (5 bytes) /
> > +struct upp_usb_frame {
> > +=C2=A0=C2=A0=C2=A0 __le16 magic;
> > +=C2=A0=C2=A0=C2=A0 __u8 cid;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 / camera id=
 /
> > +=C2=A0=C2=A0=C2=A0 __le16 length; / does not include the 5-bytes heade=
r length /
> > +} __packed;
> > +
> > +/ Camera frame header (7 bytes) /
> > +struct upp_cam_frame {
> > +=C2=A0=C2=A0=C2=A0 __u8 fid;=C2=A0=C2=A0=C2=A0=C2=A0 / frame id /
> > +=C2=A0=C2=A0=C2=A0 __u8 cam_num; / camera number /
> > +=C2=A0=C2=A0=C2=A0 / flags byte /
> > +=C2=A0=C2=A0=C2=A0 __u8 unused_A : 1;
> > +=C2=A0=C2=A0=C2=A0 __u8 button_press : 1;
> > +=C2=A0=C2=A0=C2=A0 __u8 unused_B : 6;
> > +=C2=A0=C2=A0=C2=A0 __le32 unused_C;
> > +} __packed;
> > +
> > +/ Buffer wrapper for our buffer list */
> > +struct supercamera_buffer {
> > +=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer vb;
> > +=C2=A0=C2=A0=C2=A0 struct list_head list;
> > +};
> > +
> > +struct supercamera_dev {
> > +=C2=A0=C2=A0=C2=A0 struct usb_device udev;
> > +=C2=A0=C2=A0=C2=A0 struct v4l2_device v4l2_dev;
> > +=C2=A0=C2=A0=C2=A0 struct video_device vdev;
> > +=C2=A0=C2=A0=C2=A0 struct vb2_queue vb_queue;
> > +=C2=A0=C2=A0=C2=A0 struct mutex vb_queue_mutex; / Protects vb_queue /
> > +
> > +=C2=A0=C2=A0=C2=A0 / USB interface and endpoint information */
> > +=C2=A0=C2=A0=C2=A0 struct usb_interface *intf;
> > +=C2=A0=C2=A0=C2=A0 struct urb *urbs[MAX_URBS];
> > +=C2=A0=C2=A0=C2=A0 char urb_buffers[MAX_URBS];
> > +=C2=A0=C2=A0=C2=A0 dma_addr_t urb_dma_handles[MAX_URBS];
> > +
> > +=C2=A0=C2=A0=C2=A0 / Buffer management /
> > +=C2=A0=C2=A0=C2=A0 spinlock_t buffer_list_lock; / Protects buffer list=
 /
> > +=C2=A0=C2=A0=C2=A0 struct list_head buffer_list;
> > +
> > +=C2=A0=C2=A0=C2=A0 / Device state /
> > +=C2=A0=C2=A0=C2=A0 bool streaming;
> > +
> > +=C2=A0=C2=A0=C2=A0 / Protocol handling /
> > +=C2=A0=C2=A0=C2=A0 struct {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 / Buffer for accumulating J=
PEG data */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char jpeg_buffer;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t jpeg_buffer_size;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t jpeg_data_size;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 / Current frame ID tracking=
 /
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t current_fid;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_frame_id;
> > +=C2=A0=C2=A0=C2=A0 } protocol;
> > +};
> > +
> > +/ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D DEVICE INFRASTRUCTURE =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D */
> > +
> > +static void supercamera_complete_frame(struct supercamera_dev *sc_dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_buffer *buf =3D NULL;
> > +=C2=A0=C2=A0=C2=A0 unsigned long flags;
> > +
> > +=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&sc_dev->buffer_list_lock, flags)=
;
> > +=C2=A0=C2=A0=C2=A0 if (!list_empty(&sc_dev->buffer_list)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D list_first_entry(&s=
c_dev->buffer_list, struct
> > supercamera_buffer, list);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del(&buf->list);
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&sc_dev->buffer_list_lock, f=
lags);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!buf) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_data_=
size =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if (sc_dev->protocol.jpeg_data_size <=3D
> > vb2_plane_size(&buf->vb.vb2_buf, 0)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *vaddr =3D vb2_plane_v=
addr(&buf->vb.vb2_buf, 0);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(vaddr, sc_dev->proto=
col.jpeg_buffer,
> > sc_dev->protocol.jpeg_data_size);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_set_plane_payload(&buf-=
>vb.vb2_buf, 0,
> > sc_dev->protocol.jpeg_data_size);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_buffer_done(&buf->vb.vb=
2_buf, VB2_BUF_STATE_DONE);
> > +=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_buffer_done(&buf->vb.vb=
2_buf, VB2_BUF_STATE_ERROR);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_data_size =3D 0;
> > +}
> > +
> > +static void supercamera_handle_upp_frame(struct supercamera_dev *sc_de=
v,
> > +=C2=A0=C2=A0=C2=A0 const struct upp_usb_frame *frame, const char *data=
, size_t length)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct upp_cam_frame *cam_frame;
> > +=C2=A0=C2=A0=C2=A0 size_t cam_header_len =3D sizeof(struct upp_cam_fra=
me);
> > +=C2=A0=C2=A0=C2=A0 uint8_t new_fid;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (length < cam_header_len)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +
> > +=C2=A0=C2=A0=C2=A0 cam_frame =3D (const struct upp_cam_frame )data;
> > +=C2=A0=C2=A0=C2=A0 new_fid =3D cam_frame->fid;
> > +
> > +=C2=A0=C2=A0=C2=A0 / Frame boundary detected - complete previous frame=
 /
> > +=C2=A0=C2=A0=C2=A0 if (sc_dev->protocol.jpeg_data_size > 0 &&
> > sc_dev->protocol.has_frame_id
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && sc_dev->protocol.current=
_fid !=3D new_fid) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supercamera_complete_frame(=
sc_dev);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if (sc_dev->protocol.jpeg_data_size =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->protocol.current_fi=
d =3D new_fid;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->protocol.has_frame_=
id =3D true;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /=C2=A0 // Not used, but left just in case
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * if (cam_frame->button_press) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(dev, "Butt=
on press event detected\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * }
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +
> > +=C2=A0=C2=A0=C2=A0 if (length > cam_header_len) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t data_len =3D length =
- cam_header_len;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sc_dev->protocol.jpeg_d=
ata_size + data_len >
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_=
dev->protocol.jpeg_buffer_size) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_=
dev->protocol.jpeg_data_size =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(sc_dev->protocol.jpe=
g_buffer +
> > sc_dev->protocol.jpeg_data_size,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a + cam_header_len, data_len);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_data_=
size +=3D data_len;
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +static void supercamera_return_all_buffers(struct supercamera_dev *sc_=
dev,
> > +=C2=A0=C2=A0=C2=A0 enum vb2_buffer_state state)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_buffer *buf, *tmp;
> > +=C2=A0=C2=A0=C2=A0 unsigned long flags;
> > +
> > +=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&sc_dev->buffer_list_lock, flags)=
;
> > +=C2=A0=C2=A0=C2=A0 list_for_each_entry_safe(buf, tmp, &sc_dev->buffer_=
list, list) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del(&buf->list);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_buffer_done(&buf->vb.vb=
2_buf, state);
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&sc_dev->buffer_list_lock, f=
lags);
> > +}
> > +
> > +static int supercamera_send_initial_commands(struct supercamera_dev
> > *sc_dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct device dev =3D &sc_dev->intf->dev;
> > +=C2=A0=C2=A0=C2=A0 int ret;
> > +
> > +=C2=A0=C2=A0=C2=A0 / Device initialization command for endpoint 2 */
> > +=C2=A0=C2=A0=C2=A0 const char ep2_cmd[] =3D {0xFF, 0x55, 0xFF, 0x55, 0=
xEE, 0x10};
> > +
> > +=C2=A0=C2=A0=C2=A0 ret =3D usb_bulk_msg(sc_dev->udev, usb_sndbulkpipe(=
sc_dev->udev,
> > ENDPOINT_2_OUT),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void )ep2_cmd, sizeof(ep2_=
cmd), NULL, 1000);
> > +=C2=A0=C2=A0=C2=A0 if (ret) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to sen=
d EP2 command: %d\n", ret);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 / Start streaming command (UPP protocol header) */
> > +=C2=A0=C2=A0=C2=A0 const char start_stream_cmd[] =3D {0xBB, 0xAA, 5, 0=
, 0};
> > +
> > +=C2=A0=C2=A0=C2=A0 ret =3D usb_bulk_msg(sc_dev->udev, usb_sndbulkpipe(=
sc_dev->udev,
> > ENDPOINT_1_OUT),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void *)start_stream_cmd, s=
izeof(start_stream_cmd), NULL, 1000);
> > +=C2=A0=C2=A0=C2=A0 if (ret) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to sen=
d start stream command: %d\n", ret);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static void supercamera_urb_complete(struct urb *urb)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D urb->context;
> > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> > +=C2=A0=C2=A0=C2=A0 int ret;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!sc_dev)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +
> > +=C2=A0=C2=A0=C2=A0 switch (urb->status) {
> > +=C2=A0=C2=A0=C2=A0 case 0:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 case -ECONNRESET:
> > +=C2=A0=C2=A0=C2=A0 case -ENOENT:
> > +=C2=A0=C2=A0=C2=A0 case -ESHUTDOWN:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!sc_dev->streaming)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_submit_urb(urb, GFP_ATO=
MIC);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if (urb->actual_length > 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *data =3D urb->t=
ransfer_buffer;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t len =3D urb->actual_=
length;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t offset =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (offset + sizeof(stru=
ct upp_usb_frame) <=3D len) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st struct upp_usb_frame *frame =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (const struct upp_usb_frame *)(data + offset);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 siz=
e_t frame_len =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct upp_usb_frame) + le16_to_cpu(frame->=
length);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(offset + frame_len > len)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(le16_to_cpu(frame->magic) !=3D UPP_USB_MAGIC) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 offset++;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(frame->cid !=3D UPP_CAMID_7) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 offset +=3D frame_len;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sup=
ercamera_handle_upp_frame(sc_dev, frame,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 data + offset + sizeof(struct upp_usb_frame),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 le16_to_cpu(frame->length));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 off=
set +=3D frame_len;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if (sc_dev->streaming) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D usb_submit_urb(urb,=
 GFP_ATOMIC);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(dev, "Failed to resubmit URB: %d\n", ret);
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +#define CLEANUP_URBS(sc_dev) \
> > +do { \
> > +=C2=A0=C2=A0=C2=A0 int i; \
> > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < MAX_URBS; i++) { \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((sc_dev)->urbs[i]) { \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb=
_kill_urb((sc_dev)->urbs[i]); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb=
_free_urb((sc_dev)->urbs[i]); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (sc=
_dev)->urbs[i] =3D NULL; \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((sc_dev)->urb_buffers[i=
]) { \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb=
_free_coherent((sc_dev)->udev, URB_BUFFER_SIZE, \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (sc_dev)->urb_buffers[i], (sc_dev)->urb_dma_handle=
s[i]); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (sc=
_dev)->urb_buffers[i] =3D NULL; \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } \
> > +=C2=A0=C2=A0=C2=A0 } \
> > +} while (0)
> > +
> > +static int supercamera_start_streaming(struct supercamera_dev *sc_dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> > +=C2=A0=C2=A0=C2=A0 int ret;
> > +=C2=A0=C2=A0=C2=A0 int i;
> > +
> > +=C2=A0=C2=A0=C2=A0 ret =3D supercamera_send_initial_commands(sc_dev);
> > +=C2=A0=C2=A0=C2=A0 if (ret) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to sen=
d initial commands: %d\n", ret);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 usb_clear_halt(sc_dev->udev, usb_rcvbulkpipe(sc_dev=
->udev,
> > ENDPOINT_1_IN));
> > +
> > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < MAX_URBS; i++) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->urbs[i] =3D usb_all=
oc_urb(0, GFP_KERNEL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!sc_dev->urbs[i]) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(dev, "Failed to allocate URB\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D -ENOMEM;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o error;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->urb_buffers[i] =3D =
usb_alloc_coherent(sc_dev->udev,
> > URB_BUFFER_SIZE,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP=
_KERNEL, &sc_dev->urb_dma_handles[i]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!sc_dev->urb_buffers[i]=
) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(dev, "Failed to allocate URB buffer\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D -ENOMEM;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o error;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_fill_bulk_urb(sc_dev->u=
rbs[i], sc_dev->udev,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb=
_rcvbulkpipe(sc_dev->udev, ENDPOINT_1_IN),
> > sc_dev->urb_buffers[i],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 URB=
_BUFFER_SIZE, supercamera_urb_complete, sc_dev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->urbs[i]->transfer_d=
ma =3D sc_dev->urb_dma_handles[i];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->urbs[i]->transfer_f=
lags |=3D URB_NO_TRANSFER_DMA_MAP;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < MAX_URBS; i++) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D usb_submit_urb(sc_d=
ev->urbs[i], GFP_KERNEL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(dev, "Failed to submit URB %d: %d\n", i, ret);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o error;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.has_frame_id =3D false;
> > +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_data_size =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 sc_dev->streaming =3D true;
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +
> > +error:
> > +=C2=A0=C2=A0=C2=A0 CLEANUP_URBS(sc_dev);
> > +
> > +=C2=A0=C2=A0=C2=A0 return ret;
> > +}
> > +
> > +static void supercamera_stop_streaming(struct supercamera_dev sc_dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0 sc_dev->streaming =3D false;
> > +=C2=A0=C2=A0=C2=A0 CLEANUP_URBS(sc_dev);
> > +}
> > +
> > +/ VB2 operations */
> > +static int supercamera_vb2_queue_setup(struct vb2_queue *vq, unsigned
> > int *nbuffers,
> > +=C2=A0=C2=A0=C2=A0 unsigned int *nplanes, unsigned int sizes[], struct=
 device
> > *alloc_devs[])
> > +{
> > +=C2=A0=C2=A0=C2=A0 if (*nbuffers < 2)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *nbuffers =3D 2;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (*nplanes) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sizes[0] < CAMERA_WIDTH=
 * CAMERA_HEIGHT)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizes[0] =3D CAMERA_FRAME_S=
IZE;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *nplanes =3D 1;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static int supercamera_vb2_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D vb2_get_drv_priv=
(vb->vb2_queue);
> > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (vb2_plane_size(vb, 0) < CAMERA_WIDTH * CAMERA_H=
EIGHT) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Buffer size t=
oo small\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static void supercamera_vb2_buf_queue(struct vb2_buffer *vb)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D vb2_get_drv_priv=
(vb->vb2_queue);
> > +=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer=
(vb);
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_buffer *buf =3D container_of(vbu=
f, struct
> > supercamera_buffer, vb);
> > +=C2=A0=C2=A0=C2=A0 unsigned long flags;
> > +
> > +=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&sc_dev->buffer_list_lock, flags)=
;
> > +=C2=A0=C2=A0=C2=A0 list_add_tail(&buf->list, &sc_dev->buffer_list);
> > +=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&sc_dev->buffer_list_lock, f=
lags);
> > +}
> > +
> > +static int supercamera_vb2_start_streaming(struct vb2_queue *vq,
> > unsigned int count)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D vb2_get_drv_priv=
(vq);
> > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> > +=C2=A0=C2=A0=C2=A0 int ret;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (count =3D=3D 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 ret =3D supercamera_start_streaming(sc_dev);
> > +=C2=A0=C2=A0=C2=A0 if (ret) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to sta=
rt USB streaming: %d\n", ret);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static void supercamera_vb2_stop_streaming(struct vb2_queue *vq)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev sc_dev =3D vb2_get_drv_priv(=
vq);
> > +
> > +=C2=A0=C2=A0=C2=A0 supercamera_return_all_buffers(sc_dev, VB2_BUF_STAT=
E_ERROR);
> > +=C2=A0=C2=A0=C2=A0 supercamera_stop_streaming(sc_dev);
> > +}
> > +
> > +static const struct vb2_ops supercamera_vb2_ops =3D {
> > +=C2=A0=C2=A0=C2=A0 .queue_setup =3D supercamera_vb2_queue_setup,
> > +=C2=A0=C2=A0=C2=A0 .buf_prepare =3D supercamera_vb2_buf_prepare,
> > +=C2=A0=C2=A0=C2=A0 .buf_queue =3D supercamera_vb2_buf_queue,
> > +=C2=A0=C2=A0=C2=A0 .start_streaming =3D supercamera_vb2_start_streamin=
g,
> > +=C2=A0=C2=A0=C2=A0 .stop_streaming =3D supercamera_vb2_stop_streaming,
> > +=C2=A0=C2=A0=C2=A0 .wait_prepare =3D vb2_ops_wait_prepare,
> > +=C2=A0=C2=A0=C2=A0 .wait_finish =3D vb2_ops_wait_finish,
> > +};
> > +
> > +/ V4L2 file operations */
> > +static int supercamera_v4l2_open(struct file *file)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(fi=
le);
> > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> > +=C2=A0=C2=A0=C2=A0 struct v4l2_fh *fh;
> > +=C2=A0=C2=A0=C2=A0 int ret;
> > +
> > +=C2=A0=C2=A0=C2=A0 fh =3D kzalloc(sizeof(*fh), GFP_KERNEL);
> > +=C2=A0=C2=A0=C2=A0 if (!fh)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> > +
> > +=C2=A0=C2=A0=C2=A0 v4l2_fh_init(fh, &sc_dev->vdev);
> > +=C2=A0=C2=A0=C2=A0 v4l2_fh_add(fh);
> > +=C2=A0=C2=A0=C2=A0 file->private_data =3D fh;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (sc_dev->vb_queue.type =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.type =3D V=
4L2_BUF_TYPE_VIDEO_CAPTURE;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.io_modes =
=3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF
> >=20
> > > VB2_READ;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.buf_stru=
ct_size =3D sizeof(struct
> > > supercamera_buffer);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.ops =3D =
&supercamera_vb2_ops;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.mem_ops =
=3D &vb2_vmalloc_memops;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.timestam=
p_flags =3D
> > > V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.dev =3D =
dev;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.lock =3D=
 &sc_dev->vb_queue_mutex;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.drv_priv=
 =3D sc_dev;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D vb2_queue_init(&s=
c_dev->vb_queue);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_err(dev, "Failed to initialize VB2 queue: %d\n", ret);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 v4l2_fh_del(fh);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 v4l2_fh_exit(fh);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 kfree(fh);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static int supercamera_v4l2_release(struct file *file)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct v4l2_fh *fh =3D file->private_data;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 v4l2_fh_del(fh);
> > > +=C2=A0=C2=A0=C2=A0 v4l2_fh_exit(fh);
> > > +=C2=A0=C2=A0=C2=A0 kfree(fh);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static __poll_t supercamera_v4l2_poll(struct file *file, struct
> > > poll_table_struct *wait)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(=
file);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return vb2_poll(&sc_dev->vb_queue, file, wait);
> > > +}
> > > +
> > > +static int supercamera_v4l2_mmap(struct file *file, struct
> > > vm_area_struct *vma)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev sc_dev =3D video_drvdata(f=
ile);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return vb2_mmap(&sc_dev->vb_queue, vma);
> > > +}
> > > +
> > > +static const struct v4l2_file_operations supercamera_fops =3D {
> > > +=C2=A0=C2=A0=C2=A0 .owner =3D THIS_MODULE,
> > > +=C2=A0=C2=A0=C2=A0 .open =3D supercamera_v4l2_open,
> > > +=C2=A0=C2=A0=C2=A0 .release =3D supercamera_v4l2_release,
> > > +=C2=A0=C2=A0=C2=A0 .poll =3D supercamera_v4l2_poll,
> > > +=C2=A0=C2=A0=C2=A0 .mmap =3D supercamera_v4l2_mmap,
> > > +=C2=A0=C2=A0=C2=A0 .unlocked_ioctl =3D video_ioctl2,
> > > +};
> > > +
> > > +/ V4L2 ioctl operations */
> > > +static int supercamera_v4l2_ioctl_querycap(struct file *file, void *=
fh,
> > > struct v4l2_capability *cap)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(=
file);
> > > +=C2=A0=C2=A0=C2=A0 char manufacturer[128];
> > > +=C2=A0=C2=A0=C2=A0 char product[128];
> > > +
> > > +=C2=A0=C2=A0=C2=A0 strscpy(cap->driver, DRIVER_NAME, sizeof(cap->dri=
ver));
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if (usb_string(sc_dev->udev,
> > > sc_dev->udev->descriptor.iManufacturer, manufacturer,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sizeof(manufacturer)) >=3D 0 && usb_string(sc_dev->udev,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sc_dev->udev->descriptor.iProduct, product,
> > > sizeof(product)) >=3D 0) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snprintf(cap->card, sizeo=
f(cap->card), "%s: %s", manufacturer,
> > > product);
> > > +=C2=A0=C2=A0=C2=A0 } else {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strscpy(cap->card, "Unkno=
wn UseePlus USB camera",
> > > sizeof(cap->card));
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 usb_make_path(sc_dev->udev, cap->bus_info, sizeof=
(cap->bus_info));
> > > +
> > > +=C2=A0=C2=A0=C2=A0 cap->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L=
2_CAP_READWRITE |
> > > V4L2_CAP_STREAMING;
> > > +=C2=A0=C2=A0=C2=A0 cap->capabilities =3D cap->device_caps | V4L2_CAP=
_DEVICE_CAPS;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_g_input(struct file *file, void *f=
h,
> > > unsigned int *i)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 *i =3D 0;
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_s_input(struct file *file, void *f=
h,
> > > unsigned int i)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 if (i > 0)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_enum_input(struct file *file, void
> > > *fh, struct v4l2_input *input)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 if (input->index > 0)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 strscpy(input->name, "Camera", sizeof(input->name=
));
> > > +=C2=A0=C2=A0=C2=A0 input->type =3D V4L2_INPUT_TYPE_CAMERA;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_enum_fmt_vid_cap(struct file *file=
,
> > > void *fh,
> > > +=C2=A0=C2=A0=C2=A0 struct v4l2_fmtdesc *f)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 if (f->index !=3D 0)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 f->pixelformat =3D V4L2_PIX_FMT_JPEG;
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_g_fmt_vid_cap(struct file *file, v=
oid
> > > *fh, struct v4l2_format *f)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 f->fmt.pix.width =3D CAMERA_WIDTH;
> > > +=C2=A0=C2=A0=C2=A0 f->fmt.pix.height =3D CAMERA_HEIGHT;
> > > +=C2=A0=C2=A0=C2=A0 f->fmt.pix.pixelformat =3D V4L2_PIX_FMT_JPEG;
> > > +=C2=A0=C2=A0=C2=A0 f->fmt.pix.field =3D V4L2_FIELD_NONE;
> > > +=C2=A0=C2=A0=C2=A0 f->fmt.pix.bytesperline =3D 0;
> > > +=C2=A0=C2=A0=C2=A0 f->fmt.pix.sizeimage =3D CAMERA_FRAME_SIZE;
> > > +=C2=A0=C2=A0=C2=A0 f->fmt.pix.colorspace =3D V4L2_COLORSPACE_JPEG;
> > > +=C2=A0=C2=A0=C2=A0 f->fmt.pix.priv =3D 0;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_g_parm(struct file *file, void *fh=
,
> > > struct v4l2_streamparm *a)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 if (a->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 a->parm.capture.capability =3D V4L2_CAP_TIMEPERFR=
AME;
> > > +=C2=A0=C2=A0=C2=A0 a->parm.capture.capturemode =3D 0;
> > > +=C2=A0=C2=A0=C2=A0 a->parm.capture.timeperframe.numerator =3D 1;
> > > +=C2=A0=C2=A0=C2=A0 a->parm.capture.timeperframe.denominator =3D 30;
> > > +=C2=A0=C2=A0=C2=A0 a->parm.capture.extendedmode =3D 0;
> > > +=C2=A0=C2=A0=C2=A0 a->parm.capture.readbuffers =3D 2;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_reqbufs(struct file *file, void *f=
h,
> > > +=C2=A0=C2=A0=C2=A0 struct v4l2_requestbuffers *rb)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(=
file);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return vb2_reqbufs(&sc_dev->vb_queue, rb);
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_querybuf(struct file *file, void *=
fh,
> > > struct v4l2_buffer *b)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(=
file);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return vb2_querybuf(&sc_dev->vb_queue, b);
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_qbuf(struct file *file, void *fh,
> > > struct v4l2_buffer *b)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(=
file);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return vb2_qbuf(&sc_dev->vb_queue, NULL, b);
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_dqbuf(struct file *file, void *fh,
> > > struct v4l2_buffer *b)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(=
file);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return vb2_dqbuf(&sc_dev->vb_queue, b, file->f_fl=
ags & O_NONBLOCK);
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_streamon(struct file *file, void *=
fh,
> > > enum v4l2_buf_type i)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(=
file);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return vb2_streamon(&sc_dev->vb_queue, i);
> > > +}
> > > +
> > > +static int supercamera_v4l2_ioctl_streamoff(struct file *file, void
> > > *fh, enum v4l2_buf_type i)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev sc_dev =3D video_drvdata(f=
ile);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return vb2_streamoff(&sc_dev->vb_queue, i);
> > > +}
> > > +
> > > +static const struct v4l2_ioctl_ops supercamera_ioctl_ops =3D {
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_querycap =3D supercamera_v4l2_ioctl_query=
cap,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_g_input =3D supercamera_v4l2_ioctl_g_inpu=
t,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_s_input =3D supercamera_v4l2_ioctl_s_inpu=
t,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_enum_input =3D supercamera_v4l2_ioctl_enu=
m_input,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_cap =3D supercamera_v4l2_ioc=
tl_enum_fmt_vid_cap,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_g_fmt_vid_cap =3D supercamera_v4l2_ioctl_=
g_fmt_vid_cap,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_s_fmt_vid_cap =3D supercamera_v4l2_ioctl_=
g_fmt_vid_cap,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_try_fmt_vid_cap =3D supercamera_v4l2_ioct=
l_g_fmt_vid_cap,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_g_parm =3D supercamera_v4l2_ioctl_g_parm,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_s_parm =3D supercamera_v4l2_ioctl_g_parm,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_reqbufs =3D supercamera_v4l2_ioctl_reqbuf=
s,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_querybuf =3D supercamera_v4l2_ioctl_query=
buf,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_qbuf =3D supercamera_v4l2_ioctl_qbuf,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_dqbuf =3D supercamera_v4l2_ioctl_dqbuf,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_streamon =3D supercamera_v4l2_ioctl_strea=
mon,
> > > +=C2=A0=C2=A0=C2=A0 .vidioc_streamoff =3D supercamera_v4l2_ioctl_stre=
amoff,
> > > +};
> > > +
> > > +/ USB probe/disconnect */
> > > +static int supercamera_probe(struct usb_interface *intf, const struc=
t
> > > usb_device_id *id)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev;
> > > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &intf->dev;
> > > +=C2=A0=C2=A0=C2=A0 struct usb_device *udev;
> > > +=C2=A0=C2=A0=C2=A0 int retval;
> > > +=C2=A0=C2=A0=C2=A0 int ifnum =3D intf->cur_altsetting->desc.bInterfa=
ceNumber;
> > > +=C2=A0=C2=A0=C2=A0 int altsetting =3D intf->cur_altsetting->desc.bAl=
ternateSetting;
> > > +=C2=A0=C2=A0=C2=A0 int class =3D intf->cur_altsetting->desc.bInterfa=
ceClass;
> > > +=C2=A0=C2=A0=C2=A0 int subclass =3D intf->cur_altsetting->desc.bInte=
rfaceSubClass;
> > > +=C2=A0=C2=A0=C2=A0 int protocol =3D intf->cur_altsetting->desc.bInte=
rfaceProtocol;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if (ifnum !=3D DEVICE_INTERFACE_NUMBER || class !=
=3D DEVICE_INTERFACE_CLASS
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || subclass !=3D DEVICE_I=
NTERFACE_SUBCLASS || protocol !=3D
> > > DEVICE_INTERFACE_PROTOCOL) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if (altsetting !=3D VIDEO_INTERFACE_ALTERNATE_SET=
TING) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D usb_set_interf=
ace(interface_to_usbdev(intf), ifnum,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIDEO_INTERFACE_ALTERNATE=
_SETTING);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (retval) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_err(dev, "Failed to set interface: %d\n", retval);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return retval;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 sc_dev =3D devm_kzalloc(dev, sizeof(sc_dev), GFP_=
KERNEL);
> > > +=C2=A0=C2=A0=C2=A0 if (!sc_dev)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 udev =3D interface_to_usbdev(intf);
> > > +=C2=A0=C2=A0=C2=A0 sc_dev->udev =3D udev;
> > > +=C2=A0=C2=A0=C2=A0 sc_dev->intf =3D intf;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 mutex_init(&sc_dev->vb_queue_mutex);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 spin_lock_init(&sc_dev->buffer_list_lock);
> > > +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&sc_dev->buffer_list);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 / Allocate JPEG buffer - even worst-case JPEG can=
't exceed
> > > uncompressed size */
> > > +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_buffer_size =3D CAMERA_FRAM=
E_SIZE;
> > > +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_buffer =3D devm_kzalloc(dev=
,
> > > sc_dev->protocol.jpeg_buffer_size,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> > > +=C2=A0=C2=A0=C2=A0 if (!sc_dev->protocol.jpeg_buffer) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D -ENOMEM;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_jpeg_buffer;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 retval =3D v4l2_device_register(dev, &sc_dev->v4l=
2_dev);
> > > +=C2=A0=C2=A0=C2=A0 if (retval) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to r=
egister v4l2 device: %d\n", retval);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_v4l2;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 sc_dev->vdev =3D (struct video_device) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "supercamera",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fops =3D &supercamera_fo=
ps,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ioctl_ops =3D &supercame=
ra_ioctl_ops,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .release =3D video_device=
_release_empty,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .v4l2_dev =3D &sc_dev->v4=
l2_dev,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vfl_dir =3D VFL_DIR_RX,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .device_caps =3D V4L2_CAP=
_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
> > > V4L2_CAP_STREAMING,
> > > +=C2=A0=C2=A0=C2=A0 };
> > > +
> > > +=C2=A0=C2=A0=C2=A0 video_set_drvdata(&sc_dev->vdev, sc_dev);
> > > +=C2=A0=C2=A0=C2=A0 retval =3D video_register_device(&sc_dev->vdev, V=
FL_TYPE_VIDEO, -1);
> > > +=C2=A0=C2=A0=C2=A0 if (retval) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to r=
egister video device: %d\n", retval);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_video;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 usb_set_intfdata(intf, sc_dev);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +
> > > +error_video:
> > > +=C2=A0=C2=A0=C2=A0 v4l2_device_unregister(&sc_dev->v4l2_dev);
> > > +error_v4l2:
> > > +error_jpeg_buffer:
> > > +=C2=A0=C2=A0=C2=A0 return retval;
> > > +}
> > > +
> > > +static void supercamera_disconnect(struct usb_interface *intf)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D usb_get_intfda=
ta(intf);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if (!sc_dev)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 supercamera_stop_streaming(sc_dev);
> > > +=C2=A0=C2=A0=C2=A0 supercamera_return_all_buffers(sc_dev, VB2_BUF_ST=
ATE_ERROR);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 video_unregister_device(&sc_dev->vdev);
> > > +=C2=A0=C2=A0=C2=A0 v4l2_device_unregister(&sc_dev->v4l2_dev);
> > > +=C2=A0=C2=A0=C2=A0 usb_set_intfdata(intf, NULL);
> > > +}
> > > +
> > > +static const struct usb_device_id supercamera_table[] =3D {
> > > +=C2=A0=C2=A0=C2=A0 {USB_DEVICE(USB_VENDOR_ID_SUPERCAMERA, USB_PRODUC=
T_ID_SUPERCAMERA)}, {}
> > > +};
> > > +MODULE_DEVICE_TABLE(usb, supercamera_table);
> > > +
> > > +static struct usb_driver supercamera_driver =3D {
> > > +=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
> > > +=C2=A0=C2=A0=C2=A0 .id_table =3D supercamera_table,
> > > +=C2=A0=C2=A0=C2=A0 .probe =3D supercamera_probe,
> > > +=C2=A0=C2=A0=C2=A0 .disconnect =3D supercamera_disconnect,
> > > +};
> > > +
> > > +module_usb_driver(supercamera_driver);
> > > +
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_AUTHOR("Amaury Barral useeplus.l4qli@passmail.net, Hadrien
> > > Barral hadrien.barral@univ-eiffel.fr");
> > > +MODULE_DESCRIPTION("Driver for 'Geek szitman supercamera'
> > > ('com.useeplus.protocol' protocol)");
> > > +MODULE_VERSION("1.0");


