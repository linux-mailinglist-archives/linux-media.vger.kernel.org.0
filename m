Return-Path: <linux-media+bounces-4901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7C84FB49
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 18:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19811F29CE6
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418C47EF17;
	Fri,  9 Feb 2024 17:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="HEiTjghb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179337E770
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707501218; cv=none; b=Cwd6yZphe5KuwVf7z7cblsNOt9US/sP5OrfWb1pKu5U9Cvm4vvz/iLeWdQRaICmihUct5c4AWj4yf1jStFN4onFRW8gfRr2+hhr4sY8aGyC2pJVUOQiD6pewxFxc3ndtQkzd9SIiKp4K9fJuhINvYDWP228MKvRGlTF+Oa3RoU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707501218; c=relaxed/simple;
	bh=yrR6PL/KxegizRRXo4UZgplkaYJ0zvqsvAZpLifxKaY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K8SasEwer8cTqInhPm5SV9dzqCST/ZOc0ZaUqXQiLoNwxDyzqJbUQ4i1CLpIena9QkKaMZbD1JaPdXNOQMXGp4gowpknJ8Embsr26nZ/f79pj/czEkODiFPEfnF+xGdNedSn6D0RGMh/wbOjm5xf+OnxQmU3RTWsvYdDHRxUOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=HEiTjghb; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7d2940ad0e1so637274241.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 09:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1707501216; x=1708106016; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=demp+kQ/ETbT9Y3PkrQdAmMnrTGZd0LNq9Ss6Bgbfuc=;
        b=HEiTjghbBf9lfZx+MRPRANPxjfVZ/GLYZ4JG5GkzigM1lh28Az6WSqjU+esfjfoHPG
         CmSZRscZCYwviMzXifYqPzKgJEomyzHjjxp0Doch0shtXBMg1EkUZVuz6Z2veXsIT6e8
         4xz4//niGWpQwkfJTXCjcelFAhH9z0pI7pL9GHNvSQW3S0/n4f5HhMRs+2vgnqdHwKtA
         fEySNwzAAeT+D5oXLULgnurrOKQHWNgkZHMGIbXcHK7sNgvcMnoDq7ofyIKTXDHkSq2i
         2TLMLiYZyD+AFqkV1OxNK1ZsNqSlKNgzqHKhbhE0eM6FQ5PlYEf/HIELRGhgmqSxD4X0
         ecjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501216; x=1708106016;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=demp+kQ/ETbT9Y3PkrQdAmMnrTGZd0LNq9Ss6Bgbfuc=;
        b=UWqo0UxlB3IUYaG32p10GLqTZbXXdccOjJhQ1y06hh52PjF71cm22ZG0k+Cksert7K
         BoGwWLbGWN5M9nAfG472BDVg2/+KQY9DoMsM5LxHINtvmSQv7rwootU39OZrMFwjx2sa
         v9RWzsOqcekxSXA2EZrSkuzu5FiCZo7giZHi+XxerSF/oFnIqYJUWb33nm3aFHP7JCKU
         32xKmrdzL8bgs1j/bE7SEB/28X4hg1ukSEhj9FagOHVkx7+0wGmMVfJlDCD3hoURBCHS
         jARChDw7Qh9kbMqmadU1xrzuqJzmwdYqy1ISrynfLW7xZ9spEvX/Lk+a8NgE/cDDF1rL
         j/Lw==
X-Gm-Message-State: AOJu0Yx9+9LibcononnwdKY388dr1o1kJJFybE1GnQiLD9NbkVW1I1hr
	xMf65JNdDggviFq73UuRVEAvTIFKrsMlSv1MJbr2msj9AigsUq7Ibu2xF8hhKYw=
X-Google-Smtp-Source: AGHT+IFe1nKNrRlUNbhERv1Kwn3BuHjhux3zxK/FNfaG9ss1TguZAGZYPCkDm9CUcBiUhjVUjGHPzg==
X-Received: by 2002:a05:6102:2859:b0:46d:224d:9290 with SMTP id az25-20020a056102285900b0046d224d9290mr74433vsb.9.1707501215875;
        Fri, 09 Feb 2024 09:53:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiNjBbeG5mL11uUFp9qj8i/AdgRz06acsmQL3T6UPx5a3z0Z92VzdIrr/nlGOOOcUBNZcqnEweCdGcpakivqYJ+/TCxxgubXWVP6popBovFQpvmM+dISxhRZLceqP0z2THv0V6qS/D7K3daJNlO5hQzWWZIe+Z15H4TgxaSe3wBIuEmvNOGXN7T4Tauw3U6qHgytrBfGw583TXHzg4N6dwikbMdDnEyfiyOkT45Td5zBsfHYh+A+CDDVRs5KhX9zlcd+DQ6FRPp2ix8UtlsnatDDIrfBcrPFvSPLCHZYCbNkP/I9QMKOpID7otmf8XmcpZCVBu0TseftG6Co2Nrgotof6zTauiy6S6RtqkEBuw1qblaWHrQ0rVesE5YeCMTKmEUmP+UBGoM3KVD3Ow1DtfZkr5pX1sNgz7JqDdVsnust7vO65NS9Ose0hVLak=
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id l13-20020ad4444d000000b0068cc27e57ecsm1023672qvt.139.2024.02.09.09.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 09:53:35 -0800 (PST)
Message-ID: <1cd5ff6b9d24588a2fb0aa69cc1e8c0dfb63e597.camel@ndufresne.ca>
Subject: Re: [PATCH 1/8] media: Add a pixel format for MIPI packed 12bit
 luma only.
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
Date: Fri, 09 Feb 2024 12:53:34 -0500
In-Reply-To: <20240209164825.166800-2-jacopo.mondi@ideasonboard.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
	 <20240209164825.166800-2-jacopo.mondi@ideasonboard.com>
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
> This is the format used by monochrome 12bit image sensors.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-y12p.rst   | 38 +++++++++++++++++++
>  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 41 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst b/Docu=
mentation/userspace-api/media/v4l/pixfmt-y12p.rst
> new file mode 100644
> index 000000000000..b2eb4a72724d
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _V4L2-PIX-FMT-Y12P:
> +
> +******************************
> +V4L2_PIX_FMT_Y12P ('Y12P')
> +******************************
> +
> +Grey-scale image as a MIPI RAW12 packed array
> +
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is a packed grey-scale image format with a depth of 12 bits per
> +pixel. Two consecutive pixels are packed into 3 bytes. The first 2 bytes
> +contain the 8 high order bits of the pixels, and the 3rd byte contains t=
he 4
> +least significants bits of each pixel, in the same order.

This is an interesting arrangement, which make me feel that Y12P is perhaps=
 bit
too generic ? Perhaps something like:

  V4L2_PIX_FMT_Y12_MIPI

That being said, I don't mind if you reserve the nice and short name for th=
e
first occurrence of such format in 20 years (it might equally be the last).=
 Will
they do the same for Y10, by storing 4 bytes of higher 8bit of 4 pixels, an=
d
packing the remaining lower 2 bits packed in the fif bytes ? Cause for this=
 one,
we'd have confusion, since CODEC usually just place all the bits in order o=
ver 5
bytes here (which have its own issues of course).

> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       2 1 1 1
> +
> +
> +    -  -  start + 0:
> +       -  Y'\ :sub:`00high`
> +       -  Y'\ :sub:`01high`
> +       -  Y'\ :sub:`01low`\ (bits 7--4)
> +
> +          Y'\ :sub:`00low`\ (bits 3--0)
> +
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Docu=
mentation/userspace-api/media/v4l/yuv-formats.rst
> index 24b34cdfa6fe..7c9ccfdd94cd 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -267,6 +267,7 @@ image.
>      pixfmt-packed-yuv
>      pixfmt-yuv-planar
>      pixfmt-yuv-luma
> +    pixfmt-y12p
>      pixfmt-y8i
>      pixfmt-y12i
>      pixfmt-uv8
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 33076af4dfdb..483498c55899 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1311,6 +1311,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_PIX_FMT_Y16_BE:	descr =3D "16-bit Greyscale BE"; break;
>  	case V4L2_PIX_FMT_Y10BPACK:	descr =3D "10-bit Greyscale (Packed)"; brea=
k;
>  	case V4L2_PIX_FMT_Y10P:		descr =3D "10-bit Greyscale (MIPI Packed)"; br=
eak;
> +	case V4L2_PIX_FMT_Y12P:		descr =3D "12-bit Greyscale (MIPI Packed)"; br=
eak;
>  	case V4L2_PIX_FMT_IPU3_Y10:	descr =3D "10-bit greyscale (IPU3 Packed)";=
 break;
>  	case V4L2_PIX_FMT_Y8I:		descr =3D "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr =3D "Interleaved 12-bit Greyscale"; brea=
k;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index a8015e5e7fa4..11ebf9b22ccb 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -598,6 +598,7 @@ struct v4l2_pix_format {
>  /* Grey bit-packed formats */
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  =
Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Grey=
scale, MIPI RAW10 packed */
> +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Grey=
scale, MIPI RAW12 packed */
>  #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 p=
acked 10-bit greyscale */
> =20
>  /* Palette formats */


