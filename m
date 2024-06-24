Return-Path: <linux-media+bounces-14048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3EC9147A0
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 12:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0171F23305
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 10:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13763136E3B;
	Mon, 24 Jun 2024 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HdYtK7xT"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1F713A3F0;
	Mon, 24 Jun 2024 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719225440; cv=none; b=TdNQLl5I/2jo0mBj+IFhTyDF0KehamN3x8JglsWl9cQ1MCtPyOY17jlKTav2Xjl4EE4XyrRg6b8MKiKlnNYUpgT523nlir9g7s3NkUHUvVMbw/nCuhYZGAwl/XIUs9PIb2VYsgK74/FVPaN0mqZpNbYJr+iJi1TlTofyTOqmStQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719225440; c=relaxed/simple;
	bh=rutUoUUJYxT2FiC8SN5N1yqF3b79HvpReCuUQIli6yI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGtgUG7CA23/r4PGxlIx+RtM0JGhsh4KD73AFx5SW2gqwDZUtnRPhOz5aJeWOC9BxodMcrJjdVZXTuW29dOAZM76kkubt8TturQtASUbRmWblTqpmpxCG5o5xrnatpiYGgHKGClVx2cp1GfYFBtcogVCqj9bMVyKbSoeg2eJdiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HdYtK7xT; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719225436; x=1750761436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rutUoUUJYxT2FiC8SN5N1yqF3b79HvpReCuUQIli6yI=;
  b=HdYtK7xTp/Nl6H63YSgec+YEfcFBPWxyqYVDo/VXJhiwz6Pr+03BrIMi
   q5m9e/xqTIBbrGNTu6OVlupBO8b7fQBLK6SAltN5fHpnO4T2x1+8Lnd3y
   nx3AmHrdq0GPNWa2RLayz8wXUwzl19qIxRgrX4bbKlxUTrGisoPLyFnLW
   zea+hlC5NlJQtqpQjPptFEfpJDSkIHIi8OLkUGKF3aLf2E6UifRRnu1hA
   ndIgkULupBCTD1sogK9WA8ABowfYwYMH7N+rUU4lNq6BSqwumKnTDyt43
   JW5evLtRz/KBcQTRIAHu/o7Nus6rSCFjVfAq9yGNByQDBZjAyOuDCZnOY
   w==;
X-CSE-ConnectionGUID: stjeug2lS2i021Tlhj9jAA==
X-CSE-MsgGUID: BxHNb/9CRZmuVYhhjv4o/g==
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="asc'?scan'208";a="28387228"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 03:37:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 03:36:58 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 24 Jun 2024 03:36:56 -0700
Date: Mon, 24 Jun 2024 11:36:40 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
CC: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240624-rented-danger-300652ab8eeb@wendy>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud>
 <20240619185607.GT382677@ragnatech.se>
 <20240619204321.GU382677@ragnatech.se>
 <20240620-gating-coherent-af984389b2d7@spud>
 <20240620172237.GA3623951@ragnatech.se>
 <CAMuHMdUaWMiQ_wrmX14uwkeU1D_55ehmJD8+GZ4eydWfw4Mi-Q@mail.gmail.com>
 <20240624092029.GB3655345@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zm4H2w7XfrYO9qDK"
Content-Disposition: inline
In-Reply-To: <20240624092029.GB3655345@ragnatech.se>

--Zm4H2w7XfrYO9qDK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:20:29AM +0200, Niklas S=C3=B6derlund wrote:
> Hi Conor,
>=20
> On 2024-06-21 09:21:24 +0200, Geert Uytterhoeven wrote:
> > Hi Niklas,
> >=20
> > On Thu, Jun 20, 2024 at 7:22=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > On 2024-06-20 17:27:00 +0100, Conor Dooley wrote:
> > > > > +      - items:
> > > > > +          - enum:
> > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > > > +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> > > > >
> > > > > If so I can see that working as I could still fix any issues that=
 come
> > > > > from differences between V4H and V4M if needed. If so do you thin=
k it
> > > > > best to add this in two different patches? One to add the
> > > > > renesas,rcar-gen4-vin fallback (which will also need DTS updates =
to fix
> > > > > warnings from exciting users of V4H not listing the gen4 fallback=
) and
> > > > > one to add V4M?
> > > >
> > > >
> > > > I would just do:
> > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.ya=
ml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > index 5539d0f8e74d..22bbad42fc03 100644
> > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > @@ -54,6 +54,9 @@ properties:
> > > >                - renesas,vin-r8a77995 # R-Car D3
> > > >                - renesas,vin-r8a779a0 # R-Car V3U
> > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > +      - items:
> > > > +          - const: renesas,vin-r8a779h0 # R-Car V4L2
> > > > +          - const: renesas,vin-r8a779g0 # R-Car V4H
> > >
> > > @Geert: What do you think about this? This would be a first use-case =
for
> > > compatibles crossing SoC DTS files that I know of. I'm a bit uneasy
> > > going down this road.
> >=20
> > Me too ;-)
> >=20
> > > Would this not also effect the existing users of renesas,vin-r8a779g0
> > > which would now need something similar to what you propose below with=
 a
> > > list of SoC compatibles and a fallback.
> > >
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > >
> > > > Which requires no driver or dts changes. That could become:
> > > >       - items:
> > > >           - enum:
> > > >               - renesas,vin-r8a779h0 # R-Car V4L2
> > > >               - renesas,vin-r8a779i0 # R-Car R4P17
> > > >           - const: renesas,vin-r8a779g0 # R-Car V4H
> > >
> > > FWIW, on Gen2 where fallback es where useful compared to Gen3 we did
> > > this with "renesas,rcar-gen2-vin".
> >=20
> > We do know there are differences (albeit probably small) among the R-Car
> > Gen4 VIN implementations, so I am reluctant to add a family-specific
> > compatible value.  Typically we only use a family-specific compatible
> > value if the IP cores are known (or better, assumed ;-) to be identical.
> >=20
> > And sometimes our assumptions turn out to be wrong...
> > See slides 25-33 (last two for the numbers) of my talk at ER2019
> > https://embedded-recipes.org/2019/talks/herd-your-socs-become-a-matchma=
ker/
>=20
> Do Geert's slides help to explain the R-Car perspective on why a=20
> family-specific fallback compatible might not be desirable, and why the=
=20
> SoC specific one is proposed?=20

IIRC, it was you that wanted to use a "family-specific" fallback, I
don't understand what you want from me. If you look back at even the
context in this email, you can see you suggesting one and my counter
point.

Confused,
Conor.

--Zm4H2w7XfrYO9qDK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnlMOAAKCRB4tDGHoIJi
0o/EAP99XL8HQVZyTBlqsl2xKRHV4ub7HKQQ4HK/GETBQKoPxQD+KI/HLy3kZQGT
AAlIvkoHQn+u0AbRw9IPx7Dp39T3UgI=
=rn1d
-----END PGP SIGNATURE-----

--Zm4H2w7XfrYO9qDK--

