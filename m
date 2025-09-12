Return-Path: <linux-media+bounces-42414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05FB54ADD
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 13:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B7541C84D53
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 11:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6713009D4;
	Fri, 12 Sep 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ugQIVJQ0"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22996277037
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757676083; cv=none; b=Pf1VhSDWJeRgD8RMavQ2EzWkaESLbV9cCZUexE7N4zJzeLh7zKRNONLRf+DWaiqGOUefQPjAL7708TseGriw0ftOIuUmQKEMfHVG3H4YafVAv/N/8G5q33vSCCErIudLwSDXp5Y/yfJF7aS4A9irEVkX7sUmCBVwSGGx7OOgGhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757676083; c=relaxed/simple;
	bh=Q4hmQEjva+YvCSicv+ARH/ztXY2Wus0zcpUMszvL0Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b69EWLrUwjaRGBlFIrMJr895hb46glK++aMs3spEbDQ/bVD3Vj9zIBZLAd93dkE9H+q3F6ppSJZ9RKb+ZxgvFQDLBoLHsZi8OuDcYIMR8Hm/nkIeygBkZGYwaJotxTH6yhVODPKdp2MUGjg54TXXbigcXECkgRrn7I+JrR/SfEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ugQIVJQ0; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 12 Sep 2025 16:51:05 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757676075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YN11ddgm4aw9B9XKz+NXuJgKviyzTU8HjNO90ljF3UY=;
	b=ugQIVJQ0sM4wontIzSP3C0AJkYQH9DVLZhAZy1ZeaX/y6hnlyP+XW9sy/NMASmhMx3J6lV
	lOQRK8V1RLUkCwZZ6+IKAno71++TC9FmxiQZjPfGbcsunM1/+29y5g7hw8lP3qyNpv+WlN
	jVFKUCS8aOIELJDMKcisX4OwZzDo2nU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [GIT PULL FOR v6.18] TI and Cadence CSI2RX drivers changes
Message-ID: <v2xtw7soyiailistxcr24xj5uxzhlhljtf2hqdgarnzhnmms5d@rxojdydr7jqo>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <4wklgso7mjxss5nzrwtcwae6fm22snmw7zdx4lmdxs75tmklip@3w55xhfzkasw>
 <9bc39cae-ea86-4ef7-a97c-66469b082375@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="stshvk6my3qo5kpa"
Content-Disposition: inline
In-Reply-To: <9bc39cae-ea86-4ef7-a97c-66469b082375@kernel.org>
X-Migadu-Flow: FLOW_OUT


--stshvk6my3qo5kpa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL FOR v6.18] TI and Cadence CSI2RX drivers changes
MIME-Version: 1.0

Hi Hans,

On Fri, Sep 12, 2025 at 12:17:17PM +0200, Hans Verkuil wrote:
> Hi Jai,
>=20
> On 12/09/2025 11:55, Jai Luthra wrote:
> > Hi Hans, Mauro,
> >=20
> > The following changes since commit ecba852dc9f4993f4f894ea1f352564560e1=
9a3e:
> >=20
> >   media: redrat3: use int type to store negative error codes (2025-09-1=
1 08:46:10 +0200)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://gitlab.freedesktop.org/linux-media/users/jluthra.git tags/for=
-6.18-ti-j721e-csi2rx-signed
> >=20
> > for you to fetch changes up to c694e74c651e79838e817a8c6644dc72cf80540d:
> >=20
> >   media: ti: j721e-csi2rx: Support system suspend using pm_notifier (20=
25-09-12 14:37:56 +0530)
> >=20
> > ----------------------------------------------------------------
> > TI and Cadence CSI2RX driver changes:
> >=20
> > - Multistream support for Cadence and TI CSI2RX
> > - Runtime PM support for Cadence and TI CSI2RX
> > - System suspend and resume support for TI CSI2RX
> > - Misc cleanups
>=20
> This should go through Sakari most likely, possibly Laurent, seeing that =
this is CSI
> related. Several patches do not even have a Reviewed-by from Sakari or La=
urent.
>=20
> I can't take this, I'm afraid.
>=20
> I'm not sure why we get a PR from you, was there some misunderstanding?
>=20

Apologies. I had a look at other "GIT PULL" messages on linux-media and=20
inferred that any driver maintainer can send a pull request for media tree.

I looked at=20
https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html but=
=20
that was not very informative.

But yes, happy to wait for more reviews from Sakari and Laurent (or Tomi gi=
ven=20
this is about streams support).

Could the process and who-owns-what sub-subsystem be better documented in=
=20
docs.kernel.org or linuxtv.org? I am aware of the proposed multi-committer=
=20
model, but until that is finalized even the current process is hard to=20
understand for a newbie :-)

> Regards,
>=20
> 	Hans
>=20

Thanks,
Jai

> >=20
> > ----------------------------------------------------------------
> > Changhuang Liang (1):
> >       media: cadence: csi2rx: Support runtime PM
> >=20
> > Jai Luthra (9):
> >       dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
> >       media: ti: j721e-csi2rx: separate out device and context
> >       media: ti: j721e-csi2rx: add a subdev for the core device
> >       media: ti: j721e-csi2rx: add support for processing virtual chann=
els
> >       media: cadence: csi2rx: add multistream support
> >       media: ti: j721e-csi2rx: add multistream support
> >       media: ti: j721e-csi2rx: Submit all available buffers
> >       media: ti: j721e-csi2rx: Support runtime suspend
> >       media: ti: j721e-csi2rx: Support system suspend using pm_notifier
> >=20
> > Pratyush Yadav (4):
> >       media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
> >       media: ti: j721e-csi2rx: allocate DMA channel based on context in=
dex
> >       media: ti: j721e-csi2rx: get number of contexts from device tree
> >       media: cadence: csi2rx: add get_frame_desc wrapper
> >=20
> > Rishikesh Donadkar (2):
> >       media: ti: j721e-csi2rx: Remove word size alignment on frame width
> >       media: ti: j721e-csi2rx: Change the drain architecture for multis=
tream
> >=20
> >  Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml |   =
39 ++++++-
> >  drivers/media/platform/cadence/Kconfig                            |   =
 1 +
> >  drivers/media/platform/cadence/cdns-csi2rx.c                      |  4=
91 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----=
----------------
> >  drivers/media/platform/ti/Kconfig                                 |   =
 1 +
> >  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c             | 11=
67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++--------------------------------------------------
> >  5 files changed, 1300 insertions(+), 399 deletions(-)
> >=20
> > --
> > Thanks,
> >=20
> > Jai
> >=20
>=20

--stshvk6my3qo5kpa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmjEAiAACgkQQ96R+SSa
cUWHBxAAxhaJy2Ug//jL53e7osqKqc/eGZtkrWP2MUA6m9wxFazSsR0xNPLpl6h4
+jPoM2+Z7rBjdZqYF2Lh+GsdP3vPsDmYe6BN7VtDZmbh20ebe7uQK0OiwveRFS9I
9WziDShBdCmOQ03G/RCsvTGLgRPDqdSyub0GZrYa2G6oYJIusu0Gp6m2B00XYZo0
mwEJAK41LY2w5UkI+mT2+rsiJ6sQtrUHeKcH0S/upe89z6e6py+46o7LaQ9DtyW9
fT7Yh8LqCxe8Hqq/GkeGPcdjZRS+WMpNU6w4ulVI90Kaedb6BBDUT1HdoBzHIvuP
hoXGliDMTmXMn4m5EIZj6oti/JTUVCHbdxJMYH8sl8NEjVbfranvCh7uQmMuFWqF
DEb6SA3rCdoEJfAu+mTtsuj2KvAZs7FesAGXJdkLvwJDM94tSX1CyX6y9wAe6+2Q
sEKeeH7mw7/bmjUFxjeJ+QtA0gBsrDhxWhNtax6XGXzgxSqoqOxHXBsVFDzRw8v5
vOz57kthXh8OhYoM5rTqLez3bricdv1BR8p7iYQB+Q/Y/vNRSEnpDhYA2w5isnpQ
YNKjMFx4iN9zHmUW77XLpfPMTVPgZlNHL3ODfJCYwkhRyfsAQ4VE5Ypt6KFYLu0u
9/KXicXKgM0lEIm25EVEw8Gy1UqAdKzI0O7r5ckoS49tKM+o+bk=
=Jr2s
-----END PGP SIGNATURE-----

--stshvk6my3qo5kpa--

