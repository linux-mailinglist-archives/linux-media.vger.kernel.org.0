Return-Path: <linux-media+bounces-5110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC4853EBF
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 23:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED79C1C21D1A
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 22:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF42B62178;
	Tue, 13 Feb 2024 22:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHhdAusz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FD958138;
	Tue, 13 Feb 2024 22:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707863564; cv=none; b=F/szNUs6a/t9AfGTkg+1sVY8Cx0zUfUuc8STxMrKtJ73+axAQFo53YzcU/q0XGSkPSVVOQiqM0IBOLl0fd6KH3IQe6nvJBg4K50DRaR+FQOFLKLv8OIwo6Y807iA5cpXXvtRFv+nThiQtIVTU+E6+7tAzym6YxHUwsSIvlZ3V2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707863564; c=relaxed/simple;
	bh=f44nsEhJCDnu3Cc9NTmCp54suvfdxHMTdGmgrDZ1tbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVt2i9Xl1Hm3J9kNlv8VJo8Mti2+P748O0DhI2FSOIOIVAMlaobm7AuyuyS3pciTKKvLPGGLQCk796ch0u40TlnNXI0HlmeaD0OgmP3kSsCJu4l+6io5Ja2TqGitd9qk4M58AEAnWA5n7WxqkcjgSBtiwzFOKxA193pIZXVP7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHhdAusz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBAEC433C7;
	Tue, 13 Feb 2024 22:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707863563;
	bh=f44nsEhJCDnu3Cc9NTmCp54suvfdxHMTdGmgrDZ1tbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHhdAusz6mzJXaXDBeRiOuRJFPHZx5UgvjFi6wbjllvvGSYUrVQFMg0sfDG0oSq/W
	 K/WTAKpIdweYz76J6+ddl0HaNnxiAVWaijWF2NSS98X61lZPdt4wawLCuFYCVm2QTS
	 v2EdmaQ+BNYVRe4eEI+CENSl3hj2kJ05PfVPGkuSdMDuICBuCIGiSHxpxetHClaif0
	 BU0UWQxdT0DmnGCaoKBMKFcWodffvgpERaawo1A43DVuH0F/ZLjUz1B+5M4AuLPIa7
	 Tp3PFPf+5XCK3mZOkvk7NrkvVOJQT4mXD5YEXF/3oVsqARPQjVjod543Bq/5LDOTxX
	 f8IbnGpw5W4uA==
Date: Tue, 13 Feb 2024 23:32:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov5645: Add a small delay after writes
 in ov5645_set_register_array()
Message-ID: <ZcvuCItn1vO6e2CZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ax8QMUNX5dvUDdf"
Content-Disposition: inline
In-Reply-To: <20240213140240.159057-3-biju.das.jz@bp.renesas.com>


--1ax8QMUNX5dvUDdf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Feb 13, 2024 at 02:02:40PM +0000, Biju Das wrote:
> Since OV5645 is showing issues @400kHz, it makes sense to add a small
> delay after register writes for settling the register values. So introduce
> a small delay by adding a read() after write() and also add a debug code
> for data mismatch.

That looks not right to me. A write reg should succeed. If it doesn't,
then either the bus speed needs to be reduced on that board, or the
frequency should be measured (maybe the clock on the bus is too fast and
bigger than 400kHz?), or maybe the chip has issues so we need delays
here and there. Just printing debug output if there is a mismatch is
nothing for upstream as well, I'd say. It helps to find out after which
register writes we need delays, but this is only for development, no?

All the best,

   Wolfram

>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index a5cc959d535e..ea9b7c610f2d 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -624,11 +624,20 @@ static int ov5645_set_register_array(struct ov5645 =
*ov5645,
>  {
>  	unsigned int i;
>  	int ret;
> +	u8 val;
> =20
>  	for (i =3D 0; i < num_settings; ++i, ++settings) {
>  		ret =3D ov5645_write_reg(ov5645, settings->reg, settings->val);
>  		if (ret < 0)
>  			return ret;
> +
> +		ret =3D ov5645_read_reg(ov5645, settings->reg, &val);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (val !=3D settings->val)
> +			dev_dbg(ov5645->dev, "Data mismatch reg=3D%x val=3D%x/%x\n",
> +				settings->reg, settings->val, val);
>  	}
> =20
>  	return 0;
> --=20
> 2.25.1
>=20
>=20

--1ax8QMUNX5dvUDdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXL7gcACgkQFA3kzBSg
KbY49A//QAGS+/g8wUKqLaGWPgyVMCma3OfVDm6emFMDBIWFb1bolYY4PcF9AVB1
rZsqlIJwE5623rcTpeSE/XoMwQPDoUeVAgATpLCKFvS2eyBcgBJsPNOmqTCobWYj
opG3fd9Pbp5qjJbgvJLYrLAtyOZg6+A/CvL8mpW5PhQZioz2Dnzx/XF1l4I/HChG
jWdOHBrWpHFSrTLZdw7V8iHaWFUUYMCdVs+r2T8D76jwNHO93s7VJtmHJJHLRO2y
QUzSlGj1pEGZKDrwNlUcdNhTjZP9NToohWqpq4E4R0BnfzwqWpHw9TnuL7/zeqee
zLvCc9Y7pTXveiou/nBvvJZSQlBDx49xfaFDMhJq+sW5TAfVKrfGkbLdjlv1gI0S
sramuYuMv5Vyv7OzcYRjIipVlV4dGTXs+PB6LwwZhP64nN8/gN1WNp7bc2Z8pnW6
z1t03MSJBq+zeJPeciEFICNH8yhEQzT93uCZ4FaIXGBmkrWieAr58PYgBnPigo7J
fQo37f8Edv58xwAnaDIS1XapTBSsgdmG1xCwTPG5X7iof/1gpOAvVjVxgeIK9VnC
Njsmy/aLmlk6CavvrQuIcwJxCUFhLocFFDY+IRaWUoslKvsSGi68wZCRZRqbPv/o
CYFBw5TFbvZprphlwUDfN6uMfpow4uHdch+g858FTy6cHBiZujU=
=lw4c
-----END PGP SIGNATURE-----

--1ax8QMUNX5dvUDdf--

