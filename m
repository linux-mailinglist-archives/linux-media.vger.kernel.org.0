Return-Path: <linux-media+bounces-48679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64005CB7A36
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6E1830421BC
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A9328FFF6;
	Fri, 12 Dec 2025 02:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFgiGffX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD58428B3E2;
	Fri, 12 Dec 2025 02:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505373; cv=none; b=QmFm/KLRwavgre3TFn0xRx+woe3+VB6d8VnL5M5xc1vTUNlQ3k0ahMqeIh8cQDpFJjIlPvMIAeSIIYrFJ6vXUGJAcmgnyFdKI0cAYtCBxjfVjWgCk95s2eM+X33Ic/zFbrpA2dRoZ36pqkLTCnlWs8jLdmaq6HUz9vC5xOy2ejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505373; c=relaxed/simple;
	bh=8d/p7Kfe56SAM2NSmBdFM6quJGMXFnDuqMBjoEQ644o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ7uOaS37ofhKRF+NNOXHlzkksu+flnZpC1+zBmD0ci+4/EukChCKG+QBxsxJZ/bK/ZQ3Zu7QZIoWr5H/jaLuBRyGgTFnaKEYH1ZVD3e6Bq0I+U8f4NqPbRom/+JYQmhCXyvDLTTsYcIaElfMVo42y3kE221gGi47GWkstln4fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFgiGffX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D74BC4CEF7;
	Fri, 12 Dec 2025 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505372;
	bh=8d/p7Kfe56SAM2NSmBdFM6quJGMXFnDuqMBjoEQ644o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFgiGffXlLE/4DEqc5AT2hqLXpX87mCEa7at+QcTlA5d2GTiliFhgdeErr4AUAOeR
	 orZy+UZ81Jqop5QXjunpBaEL82RA6oHA+qx9XypvRX5Gc0ibsXWPo2AH14mfcBNawh
	 NwCIHX3ly1FNSRRoH5rb2r5/N1iuL5e9qLRcHuVQh91yWR8fUqeILJ6pCSby71YO4Q
	 CnISHBCNLOAAhgJf3sHXiYcINrH4UjlClXOr7jXreBWrxkoAgYxKWqFOlhJZOdH+oR
	 A5ynDUl0AfddZynsa7cVEYXJx18a/mUsj+pH3+WMX4+1jqKPHsYQpzT+1leDO8AIYN
	 t+qLAR2eQMevg==
Received: by venus (Postfix, from userid 1000)
	id CC89D1802EB; Fri, 12 Dec 2025 11:09:30 +0900 (JST)
Date: Fri, 12 Dec 2025 11:09:30 +0900
From: Sebastian Reichel <sre@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: ov02c10: Adjust x-win/y-win when changing
 flipping to preserve bayer-pattern
Message-ID: <cdxybxqubhacovewptwyvbxpemqcco4i5xgd7uzksqnfsubt2n@e5qhrq6xzaz3>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-3-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43vfhpqroxga75lj"
Content-Disposition: inline
In-Reply-To: <20251210112436.167212-3-johannes.goede@oss.qualcomm.com>


--43vfhpqroxga75lj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/5] media: ov02c10: Adjust x-win/y-win when changing
 flipping to preserve bayer-pattern
MIME-Version: 1.0

Hi,

On Wed, Dec 10, 2025 at 12:24:33PM +0100, Hans de Goede wrote:
> The ov02c10 is capable of having its (crop) window shifted around with 1
> pixel precision while streaming.
>=20
> This allows changing the x/y window coordinates when changing flipping to
> preserve the bayer-pattern.
>=20
> __v4l2_ctrl_handler_setup() will now write the window coordinates at 0x38=
10
> and 0x3812 so these can be dropped from sensor_1928x1092_30fps_setting.
>=20
> Since the bayer-pattern is now unchanged, the V4L2_CTRL_FLAG_MODIFY_LAYOUT
> flag can be dropped from the flip controls.
>=20
> Note the original use of the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag was
> incomplete, besides setting the flag the driver should also have reported
> a different mbus code when getting the source pad's format depending on
> the hflip / vflip settings see the ov2680.c driver for example.
>=20
> Fixes: b7cd2ba3f692 ("media: ov02c10: Support hflip and vflip")
> Cc: stable@vger.kernel.org
> Cc: Sebastian Reichel <sre@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>
Tested-by: Sebastian Reichel <sre@kernel.org> # T14s Gen6 Snapdragon

Greetings,

-- Sebastian

>  drivers/media/i2c/ov02c10.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 6369841de88b..384c2f0b1608 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -165,10 +165,6 @@ static const struct reg_sequence sensor_1928x1092_30=
fps_setting[] =3D {
>  	{0x3809, 0x88},
>  	{0x380a, 0x04},
>  	{0x380b, 0x44},
> -	{0x3810, 0x00},
> -	{0x3811, 0x02},
> -	{0x3812, 0x00},
> -	{0x3813, 0x01},
>  	{0x3814, 0x01},
>  	{0x3815, 0x01},
>  	{0x3816, 0x01},
> @@ -465,11 +461,15 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
> =20
>  	case V4L2_CID_HFLIP:
> +		cci_write(ov02c10->regmap, OV02C10_ISP_X_WIN_CONTROL,
> +			  ctrl->val ? 1 : 2, &ret);
>  		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
>  				BIT(3), ov02c10->hflip->val << 3, &ret);
>  		break;
> =20
>  	case V4L2_CID_VFLIP:
> +		cci_write(ov02c10->regmap, OV02C10_ISP_Y_WIN_CONTROL,
> +			  ctrl->val ? 2 : 1, &ret);
>  		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
>  				BIT(4), ov02c10->vflip->val << 4, &ret);
>  		break;
> @@ -551,13 +551,9 @@ static int ov02c10_init_controls(struct ov02c10 *ov0=
2c10)
> =20
>  	ov02c10->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>  					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> -	if (ov02c10->hflip)
> -		ov02c10->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> =20
>  	ov02c10->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>  					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> -	if (ov02c10->vflip)
> -		ov02c10->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> =20
>  	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
> --=20
> 2.52.0
>=20

--43vfhpqroxga75lj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmk7eVoACgkQ2O7X88g7
+ppt7g/+LNEJZMykrW/nke2hJCCSA4H/wBRqR1m9Npgfrftxmt0Cw+XCJ4EczrsV
xfrXeYMJ0G9oagIWIerrPmWw8DxMYDh6a7wR/slq+msoEhSmoInas0LnueppysTl
zeqKwJqNLjydvzrxjQPsSa11/MoxYXQVqds6V4607s6fhwMmx8kbmPX3mmW+qRlU
JhpcpInfUGXZ47+kTZ8qP9iVBDKD9/IBzTi04Thdz/PiBIFYG/BV2o/CR8zyLSs7
oWyKKZxbUZKVCPZ+Xc1ccXgzBl154eEn6mSw97osfi52rewy9R6g1MsQpZ0Xhx3e
G+jzGD+VMV+lM5E8HG9KX4LOwD7cVT5PGG0CecQyzb5kWPFDoNpJ0V3DJTWuXTqn
Th/yQC4DnUFcCG0bMfF6IT4Cufu0NNT/w/zry26m+Ri/M/2oyYIiCDgNCu+H0EQZ
qTp5XkHXDT+8THhG/4Ifa8N8Mxy0IC9QmR1lzN0F3Chl/jTLJy5dury0/SrW3i6b
pG+CukCd5VpypsgQHVMxn0LGx+o2JPBcsuhFFPxD4KfzJtUvv4N+TMC/NJHMChwB
BOvsmuUCbv5CJz60JQ6QkvgJ6YAHawkgTX3BRmaADFD/n7hT4XjpLmyZ3w4CTUOs
NKeRqKfY4jB3vjo/MqHUrik7OVtN59oCfZhzY+fc96lPztaq19k=
=5J6e
-----END PGP SIGNATURE-----

--43vfhpqroxga75lj--

