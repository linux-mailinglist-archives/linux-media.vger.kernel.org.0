Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4CA8D406
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 14:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfHNM74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 08:59:56 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55249 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfHNM74 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 08:59:56 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D520860009;
        Wed, 14 Aug 2019 12:59:53 +0000 (UTC)
Date:   Wed, 14 Aug 2019 14:59:53 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCHv2 05/12] media: mtk-vcodec: flag OUTPUT formats with
 V4L2_FMT_FLAG_DYN_RESOLUTION
Message-ID: <20190814125953.GE11714@aptenodytes>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-6-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Content-Disposition: inline
In-Reply-To: <20190812110513.23774-6-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
>=20
> Tag all the coded formats where the mtk-vcodec decoder supports dynamic
> resolution switching.

Looks good to me despite lack of knowledge about the hardware.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 4 ++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers=
/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 90d1a67db7e5..26a55c3e807e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -29,16 +29,19 @@ static const struct mtk_video_fmt mtk_video_formats[]=
 =3D {
>  		.fourcc =3D V4L2_PIX_FMT_H264,
>  		.type =3D MTK_FMT_DEC,
>  		.num_planes =3D 1,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc =3D V4L2_PIX_FMT_VP8,
>  		.type =3D MTK_FMT_DEC,
>  		.num_planes =3D 1,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc =3D V4L2_PIX_FMT_VP9,
>  		.type =3D MTK_FMT_DEC,
>  		.num_planes =3D 1,
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc =3D V4L2_PIX_FMT_MT21C,
> @@ -948,6 +951,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bo=
ol output_queue)
> =20
>  	fmt =3D &mtk_video_formats[i];
>  	f->pixelformat =3D fmt->fourcc;
> +	f->flags =3D fmt->flags;
> =20
>  	return 0;
>  }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers=
/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index c95de5d08dda..9fd56dee7fd1 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -99,6 +99,7 @@ struct mtk_video_fmt {
>  	u32	fourcc;
>  	enum mtk_fmt_type	type;
>  	u32	num_planes;
> +	u32	flags;
>  };
> =20
>  /**
> --=20
> 2.20.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1UBckACgkQ3cLmz3+f
v9E3Ygf/X3gLqFGmzPpNCFqFyFnQocslbzWvFwlL+SPt4TXQy+2b06MobCzBdPlI
aFh1mQBHp8vuu/WzWcYqgdv+RIkdshEw/O8MLlIXp+c/aNB9xx9+XFXfRw37ecJ1
NaeoVNr9nu5eCGlxDMe4V8auSDbz9Ep1U2Nr+oOWJRymadXQ0EO1GLev/Y5gMDBX
dB/kZbhThQQACiaNb3AwfMW+sU4dwwjjhIEGkVToH15aFuEGkrJEt4s5rYp5fXyl
86fBAl+Jej45vlxEa9vbHJeTj8rC49+vQVPBIDug57wiKR9QSgUeughGipbnsqI1
bK5YLC2bNUqkgS+Oz0Ex54PmVzi1MA==
=IPWo
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--
