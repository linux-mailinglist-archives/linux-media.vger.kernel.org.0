Return-Path: <linux-media+bounces-40229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA61B2BA37
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8BD11BA53B8
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36072773D0;
	Tue, 19 Aug 2025 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CJCjvKiM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ECC1EA7D2;
	Tue, 19 Aug 2025 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755587598; cv=none; b=qwieh6hHbvoVZ1nr251479r6P0YKO7D/c0bLE6hoiu2bD8vOIwllBvxi3kbducH89TalYG9MMPghsSrm9QVEl0TV1s2M/lPSWghM6oZ6Z11B3Q9H4CIlNXKl54V9pvS+fXfIB1bc1P2Ik9yDQZ+AHqWP/ebF9DSjZS7Llo/Bm7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755587598; c=relaxed/simple;
	bh=OrioP7w60uI64tfCAiOMNFmII/54iaJxUCo4tU0t6Qs=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:From:Cc:To:Subject:Date:Message-ID; b=C9q3DTuPbahDJKtNNK4dnF3Z/pdDzjnvf+Ls9PXSoUqjkIyRCA9ZoXEkkuTRlKit8p0nO7RkA7Pfuz7vV92fQra7zbQd+RuwMgADM3CRQARBRvw5COklp31WQLclvAqHwDmQWAu8JBg8Rpd5eEQoi6Acp8cjb0n+zd0G/jwzjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CJCjvKiM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.157])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3404596;
	Tue, 19 Aug 2025 09:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755587537;
	bh=OrioP7w60uI64tfCAiOMNFmII/54iaJxUCo4tU0t6Qs=;
	h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
	b=CJCjvKiMimj4HLW9ftJG+0Sg6nVSu5s8RX4hvumRsf5D4VWLRZfYD7hXr0/1EeJNf
	 XHOI++BfQOzfyZvNuEC9IooP/h+3MQuMnxF9xSA4wAsrAsnYHnreVawtLrDttUX9is
	 8sYm4pttTi1T+nIKmIFZu/rYMTUNbdsndhwxAAmA=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============1524516976780608898=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175508015948.560048.7430206645162546917@ping.linuxembedded.co.uk>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com> <20250813-imx335_binning-v1-3-a42b687d8541@ideasonboard.com> <175508015948.560048.7430206645162546917@ping.linuxembedded.co.uk>
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 3/6] media: imx335: Update the native pixel array width
Date: Tue, 19 Aug 2025 12:43:01 +0530
Message-ID: <175558758114.8696.4076428044281728141@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

--===============1524516976780608898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting Kieran Bingham (2025-08-13 15:45:59)
> Quoting Jai Luthra (2025-08-13 08:20:34)
> > The sensor datasheet reports actual total number of pixels as 2696x2044.
>=20
> Err ...
>=20
> Page 2 of the IMX335LQN-D datasheet I have says:
>=20
> Total number of pixels: 2704 (H) x 2104 (V) approx 5.69 M pixels
> Number of Effective Pixels: 2616 (H) x 1964 (V) approx 5.14 M pixels
> Number of Active Pixels: 2616 (H) x 1964 (V) approx 5.04 M pixels
>=20
> Where does 2696x2044 come from ?
>=20
>=20
> Argh - then on page 8 - indeed it says
> Total Number of pixels 2696(H) x 2044(V) =3D 5.51M
>=20

Yeah, I don't know which one to use, but the page 8 seems "safer".

>=20
> In imx283.c I've moved to defining these windows as a v4l2_rect. I find
> that's a nicer way to convey the rectangles specifically instead of
> through #defines and then they can be directly used to report crop
> rectangles:
>=20
> i.e.:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/=
drivers/media/i2c/imx283.c:
>=20
> /* IMX283 native and active pixel array size. */
> static const struct v4l2_rect imx283_native_area =3D {
>         .top =3D 0,
>         .left =3D 0,
>         .width =3D 5592,
>         .height =3D 3710,
> };
>=20
> static const struct v4l2_rect imx283_active_area =3D {
>         .top =3D 40,
>         .left =3D 108,
>         .width =3D 5472,
>         .height =3D 3648,
> };
>=20
> Not required - but just an idea (that obviously I like :D)
>=20

Ah that is indeed quite nice, will do the same in v2.

>=20
> >=20
> > This becomes important for supporting 2x2 binning modes that can go
> > beyond the current maximum pixel array width set here.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx335.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index 6369bdbd2b09ba1f89c143cdf6be061820f2d051..dbf2db4bf9cbfd792ff5865=
264c6f465eb79a43b 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -124,10 +124,10 @@
> >  #define IMX335_NUM_DATA_LANES  4
> > =20
> >  /* IMX335 native and active pixel array size. */
> > -#define IMX335_NATIVE_WIDTH            2616U
> > -#define IMX335_NATIVE_HEIGHT           1964U
> > -#define IMX335_PIXEL_ARRAY_LEFT                12U
> > -#define IMX335_PIXEL_ARRAY_TOP         12U
> > +#define IMX335_NATIVE_WIDTH            2696U
>=20
> The all scan mode on page 56 doesn't show these at all.
> Just 12 + 2592 + 12
>=20
> But I think that's the datasheet being inconsistent/restrictive about
> what it says an all scan mode could be.
>=20
> It would be interesting to make a 'super resolution' output mode that
> can transmit every pixel possible but not required for this series
> development just for fun tests.
>=20

Yeah I think datasheet is being quite restrictive, and even the +12 on both
sides for "color processing" makes it very difficult to parse what the
actual resolution is on the wire, and what they expect to be used post ISP
processing.

The all-pixel scan mode table given in the datasheet is actually different
from what we actually use (we use WINMODE=3D4 i.e. cropped) for the 2592x19=
44
mode in driver, as the datasheet settings would give us 2592+24 =3D 2616
pixels per line.

I didn't want to change the existing mode in this series though. Making the
driver freely-configurable will fix all of this (hopefully).

> I'm torn here - as the datasheet changes it's points of reference to
> make it's "all scan mode" essentially start at 0 which is clearly not
> correct against the 'native' positions.
>=20
> So ... I think I'm just going to say I think we don't believe the
> datasheet as we *know* there are more pixels and we are using them so :
>=20
>=20
> > +#define IMX335_NATIVE_HEIGHT           2044U
> > +#define IMX335_PIXEL_ARRAY_LEFT                52U
> > +#define IMX335_PIXEL_ARRAY_TOP         50U
>=20
> I see you have taken the '80' extra pixels on both width and height and
> divided half before and half after centering the window. I have no
> information to say if it's position is otherwise so I think this is all
> we can do:
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>=20
> >  #define IMX335_PIXEL_ARRAY_WIDTH       2592U
> >  #define IMX335_PIXEL_ARRAY_HEIGHT      1944U
> > =20
> >=20
> > --=20
> > 2.50.1
> >

Thanks,
Jai
--===============1524516976780608898==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmikI/wACgkQQ96R+SSa
cUUhrg/8CaJH8DpYJ0aYicgshRm6ZP3Isy9DSxNCy4UC9iKY3+/mNu1N2gewyP3M
zRYujQIhE74IAxh/WaSyn/UdEiyJ2NIzu5fhmAGkN9jEV5ZRhTSW0pAum+WzpMsv
PRgF4dLnkxWon6xoVoxGIIV7kU+dyfWhLy6KO8ES5mWbR0grtx5z7MbNSyeNdXsR
QXgTRUwhSeIfR759Juh5/ZueubFPnC7eYyNjNXgjoRNGHnIDCgK6kze3ZoVUCh4Y
gXniEfuzZNGm87N6TY4HkSUtPyowemUeV9JiwXzMS1hSQ1AqFvYcdYhO1i/CS2Sj
u/YOz4SnON+fB8YVihSoSas5xGWdfmc/qyEI4DpqwrfYH5t0TQJeTruEl4X7EzSc
y4an+wV6o+UzaW12Z58qQLQEHHYYREViNNDnoJaPjApr7NbPWGXE7BzlK+a89Ym/
nI907+jNB7fjCF+HNYQO0lnjbIFDA+l4yzbNe6RZZBN5u19KYPo67Goa7nVQvaPH
64HzZhCR6Ir8K8oIr5oXWWfOQJsUVCLHeDe2jNdrm2mIV2O2NtNrcEd43cucw0ef
bhakI8+TqLup9W/AckBQhR+dQURg/GvZtF/YoCeaInzSXa4ebbn8MIpa76n0jC99
HSn1aHO9Ry3unDS8JOng5bzByphjGDVEEJ+CmLV2DMHT9+o0PVE=
=14ti
-----END PGP SIGNATURE-----

--===============1524516976780608898==--

