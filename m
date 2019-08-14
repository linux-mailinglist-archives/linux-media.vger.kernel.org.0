Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3938D428
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 15:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfHNNEU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 09:04:20 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:47343 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbfHNNEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 09:04:20 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 44F8760005;
        Wed, 14 Aug 2019 13:04:18 +0000 (UTC)
Date:   Wed, 14 Aug 2019 15:04:18 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCHv2 06/12] media: vicodec: set flags for vdec/stateful
 OUTPUT coded formats
Message-ID: <20190814130418.GF11714@aptenodytes>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-7-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline
In-Reply-To: <20190812110513.23774-7-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
>=20
> Tag all the coded formats where the vicodec stateful decoder supports
> dynamic resolution switching and bytestream parsing.

Looks good to me:

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> [hverkuil-cisco@xs4all.nl: added CONTINUOUS_BYTESTREAM]
> ---
>  drivers/media/platform/vicodec/vicodec-core.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/medi=
a/platform/vicodec/vicodec-core.c
> index 7e7c1e80f29f..5152f44bcc0a 100644
> --- a/drivers/media/platform/vicodec/vicodec-core.c
> +++ b/drivers/media/platform/vicodec/vicodec-core.c
> @@ -742,6 +742,9 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vi=
codec_ctx *ctx,
>  			return -EINVAL;
>  		f->pixelformat =3D ctx->is_stateless ?
>  			V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
> +		if (!ctx->is_enc && !ctx->is_stateless)
> +			f->flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				   V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM;
>  	}
>  	return 0;
>  }
> --=20
> 2.20.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1UBtEACgkQ3cLmz3+f
v9EAiQf/UYkt27nazEdHOpl6TBSi7QonKSqiG6SyXKe1MJjz4BTb/3a8c2gdUel6
mdi+VUSdxTEfTWVWc88no18clNaRNT9Gs5kSSYkPoRQakEzkxmXU+dAurGsnAE3I
YplQnrVRX6cy//Cly/eZiHcWQuxaWoY9UgKXwm9wi1vgXk1YDN+1SGx1l5A9s++l
4t8p6F10FiTOwLWvav7gQb47r/sQRKe4iapOdhp9ikShyiYqnGiKmLG7ZDdVsCJZ
/VljFgMCx9AmqUpBJ2Lhkbe7G32Yo8f5sI4LRq13oCphWWQSzziKwZHMImo75XK+
0pr1gEOuFNM1gGOi2UNQy0g+l1jxUQ==
=HhV6
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--
