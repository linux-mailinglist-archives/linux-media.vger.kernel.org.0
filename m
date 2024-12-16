Return-Path: <linux-media+bounces-23474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 846DD9F315D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 14:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 179A01887F3A
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B527C20459B;
	Mon, 16 Dec 2024 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZERzHal0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5729CA
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355076; cv=none; b=DBgyuRVA+2d6G5WQaKTvrRcUj44KQTNncz2rooXj4DVrWHY3uACpuagnmtVu/LHr1l3AoyszfkLzmXOzK1dsdSD6HlGk7CGU+pauWMj1TayhGMMPnVy8kejdMOVjGL6tupDA80MXI/gjV2pg0OvscxEjH/jj2DqVvZVlr5uue2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355076; c=relaxed/simple;
	bh=30zOXEKnW4HmVAyfBFBE4wBx5AX29jlRCmnBQhtpuG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPTZVULeCClXyzsiTWP061o5bbXmwkV7q8s5OWsj0KmS9lAaXxp0HENMFSip3C4P49fAEsUpew0ggflOqrjSum0SD1boGeKmX68UKEP6FhPlTqtu7RxQ/afsUv7VRb0AckvUnvYtnpzPUk4UuBKDxPCtzy3y9QtnvYHCvEWByYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZERzHal0; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so1002264137.3
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 05:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734355073; x=1734959873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0wFWBr32KIb+Vf5kLmU6z74BCWmq2VJBtWQ2NNT0As=;
        b=ZERzHal0ATNc2DAHSQP9fVryIZyy86KJH2UUp5CnaIjCitIgNj+fMN1yGMqDZs99h6
         ST/yVDKU8SKdDPet62hmkycBKmbIC4+DQq8Svbkq8uB3vT0k5VkWrusbqxnPEOG7N5yi
         fkTrdcKBeYHHLObRFSHNI+joSifjwaRyVHmNxonHVbOxZsgmJmQfQ2NFiPIJ2w9PWttQ
         uPmh/ZAFxUd1R+GbY24QPk9CLrjELzXBoQ9xYzgyWFF5yrQqyHbYatZIIhz0SqUvB7b2
         oab61Rcvgnf0/7Xsd7p7rrvPSQM8MmA95X7Lte/dGLSl0qkeXjSBPJTOA9BM4w7gQ8a/
         jq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355073; x=1734959873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0wFWBr32KIb+Vf5kLmU6z74BCWmq2VJBtWQ2NNT0As=;
        b=L8QZR13pcwmXFWHmaYjF7KOUB/zJgFVsgYeH1FpIS73VJb5Mm2mAbHBQgFbZxfn3xO
         aSv7n608Ax2zdq+25KOyKNAJmqxQFIgd3AGpnyEzhBe6sokbaDGtMht15Ly07ihQPUKC
         tTJxsAyHABmZ5qbJQXYHHx71xyJDqFk81sWc5/54KG29Ch1dhI/oV/E6Mpe91fUyYmWH
         J9BPGQDXR6ZFefl/NFtoRt+4rEX7Jh+9SGTWuQ4eefa4iiOsMmmzGQ4BH0pBmaKfTG9Q
         szXaATqDnUQUeKNOi7e6dKAwL3Ab0JeT5qXaXqLcmJ4/kdJ/3yoWvds5H28/gKX8Yn4R
         vXAQ==
X-Gm-Message-State: AOJu0Yz/RfsZ6yYEXItP4k5oWpKtqq4QkV11Nrts39+LboPG21O8QPQw
	Q58lyaaPrkV4wvTGdFZff3Ncqb+p1uj/bz7t3/N3mMRRzmp95C/QXK3AXB1jpCZimjFy5qENjvi
	rK844jZIWqJlGiuHy2qKMu8uiKus=
X-Gm-Gg: ASbGncvWs6yGymeJg5J3NA9FUknSQswfRKaWDZ6l+stGHdQyu9USz+Trs6dkmIp2oIq
	qWcd4jQilBlVwMQgudgYVHQ8BJgm0ax0eA47pNA==
X-Google-Smtp-Source: AGHT+IGCFCMWOu72WgG+K8rupDplawFP0gKh/ZHy+/TfPLlhtIEqMyTkywJGBN5eSDFl+dij0Tn9kvjvjA49favlH+Y=
X-Received: by 2002:a05:6122:1d10:b0:518:7ab7:afbf with SMTP id
 71dfb90a1353d-518ca3a6893mr10690285e0c.4.1734355072963; Mon, 16 Dec 2024
 05:17:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145831.127297-1-dan.scally@ideasonboard.com> <20241202145831.127297-2-dan.scally@ideasonboard.com>
In-Reply-To: <20241202145831.127297-2-dan.scally@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Dec 2024 13:17:27 +0000
Message-ID: <CA+V-a8umCJ4f1ZH_5oegqmxfYVA_31-qLb5+kT0hJ17rU-R=YQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
	isaac.scott@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 6:16=E2=80=AFPM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
> data captured from an image sensor without conversion to an RGB/YUV
> format. In that case the data are packed into 64-bit blocks, with a
> variable amount of padding in the most significant bits depending on
> the bitdepth of the data. Add new V4L2 pixel format codes for the new
> formats, along with documentation to describe them.
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v3:
>
>         - Switched from bayer-order specific formats to generic RAWnn
>
> Changes in v2:
>
>         - Added labels to the new formats in the documentation file
>         - Added 20-bit formats
>
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
>  .../media/v4l/pixfmt-rawnn-cru.rst            | 144 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |   4 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
>  include/uapi/linux/videodev2.h                |   6 +
>  5 files changed, 159 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cr=
u.rst
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Doc=
umentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index ed3eb432967d9..20a8aa0433047 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
>      pixfmt-srggb14
>      pixfmt-srggb14p
>      pixfmt-srggb16
> +    pixfmt-rawnn-cru
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b=
/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> new file mode 100644
> index 0000000000000..959ecc33654a1
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> @@ -0,0 +1,144 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-pix-fmt-cru-raw10:
> +.. _v4l2-pix-fmt-cru-raw12:
> +.. _v4l2-pix-fmt-cru-raw14:
> +.. _v4l2-pix-fmt-cru-raw20:
> +
> +************************************************************************=
**********************************************************
> +V4L2_PIX_FMT_CRU_RAW10 ('CR10'), V4L2_PIX_FMT_CRU_RAW12 ('CR12'), V4L2_P=
IX_FMT_CRU_RAW14 ('CR14'), V4L2_PIX_FMT_CRU_RAW20 ('CR20')
> +************************************************************************=
**********************************************************
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Renesas RZ/V2H Camera Receiver Unit 64-bit packed pixel formats
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +| V4L2_PIX_FMT_CRU_RAW10 (CR10)
> +| V4L2_PIX_FMT_CRU_RAW12 (CR12)
> +| V4L2_PIX_FMT_CRU_RAW14 (CR14)
> +| V4L2_PIX_FMT_CRU_RAW20 (CR20)
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +These pixel formats are some of the Bayer RAW outputs for the Camera Rec=
eiver
> +Unit in the Renesas RZ/V2H SoC. They are raw sRGB / Bayer formats which =
pack
> +pixels contiguously into 64-bit units, with the 4 or 8 most significant
> +bits padded.
> +
> +**Byte Order**
> +
> +.. flat-table:: RGB formats
> +    :header-rows:  2
> +    :stub-columns: 0
> +    :widths: 36 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 =
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
> +    :fill-cells:
> +
> +    * - :rspan:`1` Pixel Format Code
> +      - :cspan:`63` Data organization
> +    * - 63
> +      - 62
> +      - 61
> +      - 60
> +      - 59
> +      - 58
> +      - 57
> +      - 56
> +      - 55
> +      - 54
> +      - 53
> +      - 52
> +      - 51
> +      - 50
> +      - 49
> +      - 48
> +      - 47
> +      - 46
> +      - 45
> +      - 44
> +      - 43
> +      - 42
> +      - 41
> +      - 40
> +      - 39
> +      - 38
> +      - 37
> +      - 36
> +      - 35
> +      - 34
> +      - 33
> +      - 32
> +      - 31
> +      - 30
> +      - 29
> +      - 28
> +      - 27
> +      - 26
> +      - 25
> +      - 24
> +      - 23
> +      - 22
> +      - 21
> +      - 20
> +      - 19
> +      - 18
> +      - 17
> +      - 16
> +      - 15
> +      - 14
> +      - 13
> +      - 12
> +      - 11
> +      - 10
> +      - 9
> +      - 8
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * - V4L2_PIX_FMT_CRU_RAW10
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`9` P5
> +      - :cspan:`9` P4
> +      - :cspan:`9` P3
> +      - :cspan:`9` P2
> +      - :cspan:`9` P1
> +      - :cspan:`9` P0
> +    * - V4L2_PIX_FMT_CRU_RAW12
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`11` P4
> +      - :cspan:`11` P3
> +      - :cspan:`11` P2
> +      - :cspan:`11` P1
> +      - :cspan:`11` P0
> +    * - V4L2_PIX_FMT_CRU_RAW14
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`13` P3
> +      - :cspan:`13` P2
> +      - :cspan:`13` P1
> +      - :cspan:`13` P0
> +    * - V4L2_PIX_FMT_CRU_RAW20
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`19` P2
> +      - :cspan:`19` P1
> +      - :cspan:`19` P0
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 0a2f4f0d0a073..696b33add65b8 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -329,10 +329,14 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
>                 { .format =3D V4L2_PIX_FMT_SGBRG10DPCM8,  .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, =
0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_SGRBG10DPCM8,  .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, =
0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_SRGGB10DPCM8,  .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, =
0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +               { .format =3D V4L2_PIX_FMT_CRU_RAW10,     .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, =
0, 0, 0 }, .bpp_div =3D { 6, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_SBGGR12,       .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, =
0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_SGBRG12,       .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, =
0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_SGRBG12,       .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, =
0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_SRGGB12,       .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, =
0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +               { .format =3D V4L2_PIX_FMT_CRU_RAW12,     .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, =
0, 0, 0 }, .bpp_div =3D { 5, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +               { .format =3D V4L2_PIX_FMT_CRU_RAW14,     .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, =
0, 0, 0 }, .bpp_div =3D { 4, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +               { .format =3D V4L2_PIX_FMT_CRU_RAW20,     .pixel_enc =3D =
V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, =
0, 0, 0 }, .bpp_div =3D { 3, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>         };
>         unsigned int i;
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 0304daa8471d1..85bd068b14275 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1409,6 +1409,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>         case V4L2_PIX_FMT_SGBRG10DPCM8: descr =3D "8-bit Bayer GBGB/RGRG =
(DPCM)"; break;
>         case V4L2_PIX_FMT_SGRBG10DPCM8: descr =3D "8-bit Bayer GRGR/BGBG =
(DPCM)"; break;
>         case V4L2_PIX_FMT_SRGGB10DPCM8: descr =3D "8-bit Bayer RGRG/GBGB =
(DPCM)"; break;
> +       case V4L2_PIX_FMT_CRU_RAW10:    descr =3D "10-bit Bayer CRU Packe=
d"; break;
>         case V4L2_PIX_FMT_SBGGR12:      descr =3D "12-bit Bayer BGBG/GRGR=
"; break;
>         case V4L2_PIX_FMT_SGBRG12:      descr =3D "12-bit Bayer GBGB/RGRG=
"; break;
>         case V4L2_PIX_FMT_SGRBG12:      descr =3D "12-bit Bayer GRGR/BGBG=
"; break;
> @@ -1417,6 +1418,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>         case V4L2_PIX_FMT_SGBRG12P:     descr =3D "12-bit Bayer GBGB/RGRG=
 Packed"; break;
>         case V4L2_PIX_FMT_SGRBG12P:     descr =3D "12-bit Bayer GRGR/BGBG=
 Packed"; break;
>         case V4L2_PIX_FMT_SRGGB12P:     descr =3D "12-bit Bayer RGRG/GBGB=
 Packed"; break;
> +       case V4L2_PIX_FMT_CRU_RAW12:    descr =3D "12-bit Bayer CRU Packe=
d"; break;
>         case V4L2_PIX_FMT_SBGGR14:      descr =3D "14-bit Bayer BGBG/GRGR=
"; break;
>         case V4L2_PIX_FMT_SGBRG14:      descr =3D "14-bit Bayer GBGB/RGRG=
"; break;
>         case V4L2_PIX_FMT_SGRBG14:      descr =3D "14-bit Bayer GRGR/BGBG=
"; break;
> @@ -1425,10 +1427,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
>         case V4L2_PIX_FMT_SGBRG14P:     descr =3D "14-bit Bayer GBGB/RGRG=
 Packed"; break;
>         case V4L2_PIX_FMT_SGRBG14P:     descr =3D "14-bit Bayer GRGR/BGBG=
 Packed"; break;
>         case V4L2_PIX_FMT_SRGGB14P:     descr =3D "14-bit Bayer RGRG/GBGB=
 Packed"; break;
> +       case V4L2_PIX_FMT_CRU_RAW14:    descr =3D "14-bit Bayer CRU Packe=
d"; break;
>         case V4L2_PIX_FMT_SBGGR16:      descr =3D "16-bit Bayer BGBG/GRGR=
"; break;
>         case V4L2_PIX_FMT_SGBRG16:      descr =3D "16-bit Bayer GBGB/RGRG=
"; break;
>         case V4L2_PIX_FMT_SGRBG16:      descr =3D "16-bit Bayer GRGR/BGBG=
"; break;
>         case V4L2_PIX_FMT_SRGGB16:      descr =3D "16-bit Bayer RGRG/GBGB=
"; break;
> +       case V4L2_PIX_FMT_CRU_RAW20:    descr =3D "14-bit Bayer CRU Packe=
d"; break;
>         case V4L2_PIX_FMT_SN9C20X_I420: descr =3D "GSPCA SN9C20X I420"; b=
reak;
>         case V4L2_PIX_FMT_SPCA501:      descr =3D "GSPCA SPCA501"; break;
>         case V4L2_PIX_FMT_SPCA505:      descr =3D "GSPCA SPCA505"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index e7c4dce390074..b0482b9af04f5 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -830,6 +830,12 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_PISP_COMP2_BGGR   v4l2_fourcc('P', 'C', '2', 'B') /=
* PiSP 8-bit mode 2 compressed BGGR bayer */
>  #define V4L2_PIX_FMT_PISP_COMP2_MONO   v4l2_fourcc('P', 'C', '2', 'M') /=
* PiSP 8-bit mode 2 compressed monochrome */
>
> +/* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixel=
s */
> +#define V4L2_PIX_FMT_CRU_RAW10 v4l2_fourcc('C', 'R', '1', '0')
> +#define V4L2_PIX_FMT_CRU_RAW12 v4l2_fourcc('C', 'R', '1', '2')
> +#define V4L2_PIX_FMT_CRU_RAW14 v4l2_fourcc('C', 'R', '1', '4')
> +#define V4L2_PIX_FMT_CRU_RAW20 v4l2_fourcc('C', 'R', '2', '0')
> +
>  /* SDR formats - used only for Software Defined Radio devices */
>  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ =
u8 */
>  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ =
u16le */
> --
> 2.34.1
>
>

