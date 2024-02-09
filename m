Return-Path: <linux-media+bounces-4902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A2184FB4A
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 18:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8D171C24EE7
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0307F480;
	Fri,  9 Feb 2024 17:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="1P58MvDm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C507B3D2
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 17:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707501292; cv=none; b=qR2z+n6ZY0N7PuV3cQxrcArJ2wOHeLRywgHRODoQap4Jm3TYMm/8gM2UHI67zI2TmC2+Xu8r7BKXk7AbcGG708bDLNIHDlAt5Tv25pT1yT9byDQNcNHYCAhimtzm2iArM00ckolTeKNSmsTH6TVxERIPIjfJy4dKZX0f1nKH4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707501292; c=relaxed/simple;
	bh=gWZw4yf0JHXGbkpciR329qu3AY3v6oPJamredEmyRTo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b6soHt+vQ0TL935jCi2Gbj4Qjc3GJTtqEqAhxQu2lShGC7TGEHkMq8b5Nap7FYPd84Ct0zG36ijNyW8zJuXywm4wkzFq6MSABnO0NNhVPypLeOfxDENw1BOlKwkOhq9ER36ED8Fm3TdjldDqXKv9IHXIbk5W59WPe2318D7Mue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=1P58MvDm; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3beab443a63so818287b6e.3
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1707501290; x=1708106090; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3zdh1PY7jFpj6YM7X9MHSaSZeC9dSk3Dr5/mWWHNgO8=;
        b=1P58MvDmLnuzFcEv4f8EwQr3VO3VoYjjt1GAK8X3gUfdeK5I9xDXxOjwhqXtTEs4oz
         Hqi6quYPHe1TFiFQJKk5ABRHo5iqKkj0jsjQFL3q0BbZVJr4yK8wKmwLWFdIQHWOE0Jt
         9Rdgtt0oNU6apqF/uyOjrBnvWLlfORKWF9aTwowhkD4yKi8uuAT6vu9ARgSu+GYNRV4w
         Qup4qdKCXi6EYC+yTN9i5YMTSkiz2TBxSErx0Uy/L5RdBrroLYvpH3L76g1PxTg5Laak
         cnySl+RTOFAvU1JS3wgVc+ms8wZde2JHhUWaDIISVBAKRZVaWxHn1t70mFei1Lqf3U0H
         S6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501290; x=1708106090;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zdh1PY7jFpj6YM7X9MHSaSZeC9dSk3Dr5/mWWHNgO8=;
        b=VKstSeF6ZULZoi/Vpvn0zbnJMQJDJ3ivW1InZ1nHun7Bg+9N5MZ05taphm4OO42kCd
         Na9bEZfAdDUKM32XTbYDiJVEoWbZbDUbZwkj2eCvJYex3xwYzWhEJSnAJD92KWbdx8++
         M1gsBUePkGmSWFjmRMualx7fWvP760J7AP1PyqWVyJUExFvHXIzpqQ3E4rdqu2gMCGoE
         2YzhDQzANF5S84kkmW8AEDCUINTtJ0NE25ajWfLlRDueOn7Wu+pmxfhJ/RYile52krRS
         j5FJIkD2Z9iYioqiNcCEisvJg3yggMUplEIowHjq5o7GeXQcKGaVt7xdQiTvcr/Edo7U
         aCJw==
X-Forwarded-Encrypted: i=1; AJvYcCVLTKKdTXpWJ6Yma4liy7nic4fgIXQ53fv+ame1h8kBBdLswsYmp6c94gSgVGTnaCtS58VgrK5ZuYik67fxBf5dDeNizMK2HCKLZCw=
X-Gm-Message-State: AOJu0YwIjDniTfSisDbp5Yhjussxr9J1wXD5kRoEzbAonIq6AQexk+iM
	YR/0wfMUimKAHk0PGc9ezCjRTu15WtvmCmA0UEqiZs3DfCvXyC96hg3UNrGtFm0XPJH93idz7QR
	Vn9c=
X-Google-Smtp-Source: AGHT+IGWdjKx2REL9+Jq648FKXKS8cFF/TuZSGHoVLLc8u8wcO6CedM8mpHll/04d/F2ILOrSrCjqA==
X-Received: by 2002:a05:6808:f94:b0:3c0:8d2:e740 with SMTP id o20-20020a0568080f9400b003c008d2e740mr1119950oiw.11.1707501289831;
        Fri, 09 Feb 2024 09:54:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW09paW9hWdyTlHnxX4HUjjmtdDadxcl40G1Y76qnK+6CwtrSdUCKZPb8p4078xpvGH4qf6hEfFkgOyx5eO/RQqzBjYvc79+mWSBGq6Gdw5hQAzte8RXLWQybSOYuFzm1ngZlRmd/3PNih3+SQCs6YoT6fw6cvL8BeWOU24T4xva20tu8azxdEDI++7PCzxR88faWMn3XfqnMmroJ65Gxu36hlB1139ZbKRXWVTdZTjwEbB04UlouKXDMt7DxmfOW290/TqsMRZcbRW4rOsZ0K+Hez8h8bmeuUxphC9TAHc5ZdeWsgcDdTwDwp/GRnh5iBVPHeal2NvYOFi8pRStybS4Doiqui5T9kj0cUR7vMVvLi8V+3QN4Zu0LUO7rWJjv9lGsodFXegNt1fyrgUiS/tpPPQw0NC7ikZzulzTBSgf7dOrxNhPQXE6CPoENQ=
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id k6-20020ac80746000000b0042c58191861sm861820qth.53.2024.02.09.09.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 09:54:48 -0800 (PST)
Message-ID: <89cc82e2cc64a0b32b7e26faa949893cd9f9e279.camel@ndufresne.ca>
Subject: Re: [PATCH 2/8] media: Add a pixel format for MIPI packed 14bit
 luma only
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck
 <naush@raspberrypi.com>, Nick Hollinghurst
 <nick.hollinghurst@raspberrypi.org>,  Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>,  Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Date: Fri, 09 Feb 2024 12:54:47 -0500
In-Reply-To: <20240209164825.166800-3-jacopo.mondi@ideasonboard.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
	 <20240209164825.166800-3-jacopo.mondi@ideasonboard.com>
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

Le vendredi 09 f=C3=A9vrier 2024 =C3=A0 17:48 +0100, Jacopo Mondi a =C3=A9c=
rit=C2=A0:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> This is the format used by monochrome 14bit image sensors.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-y14p.rst   | 47 +++++++++++++++++++
>  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 50 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14p.rst
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y14p.rst b/Docu=
mentation/userspace-api/media/v4l/pixfmt-y14p.rst
> new file mode 100644
> index 000000000000..8e986bc6904f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-y14p.rst
> @@ -0,0 +1,47 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _V4L2-PIX-FMT-Y14P:
> +
> +**************************
> +V4L2_PIX_FMT_Y14P ('Y14P')
> +**************************
> +
> +Grey-scale image as a MIPI RAW14 packed array

Same suggestion applies, could be called Y14_MIPI due to the specific
arrangement.

> +
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is a packed grey-scale image format with a depth of 14 bits per
> +pixel. Every four consecutive samples are packed into seven bytes. Each
> +of the first four bytes contain the eight high order bits of the pixels,
> +and the three following bytes contains the six least significants bits o=
f
> +each pixel, in the same order.
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. tabularcolumns:: |p{1.8cm}|p{1.0cm}|p{1.0cm}|p{1.0cm}|p{1.1cm}|p{3.3c=
m}|p{3.3cm}|p{3.3cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       2 1 1 1 1 3 3 3
> +
> +
> +    -  -  start + 0:
> +       -  Y'\ :sub:`00high`
> +       -  Y'\ :sub:`01high`
> +       -  Y'\ :sub:`02high`
> +       -  Y'\ :sub:`03high`
> +       -  Y'\ :sub:`01low bits 1--0`\ (bits 7--6)
> +
> +	  Y'\ :sub:`00low bits 5--0`\ (bits 5--0)
> +
> +       -  Y'\ :sub:`02low bits 3--0`\ (bits 7--4)
> +
> +	  Y'\ :sub:`01low bits 5--2`\ (bits 3--0)
> +
> +       -  Y'\ :sub:`03low bits 5--0`\ (bits 7--2)
> +
> +	  Y'\ :sub:`02low bits 5--4`\ (bits 1--0)
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Docu=
mentation/userspace-api/media/v4l/yuv-formats.rst
> index 7c9ccfdd94cd..6104747d17d4 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -268,6 +268,7 @@ image.
>      pixfmt-yuv-planar
>      pixfmt-yuv-luma
>      pixfmt-y12p
> +    pixfmt-y14p
>      pixfmt-y8i
>      pixfmt-y12i
>      pixfmt-uv8
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 483498c55899..24f52485e59c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1312,6 +1312,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_PIX_FMT_Y10BPACK:	descr =3D "10-bit Greyscale (Packed)"; brea=
k;
>  	case V4L2_PIX_FMT_Y10P:		descr =3D "10-bit Greyscale (MIPI Packed)"; br=
eak;
>  	case V4L2_PIX_FMT_Y12P:		descr =3D "12-bit Greyscale (MIPI Packed)"; br=
eak;
> +	case V4L2_PIX_FMT_Y14P:		descr =3D "14-bit Greyscale (MIPI Packed)"; br=
eak;
>  	case V4L2_PIX_FMT_IPU3_Y10:	descr =3D "10-bit greyscale (IPU3 Packed)";=
 break;
>  	case V4L2_PIX_FMT_Y8I:		descr =3D "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr =3D "Interleaved 12-bit Greyscale"; brea=
k;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 11ebf9b22ccb..94a0373e8234 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -599,6 +599,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  =
Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Grey=
scale, MIPI RAW10 packed */
>  #define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Grey=
scale, MIPI RAW12 packed */
> +#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Grey=
scale, MIPI RAW12 packed */
>  #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 p=
acked 10-bit greyscale */
> =20
>  /* Palette formats */


