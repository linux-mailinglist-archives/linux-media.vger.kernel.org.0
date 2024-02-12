Return-Path: <linux-media+bounces-4974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2378512ED
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 13:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FF471C2246B
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 12:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE2C3A1B9;
	Mon, 12 Feb 2024 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KyATJGiP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238813A1C5
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707739131; cv=none; b=LsUf5hMtaFnQHADY9Ptdn9t+1wrYj4tJG0FfArk5eSyPGAfYmrM89laWyU8fLTXvY9tmNFgTJKwp0WvQg1Yiw2EBE9g6c2RUZLnfN2kYBTjdqYU1DEMEkGYSHRnogOl+TS3svQYZ5bKTo2uMNAFdss1esLxZyPyzizFWf8AOPk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707739131; c=relaxed/simple;
	bh=rPoacq65+c/zAXE8PfVIOD3tTGZdAGIx6VnkSSFolZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LE0Y6UoSHto4VKuD/y6rP+jCdsemWl/IL2L93yoP05tFt75F0wRFuj2fQ8Fc5GvqtniwNtznTyKExeD0w3vQkWcKoeYe5DdIxhZaSj7DBkoU9YgXgfSv6HSc7DsU10PWTf9j+nN8718Elj41Olucj+VcW7nYUktqRHHDiZcKltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KyATJGiP; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so2656844276.2
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 03:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1707739128; x=1708343928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIhjDrHgtRMyHQGIeToNVK56mu86Tu13Rge5zu0bcbw=;
        b=KyATJGiPp8Pnz3wUoolDvJzwlUi2gQAB9FJ5iRXBi1BJHR9Km//IxMrkZWDzFoDmUw
         QGh8XWr0xE16iMM7/ZZdqGcJe1qErr3MTXTi7cZt9IjKYNSuzofkMvxr/xG6su2FNT+a
         YtXepaKzzpAV1+4ES4NDQlNJvUN696dcRxg76n1B2R0GLxkXnJOkpU8vvoNklxCd2SS3
         tZBKmtegvplMHuBoZrptk/XKWRYnoAuNxG3zJ56Vs82WKZmdW5caPkycqO0oL3Sm5bUo
         vH4H7X0mTCk9/6uKM/XZhWQQQcL1QXkxBjj+ajBTLP1/DLA+SzwWMQ/dPfon/Rf18Q0u
         f1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707739128; x=1708343928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIhjDrHgtRMyHQGIeToNVK56mu86Tu13Rge5zu0bcbw=;
        b=PFBB6zZeYLo3NezqmnG3ZSm8pm0KyBwIg1NS+TBsTNVikZ5UslSwectnSeoSHeV5MM
         1AsgK5pCuhepOlSiIzU//6bjIvJihRNqX54FvFnfyD1jjzUywTOHWnIX7Kr8jww/M/Zc
         XBHbkZ5yRS+JzQ0jjzEJ/uId/PPAT7YqsoSMexUFE/87LHndh+ZTzm/TbCfRoqOfVQ8S
         W+Tq7TuGHJnr9iUTtR7nvig0Dn4W8BN78IZOzwPbZaAcoxlhwkUrSfZ7F306+/Naqipb
         p09Ocxrutnt4i/wgU0g4l3c7SW/0Eh1bbanA1Qen2d0HUV01jLJkDLWG4CWkTVi1ZJHl
         1yAw==
X-Forwarded-Encrypted: i=1; AJvYcCVLK9ooVVsUsZZrkLv5Cer6fQBe5xnnuiTmaboAHOe5jU6nciytJAY/eL+q5GltEKWdtToUukaLj+tYMD2uOHLqLrX197+12t4nsU8=
X-Gm-Message-State: AOJu0Yw4OmKOjMI5Z8o9NlMf0nZlVlbI2KMwSe+TvqLCLK7yTRa4pnvT
	wINjmeMysut1DcPNnoMpofodOMj5lcGKyjasLWE8Co2UBWASt3Xu8k8iIyRCBV2/SB1mnjd+V8P
	1nBB44p1KtlPQi5wQOcbQDHgwKSbYUV4Sh7yeug==
X-Google-Smtp-Source: AGHT+IFYs1oG7l009JTTVE3YV6Pei84hezgdERDM1a5ksR9Un3QuVSIYByWVSd3/kzI0W0QVxwCf6xmTp9HbCtQJzNU=
X-Received: by 2002:a25:900f:0:b0:dc7:5018:4022 with SMTP id
 s15-20020a25900f000000b00dc750184022mr6057015ybl.44.1707739127904; Mon, 12
 Feb 2024 03:58:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-2-jacopo.mondi@ideasonboard.com> <1cd5ff6b9d24588a2fb0aa69cc1e8c0dfb63e597.camel@ndufresne.ca>
 <CAPY8ntBJuZsm+h=zFy59M5u6D5hbwtnrRVEOjwQRWQv-ZyogfQ@mail.gmail.com> <05259197166f5077ccbad5a98246b0f257207b8c.camel@ndufresne.ca>
In-Reply-To: <05259197166f5077ccbad5a98246b0f257207b8c.camel@ndufresne.ca>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 12 Feb 2024 11:58:32 +0000
Message-ID: <CAPY8ntD7ceWJiyHokpv08cfJFpxnW07FGEvdufjtvynkcRSxug@mail.gmail.com>
Subject: Re: [PATCH 1/8] media: Add a pixel format for MIPI packed 12bit luma only.
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, David Plowman <david.plowman@raspberrypi.com>, 
	Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Feb 2024 at 21:15, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Le vendredi 09 f=C3=A9vrier 2024 =C3=A0 19:28 +0000, Dave Stevenson a =C3=
=A9crit :
> > Hi Nicolas
> >
> > On Fri, 9 Feb 2024 at 17:53, Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
> > >
> > > Le vendredi 09 f=C3=A9vrier 2024 =C3=A0 17:48 +0100, Jacopo Mondi a =
=C3=A9crit :
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > >
> > > > This is the format used by monochrome 12bit image sensors.
> > > >
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/pixfmt-y12p.rst   | 38 +++++++++++++++=
++++
> > > >  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
> > > >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> > > >  include/uapi/linux/videodev2.h                |  1 +
> > > >  4 files changed, 41 insertions(+)
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y1=
2p.rst
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > > > new file mode 100644
> > > > index 000000000000..b2eb4a72724d
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > > > @@ -0,0 +1,38 @@
> > > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > > +
> > > > +.. _V4L2-PIX-FMT-Y12P:
> > > > +
> > > > +******************************
> > > > +V4L2_PIX_FMT_Y12P ('Y12P')
> > > > +******************************
> > > > +
> > > > +Grey-scale image as a MIPI RAW12 packed array
> > > > +
> > > > +
> > > > +Description
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +This is a packed grey-scale image format with a depth of 12 bits p=
er
> > > > +pixel. Two consecutive pixels are packed into 3 bytes. The first 2=
 bytes
> > > > +contain the 8 high order bits of the pixels, and the 3rd byte cont=
ains the 4
> > > > +least significants bits of each pixel, in the same order.
> > >
> > > This is an interesting arrangement, which make me feel that Y12P is p=
erhaps bit
> > > too generic ? Perhaps something like:
> > >
> > >   V4L2_PIX_FMT_Y12_MIPI
> > >
> > > That being said, I don't mind if you reserve the nice and short name =
for the
> > > first occurrence of such format in 20 years (it might equally be the =
last). Will
> > > they do the same for Y10, by storing 4 bytes of higher 8bit of 4 pixe=
ls, and
> > > packing the remaining lower 2 bits packed in the fif bytes ? Cause fo=
r this one,
> > > we'd have confusion, since CODEC usually just place all the bits in o=
rder over 5
> > > bytes here (which have its own issues of course).
> >
> > We already have V4L2_PIX_FMT_Y10P defined for the MIPI packing for
> > 10bit luma-only.
> > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-y=
uv-luma.html
> >
> > This is only extending the definitions for the other bit depths using
> > the same pattern.
> >
> > Adding the P is also the same pattern as for the Bayer formats -
> > V4L2_PIX_FMT_SRGGB10 for the 10bit unpacked to 16bit, and
> > V4L2_PIX_FMT_SRGGB10P for the MIPI packed variant.
> >
> > I'm not inventing anything new here :)
>
> A bit sad, but what can we do, I keep missing patches ;-P

Not recently though.

V4L2_PIX_FMT_Y10P was added in July 2018. [1]
The use of V4L2_PIX_FMT_Sxxxx10P for Bayer format MIPI 10 bit packing
was added in Dec 2014 [2]

  Dave

[1] 6e15bec49f36 media: v4l: Add new 10-bit packed grayscale format
[2] 4353e36ee84d [media] v4l: Add packed Bayer raw10 pixel formats

> Nicolas
>
> >
> >   Dave
> >
> > > > +
> > > > +**Byte Order.**
> > > > +Each cell is one byte.
> > > > +
> > > > +.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|
> > > > +
> > > > +
> > > > +.. flat-table::
> > > > +    :header-rows:  0
> > > > +    :stub-columns: 0
> > > > +    :widths:       2 1 1 1
> > > > +
> > > > +
> > > > +    -  -  start + 0:
> > > > +       -  Y'\ :sub:`00high`
> > > > +       -  Y'\ :sub:`01high`
> > > > +       -  Y'\ :sub:`01low`\ (bits 7--4)
> > > > +
> > > > +          Y'\ :sub:`00low`\ (bits 3--0)
> > > > +
> > > > diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst =
b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > > index 24b34cdfa6fe..7c9ccfdd94cd 100644
> > > > --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > > @@ -267,6 +267,7 @@ image.
> > > >      pixfmt-packed-yuv
> > > >      pixfmt-yuv-planar
> > > >      pixfmt-yuv-luma
> > > > +    pixfmt-y12p
> > > >      pixfmt-y8i
> > > >      pixfmt-y12i
> > > >      pixfmt-uv8
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v=
4l2-core/v4l2-ioctl.c
> > > > index 33076af4dfdb..483498c55899 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > @@ -1311,6 +1311,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtd=
esc *fmt)
> > > >       case V4L2_PIX_FMT_Y16_BE:       descr =3D "16-bit Greyscale B=
E"; break;
> > > >       case V4L2_PIX_FMT_Y10BPACK:     descr =3D "10-bit Greyscale (=
Packed)"; break;
> > > >       case V4L2_PIX_FMT_Y10P:         descr =3D "10-bit Greyscale (=
MIPI Packed)"; break;
> > > > +     case V4L2_PIX_FMT_Y12P:         descr =3D "12-bit Greyscale (=
MIPI Packed)"; break;
> > > >       case V4L2_PIX_FMT_IPU3_Y10:     descr =3D "10-bit greyscale (=
IPU3 Packed)"; break;
> > > >       case V4L2_PIX_FMT_Y8I:          descr =3D "Interleaved 8-bit =
Greyscale"; break;
> > > >       case V4L2_PIX_FMT_Y12I:         descr =3D "Interleaved 12-bit=
 Greyscale"; break;
> > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> > > > index a8015e5e7fa4..11ebf9b22ccb 100644
> > > > --- a/include/uapi/linux/videodev2.h
> > > > +++ b/include/uapi/linux/videodev2.h
> > > > @@ -598,6 +598,7 @@ struct v4l2_pix_format {
> > > >  /* Grey bit-packed formats */
> > > >  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /=
* 10  Greyscale bit-packed */
> > > >  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10=
  Greyscale, MIPI RAW10 packed */
> > > > +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12=
  Greyscale, MIPI RAW12 packed */
> > > >  #define V4L2_PIX_FMT_IPU3_Y10                v4l2_fourcc('i', 'p',=
 '3', 'y') /* IPU3 packed 10-bit greyscale */
> > > >
> > > >  /* Palette formats */
> > >
>

