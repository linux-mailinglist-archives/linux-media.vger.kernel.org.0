Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 262A98D3F0
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 14:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfHNMze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 08:55:34 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44929 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbfHNMze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 08:55:34 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3A27CFF802;
        Wed, 14 Aug 2019 12:55:31 +0000 (UTC)
Date:   Wed, 14 Aug 2019 14:55:30 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCHv2 04/12] media: s5p_mfc_dec: set flags for OUTPUT coded
 formats
Message-ID: <20190814125530.GD11714@aptenodytes>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Content-Disposition: inline
In-Reply-To: <20190812110513.23774-5-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
>=20
> Tag all the coded formats where the s5p_mfc decoder supports dynamic
> resolution switching or has a bytestream parser.

Looks good to me, despite lacking knowledge of whether this matches what the
hardware really supports.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> [hverkuil-cisco@xs4all.nl: added CONTINUOUS_BYTESTREAM]
> ---
>  .../media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c   | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/me=
dia/platform/s5p-mfc/s5p_mfc_common.h
> index 96d1ecd1521b..31b133af91eb 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> @@ -723,6 +723,7 @@ struct s5p_mfc_fmt {
>  	enum s5p_mfc_fmt_type type;
>  	u32 num_planes;
>  	u32 versions;
> +	u32 flags;
>  };
> =20
>  /**
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media=
/platform/s5p-mfc/s5p_mfc_dec.c
> index 61e144a35201..1423c33c70cb 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> @@ -62,6 +62,8 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V5PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_H264_MVC,
> @@ -69,6 +71,8 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V6PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_H263,
> @@ -76,6 +80,7 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V5PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_MPEG1,
> @@ -83,6 +88,8 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V5PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_MPEG2,
> @@ -90,6 +97,8 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V5PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_MPEG4,
> @@ -97,6 +106,8 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V5PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_XVID,
> @@ -104,6 +115,7 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V5PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_VC1_ANNEX_G,
> @@ -111,6 +123,7 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V5PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_VC1_ANNEX_L,
> @@ -118,6 +131,7 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V5PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_VP8,
> @@ -125,6 +139,7 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V6PLUS_BITS,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_HEVC,
> @@ -132,6 +147,8 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V10_BIT,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		=3D V4L2_PIX_FMT_VP9,
> @@ -139,6 +156,7 @@ static struct s5p_mfc_fmt formats[] =3D {
>  		.type		=3D MFC_FMT_DEC,
>  		.num_planes	=3D 1,
>  		.versions	=3D MFC_V10_BIT,
> +		.flags		=3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  };
> =20
> --=20
> 2.20.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1UBMIACgkQ3cLmz3+f
v9ElHggAhH3o1W5DqW6ggFnkuSAXOFcBmVwVslY5mdHxZ7dbLKYHG/pJBYQl3sjO
EEuKBDx08+7s65ZFKWAbwj4UxxAk5p5yaVZCLyKzNQBU+RKfY6JieyJInJ6o0Vui
Cc4NGiOc1qb+UaV3yt3eP0wDfMvVV/wyqMBs6rHEeC3SYcoCzucvJ3FWtld+2GfD
dwFeYwQQU/c6a9rGx40vyBxcOdxB4X8Ehh1C8RNMw8HTaW/ooboBUOeXLA03OVlr
Lk9lSLIvSnNhZJ5X4jfWOGPpP0KfyRusWM0uWtGxOPp0KWB8tMo3XUj8FI5vAXvD
+fjba6pxqO2L/d6EU4CChFzcePxHQQ==
=IYU1
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--
