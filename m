Return-Path: <linux-media+bounces-48681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D46CB7A3F
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F049D3011EC0
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6A5290DBB;
	Fri, 12 Dec 2025 02:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTH6RivM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEEE295DA6
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 02:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505461; cv=none; b=Cs3iTmPk8DL/lZ6LGILWpPtkEf0+XcQ5YS6KbL5lOOked7EVtQGl/DoQyphPQVMgmpUWKUp0abXucmPZd5XCqSblJRSXEBQ7UfYry1HkgNtl2bPDQWEGgnLrEppf6nIejEEa59H2rSB38STxcel7CWGDQZWkQDjzUqunI+OES8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505461; c=relaxed/simple;
	bh=Fo+Gwh9Fd5SKWIT8N7SkwVzalCNO8NceUsVd9MwM0g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNGv/NA+KEGJ+BUpzZtQuu/qCmVN4/3jCDXQ4r8UhYAoC8f6yRqBlAv9USe5u36SCI5HPJy3uQ/F1aaFOwQYgZamVgQzjMPLBaAh6l97nkoN64x16Q/jjjQxQHv3pTrnaEA5RuTQ9MWwo7lf+lWhkLpW4GTs5XrO1vkNFw2c85Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTH6RivM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D62C4CEF7;
	Fri, 12 Dec 2025 02:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505460;
	bh=Fo+Gwh9Fd5SKWIT8N7SkwVzalCNO8NceUsVd9MwM0g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTH6RivMznzeLnBVFNjcX5ispuEV4r5X8izcM35Co05LgGu1xYc7MPYyKFh4U+XdL
	 Yu+wliQfbjrS6Xyh3/ye04MvzMeAF8ZQxs+uuVaoMSFpCAXGjasGIJpVmjebbbxISM
	 00Ow7106r8oFpNTUXesqXi71faMyNAvwe2KKOoFTV8E6A6hIgsHKZlic8oNlaqVC4R
	 pQoiJgw/TT5aPWf1/J8wZmLfhDWHCXR7YJofTbWiJlOwxVjeQeHMWzFEJ60f4toAtF
	 2e2zFHp2ABdxBZ1eakwu1VDGd+KXgU5y5XsS+at0s19i+d6WsEzPrzTsdbdUAlzXQv
	 aesljO4mgbZCw==
Received: by venus (Postfix, from userid 1000)
	id B99721802EB; Fri, 12 Dec 2025 11:10:58 +0900 (JST)
Date: Fri, 12 Dec 2025 11:10:58 +0900
From: Sebastian Reichel <sre@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 5/5] media: ov02c10: Remove unnecessary hflip and
 vflip pointers
Message-ID: <i3e4lduuk6her3due2whewor55gdrv3wollgr3pcfwifpx27jm@ejfqpxonafum>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-6-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4eu73p72ryf4yrob"
Content-Disposition: inline
In-Reply-To: <20251210112436.167212-6-johannes.goede@oss.qualcomm.com>


--4eu73p72ryf4yrob
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/5] media: ov02c10: Remove unnecessary hflip and
 vflip pointers
MIME-Version: 1.0

Hi,

On Wed, Dec 10, 2025 at 12:24:36PM +0100, Hans de Goede wrote:
> The cci_update_bits() inside ov02c10_set_ctrl() can used the passed
> data in the ctrl argument to access the vflip control value.
>=20
> After changing this there is no need to store a pointer to the hflip
> and vflip controls inside struct ov02c10, drop these.
>=20
> Cc: Sebastian Reichel <sre@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>
Tested-by: Sebastian Reichel <sre@kernel.org> # T14s Gen6 Snapdragon

Greetings,

-- Sebastian

> Changes in v2:
> - Small commit msg tweak suggested by Bryan
> ---
>  drivers/media/i2c/ov02c10.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index f912ae142040..cf93d36032e1 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -381,8 +381,6 @@ struct ov02c10 {
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
> -	struct v4l2_ctrl *hflip;
> -	struct v4l2_ctrl *vflip;
> =20
>  	struct clk *img_clk;
>  	struct gpio_desc *reset;
> @@ -471,7 +469,7 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
>  		cci_write(ov02c10->regmap, OV02C10_ISP_Y_WIN_CONTROL,
>  			  ctrl->val ? 2 : 1, &ret);
>  		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
> -				BIT(4), ov02c10->vflip->val << 4, &ret);
> +				BIT(4), ctrl->val << 4, &ret);
>  		break;
> =20
>  	default:
> @@ -549,11 +547,11 @@ static int ov02c10_init_controls(struct ov02c10 *ov=
02c10)
>  					      OV02C10_EXPOSURE_STEP,
>  					      exposure_max);
> =20
> -	ov02c10->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> -					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_HFLIP,
> +			  0, 1, 1, 0);
> =20
> -	ov02c10->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> -					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_VFLIP,
> +			  0, 1, 1, 0);
> =20
>  	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
> --=20
> 2.52.0
>=20

--4eu73p72ryf4yrob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmk7ebIACgkQ2O7X88g7
+praKg//ZM7JpPfCfBScgXHeY661M8mkw8yRRc60FD0L0nQO/v9WFz1WCCpj/b29
rA1knus6CBelmJJbroqlZt4bnvmm2jyZusXTATAcccoo2vKJSIfmwW2nLm4m9mBJ
xYQQvIebZ4rQfgEXvD6rYfnYkfX0JiNg/vkQx2kUf4bwfBLHYq0q7TDmqpSquRWE
20iF3pj2EQbQXiFwL3lcsFv48SNm4+eYfYmeVLmf2hJPNyCq6EmXOHCSQklBed+3
WSez0SJwzZtju43Gn5uKkeAkk6daLhRXo74hb02QfaVqwCwnFB3soA9ML6c21cFT
IFCwuOYvggWHuKnj987QobahgOV24A7Z0INpaSoekBFeRfB81HwV1aV7JimGG+vQ
QsCKDSy/GgtTJEmde+PPf+itfdqxenJNYAtWTKn3YUNJn3PqX9jtDgREz2zZcamm
51m7tglc48RcS/TJfDmNvzbbHJohSWCMPnAyiIbJv01ZHLALCuIE0S5MA581B/gh
nKPkkAFV6u45FcAlQS4UTZpWr/f56/zw9oQPOFy1qMs8T42/cnD847D+C5SekfVK
zyht+QEs8XTX9r1y17ZeInqVDHWCNOEbV8oE89A8PA7fqGHlYEwt5tqtV007okrS
zTl1aToM+7I1uWIWwMeire2Tm4I02e6MbqhhEnuEqNO41xQxYOg=
=LR0I
-----END PGP SIGNATURE-----

--4eu73p72ryf4yrob--

