Return-Path: <linux-media+bounces-41346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7ABB3C09C
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70CEE5853D0
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6673533438B;
	Fri, 29 Aug 2025 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ARTQEDl4"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE693314B3;
	Fri, 29 Aug 2025 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756484617; cv=none; b=AkNKA291Fv1OHlfDxPYRVg9WCZH03KSWCFHkxCmbJviHEhEqmEc2cgBrYDRavYYOlSBuvLaNCguSCoGWWzLoSBcmU9MMEDvkG+ylPdBHhCELzFHR4Jm/pKRUNhn56Mq2PYQy8GxhKbNAd47GQHRyXcdqzAQrSzTVV+QmBMRpUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756484617; c=relaxed/simple;
	bh=yFN1EQEjRbUyL6L3NwzgEy/E1VDAcLoyMHEC0+8jWsU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rn+NjG9QaRztQYn5dRxVx9FksPqDudp/5NIn9RsTCAtxtt2ySSe78XzqI/sFkUmdDckFjmaOLYA8Uao9gRiiZ36f13Pg9TvbN9CfwcZg86hfEW/m9SdsZHLRht1bpnjUwqfvs++ZqRfFB+Uj9EwXUaqPweDULwMpaxawg5LUPm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ARTQEDl4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756484613;
	bh=yFN1EQEjRbUyL6L3NwzgEy/E1VDAcLoyMHEC0+8jWsU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ARTQEDl4e6cM5xGS8Pafvs6+Llf0SyXoean8jS5+AcWHRp/1iNxjV8I12YtWSthw5
	 TK1vGObU9Pwkmmm/NPpkRsqrdi7azBqIaJu6NWCzGipFBP1vHjWZjCVKcfxYYpbwH/
	 I5+G6h8wAr1oUd9A+r2km7ZzCJD9vh/QplWGB61je9eW2m/SmClL0XvdmoPEFJVQKq
	 aiun6rkDnnonpm56lLBSyQv3J5CYXoXPYOCjy6Kghenih/8ZQxmLeU1dmXu3+uTA2u
	 Nq4cJ+BH4ni5uwq9ZKB6gZjInQqTQ6PvyeqGGn1WFYerWADkIRo+hYClHgGnI0+rDP
	 qfHDjppqdJMaA==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C405917E10F3;
	Fri, 29 Aug 2025 18:23:31 +0200 (CEST)
Message-ID: <a216e7e218d874cf64b53f6eba2fc74fc551d2fe.camel@collabora.com>
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 p.zabel@pengutronix.de, 	mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 kernel@collabora.com, 	linux-media@vger.kernel.org
Date: Fri, 29 Aug 2025 12:23:29 -0400
In-Reply-To: <20250826124155.GD1899851@ziepe.ca>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
	 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
	 <20250825170531.GA1899851@ziepe.ca>
	 <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
	 <20250825183122.GB1899851@ziepe.ca>
	 <441df5ff-8ed4-45ed-8a52-b542c6e7d38c@collabora.com>
	 <20250826124155.GD1899851@ziepe.ca>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-DNMiMpnxu0upmlGb0Ub2"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-DNMiMpnxu0upmlGb0Ub2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 26 ao=C3=BBt 2025 =C3=A0 09:41 -0300, Jason Gunthorpe a =C3=A9crit=
=C2=A0:
> On Tue, Aug 26, 2025 at 11:52:37AM +0200, Benjamin Gaignard wrote:
> >=20
> > Le 25/08/2025 =C3=A0 20:31, Jason Gunthorpe a =C3=A9crit=C2=A0:
> > > On Mon, Aug 25, 2025 at 01:50:16PM -0400, Nicolas Dufresne wrote:
> > >=20
> > > > Jason, the point is that the iommu and the VPU are not separate dev=
ices, which
> > > > comes with side effects. On RKVDec side, the iommu configuration ge=
t resets
> > > > whenever a decoding error leads to a VPU "self reset". I can't reme=
mber who from
> > > > the iommu subsystem suggested that, but the empty domain method was=
 agreed to be
> > > IDK, that seems really goofy too me an defiantly needs to be
> > > extensively documented this is restoring the default with some lore
> > > link of the original suggestion.
> > >=20
> > > > the least invasive way to workaround that issue. I believe Detlev t=
ried multiple
> > > > time to add APIs for that before the discussion lead to this path.
> > > You mean this:
> > >=20
> > > https://lore.kernel.org/linux-iommu/20250318152049.14781-1-detlev.cas=
anova@collabora.com/
> > >=20
> > > Which came back with the same remark I would give:
> > >=20
> > > =C2=A0 Please have some kind of proper reset notifier mechanism - in =
fact
> > > =C2=A0 with runtime PM could you not already invoke a suspend/resume =
cycle
> > > =C2=A0 via the device links?
> >=20
> > when doing parallel decode suspend/resume are not invoked.
>=20
> It was a proposal for an error recovery path.
>=20
> > > Or another reasonable option:
> > >=20
> > > =C2=A0=C2=A0 Or at worst just export a public interface for the other=
 driver to
> > > =C2=A0=C2=A0 invoke rk_iommu_resume() directly.
> > >=20
> > > Sigh.
> >=20
> > An other solution which is working is to call iommu_flush_iotlb_all()
> > before decoding each frame.
>=20
> That was already proposed and shot down, it makes no sense at all use
> to use flushing to reset the registers because the HW weirdly lost
> them, and flushing should never happen outside mapping contexts.
>=20
> If the HW is really resetting the iommu registers after every frame
> that is really just painfully broken, and makes me wonder if it really
> should be an iommu subsystem driver at all if it is so tightly coupled
> to the computing HW. :\
>=20
> Like we wouldn't try to put a GPU MMU into the iommu subsystem though
> they do fairly similar things.

I didn't mention, but this is obviously close to the same IOMMU wrapped ins=
ide
etnaviv (same company making it). Note that for media driver, drivers in th=
e
iommu subsystem are very convenient, they just work usually (except when th=
ey
don't like with codecs). I'm pretty sure rkmmu is also used by Panfrost, so=
 I
suppose not all GPU IOMMU lives in GPU drivers (I could be wrong). Its one
instance per block, but the same programming interface. Note that we do hav=
e an
in-driver iommu implementation in the RGA2 driver.

If we can agree on solutions for this problem, which seems slightly differe=
nt on
RK compared to VSI IOMMU, it will be quite beneficial to not have to overri=
de
all the media allocation ops, and re-implement rkmmu, vsimmu in every drive=
r
needing this block. The VSI mmu could be used similarly to how the rkmmu is
used, meaning we'd have to copy its implementation in every driver. If we c=
ould
find out more accuratly how this is suppose to work it would be great, I fe=
el we
don't really understand what is going on yet. Once that done, we can port r=
kvdec
driver with the unified solution.

The empty domain approach was used since there was no solution that came ou=
t
over a year, and users these days expect concurrent decoding to work. So ye=
s,
its not all pretty, but its the best we found until this type of hardware
behaviour gets an API for that is commonly agreed.

Main question is shall we block on merging the VSI IOMMU driver for that re=
ason
? Its there anything in the IOMMU driver that still needs more work ?

cheers,
Nicolas

p.s. RK means Rockchip, VSI means Verisilicon, the company behind Vivante G=
PU

--=-DNMiMpnxu0upmlGb0Ub2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLHUAQAKCRDZQZRRKWBy
9JkWAQCjhKw0H+/fIxtEIGqR/i3mzCXIn2jiB22S5Z1/SsXLjgEAnopTxM8L88l+
NUbl5VA35McqgA+aGhShXzST98zO8wY=
=Uy0P
-----END PGP SIGNATURE-----

--=-DNMiMpnxu0upmlGb0Ub2--

