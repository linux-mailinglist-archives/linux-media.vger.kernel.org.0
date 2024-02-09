Return-Path: <linux-media+bounces-4905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0984FCD7
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 20:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E35A51C24705
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 19:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDB584A45;
	Fri,  9 Feb 2024 19:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Sw5EYnqI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651AD83CC4
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 19:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707506914; cv=none; b=Lshz2ZtpCWRoobXXx0p5szD9e5NiFPCKt4L5NxtcZw+BAUi4Fq0RFeHAO81V6HyPV3E5lhzXdOB+RYH1J9SQllHNj6s/bhB8tIOoQ3FEti6EkRtpQqZaEsBvNhXC0MncIu9/6zB5JMM8rgvT++KyUkKuxiReElrl2QZbx+kmFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707506914; c=relaxed/simple;
	bh=C2P2A7UUqnFjjjicowziBdQlwiR0J7xYy3R/YqIQ89o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QK/86pTcEOP/ZxhCx+yDF9BDuk13SXvmkNGb3+lWgnKt5fYZKj20liRutxiR06URaE/Q6V/TASThI+09Rdvo/9IKRYfhhAw+2YeMWJGM16aIqnfrmO9abMW6cCXHIDjxZ1GjcAaCE+YnF/7rdvxDxprReZW0yxOeV875x6rPxnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Sw5EYnqI; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-604b23d91afso15926197b3.3
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 11:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1707506911; x=1708111711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzVJrpEXKTbgdY/c9RYwR6OVPRay2JL0DiSVMFPFpDw=;
        b=Sw5EYnqIagqMW1L6zE1QZ/WjgDYaESLAmaVCjN+vyeeMtU4kjCLlddPMClkH+0fjDt
         07MzjEqyeSYIUMNPTsfHBe4LHd9AsbbcgbNu4c+ge+iIhwCMSsGkWduRmJUXdM3sfFZu
         b6r/Crgq14+iZbohCYRjrb8CiTK1C/si4rXYZ2tj6lArGc7wax0vZiuOEQ7Q4mCU2QRW
         /lHq/NW4ygPBI6QSAJTS4Cc0ka+gE2UgZdGigd+SKV5sAVN8dfGFbsmCGfpmn3aV7pkR
         MVEcwqDGqASFqvoZ17+fXTvC1yP+FCQ7c1HTxBVBYRWkx3FGivzCa7hb9Oj7SPtyWVBU
         4eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707506911; x=1708111711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzVJrpEXKTbgdY/c9RYwR6OVPRay2JL0DiSVMFPFpDw=;
        b=a4OKLU8xMDIpnNgcTVXoO418UqFdIijLJAVjknUT1uCh19M7/WcqfruzBqCx7LxxiR
         JGbtq5ctN6/Gf9LTzb0IA9wvkVJLaA04Zk9Z6JcJbzLJyU7KAqXQMHEQcF8hrSTuerjr
         TD0MpnceCtx+Hqc8nTO63OhpjrXaIFEtGVFJrKaeQ/YzFoUKUjv5CarHezx/CqAHP+8w
         pY9lvKawtqdOqBjzB/kV37rBqvMWsL/hmdir290IWkAV6TMB8NHX2++6BZkRArdYg5Be
         oUE0bHnGNMDN9Cvg/9/OWf8QwImIwepxEPIOD/DOnzxl3s5LWshVQQBDcpy7hmVHU+ER
         OEFg==
X-Gm-Message-State: AOJu0YxPl95wtt8xoDA5DxuIuWFBttKaDdk+QCxwJrwboIHuiGpD1u/V
	6E1lDRsuHxgc7oL0P1Pf6AUkDetWZT/bjEJttTCIgk18gHPLNHx6dDy+IxMg0nrz31+kIZDoX7+
	uYtJNf3AVPga2cqcElTP4/S5/s5Bh1cDqUBLgPA==
X-Google-Smtp-Source: AGHT+IHBdDkL14wP/gD/PuRbjki9ZvaeG8ATaHHfy4YLVG6xkf+GtFSFaIiaJSZN0fLtS2KeQYsifv4W/cxZ9lhApIo=
X-Received: by 2002:a0d:ca0f:0:b0:5f6:a23b:9d4f with SMTP id
 m15-20020a0dca0f000000b005f6a23b9d4fmr158184ywd.3.1707506911338; Fri, 09 Feb
 2024 11:28:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-2-jacopo.mondi@ideasonboard.com> <1cd5ff6b9d24588a2fb0aa69cc1e8c0dfb63e597.camel@ndufresne.ca>
In-Reply-To: <1cd5ff6b9d24588a2fb0aa69cc1e8c0dfb63e597.camel@ndufresne.ca>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 9 Feb 2024 19:28:15 +0000
Message-ID: <CAPY8ntBJuZsm+h=zFy59M5u6D5hbwtnrRVEOjwQRWQv-ZyogfQ@mail.gmail.com>
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

Hi Nicolas

On Fri, 9 Feb 2024 at 17:53, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Le vendredi 09 f=C3=A9vrier 2024 =C3=A0 17:48 +0100, Jacopo Mondi a =C3=
=A9crit :
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > This is the format used by monochrome 12bit image sensors.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-y12p.rst   | 38 +++++++++++++++++++
> >  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> >  include/uapi/linux/videodev2.h                |  1 +
> >  4 files changed, 41 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12p.r=
st
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst b/Do=
cumentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > new file mode 100644
> > index 000000000000..b2eb4a72724d
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > @@ -0,0 +1,38 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _V4L2-PIX-FMT-Y12P:
> > +
> > +******************************
> > +V4L2_PIX_FMT_Y12P ('Y12P')
> > +******************************
> > +
> > +Grey-scale image as a MIPI RAW12 packed array
> > +
> > +
> > +Description
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This is a packed grey-scale image format with a depth of 12 bits per
> > +pixel. Two consecutive pixels are packed into 3 bytes. The first 2 byt=
es
> > +contain the 8 high order bits of the pixels, and the 3rd byte contains=
 the 4
> > +least significants bits of each pixel, in the same order.
>
> This is an interesting arrangement, which make me feel that Y12P is perha=
ps bit
> too generic ? Perhaps something like:
>
>   V4L2_PIX_FMT_Y12_MIPI
>
> That being said, I don't mind if you reserve the nice and short name for =
the
> first occurrence of such format in 20 years (it might equally be the last=
). Will
> they do the same for Y10, by storing 4 bytes of higher 8bit of 4 pixels, =
and
> packing the remaining lower 2 bits packed in the fif bytes ? Cause for th=
is one,
> we'd have confusion, since CODEC usually just place all the bits in order=
 over 5
> bytes here (which have its own issues of course).

We already have V4L2_PIX_FMT_Y10P defined for the MIPI packing for
10bit luma-only.
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv-l=
uma.html

This is only extending the definitions for the other bit depths using
the same pattern.

Adding the P is also the same pattern as for the Bayer formats -
V4L2_PIX_FMT_SRGGB10 for the 10bit unpacked to 16bit, and
V4L2_PIX_FMT_SRGGB10P for the MIPI packed variant.

I'm not inventing anything new here :)

  Dave

> > +
> > +**Byte Order.**
> > +Each cell is one byte.
> > +
> > +.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|
> > +
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       2 1 1 1
> > +
> > +
> > +    -  -  start + 0:
> > +       -  Y'\ :sub:`00high`
> > +       -  Y'\ :sub:`01high`
> > +       -  Y'\ :sub:`01low`\ (bits 7--4)
> > +
> > +          Y'\ :sub:`00low`\ (bits 3--0)
> > +
> > diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Do=
cumentation/userspace-api/media/v4l/yuv-formats.rst
> > index 24b34cdfa6fe..7c9ccfdd94cd 100644
> > --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > @@ -267,6 +267,7 @@ image.
> >      pixfmt-packed-yuv
> >      pixfmt-yuv-planar
> >      pixfmt-yuv-luma
> > +    pixfmt-y12p
> >      pixfmt-y8i
> >      pixfmt-y12i
> >      pixfmt-uv8
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 33076af4dfdb..483498c55899 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1311,6 +1311,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >       case V4L2_PIX_FMT_Y16_BE:       descr =3D "16-bit Greyscale BE"; =
break;
> >       case V4L2_PIX_FMT_Y10BPACK:     descr =3D "10-bit Greyscale (Pack=
ed)"; break;
> >       case V4L2_PIX_FMT_Y10P:         descr =3D "10-bit Greyscale (MIPI=
 Packed)"; break;
> > +     case V4L2_PIX_FMT_Y12P:         descr =3D "12-bit Greyscale (MIPI=
 Packed)"; break;
> >       case V4L2_PIX_FMT_IPU3_Y10:     descr =3D "10-bit greyscale (IPU3=
 Packed)"; break;
> >       case V4L2_PIX_FMT_Y8I:          descr =3D "Interleaved 8-bit Grey=
scale"; break;
> >       case V4L2_PIX_FMT_Y12I:         descr =3D "Interleaved 12-bit Gre=
yscale"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index a8015e5e7fa4..11ebf9b22ccb 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -598,6 +598,7 @@ struct v4l2_pix_format {
> >  /* Grey bit-packed formats */
> >  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10=
  Greyscale bit-packed */
> >  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Gr=
eyscale, MIPI RAW10 packed */
> > +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Gr=
eyscale, MIPI RAW12 packed */
> >  #define V4L2_PIX_FMT_IPU3_Y10                v4l2_fourcc('i', 'p', '3'=
, 'y') /* IPU3 packed 10-bit greyscale */
> >
> >  /* Palette formats */
>

