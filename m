Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3B98D3E4
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 14:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfHNMyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 08:54:22 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:35925 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfHNMyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 08:54:22 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5A48E6000A;
        Wed, 14 Aug 2019 12:54:20 +0000 (UTC)
Date:   Wed, 14 Aug 2019 14:54:20 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCHv2 03/12] media: venus: vdec: flag OUTPUT formats with
 V4L2_FMT_FLAG_DYN_RESOLUTION
Message-ID: <20190814125420.GC11714@aptenodytes>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-4-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline
In-Reply-To: <20190812110513.23774-4-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
>=20
> Tag all the coded formats where the venus vdec supports dynamic
> resolution switching.

Looks good to me.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/platform/qcom/venus/core.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/pla=
tform/qcom/venus/core.h
> index 959eaa550f4e..922cb7e64bfa 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -46,6 +46,7 @@ struct venus_format {
>  	u32 pixfmt;
>  	unsigned int num_planes;
>  	u32 type;
> +	u32 flags;
>  };
> =20
>  #define MAX_PLANES		4
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/pla=
tform/qcom/venus/vdec.c
> index 0b7d65db5cdc..7f4660555ddb 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -37,42 +37,52 @@ static const struct venus_format vdec_formats[] =3D {
>  		.pixfmt =3D V4L2_PIX_FMT_MPEG4,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_MPEG2,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_H263,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_VC1_ANNEX_G,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_VC1_ANNEX_L,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_H264,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_VP8,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_VP9,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_XVID,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt =3D V4L2_PIX_FMT_HEVC,
>  		.num_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  };
> =20
> @@ -379,6 +389,7 @@ static int vdec_enum_fmt(struct file *file, void *fh,=
 struct v4l2_fmtdesc *f)
>  		return -EINVAL;
> =20
>  	f->pixelformat =3D fmt->pixfmt;
> +	f->flags =3D fmt->flags;
> =20
>  	return 0;
>  }
> --=20
> 2.20.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1UBHsACgkQ3cLmz3+f
v9HZSwf9FbWyFUyUYK8+QZlSCAkst+4LXbsu1Boxje3hLNvjbl2yFGXyTTavsHML
SFt5ED65vdQoqs29VSvjSH7Zn+0suesitUH8BRc5NFze+IhsildeCmV7wq9qKF5h
88tfX5D2yWJnCKpnD4f7DIYm0chGr70ZCWTCr7/POdZC6T5yTlEY7kExVpfc6i8N
g9bOYX7z7ggPtfVc8ZF1FmCjk6jDRbHn2mc8xE9dg8ZmF8rq12LShw8Z8ffgfyyX
bGYfT9rqjDA0PrDkkEAGxgDF66lVfidx5u86NvYyUCQU4GTXOAQMaJ/VL4bq8Ywx
SmSAcSAQbe7Ccu8PdPp/8xhph3LrCw==
=Mgy/
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
