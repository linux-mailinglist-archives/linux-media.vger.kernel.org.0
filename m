Return-Path: <linux-media+bounces-24102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0169FCD5C
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 20:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2B7B1883129
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 19:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132D014AD29;
	Thu, 26 Dec 2024 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oJo4KlQn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA61EEF9;
	Thu, 26 Dec 2024 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735241679; cv=none; b=jN96XC8eSH7zLqyt1Ez131UJ/3XWDJa/ZNnJrQ0Q/vqgtVQFQdXEvKP54dVIm7TeK2tHfD8+aXig6NuT4i+Qvm80wfempX4JQA4BeY2Fhv5B1muDhX15WinjukivWwarut493XL2qNlHwSPokA2fCZHCCj3qKGjryelG2pWpsM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735241679; c=relaxed/simple;
	bh=jaxKQkcQJ6HPxYdCnrscSMQA7KMAce/g/gry8Yxui9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucBVquP5wrniBG+Y+1qnUVZncRVk9CGDSIr7lSkHOM+7mQKUAIkjkKDRK3xnbnqNKkNZRVbZvoo0XMqEyff9ix4Uc79kEjPUuc64HHfclLLCPkxwgXgxlhJJ7HOKr+2MBhATKgFqZfD1jZcjDhjkyvV0XEu1Z7xUERJg57FKpOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oJo4KlQn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4ee5:4f3d:d64c:ba0b:db2e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 774F163F;
	Thu, 26 Dec 2024 20:33:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735241629;
	bh=jaxKQkcQJ6HPxYdCnrscSMQA7KMAce/g/gry8Yxui9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJo4KlQnmcRWAQ7LVdo199ePRhaYuReaprdVaIqHuRyFQCEg2jHkRojFNQB40J7Cl
	 SEQMJMJeuQqgJXhhxLCyWgQIKbd5zsTvMFnAPrHDJCvxWVh5iqN7mfneSbTmTU1OVw
	 xfILWh0xp8hnGmY5eLGrXgNuBv8t6mjlsDkZf1vY=
Date: Fri, 27 Dec 2024 01:04:23 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 4/5] media: i2c: imx219: Update PLL multipliers
Message-ID: <y7k6uugodwgyijl7mmakycwoklzbb4i5zdwhccrooz2lo4aqm6@rcawfilxiqqm>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
 <20241226-imx219_fixes-v4-4-dd28383f06f7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofiosnjpcgcnstu5"
Content-Disposition: inline
In-Reply-To: <20241226-imx219_fixes-v4-4-dd28383f06f7@ideasonboard.com>


--ofiosnjpcgcnstu5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/5] media: i2c: imx219: Update PLL multipliers
MIME-Version: 1.0

On Thu, Dec 26, 2024 at 01:19:36PM +0530, Jai Luthra wrote:
> Switch to different PLL multipliers and FLL/LLP to achieve the same

Self NACK here. The new PLL multipliers also mean a different pixel rate, I=
=20
missed making that change in this patch.

On further testing, only updating the minimum LLP from 0xd78 to 0xde8 is wh=
at=20
fixes the issue. The change to the PLL multipliers is not really needed.

> resolution and framerate while avoiding blocky artefacts seen when using
> analog binning with RAW10 format on higher resolutions [1].
>=20
> These new settings match the register sequence generated for
> 1640x1232@60fps (2x2 analog binned) RAW10 mode where no artefacts are
> present. The same values work for other modes as well. It is unclear
> from the datasheet why a higher HBLANK, lower VBLANK and lower PLL
> multipliers fix the artefacts seen before.

I will send a v5 that does not change the PLL multipliers but only increases
the minimum LLP (and decreases vts_def for all modes, so that we still hit=
=20
30/60fps)

>=20
> [1]: https://github.com/raspberrypi/rpicam-apps/issues/281#issuecomment-1=
082894118
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 84681e5da3e238905139fe174e9ee3cfe5fa0246..a8fcb7234c78b888cd7424629=
ced02cdc55a98fd 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -74,7 +74,7 @@
>  #define IMX219_FLL_MAX			0xffff
>  #define IMX219_VBLANK_MIN		32
>  #define IMX219_REG_LINE_LENGTH		CCI_REG16(0x0162)
> -#define IMX219_LLP_MIN			0x0d78
> +#define IMX219_LLP_MIN			0x0de8
>  #define IMX219_LLP_MAX			0x7ff0
> =20
>  #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
> @@ -171,9 +171,9 @@ static const struct cci_reg_sequence imx219_common_re=
gs[] =3D {
>  	{ IMX219_REG_VTSYCK_DIV, 1 },
>  	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 =3D AUTO set */
>  	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 =3D AUTO set */
> -	{ IMX219_REG_PLL_VT_MPY, 57 },
> +	{ IMX219_REG_PLL_VT_MPY, 48 },
>  	{ IMX219_REG_OPSYCK_DIV, 1 },
> -	{ IMX219_REG_PLL_OP_MPY, 114 },
> +	{ IMX219_REG_PLL_OP_MPY, 96 },
> =20
>  	/* Undocumented registers */
>  	{ CCI_REG8(0x455e), 0x00 },
> @@ -287,25 +287,25 @@ static const struct imx219_mode supported_modes[] =
=3D {
>  		/* 8MPix 15fps mode */
>  		.width =3D 3280,
>  		.height =3D 2464,
> -		.vts_def =3D 3526,
> +		.vts_def =3D 2876,
>  	},
>  	{
>  		/* 1080P 30fps cropped */
>  		.width =3D 1920,
>  		.height =3D 1080,
> -		.vts_def =3D 1763,
> +		.vts_def =3D 1438,
>  	},
>  	{
>  		/* 2x2 binned 30fps mode */
>  		.width =3D 1640,
>  		.height =3D 1232,
> -		.vts_def =3D 1763,
> +		.vts_def =3D 1438,
>  	},
>  	{
>  		/* 640x480 30fps mode */
>  		.width =3D 640,
>  		.height =3D 480,
> -		.vts_def =3D 1763,
> +		.vts_def =3D 1438,
>  	},
>  };
> =20
>=20
> --=20
> 2.47.1
>=20

--ofiosnjpcgcnstu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmdtr7kACgkQQ96R+SSa
cUWpvhAAu+GZPY0XUfVj1SF47Dzu+71Ld/rHxdosfE8fH2eqPkyDe/i/sG+wr1UF
KPThQ3B698CZIw0/vo18lqQB1MJGsqah0ssFi5oTANVuUlEhV7nxI8sBLIhW6xlW
VtER54OAosHzJ9U4NfaigB/Z8TWqketyluQX0U5vZBTjpUNbTzq7ctlYmJq+ybZb
iA7/YFHAxbhFhK/hJz/liLbioAUbD4p+2kilXCOfKcrrN9DjeFi+0kup8E2HZcJt
74k0kNMIDuQdXHCkoh9E7/OwEh7mNSF3RT21eimMx+/ifYa5qwULSShVIKZn/tRv
QNcuJYIMYm8yFHCzpmN3BIAqJ3H2lVqLgHez7SVYYN7Z09CmidktVh+FGocY//4a
JCJFCPNCzICY1ekmtAfFtJhFaULM3O1uikCrRcTDyAmTIGaT1c8bTxFyCR2+o7gz
wVgOTD6VcRGuj8i2h8jjoI9/wrbnay4A2+h+IT9xn7F28KsUd/Hw6v6qRV3SVQsa
YB0Y/aydKPy3PUJweZCSgEN2rPAqL2OymSNeptA3+GZqmeZPXDua9hEZVNR8wcZ3
w+O+ml4+lZ15UI7lOJAY6J2299KR3irKc66gLVAjnfk1TvzTmBhasVcETcbJe/2m
KmbY4KXiAww2sf66t2E21IuWMuaHIcCqY5JI70TxeYKP1U3lUfQ=
=1Qw2
-----END PGP SIGNATURE-----

--ofiosnjpcgcnstu5--

