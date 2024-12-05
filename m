Return-Path: <linux-media+bounces-22704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751A9E54C3
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 13:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3610516AC2E
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 12:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE09214A7E;
	Thu,  5 Dec 2024 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ImR+GtGI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE38214A71;
	Thu,  5 Dec 2024 12:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400022; cv=none; b=eivZmaRaA+2jgImyeJmFA9gp1jLyj48KnPlkVUn58VkD1ss4s9Dpl5ICE8g/npAMKp0lOYy09SIhxWK8TddxUQObAMtjmyrVgK52fFksuEtUBAtrLJcpeRbwhd+Phc6Aa8U7P5WvsGwJW/cEBrjDtNJR117+l4pHzk4TbvndrL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400022; c=relaxed/simple;
	bh=EHWkyipe9roka/o7iKOg8L6iIH2p1aW8Cxu+0EcgdxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeON8+2FGGXHic1sJl6VkHEPhqag+q5YUFkj7aPgPoZBMq3ScTMlNcI4apfdRSoHNeemw5MHxZGdUAVtOUoYfMKNm2hZv0N/JO8/vjvmHtMrZhduuOGdHBt4lSI/BRRjGVimhEddstCKqQDlUWMgUk7yltWctzG/vDeQQlip8P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ImR+GtGI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:dd5a:60c0:2d2a:9a5a:1723])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD4AD3E;
	Thu,  5 Dec 2024 12:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733399990;
	bh=EHWkyipe9roka/o7iKOg8L6iIH2p1aW8Cxu+0EcgdxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ImR+GtGIXN4GeBcppHzvw/Ywp3A6XJYWelmE+/4Q6j4oHfubdg3h2aI/FbHVfxKYf
	 h4i4ytx5jWw1BxglEt9BuEEnuBCl0Jon2e8aIPsNHULNayijIluHaRfdAt7fAuot32
	 yXJwgzGqIlgn4XoixT1TQ8c4l8TTCHbjgGgQfMqw=
Date: Thu, 5 Dec 2024 17:30:13 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/15] media: i2c: ds90ub960: Add support for I2C_RX_ID
Message-ID: <d72utbt36uhutdlzl5a6vkjl7mxl2cfgfo6ax6fuvkpit2u3i4@eov4fsavtxw4>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <20241204-ub9xx-fixes-v3-7-a933c109b323@ideasonboard.com>
 <Z1Fk7jRVQJZzsTQp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pmmwf2hswfn26wvm"
Content-Disposition: inline
In-Reply-To: <Z1Fk7jRVQJZzsTQp@smile.fi.intel.com>


--pmmwf2hswfn26wvm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 07/15] media: i2c: ds90ub960: Add support for I2C_RX_ID
MIME-Version: 1.0

Hi Tomi,

On Dec 05, 2024 at 10:31:42 +0200, Andy Shevchenko wrote:
> On Wed, Dec 04, 2024 at 01:05:21PM +0200, Tomi Valkeinen wrote:
> > Normally the driver accesses both the RX and the TX port registers via a
> > paging mechanism: one register is used to select the page (i.e. the
> > port), which dictates the port used when accessing the port specific
> > registers.
> >=20
> > The downside to this is that while debugging it's almost impossible to
> > access the port specific registers from the userspace, as the driver can
> > change the page at any moment.
> >=20
> > The hardware supports another access mechanism: using the I2C_RX_ID
> > registers (one for each RX port), i2c addresses can be chosen which,
> > when accessed, will always use the specific port's registers, skipping
> > the paging mechanism.
> >=20
> > The support is only for the RX port, but it has proven very handy while
> > debugging and testing. So let's add the code for this, but hide it
> > behind a disabled define.
>=20
> ...
>=20
> >  #define MHZ(v) ((u32)((v) * 1000000U))
>=20
> Missed HZ_PER_MHZ from previous patch?
>=20
> ...
>=20
> > +#ifdef UB960_DEBUG_I2C_RX_ID
> > +	for (unsigned int i =3D 0; i < 4; i++)
>=20
> Should it use _MAX_RX_NPORTS instead of 4?
>=20

Instead of hardcoded value or the macro, it is better to use=20
priv->hw_data->num_rxports.

The cut-down variant of this deser only has 2 ports for example.
https://www.ti.com/lit/gpn/ds90ub954-q1

> > +		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
> > +			    (UB960_DEBUG_I2C_RX_ID + i) << 1);
> > +#endif
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

--=20
Thanks,
Jai

--pmmwf2hswfn26wvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmdRlc0ACgkQQ96R+SSa
cUW/xw//UN/uh0P5W7eqxSQv1lIjKSeSDPsY8X9gJAiBU+MvT6aBXieOwSFJGhhA
3lhXe2mYV5tmgwsu2q0ET0acLIQWArjAjZy/MA1MKoHFoSB1lTdpUV/Ae0D+DYKJ
nEZrbh2gEGwJg61B4lOzVyMTHn1XDBkupnb1oOkpCrbrQBWAYpVbNoa6Z/MOp183
Pdcd+A9NBQbK5r3u8oJExcx8atJxH8oe5U7nVRT/6JAzb6+usuUdapxZjWlwe25q
w5zWdfuuC76HNEnIl1FNi3oy7Vx2vYXomhstZ3sDlBI7YFgoKivLhYn46beabBRl
ZX4TCVNiDCuI/4wCRbmJgqvFHK3SHxrWffKjlKBSgcsVgUApwVrQxjd093KGUgIS
GZBDbB5Uzt8CM3ftbZSMcAMIqEQ+2lyhXztMsEnLDJkXKeZr7/LedUwnePZ9LAh2
MxZQFSIKKDXPMCYjllthX8xv+6tseksA/v6/1SdR9rBYSKLBUp8hGDwhYK7xsWL0
Aeky0LeNVnU52dPUV5v7ysMZ6hUJeyrsCBwwtftAguEIK185EjD+gsnP9eUUqmbc
6K28qjaoPM0NJjo6LMrHndMNfjmd0mWI1vH7i3hH85aCqQBt4QfEsTKcZgxPXsQd
baKMreevizCkp7HFlMCLoJxoATys9qU/M+ly1SBudpOF+DzO5nM=
=FjmX
-----END PGP SIGNATURE-----

--pmmwf2hswfn26wvm--

