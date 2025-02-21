Return-Path: <linux-media+bounces-26539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D555A3ED1E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23D8C7AB013
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 07:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4D11FECC2;
	Fri, 21 Feb 2025 07:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sb3fOUjc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9B35979;
	Fri, 21 Feb 2025 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740121399; cv=none; b=bKCg35Sf9tMeA65AxdyZTA42MWAeE16Ozj6G1YEYGedrcTt4VEIZLFzPllV5hKCk+V6kpQ/6IX2wRO8W88ZzvqOUD/5qXFuSkzG0pPmW37Zle394A6sAwNYhFqv5rtk9eexcNOCNa6BcDk4z4g0YRII19xRUbUAj+jkSlwsQrco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740121399; c=relaxed/simple;
	bh=fL3VFHc8Iw4UEcrhx6AYcJSOc4ybHtXWyyLl28Js0K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUtd7v0Ktsw49Te4BOmeje49/SYOL1zaUdblDvelFLeu6w/NS/EpKOdI1jNEWcJDcbbmj5eU9EHBrVgG/foIIJxN5x+uLNql5dv1S5XEmlmVgEiH0+4Swk+tgB682QTnJ2ObTJ79HAqZkQwLmkbR2ujbpPXLBcfvENzxPKy4IWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Sb3fOUjc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC9EC7E0;
	Fri, 21 Feb 2025 08:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740121311;
	bh=fL3VFHc8Iw4UEcrhx6AYcJSOc4ybHtXWyyLl28Js0K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sb3fOUjc8Ww6ftO3DRierlIUIhRnugYs1k00i1XGt0yZ+HoWYADlDijVeegrVJlcn
	 jwynw9W5+nZyU4C6VON2EQjEIxsdLJUPpzgBfFQL7zUSx7bFi4iS71qDov0AxWXBr+
	 vxACfRy0BTvvxst9YPFGSgXqw6Gf9J4NbhRAX6y4=
Date: Fri, 21 Feb 2025 12:33:09 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: i2c: imx219: pass format's code to
 imx219_get_format_bpp()
Message-ID: <73rzq5ja6gsjd3oatbnqvmqminiolgz4meelvxqnbieategxsf@zb23f36gm4nd>
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-5-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qu3uozr2fidqrsfy"
Content-Disposition: inline
In-Reply-To: <20250220230818.275262-5-demonsingur@gmail.com>


--qu3uozr2fidqrsfy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/6] media: i2c: imx219: pass format's code to
 imx219_get_format_bpp()
MIME-Version: 1.0

Hi Cosmin,

Thanks for the patch.

On Feb 21, 2025 at 01:08:12 +0200, Cosmin Tanislav wrote:
> imx219_get_format_bpp() only uses the code of the format, pass it
> instead of the whole format to allow usage when the whole format is not
> available.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index fcd98ee54768e..ad1965a91ae3c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -387,9 +387,9 @@ static u32 imx219_get_format_code(struct imx219 *imx2=
19, u32 code)
>  	return imx219_mbus_formats[i];
>  }
> =20
> -static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
> +static u32 imx219_get_format_bpp(u32 code)
>  {
> -	switch (format->code) {
> +	switch (code) {
>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  	case MEDIA_BUS_FMT_SGRBG8_1X8:
>  	case MEDIA_BUS_FMT_SGBRG8_1X8:
> @@ -680,7 +680,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> =20
>  	format =3D v4l2_subdev_state_get_format(state, 0);
>  	crop =3D v4l2_subdev_state_get_crop(state, 0);
> -	bpp =3D imx219_get_format_bpp(format);
> +	bpp =3D imx219_get_format_bpp(format->code);
> =20
>  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
>  		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> --=20
> 2.48.1
>=20

--=20
Thanks,
Jai

--qu3uozr2fidqrsfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAme4JS0ACgkQQ96R+SSa
cUUyoQ//XZ0w48A1jFQeb14U2B2VcdX6fhhBL2Dw7kfgnqm9mVIOrt3BxXZDo4yk
dgi+CLC0RIDhrVtEnLN+m3L3f+Q+f5H6LV7QePfE2ZEYCAhXLgR8gRBx1NTIs9Ym
RmH+tCQw1tPto+5X6U6nP13vbHGPaxM3403m7U7Xe/qu7KNcPcpznm5dGzClWlmD
I0Foq0e2f5iRsjaIkvZf0cJ+XTX0G6i2BESibGX7Zrlk65bj0cr995UFYp3+IBEQ
Cn86gTDm4eL67hVppoy45eUbowOxJ+zVER7P73zbxc/s70M8qlc+t+mmJ3EEXuVU
j2mm451bRreIR9QoEo0D0y8P1a6QPGboTy2Gy7GDevQ+N3NsZlPEqtmGp/Mqlq4b
vl0Mj4pX5Y49VHFXCZjyrPFIxwobW2u+1dC5iy31+b5xWIm4c//If8Je1Bg9LBlo
vvvKcyP8pPy1rDFGn5014rgHlDIFrneiNln6/UQzG7bboI0kp0U0NbTFjkq2kdFi
lpjGyNX19zBlRnWhRIpOcXYKFF+++Zme9uVEG1DG1KZJRG+0aiLkc3PgQwcURknE
+AiBNpaW06e2mof17gRaftQwOR9P/vcNnjt4yXAQoKSxKIEzXdJcHNseXcE4JMhm
sztXjWNiv31ooynp3ARdYAZzbGpcybCbtfVhGsJyHCSPAuYL23E=
=qZw6
-----END PGP SIGNATURE-----

--qu3uozr2fidqrsfy--

