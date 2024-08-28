Return-Path: <linux-media+bounces-17046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA888962BE5
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 17:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE4801C20944
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 15:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BB21A3BDE;
	Wed, 28 Aug 2024 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJ6lJrY1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405691A3BD6;
	Wed, 28 Aug 2024 15:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858138; cv=none; b=nrmygkHPAQ303I3ZR9mLNoi4mqjudZwzvFKBWGyOeFPYU2WoTwnJg30JX4b7l+vbCr+oTWZgcrliVpMVlxQsbvZt690zbNoi1lCZ7rA8CYf279cks6g31WIKPTVWf5h1H75SyGBWulb/wz6Ps2U04ZyFzwD7FKwSAhfmbrKTBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858138; c=relaxed/simple;
	bh=fb0f+MfVlZQiyWcvqsrz7Sr4Ok4fbqTX8prEEmIw0P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN9B6LRmi0fy5/MCpD8EoFOphWll+9hRU8ARRd+9pboc8b3wRf+kjAtjf9xVJTy6G8CigVdXBDQfjz71/oDQrQySR+yyEA/4dWgPYIBD1LlGrtZVRBe56Qfz4JpJZ4aQQeTKgT6DOmZ+23zFNV/x4EAZZemh63h/vqmTUXcPetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJ6lJrY1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DBCC4CEC0;
	Wed, 28 Aug 2024 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724858137;
	bh=fb0f+MfVlZQiyWcvqsrz7Sr4Ok4fbqTX8prEEmIw0P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dJ6lJrY1PSzjXENCnouOy3C03ARLHxTS217DV13xrE6GS0K8b2T3w+W3mDFZ7w2WS
	 RAaPqatMei8WXU7ZIbH1l0kbRl2hWk1jBaEU1RMlvTs0WmmIMbly6lmwng8/RSh0Qx
	 V4xuUpYmAven2ROm2x+nfo0J8+40GIiMlaODXAYWHbdNSEU+93rEvk++tAXW2TaAkD
	 WQJQclfxeGDhR25NDo+47a2AHB/P5luf1xnIb7b+BvKrvTeii31UgLePC4ZSDHCNus
	 mMRLRbJEDnZFKmzKxEa/9bUN5TRaTHLRVONsjeo8Ags8Yb+LEGJERXztc8+p73D1J6
	 9tTyMk3LjNsjQ==
Date: Wed, 28 Aug 2024 16:15:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family
 fallback
Message-ID: <20240828-sadly-serotonin-8c1f4cd2bb5e@spud>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
 <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>
 <20240827081233.GE2636928@fsdn.se>
 <20240827213441.GA30398@pendragon.ideasonboard.com>
 <9e18bbf4-ae22-4d53-a998-67ad5807d72b@kernel.org>
 <20240828144644.GA3680498-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7R4ynt3y8vx8ip6c"
Content-Disposition: inline
In-Reply-To: <20240828144644.GA3680498-robh@kernel.org>


--7R4ynt3y8vx8ip6c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 09:46:44AM -0500, Rob Herring wrote:
> On Wed, Aug 28, 2024 at 07:36:35AM +0200, Krzysztof Kozlowski wrote:
> > On 27/08/2024 23:34, Laurent Pinchart wrote:
> > > On Tue, Aug 27, 2024 at 10:12:33AM +0200, Niklas S=F6derlund wrote:
> > >> On 2024-08-27 08:31:22 +0200, Krzysztof Kozlowski wrote:
> > >>> On Mon, Aug 26, 2024 at 04:43:47PM +0200, Niklas S=F6derlund wrote:
> > >>>> The ISP Channel Selector IP is the same for all current Gen4 devic=
es.
> > >>>> This was not known when adding support for V3U and V4H and a singl=
e SoC
> > >>>> specific compatible was used.
> > >>>>
> > >>>> Before adding more SoC specific bindings for V4M add a family comp=
atible
> > >>>> fallback for Gen4. That way the driver only needs to be updated on=
ce for
> > >>>> Gen4, and we still have the option to fix any problems in the driv=
er if
> > >>>> any testable differences between the SoCs are found.
> > >>>>
> > >>>> There are already DTS files using the V3U and V4H compatibles which
> > >>>> needs to be updated to not produce a warning for DTS checks. The d=
river
> > >>>> also needs to kept the compatible values to be backward compatible=
 , but
> > >>>> for new Gen4 SoCs such as V4M we can avoid this.
> > >>>>
> > >>>> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> > >>>> ---
> > >>>> * Changes since v1
> > >>>> - New in v2.
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
> > >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.y=
aml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > >>>> index 33650a1ea034..730c86f2d7b1 100644
> > >>>> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > >>>> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > >>>> @@ -22,6 +22,7 @@ properties:
> > >>>>        - enum:
> > >>>>            - renesas,r8a779a0-isp # V3U
> > >>>>            - renesas,r8a779g0-isp # V4H
> > >>>> +      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
> > >>>
> > >>> Adding generic fallback post-factum is odd, does not feel reliable.
> > >>> Instead use specific compatibles as fallbacks.
> > >>
> > >> I agree, it feels a bit odd. But this was the road we hammered out a=
t=20
> > >> great pain for how to be able to move forward with this issue for th=
e=20
> > >> other IP block involved in video capture for R-Car Gen4, VIN [1]. Th=
is=20
> > >> just mirrors that long discussion decision for the R-Car CSISP.
> > >>
> > >> I would hate to have different solutions for the two.
> > >>
> > >> 1. [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
> > >>    https://lore.kernel.org/all/20240704161620.1425409-1-niklas.soder=
lund+renesas@ragnatech.se/
> > >=20
> > > The compatible fallback for VIN has been added following a request fr=
om
> > > Conor and Rob, so it would be nice if the three of you could agree to
> > > achieve consistency in the bindings :-)
> >=20
> > Don't twist our answers. You need fallback, but specific, not family.
> > There was a countless number of answers from Rob that specific
> > compatibles are preferred.
>=20
> Preferred, definitely. But preferred is not absolute. The Renesas=20
> bindings have consistently followed the above style for some time. For=20
> the most part that has worked out it seems (based on Geert's slides=20
> linked in one of the threads). If you want to continue that here, it's=20
> not something I care to argue about.
>=20
> However, I have to agree that adding the fallback after the fact is not=
=20
> ideal. Why design it where you have to carry renesas,r8a779g0-isp and=20
> renesas,rcar-gen4-isp in the driver forever when you could have 0 driver=
=20
> changes instead? The problem with genericish fallbacks is you have to=20
> know the future. Am I going to have a family of chips with the same=20
> block? It's much easier to just say "oh, this new chip is compatible=20
> with this old chip".

Yep, that's what I said pretty much. When I acked it I did so with the
comment:
| Same caveat here. Using the g model as a fallback is, as we already
| discussed, an option too and would be less disruptive.
| (at https://lore.kernel.org/all/20240626-unnatural-ember-26ae8895c008@spu=
d/)

But...

> > Look, Conor's reply:
> >=20
> > https://lore.kernel.org/all/20240620-gating-coherent-af984389b2d7@spud/
> > Do you see family fallback? I think "r8a779g0" is SoC.
> >=20
> > Look here:
> > https://lore.kernel.org/all/20240610-screen-wolverine-78370c66d40f@spud/
> >=20
> > Or here
> > https://lore.kernel.org/all/20240624-rented-danger-300652ab8eeb@wendy/
> > where Conor agrees against!
>=20
> But he ultimately Acked it.

=2E..since Geert was happy enough with taking the modifications to existing
devicetrees, and well aware of the pros/cons of each approach, I figured
I had argued it enough and let it be.


--7R4ynt3y8vx8ip6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs8/FQAKCRB4tDGHoIJi
0huOAQCkVJUO9g+NJ6ad6p3npdYSb5zTVmmK1SqH2UoF6AF0AAEAwTFpJQFSgbpb
CzqhBLkqE1GhToxyUQIjpFDCoD/OSwE=
=pAlY
-----END PGP SIGNATURE-----

--7R4ynt3y8vx8ip6c--

