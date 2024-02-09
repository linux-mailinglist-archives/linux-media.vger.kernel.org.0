Return-Path: <linux-media+bounces-4899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9384FB20
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 18:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B5D7287EDB
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FE27E595;
	Fri,  9 Feb 2024 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L0ezojss"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2674E33
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707500157; cv=none; b=pd5suUcvIeFP/1Tv9EYqQQXIz+/KMPoa2U8CqFUFjOyjOGt33Nl8gcbztXvaE1tr1SE5/EJPFHb0YK8VM7enSATX/6P2LlnDLkc+QHZt0CErrlGlh5v/hSEVR20omuq59NwoUQec6G82qRfCALKQ5D311yepoO7YVkORGcAXEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707500157; c=relaxed/simple;
	bh=+cvuL5TKOhg8d9BPpDLs+fMACwYXdjo1VRAGUvenw8E=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=prJyRk5uRxVIOP32fsgM9Y1ed+VYee13mi3XiUp7o/KNsSezjJpS0dZOCJBiVrK5QW6jAOahNBH50pdTolR4HpXtLeki/XWQ9gZG7OfWwvIAkno48ojVQdwcaH/nwVO8x+YZj03pLDALkSMulvqX1+Sd1c/q4EK8AiaqnvyFHvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L0ezojss; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02FA474A;
	Fri,  9 Feb 2024 18:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707500068;
	bh=+cvuL5TKOhg8d9BPpDLs+fMACwYXdjo1VRAGUvenw8E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=L0ezojssf/8rNYglYUVp8qwBxgZoxImzrxATPIRhOiAymo+HR71cZE30KrejWILJf
	 266P3+RxOscSOFeo7nbBDaCigbHVOSlt++jBeSRWV5SNlM99avaFjoiQNnYAj+QK7q
	 d74x+INncVUOoBxUTw4vELU0six6OCRv1+mMR9vI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240209164825.166800-4-jacopo.mondi@ideasonboard.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com> <20240209164825.166800-4-jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 3/8] media: Add a pixel format for BRG48 and RGB48
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Fri, 09 Feb 2024 17:35:50 +0000
Message-ID: <170750015052.493890.8248324138903208198@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

In $SUBJECT s/BRG48/BGR48/


The other references all look like they state BGR correctly so with that
fixed:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

I think I heard you might have run this through some new linux-media CI
system. Does that produce artifacts that make it easy to see the
produced documentation? That would be easier to look at than the source
to see the table.

--
Kieran



Quoting Jacopo Mondi (2024-02-09 16:48:18)
> Add BGR48 and RGB48 16-bit per component image formats.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 39 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
>  include/uapi/linux/videodev2.h                |  4 ++
>  4 files changed, 47 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Docum=
entation/userspace-api/media/v4l/pixfmt-rgb.rst
> index b71b80d634d6..458308ae4eb8 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -996,6 +996,45 @@ arranged in little endian order.
> =20
>      \normalsize
> =20
> +16 Bits Per Component
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +These formats store an RGB triplet in six bytes, with 16 bits per compon=
ent.
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. flat-table:: RGB Formats With 16 Bits Per Component
> +    :header-rows:  1
> +
> +    * - Identifier
> +      - Code
> +      - Byte 1-0
> +      - Byte 3-2
> +      - Byte 5-4
> +    * .. _V4L2-PIX-FMT-BGR48:
> +
> +      - ``V4L2_PIX_FMT_BGR48``
> +      - 'BGR6'
> +
> +      - B\ :sub:`15-0`
> +      - G\ :sub:`15-0`
> +      - R\ :sub:`15-0`
> +      -
> +    * .. _V4L2-PIX-FMT-RGB48:
> +
> +      - ``V4L2_PIX_FMT_RGB48``
> +      - 'RGB6'
> +
> +      - R\ :sub:`15-0`
> +      - G\ :sub:`15-0`
> +      - B\ :sub:`15-0`
> +
> +.. raw:: latex
> +
> +    \normalsize
> +
>  Deprecated RGB Formats
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index d34d210908d9..ff4b4d2de9d2 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -253,6 +253,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>                 { .format =3D V4L2_PIX_FMT_RGB555,  .pixel_enc =3D V4L2_P=
IXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 =
}, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_BGR666,  .pixel_enc =3D V4L2_P=
IXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 =
}, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_BGR48_12, .pixel_enc =3D V4L2_=
PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0=
 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +               { .format =3D V4L2_PIX_FMT_BGR48, .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +               { .format =3D V4L2_PIX_FMT_RGB48, .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_ABGR64_12, .pixel_enc =3D V4L2=
_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, 0, 0, =
0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_RGBA1010102, .pixel_enc =3D V4=
L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0=
, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>                 { .format =3D V4L2_PIX_FMT_RGBX1010102, .pixel_enc =3D V4=
L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0=
, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 24f52485e59c..3c9b5b2f456c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1298,6 +1298,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>         case V4L2_PIX_FMT_RGBX1010102:  descr =3D "32-bit RGBX 10-10-10-2=
"; break;
>         case V4L2_PIX_FMT_RGBA1010102:  descr =3D "32-bit RGBA 10-10-10-2=
"; break;
>         case V4L2_PIX_FMT_ARGB2101010:  descr =3D "32-bit ARGB 2-10-10-10=
"; break;
> +       case V4L2_PIX_FMT_BGR48:        descr =3D "48-bit BGR 16-16-16"; =
break;
> +       case V4L2_PIX_FMT_RGB48:        descr =3D "48-bit RGB 16-16-16"; =
break;
>         case V4L2_PIX_FMT_BGR48_12:     descr =3D "12-bit Depth BGR"; bre=
ak;
>         case V4L2_PIX_FMT_ABGR64_12:    descr =3D "12-bit Depth BGRA"; br=
eak;
>         case V4L2_PIX_FMT_GREY:         descr =3D "8-bit Greyscale"; brea=
k;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 94a0373e8234..2782c7962974 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -584,6 +584,10 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  =
BGR 12-bit per component */
>  #define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  =
BGRA 12-bit per component */
> =20
> +/* RGB formats (6 bytes per pixel) */
> +#define V4L2_PIX_FMT_BGR48 v4l2_fourcc('B', 'G', 'R', '6') /* 16  BGR-16=
-16-16 */
> +#define V4L2_PIX_FMT_RGB48 v4l2_fourcc('R', 'G', 'B', '6') /* 16  RGB-16=
-16-16 */
> +
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Grey=
scale     */
>  #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Grey=
scale     */
> --=20
> 2.43.0
>

