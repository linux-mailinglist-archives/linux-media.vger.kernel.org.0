Return-Path: <linux-media+bounces-48678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DA1CB79B1
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 772213014DF7
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943A621ABD0;
	Fri, 12 Dec 2025 02:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxttZz4S"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5441FDA;
	Fri, 12 Dec 2025 02:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505128; cv=none; b=r1PT2An5s/jz/A3msYR5xwUgFqkUtOq+QYbPHOlmWrMNhJVjVvf3ij4+51XGkJFR5TRuEi0/cnqXRIt9dfDPM5le4Cnrx7Tq4TAn8fiR+ILNGNOrGNGjpczYtGD3Uq+fsn/dk4go6NHK/YO02srZN/qlvB6AJuDNcnIirv5SU1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505128; c=relaxed/simple;
	bh=MSaHZ5+ju60XWpHl4bnexcxKffgfsNVGW5yUkrEcuh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEB2NhHh2lOEQF6mLvJUmjrkeixy1TaqDiIq7ZB03ebelxO4AR5tZPYCazEI04MmTsN7mvInSm2y8xQEVjWpOInETAAtlBq1yY89HBZA84XKp+MyhVOGiMr9wvo9PL62pQFK1KrzB1A5iGie2oCsco0cZitsEsz6rAla8nvTR68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxttZz4S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BB1C4CEF7;
	Fri, 12 Dec 2025 02:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505127;
	bh=MSaHZ5+ju60XWpHl4bnexcxKffgfsNVGW5yUkrEcuh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxttZz4S/6gCz0A8zKu+BB31Sz15VIqHrBUiCjg4cBf4CF5MEFfgNAaF9UOrnCep/
	 VfMc7ji/vtUUVS6nufLel4maWPwlAG/CHX3ZhSZxzU86mqqrD9HrOS8FX5JGF1t7nV
	 fwcbLkGQDHZ0uxthRbX5DDJjTjt+L0XikInxRxn2ybmAD+GzlSabU3a8iUxM/BEDNQ
	 kRZb8LY3go/Odad8Hya9K6xf6iom0IuRuO7b4v1iGFZXw9UyrQwFehJNn9TK9sMhaC
	 A4Q5GsFqoggnRLlvc9ItA1u84DT60A2+hQ+doql0unmAOyBSZIivrgsx7kgl1/sTOf
	 8ahtzXKDCLEXg==
Received: by venus (Postfix, from userid 1000)
	id 8914D1802EB; Fri, 12 Dec 2025 11:05:25 +0900 (JST)
Date: Fri, 12 Dec 2025 11:05:25 +0900
From: Sebastian Reichel <sre@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: ov02c10: Fix bayer-pattern change after
 default vflip change
Message-ID: <c2k57kin4kgabvpmdszcn6smwy3iwxqm5ca563z75fusrun5z7@fe2uzmt2ydri>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xlrdq3uuncn4wzrq"
Content-Disposition: inline
In-Reply-To: <20251210112436.167212-2-johannes.goede@oss.qualcomm.com>


--xlrdq3uuncn4wzrq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/5] media: ov02c10: Fix bayer-pattern change after
 default vflip change
MIME-Version: 1.0

Hi,

On Wed, Dec 10, 2025 at 12:24:32PM +0100, Hans de Goede wrote:
> After commit d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
> the reported bayer-pattern of MEDIA_BUS_FMT_SGRBG10_1X10 is no longer
> correct.
>=20
> Change the 16-bit x-win register (0x3810) value from 2 to 1 so that
> the sensor will generate data in GRBG bayer-order again.
>=20
> Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
> Cc: stable@vger.kernel.org
> Cc: Sebastian Reichel <sre@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

I'm not sure it's worth having this change, considering you are
dropping the whole setting in the next patch, which also has a
Fixes tag. In any case:

Reviewed-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>  drivers/media/i2c/ov02c10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index b1e540eb8326..6369841de88b 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -168,7 +168,7 @@ static const struct reg_sequence sensor_1928x1092_30f=
ps_setting[] =3D {
>  	{0x3810, 0x00},
>  	{0x3811, 0x02},
>  	{0x3812, 0x00},
> -	{0x3813, 0x02},
> +	{0x3813, 0x01},
>  	{0x3814, 0x01},
>  	{0x3815, 0x01},
>  	{0x3816, 0x01},
> --=20
> 2.52.0
>=20

--xlrdq3uuncn4wzrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmk7eGEACgkQ2O7X88g7
+prUWxAAic1A57XM+mIl5lyhKCIW7WFSnmEObUTFiUxEJ6A0I1kfZ0AoG9v9GT7Q
CbIC8eFwiRAlpZ6DHsWd8aZvIaOs6MimzrC5uP2GsBwc9bm6JlqH/hyU3mBKMIma
ncPbVrMRP/7V/lG6tmrL1Y8nTwcXUAFz9s6uFHp/2prY6Kim/QLtXt95lObkNUp1
wvrIYZdxsUu/gGD5vgTXeq3oflxupeYJm3CqUDiKS33Js/LUGGUCQkTJVCie7A/X
UdleG6xzjrAs1J6wo5Azlo4tRqJW3s06Wf/p90dTR16LneTcnHHFE3V93LKcewrg
vqabJewLDFvUFvNWuttHBuBTNAyS6MaHiYwU+fikYYBEY/QROofuXnCHAB7BjEVB
krotx3GxFzQM9f8XTayROAWWWio0/o8eemYobhcacLqqeGJMqPCoTA5TdBPB+FZv
52n1ywUWyq1qKt98R1iNZU7f8RJX3V1Eepfzyxt4EHkOTRicNIcNP89OPlOR+WGh
jKuiG5jRezCp5ugjIYsjU726saCBcSr3SGqL8dEto/lPfXo6xntgrHGy5bz16Lkd
SIUcqN6ittJXPO8lftON7f6qC+EfjjfuQSVuJcz44xaEJouwYhQsf3sa23er9QG8
HiyP7RQhTgsxdSY8589vy3nN3n70f1SLLlYPD+8qEx3mMsvqwoU=
=/k3u
-----END PGP SIGNATURE-----

--xlrdq3uuncn4wzrq--

