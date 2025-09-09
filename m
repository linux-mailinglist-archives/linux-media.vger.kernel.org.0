Return-Path: <linux-media+bounces-42127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C279B50337
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 18:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1E2B1C64567
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451143568E0;
	Tue,  9 Sep 2025 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="u7VgWrpD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028831B116
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757436747; cv=none; b=ijI80LiAA6kYCaKKNsm67evUdf2AE1UBuoEMRZRHEBILCOIv6fUP51LTF5Yw15fWBp7sdk3+ryGDqITnSUwlnWa8tV/W8nn+hjo0uBLAaC7yiE63dSjrbS78sPM6QXDZuRWqh9ft9Qa2XOadzMJ1cLPTm10cRB0yUKmlV2D8ZNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757436747; c=relaxed/simple;
	bh=f8VthRlJJGQg1WFawAObaZotoct6D/Ah38cYs7pGPAs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CWOzpU8Kk1dsOGgU/HA+J10dh6v197ALGgXo186CgYo35vwBy/V7AHy7IjZD1OxEcHV5yfIy1lVvTVhHSZ5/Fn7EE0zJDnoYH4HkyXo3Rk2C83Du7DhJBKZHkoX9mRHE7GsNb4zUj54yduZsWshavc/cQNdmDvkr03RkU2FRm2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=u7VgWrpD; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70df91bdc53so47523186d6.3
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1757436743; x=1758041543; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m3YUnUjSRXPtcqqxEb5tJlUCE/Es2UsYKFMDwxReGmo=;
        b=u7VgWrpD4zCIfcFwbnt7QB/szbJcFPHdRc32aCKta8omXE2TBPA7F3tGRHRrWm9kqO
         U8Vrlx0G3fxObR+RORokA+T1M42pbs2xHZ5NGaW24TJvK5nCMNhB/HtpN6xnCOo/CII+
         Nwv/KiHIHBdx6S6GLXdTnXKAg34wYYz8TRrvRlWZo9caODvi1ImF6ImRrvUuYfaf+oTi
         YTpvDvsNx9I5tk4tG+7SzlZETqNkuRaJBxkeaIig3KtSlg9HZq0SyKmaTJ0oQ7PAvpiS
         zJ6exbPgsUOTD1VTo1zJ64fXfkTpACPZzBhBaD0gTwKe2efbtH4Em+3Bx05EeUN45UES
         dVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757436743; x=1758041543;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3YUnUjSRXPtcqqxEb5tJlUCE/Es2UsYKFMDwxReGmo=;
        b=SvD4Bxyjlmu/z70HoKHZymz9X0RGJGVTJSm9j9A+9lcqN3zKnLLuDcAa9Tl6/BH8g+
         aTkEgGx3gB8f36GPPdiser1fDy787MNo7oOKELjvi9EIUO4JFfN+ENZbDG25WNZkpFxS
         HGwxOm1uinioKl1a8a+UIcQ5sDwir8U+0iwflU3wLmdPGR0/SNfmVuh41oUlgU7BmTns
         NNgZvBCLuIZ0U+5uQJ7nP80lnDiVRMN/qnrYO8u9ig4BPT4RnG0Zg2yBDovP+Bbhnuv5
         jenM6XXWWU7cU605H8xKXRVZT57uh+Flo2SfdM0z9VfKJx8j97SZuBUf93cS5iHCZwgF
         TG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXz5P++xhG9uByS3t+DjcWzAuMnuA0uFEJ2yWJVoYkt2HQzSbYeUPnEvHOpmNwZv9U+sLJXBy6SL/cWwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7RCWGg+8WbR+MJDWcaofbjpneDCLewsm4Fg5+KruJM3KUYNq
	9p4OkHknhJS0HemO6sOprA1JGW73mxNVfiOKb9MTMtmVXpZumtzgjb/KJADdr+sYfSA=
X-Gm-Gg: ASbGncsN+uVZwiSbrsMxQCV56kAEjJ7zBYxk6cuGntNy4YKkkt1hQRRmAYu51RO6fNs
	PAFgaQ1NzhG8ZI4EGXw++bAqdPyv9IvxLzM6X6WJDOEvugv7R3/jOtV7Ktsrn/w7FDXVXelfLEn
	nVhr9m9FxpSCrFPwmTA+nwrVqUqIb+oX5Hf5qcfZqeyL3OSVAptyqluC/HqZ9kxDQ215r3zTi1N
	4otalqZ5JCqQM8szfGakOd0YqmPO+okPiWFq3qnL19K5iMmTCh+i1YRmWa5oX+57l+HSunQhKsq
	2M/n3z90flGDt5yp0kIOs9mWKlboEwWru6ZFNpu3KqFsDMLShqB/kRCMBBrO63h3WO4FZ3LmSMR
	RaQ+f9USC7k/DNrxMlhYaCDYcKpJm6xcdVhpshQ==
X-Google-Smtp-Source: AGHT+IHlyHePobZgRrCQz/yElPRcP2F3mX7JYBrM2vMriHR8fW+5DmVYeYiWhRCpxRHJzhPhUEUS+A==
X-Received: by 2002:a05:620a:472c:b0:810:b3:d287 with SMTP id af79cd13be357-813c34d6455mr1347594785a.35.1757436742907;
        Tue, 09 Sep 2025 09:52:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:d961::5ac? ([2606:6d00:15:d961::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ee69113sm143743885a.55.2025.09.09.09.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 09:52:22 -0700 (PDT)
Message-ID: <38925b932506d2a6bcd2e2f94b052a7e25694068.camel@ndufresne.ca>
Subject: Re: [PATCH] driver/media: add 'com.useeplus.protocol' USB camera
 V4L2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: useeplus.l4qli@passmail.net, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Date: Tue, 09 Sep 2025 12:52:20 -0400
In-Reply-To: <175703815458.6.14698369738764855320.888629330@passmail.net>
References: <175703815458.6.14698369738764855320.888629330@passmail.net>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zUibqkep48SOIo/nqq3h"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-zUibqkep48SOIo/nqq3h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 05 septembre 2025 =C3=A0 02:09 +0000, useeplus.l4qli@passmail.n=
et a =C3=A9crit=C2=A0:
> Add a driver for the 'Geek szitman supercamera' ('com.useeplus.protocol'
> protocol)
>=20
> This patch adds a V4L2 driver for USB cameras using the proprietary
> 'com.useeplus.protocol' protocol.
> The driver builds upon the work of
> https://github.com/hbens/geek-szitman-supercamera=C2=A0(owned by one of t=
he
> authors of this driver), and draws inspiration from the "usbtv" and
> "gspca" drivers present in the linux kernel.
>=20
> Signed-off-by: Amaury Barral <useeplus.l4qli@passmail.net>
> Co-developed-by: Hadrien Barral <hadrien.barral@univ-eiffel.fr>
> Signed-off-by: Hadrien Barral <hadrien.barral@univ-eiffel.fr>
> ---
> Note: this is my first time writing such a driver. I have tested it
> to the extent of my capabilities (multiple and fast disconnections and
> reconnections, video streaming using ffplay and firefox) and identified
> no bugs on my end. However my setup does not allow me to test, for
> instance, features such as connecting several such devices on the same
> computer.

A first step in validating your driver is to run through v4l2-compliance te=
st.
This is part of v4l2-utils  [0] project. We recommend building from source =
so
you are running the latest version.

https://git.linuxtv.org/v4l-utils.git/

Share the resulting report here. Its also nice to extend a bit more, since =
most
of the reviewers don't know about these cameras. Le us know what features t=
he
camera have and what you have implemented.

regards,
Nicolas

>=20
> diff -uprN linux-master/drivers/media/usb/Kconfig=20
> linux-master-modified/drivers/media/usb/Kconfig
> --- linux-master/drivers/media/usb/Kconfig=C2=A0=C2=A0=C2=A0 2025-08-18=
=20
> 07:22:10.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/Kconfig=C2=A0=C2=A0=C2=A0 202=
5-09-04=20
> 11:29:37.667388721 +0900
> @@ -17,6 +17,7 @@ source "drivers/media/usb/gspca/Kconfig"
> =C2=A0=C2=A0source "drivers/media/usb/pwc/Kconfig"
> =C2=A0=C2=A0source "drivers/media/usb/s2255/Kconfig"
> =C2=A0=C2=A0source "drivers/media/usb/usbtv/Kconfig"
> +source "drivers/media/usb/useeplus/Kconfig"
> =C2=A0=C2=A0source "drivers/media/usb/uvc/Kconfig"
>=20
> =C2=A0=C2=A0endif
> diff -uprN linux-master/drivers/media/usb/Makefile=20
> linux-master-modified/drivers/media/usb/Makefile
> --- linux-master/drivers/media/usb/Makefile=C2=A0=C2=A0=C2=A0 2025-08-18=
=20
> 07:22:10.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/Makefile=C2=A0=C2=A0=C2=A0 20=
25-09-04=20
> 11:30:14.977994923 +0900
> @@ -30,3 +30,4 @@ obj-$(CONFIG_VIDEO_HDPVR) +=3D hdpvr/
> =C2=A0=C2=A0obj-$(CONFIG_VIDEO_PVRUSB2) +=3D pvrusb2/
> =C2=A0=C2=A0obj-$(CONFIG_VIDEO_STK1160) +=3D stk1160/
> =C2=A0=C2=A0obj-$(CONFIG_VIDEO_USBTV) +=3D usbtv/
> +obj-$(CONFIG_VIDEO_USEEPLUS) +=3D useeplus/
> diff -uprN linux-master/drivers/media/usb/useeplus/Kconfig=20
> linux-master-modified/drivers/media/usb/useeplus/Kconfig
> --- linux-master/drivers/media/usb/useeplus/Kconfig=C2=A0=C2=A0=C2=A0 197=
0-01-01=20
> 09:00:00.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/useeplus/Kconfig 2025-09-03=
=20
> 21:11:01.080048349 +0900
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_USEEPLUS
> +=C2=A0=C2=A0=C2=A0 tristate "UseePlus cameras support"
> +=C2=A0=C2=A0=C2=A0 depends on VIDEO_DEV
> +=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_VMALLOC
> +
> +=C2=A0=C2=A0=C2=A0 help
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is a video4linux2 driver for UseePlu=
s based cameras.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Currently only supports the following har=
dware:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Geek szitman supercamera, USB-ID 2ce3:3=
828.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a module, choos=
e M here: the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module will be called useeplus
> diff -uprN linux-master/drivers/media/usb/useeplus/Makefile=20
> linux-master-modified/drivers/media/usb/useeplus/Makefile
> --- linux-master/drivers/media/usb/useeplus/Makefile=C2=A0=C2=A0=C2=A0 19=
70-01-01=20
> 09:00:00.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/useeplus/Makefile 2025-09-03=
=20
> 21:11:01.080048349 +0900
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +useeplus-y :=3D supercamera.o
> +
> +obj-$(CONFIG_VIDEO_USEEPLUS) +=3D supercamera.o
> diff -uprN linux-master/drivers/media/usb/useeplus/supercamera.c=20
> linux-master-modified/drivers/media/usb/useeplus/supercamera.c
> --- linux-master/drivers/media/usb/useeplus/supercamera.c 1970-01-01=20
> 09:00:00.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/useeplus/supercamera.c=20
> 2025-09-03 21:11:01.080048349 +0900
> @@ -0,0 +1,805 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * supercamera_v4l2.c - V4L2 driver for "Geek szitman supercamera" USB
> + *=C2=A0 endoscope
> + *
> + * This driver supports USB cameras that use the proprietary
> + *=C2=A0 "com.useeplus.protocol". The camera shows up as a standard V4L2=
 video
> + *=C2=A0 device.
> + *
> + * The camera uses a basic protocol where JPEG frames are split across
> + *=C2=A0 multiple USB packets.
> + * Each USB packet has a 5-byte header (magic 0xBBAA + camera ID + lengt=
h)
> + *=C2=A0 followed by a camera frame with a 7-byte header
> + *=C2=A0 (frame ID + camera number + flags) and then JPEG data.
> + *=C2=A0 We accumulate the JPEG data until the frame ID changes, then de=
liver
> + *=C2=A0 the complete frame.
> + *
> + * Currently, we only supports the following hardware:
> + *=C2=A0=C2=A0 Name: Geek szitman supercamera (from USB descriptors)
> + *=C2=A0=C2=A0 USB ID: 2ce3:3828
> + *=C2=A0=C2=A0 Resolution: 640x480 JPEG only
> + *=C2=A0=C2=A0 Frame rate: ~30 FPS
> + *
> + * This driver is based on patterns from usbtv and gspca drivers.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/usb.h>
> +#include <linux/videodev2.h>
> +#include <linux/wait.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#define DRIVER_NAME "supercamera"
> +
> +#define USB_VENDOR_ID_SUPERCAMERA 0x2ce3
> +#define USB_PRODUCT_ID_SUPERCAMERA 0x3828
> +
> +#define CONTROL_INTERFACE_NUMBER 0
> +#define VIDEO_INTERFACE_NUMBER 1
> +#define VIDEO_INTERFACE_ALTERNATE_SETTING 1
> +
> +#define ENDPOINT_1_IN 0x81
> +#define ENDPOINT_1_OUT 0x01
> +#define ENDPOINT_2_IN 0x82
> +#define ENDPOINT_2_OUT 0x02
> +
> +#define URB_BUFFER_SIZE 0x1000
> +#define MAX_URBS 4
> +
> +#define UPP_USB_MAGIC 0xBBAA
> +#define UPP_CAMID_7 7
> +
> +#define CAMERA_WIDTH 640
> +#define CAMERA_HEIGHT 480
> +#define CAMERA_FRAME_SIZE (CAMERA_WIDTH * CAMERA_HEIGHT * 3)
> +
> +/* USB interface descriptors constants for this device */
> +#define DEVICE_INTERFACE_NUMBER 0x1
> +#define DEVICE_INTERFACE_CLASS 0xff
> +#define DEVICE_INTERFACE_SUBCLASS 0xf0
> +#define DEVICE_INTERFACE_PROTOCOL 0x01
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 DATA MODELS =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D */
> +
> +/* USB frame header (5 bytes) */
> +struct upp_usb_frame {
> +=C2=A0=C2=A0=C2=A0 __le16 magic;
> +=C2=A0=C2=A0=C2=A0 __u8 cid;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* camera id =
*/
> +=C2=A0=C2=A0=C2=A0 __le16 length; /* does not include the 5-bytes header=
 length */
> +} __packed;
> +
> +/* Camera frame header (7 bytes) */
> +struct upp_cam_frame {
> +=C2=A0=C2=A0=C2=A0 __u8 fid;=C2=A0=C2=A0=C2=A0=C2=A0 /* frame id */
> +=C2=A0=C2=A0=C2=A0 __u8 cam_num; /* camera number */
> +=C2=A0=C2=A0=C2=A0 /* flags byte */
> +=C2=A0=C2=A0=C2=A0 __u8 unused_A : 1;
> +=C2=A0=C2=A0=C2=A0 __u8 button_press : 1;
> +=C2=A0=C2=A0=C2=A0 __u8 unused_B : 6;
> +=C2=A0=C2=A0=C2=A0 __le32 unused_C;
> +} __packed;
> +
> +/* Buffer wrapper for our buffer list */
> +struct supercamera_buffer {
> +=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer vb;
> +=C2=A0=C2=A0=C2=A0 struct list_head list;
> +};
> +
> +struct supercamera_dev {
> +=C2=A0=C2=A0=C2=A0 struct usb_device *udev;
> +=C2=A0=C2=A0=C2=A0 struct v4l2_device v4l2_dev;
> +=C2=A0=C2=A0=C2=A0 struct video_device vdev;
> +=C2=A0=C2=A0=C2=A0 struct vb2_queue vb_queue;
> +=C2=A0=C2=A0=C2=A0 struct mutex vb_queue_mutex; /* Protects vb_queue */
> +
> +=C2=A0=C2=A0=C2=A0 /* USB interface and endpoint information */
> +=C2=A0=C2=A0=C2=A0 struct usb_interface *intf;
> +=C2=A0=C2=A0=C2=A0 struct urb *urbs[MAX_URBS];
> +=C2=A0=C2=A0=C2=A0 char *urb_buffers[MAX_URBS];
> +=C2=A0=C2=A0=C2=A0 dma_addr_t urb_dma_handles[MAX_URBS];
> +
> +=C2=A0=C2=A0=C2=A0 /* Buffer management */
> +=C2=A0=C2=A0=C2=A0 spinlock_t buffer_list_lock; /* Protects buffer list =
*/
> +=C2=A0=C2=A0=C2=A0 struct list_head buffer_list;
> +
> +=C2=A0=C2=A0=C2=A0 /* Device state */
> +=C2=A0=C2=A0=C2=A0 bool streaming;
> +
> +=C2=A0=C2=A0=C2=A0 /* Protocol handling */
> +=C2=A0=C2=A0=C2=A0 struct {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Buffer for accumulating JP=
EG data */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *jpeg_buffer;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t jpeg_buffer_size;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t jpeg_data_size;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Current frame ID tracking =
*/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t current_fid;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_frame_id;
> +=C2=A0=C2=A0=C2=A0 } protocol;
> +};
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 DEVICE INFRASTRUCTURE =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D */
> +
> +static void supercamera_complete_frame(struct supercamera_dev *sc_dev)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_buffer *buf =3D NULL;
> +=C2=A0=C2=A0=C2=A0 unsigned long flags;
> +
> +=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&sc_dev->buffer_list_lock, flags);
> +=C2=A0=C2=A0=C2=A0 if (!list_empty(&sc_dev->buffer_list)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D list_first_entry(&sc_=
dev->buffer_list, struct=20
> supercamera_buffer, list);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del(&buf->list);
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&sc_dev->buffer_list_lock, fla=
gs);
> +
> +=C2=A0=C2=A0=C2=A0 if (!buf) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_data_si=
ze =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if (sc_dev->protocol.jpeg_data_size <=3D=20
> vb2_plane_size(&buf->vb.vb2_buf, 0)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *vaddr =3D vb2_plane_vad=
dr(&buf->vb.vb2_buf, 0);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(vaddr, sc_dev->protoco=
l.jpeg_buffer,=20
> sc_dev->protocol.jpeg_data_size);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_set_plane_payload(&buf->v=
b.vb2_buf, 0,=20
> sc_dev->protocol.jpeg_data_size);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_buffer_done(&buf->vb.vb2_=
buf, VB2_BUF_STATE_DONE);
> +=C2=A0=C2=A0=C2=A0 } else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_buffer_done(&buf->vb.vb2_=
buf, VB2_BUF_STATE_ERROR);
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_data_size =3D 0;
> +}
> +
> +static void supercamera_handle_upp_frame(struct supercamera_dev *sc_dev,
> +=C2=A0=C2=A0=C2=A0 const struct upp_usb_frame *frame, const char *data, =
size_t length)
> +{
> +=C2=A0=C2=A0=C2=A0 const struct upp_cam_frame *cam_frame;
> +=C2=A0=C2=A0=C2=A0 size_t cam_header_len =3D sizeof(struct upp_cam_frame=
);
> +=C2=A0=C2=A0=C2=A0 uint8_t new_fid;
> +
> +=C2=A0=C2=A0=C2=A0 if (length < cam_header_len)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +
> +=C2=A0=C2=A0=C2=A0 cam_frame =3D (const struct upp_cam_frame *)data;
> +=C2=A0=C2=A0=C2=A0 new_fid =3D cam_frame->fid;
> +
> +=C2=A0=C2=A0=C2=A0 /* Frame boundary detected - complete previous frame =
*/
> +=C2=A0=C2=A0=C2=A0 if (sc_dev->protocol.jpeg_data_size > 0 &&=20
> sc_dev->protocol.has_frame_id
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && sc_dev->protocol.current_f=
id !=3D new_fid) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supercamera_complete_frame(sc=
_dev);
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if (sc_dev->protocol.jpeg_data_size =3D=3D 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->protocol.current_fid =
=3D new_fid;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->protocol.has_frame_id=
 =3D true;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /*=C2=A0 // Not used, but left just in case
> +=C2=A0=C2=A0=C2=A0=C2=A0 * if (cam_frame->button_press) {
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(dev, "Button=
 press event detected\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0 * }
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +
> +=C2=A0=C2=A0=C2=A0 if (length > cam_header_len) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t data_len =3D length - =
cam_header_len;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sc_dev->protocol.jpeg_dat=
a_size + data_len >
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_de=
v->protocol.jpeg_buffer_size) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_de=
v->protocol.jpeg_data_size =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(sc_dev->protocol.jpeg_=
buffer +=20
> sc_dev->protocol.jpeg_data_size,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data =
+ cam_header_len, data_len);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_data_si=
ze +=3D data_len;
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +static void supercamera_return_all_buffers(struct supercamera_dev *sc_de=
v,
> +=C2=A0=C2=A0=C2=A0 enum vb2_buffer_state state)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_buffer *buf, *tmp;
> +=C2=A0=C2=A0=C2=A0 unsigned long flags;
> +
> +=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&sc_dev->buffer_list_lock, flags);
> +=C2=A0=C2=A0=C2=A0 list_for_each_entry_safe(buf, tmp, &sc_dev->buffer_li=
st, list) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del(&buf->list);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_buffer_done(&buf->vb.vb2_=
buf, state);
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&sc_dev->buffer_list_lock, fla=
gs);
> +}
> +
> +static int supercamera_send_initial_commands(struct supercamera_dev=20
> *sc_dev)
> +{
> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> +=C2=A0=C2=A0=C2=A0 int ret;
> +
> +=C2=A0=C2=A0=C2=A0 /* Device initialization command for endpoint 2 */
> +=C2=A0=C2=A0=C2=A0 const char ep2_cmd[] =3D {0xFF, 0x55, 0xFF, 0x55, 0xE=
E, 0x10};
> +
> +=C2=A0=C2=A0=C2=A0 ret =3D usb_bulk_msg(sc_dev->udev, usb_sndbulkpipe(sc=
_dev->udev,=20
> ENDPOINT_2_OUT),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void *)ep2_cmd, sizeof(ep2_c=
md), NULL, 1000);
> +=C2=A0=C2=A0=C2=A0 if (ret) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to send =
EP2 command: %d\n", ret);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /* Start streaming command (UPP protocol header) */
> +=C2=A0=C2=A0=C2=A0 const char start_stream_cmd[] =3D {0xBB, 0xAA, 5, 0, =
0};
> +
> +=C2=A0=C2=A0=C2=A0 ret =3D usb_bulk_msg(sc_dev->udev, usb_sndbulkpipe(sc=
_dev->udev,=20
> ENDPOINT_1_OUT),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void *)start_stream_cmd, siz=
eof(start_stream_cmd), NULL, 1000);
> +=C2=A0=C2=A0=C2=A0 if (ret) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to send =
start stream command: %d\n", ret);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static void supercamera_urb_complete(struct urb *urb)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D urb->context;
> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> +=C2=A0=C2=A0=C2=A0 int ret;
> +
> +=C2=A0=C2=A0=C2=A0 if (!sc_dev)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +
> +=C2=A0=C2=A0=C2=A0 switch (urb->status) {
> +=C2=A0=C2=A0=C2=A0 case 0:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0 case -ECONNRESET:
> +=C2=A0=C2=A0=C2=A0 case -ENOENT:
> +=C2=A0=C2=A0=C2=A0 case -ESHUTDOWN:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 default:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!sc_dev->streaming)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_submit_urb(urb, GFP_ATOMI=
C);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if (urb->actual_length > 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *data =3D urb->tra=
nsfer_buffer;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t len =3D urb->actual_le=
ngth;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t offset =3D 0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (offset + sizeof(struct=
 upp_usb_frame) <=3D len) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=
 struct upp_usb_frame *frame =3D
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (const struct upp_usb_frame *)(data + offset);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_=
t frame_len =3D
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sizeof(struct upp_usb_frame) + le16_to_cpu(frame->length=
);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (o=
ffset + frame_len > len)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (l=
e16_to_cpu(frame->magic) !=3D UPP_USB_MAGIC) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 offset++;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 continue;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (f=
rame->cid !=3D UPP_CAMID_7) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 offset +=3D frame_len;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 continue;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 super=
camera_handle_upp_frame(sc_dev, frame,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 data + offset + sizeof(struct upp_usb_frame),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 le16_to_cpu(frame->length));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offse=
t +=3D frame_len;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if (sc_dev->streaming) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D usb_submit_urb(urb, G=
FP_ATOMIC);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_e=
rr(dev, "Failed to resubmit URB: %d\n", ret);
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +#define CLEANUP_URBS(sc_dev) \
> +do { \
> +=C2=A0=C2=A0=C2=A0 int i; \
> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < MAX_URBS; i++) { \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((sc_dev)->urbs[i]) { \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_k=
ill_urb((sc_dev)->urbs[i]); \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_f=
ree_urb((sc_dev)->urbs[i]); \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (sc_d=
ev)->urbs[i] =3D NULL; \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((sc_dev)->urb_buffers[i])=
 { \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_f=
ree_coherent((sc_dev)->udev, URB_BUFFER_SIZE, \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (sc_dev)->urb_buffers[i], (sc_dev)->urb_dma_handles[i]);=
 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (sc_d=
ev)->urb_buffers[i] =3D NULL; \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } \
> +=C2=A0=C2=A0=C2=A0 } \
> +} while (0)
> +
> +static int supercamera_start_streaming(struct supercamera_dev *sc_dev)
> +{
> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> +=C2=A0=C2=A0=C2=A0 int ret;
> +=C2=A0=C2=A0=C2=A0 int i;
> +
> +=C2=A0=C2=A0=C2=A0 ret =3D supercamera_send_initial_commands(sc_dev);
> +=C2=A0=C2=A0=C2=A0 if (ret) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to send =
initial commands: %d\n", ret);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 usb_clear_halt(sc_dev->udev, usb_rcvbulkpipe(sc_dev->=
udev,=20
> ENDPOINT_1_IN));
> +
> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < MAX_URBS; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->urbs[i] =3D usb_alloc=
_urb(0, GFP_KERNEL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!sc_dev->urbs[i]) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_e=
rr(dev, "Failed to allocate URB\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =
=3D -ENOMEM;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
error;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->urb_buffers[i] =3D us=
b_alloc_coherent(sc_dev->udev,=20
> URB_BUFFER_SIZE,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_K=
ERNEL, &sc_dev->urb_dma_handles[i]);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!sc_dev->urb_buffers[i]) =
{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_e=
rr(dev, "Failed to allocate URB buffer\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =
=3D -ENOMEM;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
error;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_fill_bulk_urb(sc_dev->urb=
s[i], sc_dev->udev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_r=
cvbulkpipe(sc_dev->udev, ENDPOINT_1_IN),=20
> sc_dev->urb_buffers[i],
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 URB_B=
UFFER_SIZE, supercamera_urb_complete, sc_dev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->urbs[i]->transfer_dma=
 =3D sc_dev->urb_dma_handles[i];
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->urbs[i]->transfer_fla=
gs |=3D URB_NO_TRANSFER_DMA_MAP;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < MAX_URBS; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D usb_submit_urb(sc_dev=
->urbs[i], GFP_KERNEL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_e=
rr(dev, "Failed to submit URB %d: %d\n", i, ret);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
error;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.has_frame_id =3D false;
> +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_data_size =3D 0;
> +
> +=C2=A0=C2=A0=C2=A0 sc_dev->streaming =3D true;
> +=C2=A0=C2=A0=C2=A0 return 0;
> +
> +error:
> +=C2=A0=C2=A0=C2=A0 CLEANUP_URBS(sc_dev);
> +
> +=C2=A0=C2=A0=C2=A0 return ret;
> +}
> +
> +static void supercamera_stop_streaming(struct supercamera_dev *sc_dev)
> +{
> +=C2=A0=C2=A0=C2=A0 sc_dev->streaming =3D false;
> +=C2=A0=C2=A0=C2=A0 CLEANUP_URBS(sc_dev);
> +}
> +
> +/* VB2 operations */
> +static int supercamera_vb2_queue_setup(struct vb2_queue *vq, unsigned=
=20
> int *nbuffers,
> +=C2=A0=C2=A0=C2=A0 unsigned int *nplanes, unsigned int sizes[], struct d=
evice=20
> *alloc_devs[])
> +{
> +=C2=A0=C2=A0=C2=A0 if (*nbuffers < 2)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *nbuffers =3D 2;
> +
> +=C2=A0=C2=A0=C2=A0 if (*nplanes) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sizes[0] < CAMERA_WIDTH *=
 CAMERA_HEIGHT)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n -EINVAL;
> +=C2=A0=C2=A0=C2=A0 } else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizes[0] =3D CAMERA_FRAME_SIZ=
E;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *nplanes =3D 1;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D vb2_get_drv_priv(v=
b->vb2_queue);
> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> +
> +=C2=A0=C2=A0=C2=A0 if (vb2_plane_size(vb, 0) < CAMERA_WIDTH * CAMERA_HEI=
GHT) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Buffer size too=
 small\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static void supercamera_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D vb2_get_drv_priv(v=
b->vb2_queue);
> +=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(v=
b);
> +=C2=A0=C2=A0=C2=A0 struct supercamera_buffer *buf =3D container_of(vbuf,=
 struct=20
> supercamera_buffer, vb);
> +=C2=A0=C2=A0=C2=A0 unsigned long flags;
> +
> +=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&sc_dev->buffer_list_lock, flags);
> +=C2=A0=C2=A0=C2=A0 list_add_tail(&buf->list, &sc_dev->buffer_list);
> +=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&sc_dev->buffer_list_lock, fla=
gs);
> +}
> +
> +static int supercamera_vb2_start_streaming(struct vb2_queue *vq,=20
> unsigned int count)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D vb2_get_drv_priv(v=
q);
> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> +=C2=A0=C2=A0=C2=A0 int ret;
> +
> +=C2=A0=C2=A0=C2=A0 if (count =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> +
> +=C2=A0=C2=A0=C2=A0 ret =3D supercamera_start_streaming(sc_dev);
> +=C2=A0=C2=A0=C2=A0 if (ret) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to start=
 USB streaming: %d\n", ret);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static void supercamera_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D vb2_get_drv_priv(v=
q);
> +
> +=C2=A0=C2=A0=C2=A0 supercamera_return_all_buffers(sc_dev, VB2_BUF_STATE_=
ERROR);
> +=C2=A0=C2=A0=C2=A0 supercamera_stop_streaming(sc_dev);
> +}
> +
> +static const struct vb2_ops supercamera_vb2_ops =3D {
> +=C2=A0=C2=A0=C2=A0 .queue_setup =3D supercamera_vb2_queue_setup,
> +=C2=A0=C2=A0=C2=A0 .buf_prepare =3D supercamera_vb2_buf_prepare,
> +=C2=A0=C2=A0=C2=A0 .buf_queue =3D supercamera_vb2_buf_queue,
> +=C2=A0=C2=A0=C2=A0 .start_streaming =3D supercamera_vb2_start_streaming,
> +=C2=A0=C2=A0=C2=A0 .stop_streaming =3D supercamera_vb2_stop_streaming,
> +=C2=A0=C2=A0=C2=A0 .wait_prepare =3D vb2_ops_wait_prepare,
> +=C2=A0=C2=A0=C2=A0 .wait_finish =3D vb2_ops_wait_finish,
> +};
> +
> +/* V4L2 file operations */
> +static int supercamera_v4l2_open(struct file *file)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &sc_dev->intf->dev;
> +=C2=A0=C2=A0=C2=A0 struct v4l2_fh *fh;
> +=C2=A0=C2=A0=C2=A0 int ret;
> +
> +=C2=A0=C2=A0=C2=A0 fh =3D kzalloc(sizeof(*fh), GFP_KERNEL);
> +=C2=A0=C2=A0=C2=A0 if (!fh)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> +
> +=C2=A0=C2=A0=C2=A0 v4l2_fh_init(fh, &sc_dev->vdev);
> +=C2=A0=C2=A0=C2=A0 v4l2_fh_add(fh);
> +=C2=A0=C2=A0=C2=A0 file->private_data =3D fh;
> +
> +=C2=A0=C2=A0=C2=A0 if (sc_dev->vb_queue.type =3D=3D 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.type =3D V4L=
2_BUF_TYPE_VIDEO_CAPTURE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.io_modes =3D=
 VB2_MMAP | VB2_USERPTR | VB2_DMABUF=20
> > VB2_READ;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.buf_struct_s=
ize =3D sizeof(struct=20
> supercamera_buffer);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.ops =3D &sup=
ercamera_vb2_ops;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.mem_ops =3D =
&vb2_vmalloc_memops;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.timestamp_fl=
ags =3D=20
> V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.dev =3D dev;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.lock =3D &sc=
_dev->vb_queue_mutex;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_dev->vb_queue.drv_priv =3D=
 sc_dev;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D vb2_queue_init(&sc_de=
v->vb_queue);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_e=
rr(dev, "Failed to initialize VB2 queue: %d\n", ret);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_=
fh_del(fh);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_=
fh_exit(fh);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree=
(fh);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n ret;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_v4l2_release(struct file *file)
> +{
> +=C2=A0=C2=A0=C2=A0 struct v4l2_fh *fh =3D file->private_data;
> +
> +=C2=A0=C2=A0=C2=A0 v4l2_fh_del(fh);
> +=C2=A0=C2=A0=C2=A0 v4l2_fh_exit(fh);
> +=C2=A0=C2=A0=C2=A0 kfree(fh);
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static __poll_t supercamera_v4l2_poll(struct file *file, struct=20
> poll_table_struct *wait)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +
> +=C2=A0=C2=A0=C2=A0 return vb2_poll(&sc_dev->vb_queue, file, wait);
> +}
> +
> +static int supercamera_v4l2_mmap(struct file *file, struct=20
> vm_area_struct *vma)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +
> +=C2=A0=C2=A0=C2=A0 return vb2_mmap(&sc_dev->vb_queue, vma);
> +}
> +
> +static const struct v4l2_file_operations supercamera_fops =3D {
> +=C2=A0=C2=A0=C2=A0 .owner =3D THIS_MODULE,
> +=C2=A0=C2=A0=C2=A0 .open =3D supercamera_v4l2_open,
> +=C2=A0=C2=A0=C2=A0 .release =3D supercamera_v4l2_release,
> +=C2=A0=C2=A0=C2=A0 .poll =3D supercamera_v4l2_poll,
> +=C2=A0=C2=A0=C2=A0 .mmap =3D supercamera_v4l2_mmap,
> +=C2=A0=C2=A0=C2=A0 .unlocked_ioctl =3D video_ioctl2,
> +};
> +
> +/* V4L2 ioctl operations */
> +static int supercamera_v4l2_ioctl_querycap(struct file *file, void *fh,=
=20
> struct v4l2_capability *cap)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +=C2=A0=C2=A0=C2=A0 char manufacturer[128];
> +=C2=A0=C2=A0=C2=A0 char product[128];
> +
> +=C2=A0=C2=A0=C2=A0 strscpy(cap->driver, DRIVER_NAME, sizeof(cap->driver)=
);
> +
> +=C2=A0=C2=A0=C2=A0 if (usb_string(sc_dev->udev,=20
> sc_dev->udev->descriptor.iManufacturer, manufacturer,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeo=
f(manufacturer)) >=3D 0 && usb_string(sc_dev->udev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_de=
v->udev->descriptor.iProduct, product,=20
> sizeof(product)) >=3D 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snprintf(cap->card, sizeof(ca=
p->card), "%s: %s", manufacturer,=20
> product);
> +=C2=A0=C2=A0=C2=A0 } else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strscpy(cap->card, "Unknown U=
seePlus USB camera",=20
> sizeof(cap->card));
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 usb_make_path(sc_dev->udev, cap->bus_info, sizeof(cap=
->bus_info));
> +
> +=C2=A0=C2=A0=C2=A0 cap->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CA=
P_READWRITE |=20
> V4L2_CAP_STREAMING;
> +=C2=A0=C2=A0=C2=A0 cap->capabilities =3D cap->device_caps | V4L2_CAP_DEV=
ICE_CAPS;
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_g_input(struct file *file, void *fh,=
=20
> unsigned int *i)
> +{
> +=C2=A0=C2=A0=C2=A0 *i =3D 0;
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_s_input(struct file *file, void *fh,=
=20
> unsigned int i)
> +{
> +=C2=A0=C2=A0=C2=A0 if (i > 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_enum_input(struct file *file, void=20
> *fh, struct v4l2_input *input)
> +{
> +=C2=A0=C2=A0=C2=A0 if (input->index > 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> +
> +=C2=A0=C2=A0=C2=A0 strscpy(input->name, "Camera", sizeof(input->name));
> +=C2=A0=C2=A0=C2=A0 input->type =3D V4L2_INPUT_TYPE_CAMERA;
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_enum_fmt_vid_cap(struct file *file,=
=20
> void *fh,
> +=C2=A0=C2=A0=C2=A0 struct v4l2_fmtdesc *f)
> +{
> +=C2=A0=C2=A0=C2=A0 if (f->index !=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> +
> +=C2=A0=C2=A0=C2=A0 f->pixelformat =3D V4L2_PIX_FMT_JPEG;
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_g_fmt_vid_cap(struct file *file, void=
=20
> *fh, struct v4l2_format *f)
> +{
> +=C2=A0=C2=A0=C2=A0 f->fmt.pix.width =3D CAMERA_WIDTH;
> +=C2=A0=C2=A0=C2=A0 f->fmt.pix.height =3D CAMERA_HEIGHT;
> +=C2=A0=C2=A0=C2=A0 f->fmt.pix.pixelformat =3D V4L2_PIX_FMT_JPEG;
> +=C2=A0=C2=A0=C2=A0 f->fmt.pix.field =3D V4L2_FIELD_NONE;
> +=C2=A0=C2=A0=C2=A0 f->fmt.pix.bytesperline =3D 0;
> +=C2=A0=C2=A0=C2=A0 f->fmt.pix.sizeimage =3D CAMERA_FRAME_SIZE;
> +=C2=A0=C2=A0=C2=A0 f->fmt.pix.colorspace =3D V4L2_COLORSPACE_JPEG;
> +=C2=A0=C2=A0=C2=A0 f->fmt.pix.priv =3D 0;
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_g_parm(struct file *file, void *fh,=
=20
> struct v4l2_streamparm *a)
> +{
> +=C2=A0=C2=A0=C2=A0 if (a->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> +
> +=C2=A0=C2=A0=C2=A0 a->parm.capture.capability =3D V4L2_CAP_TIMEPERFRAME;
> +=C2=A0=C2=A0=C2=A0 a->parm.capture.capturemode =3D 0;
> +=C2=A0=C2=A0=C2=A0 a->parm.capture.timeperframe.numerator =3D 1;
> +=C2=A0=C2=A0=C2=A0 a->parm.capture.timeperframe.denominator =3D 30;
> +=C2=A0=C2=A0=C2=A0 a->parm.capture.extendedmode =3D 0;
> +=C2=A0=C2=A0=C2=A0 a->parm.capture.readbuffers =3D 2;
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_reqbufs(struct file *file, void *fh,
> +=C2=A0=C2=A0=C2=A0 struct v4l2_requestbuffers *rb)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +
> +=C2=A0=C2=A0=C2=A0 return vb2_reqbufs(&sc_dev->vb_queue, rb);
> +}
> +
> +static int supercamera_v4l2_ioctl_querybuf(struct file *file, void *fh,=
=20
> struct v4l2_buffer *b)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +
> +=C2=A0=C2=A0=C2=A0 return vb2_querybuf(&sc_dev->vb_queue, b);
> +}
> +
> +static int supercamera_v4l2_ioctl_qbuf(struct file *file, void *fh,=20
> struct v4l2_buffer *b)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +
> +=C2=A0=C2=A0=C2=A0 return vb2_qbuf(&sc_dev->vb_queue, NULL, b);
> +}
> +
> +static int supercamera_v4l2_ioctl_dqbuf(struct file *file, void *fh,=20
> struct v4l2_buffer *b)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +
> +=C2=A0=C2=A0=C2=A0 return vb2_dqbuf(&sc_dev->vb_queue, b, file->f_flags =
& O_NONBLOCK);
> +}
> +
> +static int supercamera_v4l2_ioctl_streamon(struct file *file, void *fh,=
=20
> enum v4l2_buf_type i)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +
> +=C2=A0=C2=A0=C2=A0 return vb2_streamon(&sc_dev->vb_queue, i);
> +}
> +
> +static int supercamera_v4l2_ioctl_streamoff(struct file *file, void=20
> *fh, enum v4l2_buf_type i)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D video_drvdata(file=
);
> +
> +=C2=A0=C2=A0=C2=A0 return vb2_streamoff(&sc_dev->vb_queue, i);
> +}
> +
> +static const struct v4l2_ioctl_ops supercamera_ioctl_ops =3D {
> +=C2=A0=C2=A0=C2=A0 .vidioc_querycap =3D supercamera_v4l2_ioctl_querycap,
> +=C2=A0=C2=A0=C2=A0 .vidioc_g_input =3D supercamera_v4l2_ioctl_g_input,
> +=C2=A0=C2=A0=C2=A0 .vidioc_s_input =3D supercamera_v4l2_ioctl_s_input,
> +=C2=A0=C2=A0=C2=A0 .vidioc_enum_input =3D supercamera_v4l2_ioctl_enum_in=
put,
> +=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_cap =3D supercamera_v4l2_ioctl_e=
num_fmt_vid_cap,
> +=C2=A0=C2=A0=C2=A0 .vidioc_g_fmt_vid_cap =3D supercamera_v4l2_ioctl_g_fm=
t_vid_cap,
> +=C2=A0=C2=A0=C2=A0 .vidioc_s_fmt_vid_cap =3D supercamera_v4l2_ioctl_g_fm=
t_vid_cap,
> +=C2=A0=C2=A0=C2=A0 .vidioc_try_fmt_vid_cap =3D supercamera_v4l2_ioctl_g_=
fmt_vid_cap,
> +=C2=A0=C2=A0=C2=A0 .vidioc_g_parm =3D supercamera_v4l2_ioctl_g_parm,
> +=C2=A0=C2=A0=C2=A0 .vidioc_s_parm =3D supercamera_v4l2_ioctl_g_parm,
> +=C2=A0=C2=A0=C2=A0 .vidioc_reqbufs =3D supercamera_v4l2_ioctl_reqbufs,
> +=C2=A0=C2=A0=C2=A0 .vidioc_querybuf =3D supercamera_v4l2_ioctl_querybuf,
> +=C2=A0=C2=A0=C2=A0 .vidioc_qbuf =3D supercamera_v4l2_ioctl_qbuf,
> +=C2=A0=C2=A0=C2=A0 .vidioc_dqbuf =3D supercamera_v4l2_ioctl_dqbuf,
> +=C2=A0=C2=A0=C2=A0 .vidioc_streamon =3D supercamera_v4l2_ioctl_streamon,
> +=C2=A0=C2=A0=C2=A0 .vidioc_streamoff =3D supercamera_v4l2_ioctl_streamof=
f,
> +};
> +
> +/* USB probe/disconnect */
> +static int supercamera_probe(struct usb_interface *intf, const struct=
=20
> usb_device_id *id)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev;
> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &intf->dev;
> +=C2=A0=C2=A0=C2=A0 struct usb_device *udev;
> +=C2=A0=C2=A0=C2=A0 int retval;
> +=C2=A0=C2=A0=C2=A0 int ifnum =3D intf->cur_altsetting->desc.bInterfaceNu=
mber;
> +=C2=A0=C2=A0=C2=A0 int altsetting =3D intf->cur_altsetting->desc.bAltern=
ateSetting;
> +=C2=A0=C2=A0=C2=A0 int class =3D intf->cur_altsetting->desc.bInterfaceCl=
ass;
> +=C2=A0=C2=A0=C2=A0 int subclass =3D intf->cur_altsetting->desc.bInterfac=
eSubClass;
> +=C2=A0=C2=A0=C2=A0 int protocol =3D intf->cur_altsetting->desc.bInterfac=
eProtocol;
> +
> +=C2=A0=C2=A0=C2=A0 if (ifnum !=3D DEVICE_INTERFACE_NUMBER || class !=3D =
DEVICE_INTERFACE_CLASS
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || subclass !=3D DEVICE_INTER=
FACE_SUBCLASS || protocol !=3D=20
> DEVICE_INTERFACE_PROTOCOL) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if (altsetting !=3D VIDEO_INTERFACE_ALTERNATE_SETTING=
) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D usb_set_interface(=
interface_to_usbdev(intf), ifnum,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIDEO_INTERFACE_ALTERNATE_SET=
TING);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (retval) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_e=
rr(dev, "Failed to set interface: %d\n", retval);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n retval;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 sc_dev =3D devm_kzalloc(dev, sizeof(*sc_dev), GFP_KER=
NEL);
> +=C2=A0=C2=A0=C2=A0 if (!sc_dev)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> +
> +=C2=A0=C2=A0=C2=A0 udev =3D interface_to_usbdev(intf);
> +=C2=A0=C2=A0=C2=A0 sc_dev->udev =3D udev;
> +=C2=A0=C2=A0=C2=A0 sc_dev->intf =3D intf;
> +
> +=C2=A0=C2=A0=C2=A0 mutex_init(&sc_dev->vb_queue_mutex);
> +
> +=C2=A0=C2=A0=C2=A0 spin_lock_init(&sc_dev->buffer_list_lock);
> +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&sc_dev->buffer_list);
> +
> +=C2=A0=C2=A0=C2=A0 /* Allocate JPEG buffer - even worst-case JPEG can't =
exceed=20
> uncompressed size */
> +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_buffer_size =3D CAMERA_FRAME_SI=
ZE;
> +=C2=A0=C2=A0=C2=A0 sc_dev->protocol.jpeg_buffer =3D devm_kzalloc(dev,=
=20
> sc_dev->protocol.jpeg_buffer_size,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> +=C2=A0=C2=A0=C2=A0 if (!sc_dev->protocol.jpeg_buffer) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D -ENOMEM;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_jpeg_buffer;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 retval =3D v4l2_device_register(dev, &sc_dev->v4l2_de=
v);
> +=C2=A0=C2=A0=C2=A0 if (retval) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to regis=
ter v4l2 device: %d\n", retval);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_v4l2;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 sc_dev->vdev =3D (struct video_device) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "supercamera",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fops =3D &supercamera_fops,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ioctl_ops =3D &supercamera_i=
octl_ops,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .release =3D video_device_rel=
ease_empty,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .v4l2_dev =3D &sc_dev->v4l2_d=
ev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vfl_dir =3D VFL_DIR_RX,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .device_caps =3D V4L2_CAP_VID=
EO_CAPTURE | V4L2_CAP_READWRITE |=20
> V4L2_CAP_STREAMING,
> +=C2=A0=C2=A0=C2=A0 };
> +
> +=C2=A0=C2=A0=C2=A0 video_set_drvdata(&sc_dev->vdev, sc_dev);
> +=C2=A0=C2=A0=C2=A0 retval =3D video_register_device(&sc_dev->vdev, VFL_T=
YPE_VIDEO, -1);
> +=C2=A0=C2=A0=C2=A0 if (retval) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to regis=
ter video device: %d\n", retval);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_video;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 usb_set_intfdata(intf, sc_dev);
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +
> +error_video:
> +=C2=A0=C2=A0=C2=A0 v4l2_device_unregister(&sc_dev->v4l2_dev);
> +error_v4l2:
> +error_jpeg_buffer:
> +=C2=A0=C2=A0=C2=A0 return retval;
> +}
> +
> +static void supercamera_disconnect(struct usb_interface *intf)
> +{
> +=C2=A0=C2=A0=C2=A0 struct supercamera_dev *sc_dev =3D usb_get_intfdata(i=
ntf);
> +
> +=C2=A0=C2=A0=C2=A0 if (!sc_dev)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +
> +=C2=A0=C2=A0=C2=A0 supercamera_stop_streaming(sc_dev);
> +=C2=A0=C2=A0=C2=A0 supercamera_return_all_buffers(sc_dev, VB2_BUF_STATE_=
ERROR);
> +
> +=C2=A0=C2=A0=C2=A0 video_unregister_device(&sc_dev->vdev);
> +=C2=A0=C2=A0=C2=A0 v4l2_device_unregister(&sc_dev->v4l2_dev);
> +=C2=A0=C2=A0=C2=A0 usb_set_intfdata(intf, NULL);
> +}
> +
> +static const struct usb_device_id supercamera_table[] =3D {
> +=C2=A0=C2=A0=C2=A0 {USB_DEVICE(USB_VENDOR_ID_SUPERCAMERA, USB_PRODUCT_ID=
_SUPERCAMERA)}, {}
> +};
> +MODULE_DEVICE_TABLE(usb, supercamera_table);
> +
> +static struct usb_driver supercamera_driver =3D {
> +=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
> +=C2=A0=C2=A0=C2=A0 .id_table =3D supercamera_table,
> +=C2=A0=C2=A0=C2=A0 .probe =3D supercamera_probe,
> +=C2=A0=C2=A0=C2=A0 .disconnect =3D supercamera_disconnect,
> +};
> +
> +module_usb_driver(supercamera_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Amaury Barral <useeplus.l4qli@passmail.net>, Hadrien=20
> Barral <hadrien.barral@univ-eiffel.fr>");
> +MODULE_DESCRIPTION("Driver for 'Geek szitman supercamera'=20
> ('com.useeplus.protocol' protocol)");
> +MODULE_VERSION("1.0");
>=20
>=20
>=20

--=-zUibqkep48SOIo/nqq3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMBbRAAKCRDZQZRRKWBy
9L9oAP9UgEHx7y546QhdlgC8wFFXsfPS2akJ0RXMlpywbr2KtQD/WaqRFM3HcUIP
qMMQezJ355LJSa8bj4RGMYC/JmLLEgo=
=lLtW
-----END PGP SIGNATURE-----

--=-zUibqkep48SOIo/nqq3h--

