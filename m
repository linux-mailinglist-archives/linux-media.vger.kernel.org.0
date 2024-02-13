Return-Path: <linux-media+bounces-5103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38617853A10
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 19:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B4BF1C20F92
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 18:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B2A10A22;
	Tue, 13 Feb 2024 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVNVkQL/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938201097D;
	Tue, 13 Feb 2024 18:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707849771; cv=none; b=kD7XYYCKSeboOOABFzx3TuZ6lNTDzDH0ARhoC3B/FTQghshfdn3Lhqg69iymgMFCnJJqcZhu+1ahAHnwyOr5IvHhBswODTkWTuQ9NaSUzWmIVGUrFJ7d//IyVpTcVcP09n0Hbz+lv7taPraMpXCCa5rGCtmcnrFtAlCHZ5m1qZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707849771; c=relaxed/simple;
	bh=fsPO/JytLyKx/6g42njVWx5fW4TcWtV6rSPtZKHFIq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBGHl0ctD2R35JuslbpRD1rwBVyP3ZfrNjYi3STDwN1YyxCeFocC6lHywWy6VGkLP+Te6hRxvS/KevpSjiE9iaA4UdPWPeR3arOQnnglv4peKjncx/nIj4nYMpyHnMt8Clr+SgI7pgTqTYt9DoyEppitQJGrm8zAZR3OIlL3Ezc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVNVkQL/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD36C433C7;
	Tue, 13 Feb 2024 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707849771;
	bh=fsPO/JytLyKx/6g42njVWx5fW4TcWtV6rSPtZKHFIq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVNVkQL/9N2ZsR5iFw6fSNf6VvkvkgdPxiUrBsIqBbubkLzuwjHPoapFAmQy0y8i5
	 QAr2JBxm41EEC5JYSERrO8HeY+HCne5JNWum41TzIdfidBUOE8tmh9kxOBAf3tlH8o
	 03hqa8RpHbhsaCJF3yM8wN/q1+FNkb4mKahl+WT9G3eB8s6j9d8WQhYs1VaVw0tuqD
	 ZIYM+nVcNqlX/QlqPG/p6f0QsS27XXmRB7kKco+U+Mk8/bnmmCuRqyDjSKvXME/N/V
	 RRltb2sNQdolDjOQcr1SP3U1a79eJ+Ks5T2HV2gcX7p3udUKu2MYh+NJ9gYWRtH/rW
	 U0G/yybb++11A==
Date: Tue, 13 Feb 2024 18:42:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 6/8] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
Message-ID: <20240213-landlady-backstab-6e7da824c99a@spud>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-7-jacopo.mondi@ideasonboard.com>
 <7f7979af-8eda-48cd-a334-bb64ddf5b9b8@linaro.org>
 <myfjzqh4wqa3lf4dcrgaswrarlh7sril6vz3mtnbz646rwxylt@oz75b5j5srot>
 <b55f4d1e-2e77-4539-8d18-8d8f2185b501@linaro.org>
 <5db2c830-2615-4416-9bb1-18fcd2a3a980@ideasonboard.com>
 <CAEmqJPo-A4wiAiuCa2pb84UU_rTTo9i5P9Kj6eo78MFEs1Y45w@mail.gmail.com>
 <20240213104405.GB5012@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ORR7EokQEWOLyWfe"
Content-Disposition: inline
In-Reply-To: <20240213104405.GB5012@pendragon.ideasonboard.com>


--ORR7EokQEWOLyWfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 12:44:05PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 13, 2024 at 08:35:39AM +0000, Naushir Patuck wrote:
> > On Tue, 13 Feb 2024 at 07:28, Tomi Valkeinen wrote:
> > > On 12/02/2024 11:05, Krzysztof Kozlowski wrote:
> > > > On 12/02/2024 09:50, Jacopo Mondi wrote:
> > > >
> > > >>>> +properties:
> > > >>>> +  compatible:
> > > >>>> +    const: raspberrypi,pispbe
> > > >>>
> > > >>> Nothing more specific? No model name, no version? It's quite gene=
ric
> > > >>> compatible which in general should not be allowed. I would assume=
 that
> > > >>> at least version of Pi could denote some sort of a model... unless
> > > >>> version is detectable?
> > > >>
> > > >> The driver matches on a version register and that should be enough=
 to
> > > >> handle quirks which are specific to an IP revision in the driver
> > > >> itself.
> > > >>
> > > >> Considering how minimal the integration with the SoC is (one clock=
, one
> > > >> interrupt and one optional iommu reference) even if we'll get futu=
re
> > > >> revisions of the SoC I don't think there will be any need to match=
 on
> > > >> a dedicated compatible for bindings-validation purposes.
> > > >>
> > > >> However I understand that to be future-proof it's good practice to
> > > >> allow a more flexible scheme, so we can have a generic fallback an=
d a
> > > >> revision-specific entry.
> > > >>
> > > >> Would
> > > >>
> > > >>    compatible:
> > > >>      items:
> > > >>        - enum:
> > > >>          - raspberrypi,pipspbe-bcm2712
> > > >
> > > > bcm2712 is manufactured by Broadcom, not Raspberry Pi, so it should=
 be
> > > > rather Pi model?
> > >
> > > Indeed, this is something I don't get. If the BE is in the bcm2712, is
> > > it not a broadcom IP? Why is raspberrypi in the compatible name at al=
l?
> > >
> > > Naush, Dave?
> >=20
> > The Backend (and Frontend) IP are both owned solely by Raspberry Pi,
> > and the BE is instantiated on the BCM2712.  So I think "raspberry" in
> > the compatible string is correct here.
>=20
> Following what we do with other SoCs, we could have
>=20
> 	compatible =3D "brcm,pispbe-bcm2712", "raspberrypi,pispbe";
>=20
> However, that scheme is mostly used when SoC vendor license IP cores
> from third parties. Here, while the SoC is indeed manufactured by
> Broadcom, it's a Raspberry Pi-specific SoC.
>=20
> I don't have a personal preference.

I'd be okay with what you propose here, I think it is a better
reflection of what is going on than that in the original patch etc.

Cheers,
Conor.

--ORR7EokQEWOLyWfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcu4JQAKCRB4tDGHoIJi
0gePAQDPvEreWXY4heELiuCqBAZWnulxmJCuqGEYejIeiXODmQEAlQ/rKvqELSs8
AwKF416pLCHNSKKC2rpuV4khZIn/Zgg=
=YLAp
-----END PGP SIGNATURE-----

--ORR7EokQEWOLyWfe--

