Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE2A124213
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 09:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfLRIn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 03:43:56 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:60855 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfLRIn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 03:43:56 -0500
Received: from aptenodytes (unknown [109.190.253.16])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 183C6100008;
        Wed, 18 Dec 2019 08:43:49 +0000 (UTC)
Date:   Wed, 18 Dec 2019 09:43:48 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, mripard@kernel.org, hverkuil@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: cedrus: hevc: Add luma bit depth
Message-ID: <20191218084348.GB2900@aptenodytes>
References: <20191213161516.54688-1-jernej.skrabec@siol.net>
 <20191213161516.54688-3-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline
In-Reply-To: <20191213161516.54688-3-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 13 Dec 19, 17:15, Jernej Skrabec wrote:
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Good catch, thanks!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 5a207f1e137c..13e58977309f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -420,6 +420,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  	      VE_DEC_H265_DEC_SPS_HDR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE(=
sps->log2_diff_max_min_luma_coding_block_size) |
>  	      VE_DEC_H265_DEC_SPS_HDR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3(sp=
s->log2_min_luma_coding_block_size_minus3) |
>  	      VE_DEC_H265_DEC_SPS_HDR_BIT_DEPTH_CHROMA_MINUS8(sps->bit_depth_ch=
roma_minus8) |
> +	      VE_DEC_H265_DEC_SPS_HDR_BIT_DEPTH_LUMA_MINUS8(sps->bit_depth_luma=
_minus8) |
>  	      VE_DEC_H265_DEC_SPS_HDR_CHROMA_FORMAT_IDC(sps->chroma_format_idc);
> =20
>  	reg |=3D VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SPS_HDR_FLAG_STRONG_INTRA_SMO=
OTHING_ENABLE,
> --=20
> 2.24.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl355sQACgkQ3cLmz3+f
v9ESgAgAhJTdZVtbPpT7EscqyjmkfLml6sT2cG4rlpNxp0uKIJXcKwC0V6sLcfir
KnwAgfKm9IAvL1D48uMBcw7BbDZK4NjKBzkEgCfcwhNBi4SH4opzCy37X3VvcGrX
PhSIVSDsQG0hS/z8GKinlkTuYWarUu/GS9Q1bBcnNXq2Qyg2rHGkeErOVRpuLpkI
SCIGMQslt+z9fk+cWZbvEILHZNMyWBFb60UNbO3a2cpcubNzxvZC7EH29qA8phA/
gxknBE3j4VF1zFWwW+hqcTTdnvBccJUoySmNYTuG5JulDpD7XeY4+CV0/bV1ygtP
TOjemgoIxM/rbgox4jMKfZEwH4xI3w==
=B0di
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
