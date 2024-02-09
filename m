Return-Path: <linux-media+bounces-4937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76984FE94
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 717F51C23AB3
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D57238FA8;
	Fri,  9 Feb 2024 21:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Tr7M9fhT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E259238DE2
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513328; cv=none; b=nbwz8G6e7lSZqUFcASy0TjQzf9GT6foL3weuAuvCAfx/PtzYjNXgRSzoNTdU6TWLbUJaAQSQT/8LuDXQEtHcC6hm7cdOnhhubhy5afGJyy2tSC3PtHy0WOOAJgTJNTB0d8PpWPUnnDJpnlwn8g+XdZ8ZWolf71rhCfm6IaafW4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513328; c=relaxed/simple;
	bh=xa9HcCv94oXd+TAe8LyqDSByhVxwmKkj8/REpSzRR38=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=stUOGyF8JTQRQbLsk/jMRHhcin6CSzQtatMPkmkXox3rXsb3rhBvk80/BZqFz3LX+HCtKAl/EHysT3ojwluaHejGwWHiFypBpxLavY6eg4AMq7/9NTE3K0ja49VtO/3S8FPMzg13zqtN57TaEG9uvY12GmO1lf/BSRWyAYgC04I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Tr7M9fhT; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-68c4673eff5so6784656d6.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 13:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1707513326; x=1708118126; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l1UMy7+Cpzxq1GUMZL2p6WFOHPgcthWoYko7ywSz+JU=;
        b=Tr7M9fhTUUoqK0ZAPvW5EpYGYYAUlX+LwLMz796iTSyp3aWQ9+jyyNDqkBlcjfA5b0
         5FPMY/Q3hsJWOUzcTJNrFuNNSuAs0aKfpB6SVyPx/fxjN6Wu1UB6jXt0fdCoj1AAmySm
         UNj7iUc4JRKEHQbm30+eq2BllWUyYHv9JupcBNPh8MTiFQzY6mueWwFC45VwuIbKheo0
         RGC7/PF9YQfss0XH+e6i5dwe26En1eJ4Vl83SxrH21R6GSHVfH2FanW832323hNj1Gix
         GoSMmquxTpcJLPQPdgCP/zb1SKeMhLAgqEmUzdlJhpNKWzx/b/u4XUxgPyTNXj07AbY4
         RlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513326; x=1708118126;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1UMy7+Cpzxq1GUMZL2p6WFOHPgcthWoYko7ywSz+JU=;
        b=quSu5vkup6PVRw3aGH/8Qzf0VPPJKSfYXatZrSji9ZmYG5YxX2RbSuMzy7QBKs8BGI
         MzmGbzHsrBr8mKSgMUDidIfE+Mb0zE8x1pGoB72889jaq9OVlqeQTIJDj73Y/yLPoXtj
         M7qVjiyzuevLrGGs4ya2M4VNsJvytDaBgMFJEk0XtquYJ6siHNv7sYpHCStFoe4YYmLf
         tgx3Oaul5N8o4/iUYtUIBmH/VWzaq2XmIF8OhARsJGsofNIhFRicOZadX9/YzdyIUvNw
         ti+dG3sG7sVp1FhrCCBL/9tEhaGJQeq1UhhShiLOfUWv8eNHO8r7VQtBCmT+tItBuYKl
         K6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9CYcua5LDUYzef/16cWdmWRe5utBGQIiYmUnJOqfD4qTtGcsWl4aVvGk955PcS7SGIFUbbsiyPu1X5wecJOCf+Ul8PbAd3MJbw/8=
X-Gm-Message-State: AOJu0YxmjZ5h0vRw98hA+LFWoM1bhNTqBXLVpL8l+32gd2tdJkWRG8sS
	Smi44biEZYIdjp1w/wmpbH+Yr9c5t7nGab/5UghEFsR0bwwY1Qu6BhylxZtsoMo=
X-Google-Smtp-Source: AGHT+IEAVRYmOB+3cA5x2u6ZsE0qeNl+hDkGNTvVLPbzcNLdQlxqcA4o64HETBxvl+P8QPBpn40MNQ==
X-Received: by 2002:a05:6214:76f:b0:68c:92d3:73e1 with SMTP id f15-20020a056214076f00b0068c92d373e1mr378767qvz.30.1707513325761;
        Fri, 09 Feb 2024 13:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWv0OzKbIQCzQzaJHAIJJdsuLcmB+K+7MpQz4/lNLfCMydSPz36u48OXGSr2gZYeygmk7Yaz2jJLb0gaGZ2ewb/O4TnqDO5fQtDwF3V+A1w/xcnKQ7Yp2viqJsOAF9E+Jou+bM4VtVR4yGVk8A7xqtAxwGfxlGt+DwqPghRaG4Hs4BmdB7qVulANv1Zykn8AoKzXmTxI8K62AX0zY24mu4AzNq97xjE4cdfzX7NEfXV6vDKnSU5Q3a5LR83fCJOE1Y9kShSrl87BrIikwkpcD2be5EChJg72Zvu2jpOpLmgyjlt/uThCf+5AIdjra9jJ5Psdm9fjMwE0Q1x1f3t0KeYaeBhRsYKEbV9KyJUzRI8brs48GR+8sgtFyiXHe4HtohHlqyMcixBD9g6txI/voC+VB3V2q+hRRuQwu7tAw7LmGqKt6yGwXs51tNgeA==
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id pj11-20020a0562144b0b00b0068cdbdb8af8sm251742qvb.119.2024.02.09.13.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:15:25 -0800 (PST)
Message-ID: <05259197166f5077ccbad5a98246b0f257207b8c.camel@ndufresne.ca>
Subject: Re: [PATCH 1/8] media: Add a pixel format for MIPI packed 12bit
 luma only.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, David Plowman
 <david.plowman@raspberrypi.com>,  Naushir Patuck <naush@raspberrypi.com>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Date: Fri, 09 Feb 2024 16:15:24 -0500
In-Reply-To: <CAPY8ntBJuZsm+h=zFy59M5u6D5hbwtnrRVEOjwQRWQv-ZyogfQ@mail.gmail.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
	 <20240209164825.166800-2-jacopo.mondi@ideasonboard.com>
	 <1cd5ff6b9d24588a2fb0aa69cc1e8c0dfb63e597.camel@ndufresne.ca>
	 <CAPY8ntBJuZsm+h=zFy59M5u6D5hbwtnrRVEOjwQRWQv-ZyogfQ@mail.gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 09 f=C3=A9vrier 2024 =C3=A0 19:28 +0000, Dave Stevenson a =C3=
=A9crit=C2=A0:
> Hi Nicolas
>=20
> On Fri, 9 Feb 2024 at 17:53, Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
> >=20
> > Le vendredi 09 f=C3=A9vrier 2024 =C3=A0 17:48 +0100, Jacopo Mondi a =C3=
=A9crit :
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > This is the format used by monochrome 12bit image sensors.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  .../userspace-api/media/v4l/pixfmt-y12p.rst   | 38 +++++++++++++++++=
++
> > >  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> > >  include/uapi/linux/videodev2.h                |  1 +
> > >  4 files changed, 41 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12p=
.rst
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst b/=
Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > > new file mode 100644
> > > index 000000000000..b2eb4a72724d
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > > @@ -0,0 +1,38 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _V4L2-PIX-FMT-Y12P:
> > > +
> > > +******************************
> > > +V4L2_PIX_FMT_Y12P ('Y12P')
> > > +******************************
> > > +
> > > +Grey-scale image as a MIPI RAW12 packed array
> > > +
> > > +
> > > +Description
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +This is a packed grey-scale image format with a depth of 12 bits per
> > > +pixel. Two consecutive pixels are packed into 3 bytes. The first 2 b=
ytes
> > > +contain the 8 high order bits of the pixels, and the 3rd byte contai=
ns the 4
> > > +least significants bits of each pixel, in the same order.
> >=20
> > This is an interesting arrangement, which make me feel that Y12P is per=
haps bit
> > too generic ? Perhaps something like:
> >=20
> >   V4L2_PIX_FMT_Y12_MIPI
> >=20
> > That being said, I don't mind if you reserve the nice and short name fo=
r the
> > first occurrence of such format in 20 years (it might equally be the la=
st). Will
> > they do the same for Y10, by storing 4 bytes of higher 8bit of 4 pixels=
, and
> > packing the remaining lower 2 bits packed in the fif bytes ? Cause for =
this one,
> > we'd have confusion, since CODEC usually just place all the bits in ord=
er over 5
> > bytes here (which have its own issues of course).
>=20
> We already have V4L2_PIX_FMT_Y10P defined for the MIPI packing for
> 10bit luma-only.
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv=
-luma.html
>=20
> This is only extending the definitions for the other bit depths using
> the same pattern.
>=20
> Adding the P is also the same pattern as for the Bayer formats -
> V4L2_PIX_FMT_SRGGB10 for the 10bit unpacked to 16bit, and
> V4L2_PIX_FMT_SRGGB10P for the MIPI packed variant.
>=20
> I'm not inventing anything new here :)

A bit sad, but what can we do, I keep missing patches ;-P

Nicolas

>=20
>   Dave
>=20
> > > +
> > > +**Byte Order.**
> > > +Each cell is one byte.
> > > +
> > > +.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|
> > > +
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       2 1 1 1
> > > +
> > > +
> > > +    -  -  start + 0:
> > > +       -  Y'\ :sub:`00high`
> > > +       -  Y'\ :sub:`01high`
> > > +       -  Y'\ :sub:`01low`\ (bits 7--4)
> > > +
> > > +          Y'\ :sub:`00low`\ (bits 3--0)
> > > +
> > > diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/=
Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > index 24b34cdfa6fe..7c9ccfdd94cd 100644
> > > --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > @@ -267,6 +267,7 @@ image.
> > >      pixfmt-packed-yuv
> > >      pixfmt-yuv-planar
> > >      pixfmt-yuv-luma
> > > +    pixfmt-y12p
> > >      pixfmt-y8i
> > >      pixfmt-y12i
> > >      pixfmt-uv8
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> > > index 33076af4dfdb..483498c55899 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1311,6 +1311,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdes=
c *fmt)
> > >       case V4L2_PIX_FMT_Y16_BE:       descr =3D "16-bit Greyscale BE"=
; break;
> > >       case V4L2_PIX_FMT_Y10BPACK:     descr =3D "10-bit Greyscale (Pa=
cked)"; break;
> > >       case V4L2_PIX_FMT_Y10P:         descr =3D "10-bit Greyscale (MI=
PI Packed)"; break;
> > > +     case V4L2_PIX_FMT_Y12P:         descr =3D "12-bit Greyscale (MI=
PI Packed)"; break;
> > >       case V4L2_PIX_FMT_IPU3_Y10:     descr =3D "10-bit greyscale (IP=
U3 Packed)"; break;
> > >       case V4L2_PIX_FMT_Y8I:          descr =3D "Interleaved 8-bit Gr=
eyscale"; break;
> > >       case V4L2_PIX_FMT_Y12I:         descr =3D "Interleaved 12-bit G=
reyscale"; break;
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index a8015e5e7fa4..11ebf9b22ccb 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -598,6 +598,7 @@ struct v4l2_pix_format {
> > >  /* Grey bit-packed formats */
> > >  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* =
10  Greyscale bit-packed */
> > >  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  =
Greyscale, MIPI RAW10 packed */
> > > +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  =
Greyscale, MIPI RAW12 packed */
> > >  #define V4L2_PIX_FMT_IPU3_Y10                v4l2_fourcc('i', 'p', '=
3', 'y') /* IPU3 packed 10-bit greyscale */
> > >=20
> > >  /* Palette formats */
> >=20


