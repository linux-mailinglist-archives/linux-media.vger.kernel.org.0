Return-Path: <linux-media+bounces-12008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA828D09B8
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 20:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F41CC1C20BAE
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6F115F3F4;
	Mon, 27 May 2024 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvsIRrem"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627431D53F;
	Mon, 27 May 2024 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716833245; cv=none; b=E+LHAN87vy7CeAwYGo6tObyYo1QVQYylAJfhXFTeFKZrUH0kvzcPSMgnqCs0TEzxmT/HS/IRMs5AWDZsJ74e90DbY1lnvlspGnouSR1WiGjuRqhbCGwi6kV8FGdaSY6EiAqAM5flDCjckZeEznMqee3QMzGTGkS6xEuyyCcUabM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716833245; c=relaxed/simple;
	bh=dJQFOmUFG6slSw+YyGmo5B3vMaqNN+hKWKTZhlmfMbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOKDcoaQYrvokxjfDDiWajpTeuIfmniIK98qIIwY4q1ezbf65xvHy5QytcFB98aRZngo/Zh/LIPZv1bGNEIfErItZJxffMXRE6ES2AhdX/ZiB4dCqdnBOXL/3nzBCpWICOe3jGDNMW5RhcZrWWGcpCdJi8lEeyY5uKfcf6Y5Xjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvsIRrem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C3CC2BBFC;
	Mon, 27 May 2024 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716833245;
	bh=dJQFOmUFG6slSw+YyGmo5B3vMaqNN+hKWKTZhlmfMbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvsIRremEWlfo8py27HAjeqt0TEfl3ov+QZw6sl+5W2ue13v1rl+HqaYulLDq8Sr0
	 JgykGrfmhaJH3Uosi8MhHToO6eJ9xxsgGxA1brHUL6W+mKmGCdgxZS+Cy/Rs1Bg8vi
	 bpwh4CyjPSby+u86Ebm1hyN7t1Pdwvh99XuogiRKqVIsyotQtczfJhBsjyWCUtsBm4
	 8w6wCh4twuKUqneOrfGi5I59xqlxHz0zT3mu2hOkqQoJD3dE8OcINSX13wrGcHU/VB
	 MB/Yb+S1HmPevOX6cwvtYhhxN/ZvE2Ol1PKcjtGhZ+nGNCrNshWIq++Q+FpabFiWJu
	 jAZ/J+eeSY1Fg==
Date: Mon, 27 May 2024 19:07:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,isp: Add binding for V4M
Message-ID: <20240527-boogeyman-caress-3c909952b283@spud>
References: <20240527131945.1679661-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527-causal-flyable-c34004c298bf@spud>
 <20240527175402.GI1900917@fsdn.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JwyVRn0YViJ0dQUR"
Content-Disposition: inline
In-Reply-To: <20240527175402.GI1900917@fsdn.se>


--JwyVRn0YViJ0dQUR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 07:54:02PM +0200, Niklas S=F6derlund wrote:
> Hi Conor,
>=20
> Thanks for your feedback.
>=20
> On 2024-05-27 17:36:23 +0100, Conor Dooley wrote:
> > On Mon, May 27, 2024 at 03:19:45PM +0200, Niklas S=F6derlund wrote:
> > > Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
> > >=20
> > > Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
=2Ese>
> >=20
> > Should be with:
> > https://lore.kernel.org/all/20240527132513.1684232-1-niklas.soderlund+r=
enesas@ragnatech.se/
>=20
> I posted the bindings separate from the driver with the intention that=20
> once they are accepted I can upstream the driver and the DT for the=20
> device using it in parallel. The V4L2 subsystem is at times overloaded=20
> and in the past waiting for both driver and binding to be accepted as a=
=20
> whole unit have delayed entablement of SoC features unneeded for one or=
=20
> more releases.

I don't really understand this argument at all. If you land the binding
but not the driver changes, you're still waiting for the driver to get
the feature functional. My understanding is that Geert takes dts patches
when bindings are applied by the subsystems, rather than wait until they
circle back to his tree a release later - so that isn't the issue either.

All it seems like you're doing to me is making my "job" reviewing
bindings harder, because I have to search on lore for your driver
patches.

> > No mention of why this can't just fall back to an existing device here
> > or in the driver. Why not?
>=20
> For better or worse that is how all Renesas devices are handled, one new=
=20
> device compatible for each device. This have worked well as each device=
=20
> usually have a quirk or extra future that is enabled later.

If you're worried about the media subsystem being too busy to pick up
patches with driver support, you know what's a way you can have the
driver functional without a code change?

/spoiler You guessed it, fallback compatibles!

--JwyVRn0YViJ0dQUR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlTL2AAKCRB4tDGHoIJi
0sbsAP0VRB8xLi1FBGxWcggQDUIZBqd+jCDrKigAqOjb92k7lwEA74Z+FaGyiuIz
MsdXqJgMplZfa+1IBGA9vP2esSU6Xwo=
=KaDR
-----END PGP SIGNATURE-----

--JwyVRn0YViJ0dQUR--

