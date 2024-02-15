Return-Path: <linux-media+bounces-5221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34D185668F
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 15:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D101C22740
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863F113247C;
	Thu, 15 Feb 2024 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rW7uwNwD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AE713172C;
	Thu, 15 Feb 2024 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708008712; cv=none; b=Q/Qj/YhoCuTjFWEkN1duQcFAlofvCJ70UQmFHeDs8aiZrEU85x+2nNR+AVpVbvKRpsqgBaWfva4k02BkVq64WNt75tNQQkLfLpjhDVcEzB7x/OhCkRc4vg0LiL5vUm1e9TImAJecYBegqzgVYxeQfePwSpqWaTzj2tlxiWX6wKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708008712; c=relaxed/simple;
	bh=9EFi1oACmKg8nxZNrcqkL5Xb37gXnlwHmzDx7YTyAtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUOFJH0Do46Dak9jf3mURJEIbG3fYb7O/0ei0zBCf8NNQtXcg8uNu2ic+Qbtb3iN5xtdGcOfRWHdVa0H+xVCiggqojCCMUb9U0Z839RXAUlH0jFjfnJDGqYFnuY2JkUULa3cHxQ9NznVcdtpVTs9eWCSYWBnXSXhjrFSxwib40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rW7uwNwD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1009CC433C7;
	Thu, 15 Feb 2024 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708008711;
	bh=9EFi1oACmKg8nxZNrcqkL5Xb37gXnlwHmzDx7YTyAtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rW7uwNwDUraV1PrsxQnXxpqia0I8e3Mk3j41G6+IbeSgCrcpYXEZFV/KONkuGslyM
	 8/BFW24aX8au54VfWuCHs3S23Ak3e7AOGaCU9Ca3cXMFAHTbIJ9FCo191DTWWJuvVC
	 doTAULEY1bsNvv6wUd8WjkpiNu18MMVhegxdxSySceoYsmKyON3PIW+mfWdee+btpm
	 McZVYNOCD4jfuE0l/bEWvBl0/ktJih5JGlgAKwNZ5aR/zYppmXMOawXxiUglrJN57Q
	 BjVzLjG4tOHV5FnKz4gA0x3C5aqIbZ6D3GoiZEGnNO9vKYjZwGVAT10FbGJDQG6R8E
	 at2JWr12LuVrQ==
Date: Thu, 15 Feb 2024 15:51:48 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: ov5645: Remove software reset entry from
 ov5645_global_init_setting
Message-ID: <Zc4lBPebbKYcECbB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <20240215144333.82036-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yswr99nN9xHoeZCL"
Content-Disposition: inline
In-Reply-To: <20240215144333.82036-1-biju.das.jz@bp.renesas.com>


--yswr99nN9xHoeZCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 02:43:33PM +0000, Biju Das wrote:
> The SYSTEM_CTRL0 register in ov5645 is almost similar to ov5640. But the
> hard reset control is mandatory for the ov5645 device, so there is no
> need for soft reset in the driver.
>=20
> Add a 1msec delay for the software power up (OV5645_SYSTEM_CTRL0_START)
> register in ov5645_global_init_setting. Without this delay sometimes the
> image is not captured at all when the i2c frequency is 400kHz.
>=20
> The changes are fixing both the greenish issue and image capture at 400kHz
> i2c frequency on Renesas RZ/G2L SMARC EVK platforms.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Much better IMO.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--yswr99nN9xHoeZCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXOJQAACgkQFA3kzBSg
KbZ4ihAAlDB7MORWn2Ad12jRCbB3vu9Ybx+Tqtzfq7bn7zSgaV8qfGolQ8AQNGCK
HK5SFg+lIIwp2Az/Smbwc+spUMBexXsWy7GCdd/1REy0kodyqFzq1UcWpDZR9C6Z
gfG15PFWN5RsQDaO9xSF340CSk8NzphX9WJc15T+VLsKPF0EwrTrh88DEXZkunTr
Z2nh73JWm9toEe35ZXONsKlQ8w6ZaTsDle9CTHIlCtnpx2xWWd3t3MMrGIC2vQW+
7Jnyn8Z0gGymT9wa43F+wv2Onw9/mqFN1CfG35UV32jqXS6YkhREIfg5H28rwXGP
9ed9Y8SFp90+9fQLvRiaZBLPtu2RDZRdS37w9elXnLmSstHi7pfwZYT8fbVKMR63
6kHmalzPPpjrOcS9WQREqBfPovy9UesthSNvuTLWh++ZFrc0RP+llSHHqkb6RB11
2fV7Q9fvYyFq6AYG7MR5RBxvW8/waREBFDjwwNaPS3gJYuHcO4VPZvU5uxlMWjJf
dNGjU3i+5fQkaQHYBAD5cQqHGC/ZIw/2dNGbI1THwmAPI0Qe37mIGPwyUJZE5Ddk
1mBcErzkU6RTND2OiRZaO9ZQbAKyTWYbiHCqxXmjpaZKzibh4QcOaZs5hGmz+VHa
nxPr0YGx18dRlxw7OalHPIms7SWgHICSObvegB9/Hf2FIjoFV0k=
=wGoI
-----END PGP SIGNATURE-----

--yswr99nN9xHoeZCL--

