Return-Path: <linux-media+bounces-32480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C04AB6B9E
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 14:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 412857B0F44
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4B0278161;
	Wed, 14 May 2025 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JJu+36tq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0C625C71A;
	Wed, 14 May 2025 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226595; cv=none; b=AmSwpuvyZY7QaS0kMWWvXuIi6l4N9wRTIGRqLW8GZtoRcXpOSvVXUq0ov5ce1/yC/qv9cyYABHZbqxq6Xbp3LaHLaeHU3vFyndNLZw5Zz9A3mytM9CwdCKWflQ29781pWmiFL93VQxBf/UiNl+sFqGYCUdlu0Mq1sVqBcNHB0Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226595; c=relaxed/simple;
	bh=UyGdIibVSOqSmBCOI28bfc7IbRGF7lf1cPNTd2CyAns=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:Subject:From:Cc:To:Date:Message-ID; b=DWFx661hcahJ1QJgk6Rah1ubZ5crbytPLzzsMUpxL4uRzSmv+7/SMStYDFg4HyI8y8JhBlk3sSBX0GuKQ6Fl4A3ohOXXPFUPzThIStPH4RXakZKxP3WWl+fnuuD+Rm2HWN3Q+Nj7ZoWTH13fPYwcVKL1ffI8hEWyVm6zYC5NIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JJu+36tq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:65db:9f82:d481:46e1:75d5:ff64])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F9AF735;
	Wed, 14 May 2025 14:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747226575;
	bh=UyGdIibVSOqSmBCOI28bfc7IbRGF7lf1cPNTd2CyAns=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JJu+36tq1IYVxgGC+Ks0XsnOJXYLnul0pg1u/qmC4ZgDg+mHDF87F+UELy8vr0MWf
	 ivUrQHezq4T4ZMKcqq8PXJRKCYwdUL2fJa7HqTljxEf44hXN0/+qWIot4cPBqteiVf
	 z356sf3yn+bqglGI2wJ4GkKLlOxhL8RjUVu5imvo=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============2589365894410712436=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514-imx415-v1-1-bb29fa622bb1@emfend.at>
References: <20250514-imx415-v1-1-bb29fa622bb1@emfend.at>
Subject: Re: [PATCH] media: i2c: imx415: Request the sensor clock without a name
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
To: Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 14 May 2025 14:42:57 +0200
Message-ID: <174722657707.1845803.6950232855047026897@selene>
User-Agent: alot/0.12.dev11+g1dd20f1f

--===============2589365894410712436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Matthias,

Thanks for the patch.

Quoting Matthias Fend (2025-05-14 12:51:01)
> Request the sensor clock without specifying a name so that the driver
> behaves as described in the imx415 bindings.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx415.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 9f37779bd6111f434c198ad1cf70c14b80724042..278e743646ea15819d5a79577=
e786b47c259dbfa 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1251,7 +1251,7 @@ static int imx415_parse_hw_config(struct imx415 *se=
nsor)
>                 return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
>                                      "failed to get reset GPIO\n");
> =20
> -       sensor->clk =3D devm_clk_get(sensor->dev, "inck");
> +       sensor->clk =3D devm_clk_get(sensor->dev, NULL);
>         if (IS_ERR(sensor->clk))
>                 return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
>                                      "failed to get clock\n");
>=20
> ---
> base-commit: 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
> change-id: 20250514-imx415-c65889e55211
>=20
> Best regards,
> --=20
> Matthias Fend <matthias.fend@emfend.at>
>
--===============2589365894410712436==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmgkj9AACgkQQ96R+SSa
cUUBBQ//WCo/WnrJIOXDyUFiyYWlz7WpTIjN7DMRKbXFaDseWL8Za6KijHU10hbK
6B/H+rVGOi5OnwxyoxD0EmqxYldWitIu17nh0X5SShg+lq+ccRBmcgKobBhsTRtb
0zzAo1ENDlePYc+RqtmTLowVc1kmeNDpI9B2uk84pfq1sqTTM2LOrGHnULi3h7vS
hPNaMX+dH4E+Wo8u7WlNDqukPIAUd71fvTN8v+R55OcNM5AnJE0WuT3uPAbmLFgr
9S1srWpnUhSL7XT/jOP+R5YbpbxtRqiYFfdjwU//JftGBlQmizSZ649kY7dUmeXZ
+WzgClE6EXxEDyq1TOIK49pyBZCIgZSMwGop2wQJ+3wMlxEW+iAKUtiuTz5RYvc/
y5Pv/PImh/GdZCMhrDI7gJ1EyFdEFOjv8569qao6QhmM4J4z14x4esIKWY05kyhF
BrCc/AvdRKPedG9hHVZi1LkQgMHHCGnRUv3QNi07ad+1VOay2d7kNGzKs0764SpP
yyJHk9ugv4wrOPnLb1Z061f0CveKIcY390h8cbaoobuFDtYJMyAP5nwu3aR3fpMa
D+7s02a5ohyyAqJJtsCAM/U+oGhw+YBmUxuZcEfMS4J0kt3MgXziNd32WvjVm1BY
lkvSN6H5sdeGIW6AgMAOOz5ul/AeSi8jCjLL6I1uLWOiTy8WSF4=
=5KmA
-----END PGP SIGNATURE-----

--===============2589365894410712436==--

