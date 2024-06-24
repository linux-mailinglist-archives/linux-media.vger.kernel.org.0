Return-Path: <linux-media+bounces-14059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C5D914E39
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 15:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8AB281671
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 13:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A5D13D889;
	Mon, 24 Jun 2024 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HnqYxMWn"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E346413B58C;
	Mon, 24 Jun 2024 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235099; cv=none; b=KNRO9S3X8QxEhHHRL8F8rro4jCvGyszPpGJ9xMsndMVSb4IlU8GN9AE6CT/q8h5dIw36/6vVoWOSM1RAkJaAP1xWiISYR7r/hPvTqDogY709zYtVnXc2DJ8RBUm1+f3BvSqbZcH4GWAxpaSuKoVk+PkaUFdEZXWnEOlZekfDxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235099; c=relaxed/simple;
	bh=A9P/HsgWON9b6a+Ar7LTr0tdOVopG8sdhzWFS1p8pDc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKk8s4htvhTT3XPAyfy6qHW4fbe86t0iH4TyeiMrY5633pSRgMDeqK++AOCeir9osGS07vsGRFUejSaX429edq8QCtKnJsvRAPcfcDvfr483Da+NbvZLsZnLLxR4RjVBWcSH6WBUyAXqBc1Ix2mLWjvq3o9rC8kixwAkVfvE52c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HnqYxMWn; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719235096; x=1750771096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A9P/HsgWON9b6a+Ar7LTr0tdOVopG8sdhzWFS1p8pDc=;
  b=HnqYxMWnnV1OzyJpXM99AgG6sTwidwQLr+NF8rqCgCJ+C+2pxwTbHUJP
   y01bwdcwbEDNOePGxq13A35HAIWot32U/5Txn6sk20gEWlCAI1wu9G3td
   CoQ/66NfhW3L5PTHvYrKB6J7SmQIvhdA//g8DGRkxjK+ZHIFRnHdrQT+m
   6KHft6LbiDyQGyTzegi67WDr5P6rfPIVjY++tkgSTPhVKrrbftHJUnZ0W
   5JA4GFm3pGu5hNUuSsMJ2DZ04oebwBVUP3WtZyaYZb+vYsmdHDFxakCO6
   KLvyzsOrvJMlRsknraR/Qo7nQ/SkhvqXEYITG2x70qNRceY+Y0RxaC+lp
   g==;
X-CSE-ConnectionGUID: rcCcXvSkTourhvc341HEpw==
X-CSE-MsgGUID: /2xm8AUkT6aloMkXWUmxQQ==
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="asc'?scan'208";a="195811847"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 06:18:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 06:18:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 24 Jun 2024 06:18:00 -0700
Date: Mon, 24 Jun 2024 14:17:46 +0100
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
Message-ID: <20240624-upstate-shale-505e754431c9@wendy>
References: <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud>
 <20240619185607.GT382677@ragnatech.se>
 <20240619204321.GU382677@ragnatech.se>
 <20240620-gating-coherent-af984389b2d7@spud>
 <20240620172237.GA3623951@ragnatech.se>
 <CAMuHMdUaWMiQ_wrmX14uwkeU1D_55ehmJD8+GZ4eydWfw4Mi-Q@mail.gmail.com>
 <20240624092029.GB3655345@ragnatech.se>
 <20240624-rented-danger-300652ab8eeb@wendy>
 <20240624125051.GC3655345@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wcejodDkY53dGgEf"
Content-Disposition: inline
In-Reply-To: <20240624125051.GC3655345@ragnatech.se>

--wcejodDkY53dGgEf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 02:50:51PM +0200, Niklas S=C3=B6derlund wrote:
> On 2024-06-24 11:36:40 +0100, Conor Dooley wrote:
> > On Mon, Jun 24, 2024 at 11:20:29AM +0200, Niklas S=C3=B6derlund wrote:
> > > Hi Conor,
> > >=20
> > > On 2024-06-21 09:21:24 +0200, Geert Uytterhoeven wrote:
> > > > Hi Niklas,
> > > >=20
> > > > On Thu, Jun 20, 2024 at 7:22=E2=80=AFPM Niklas S=C3=B6derlund
> > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > On 2024-06-20 17:27:00 +0100, Conor Dooley wrote:
> > > > > > > +      - items:
> > > > > > > +          - enum:
> > > > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > > > > > +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> > > > > > >
> > > > > > > If so I can see that working as I could still fix any issues =
that come
> > > > > > > from differences between V4H and V4M if needed. If so do you =
think it
> > > > > > > best to add this in two different patches? One to add the
> > > > > > > renesas,rcar-gen4-vin fallback (which will also need DTS upda=
tes to fix
> > > > > > > warnings from exciting users of V4H not listing the gen4 fall=
back) and
> > > > > > > one to add V4M?
> > > > > >
> > > > > >
> > > > > > I would just do:
> > > > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vi=
n.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > index 5539d0f8e74d..22bbad42fc03 100644
> > > > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > @@ -54,6 +54,9 @@ properties:
> > > > > >                - renesas,vin-r8a77995 # R-Car D3
> > > > > >                - renesas,vin-r8a779a0 # R-Car V3U
> > > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > > +      - items:
> > > > > > +          - const: renesas,vin-r8a779h0 # R-Car V4L2
> > > > > > +          - const: renesas,vin-r8a779g0 # R-Car V4H
> > > > >
> > > > > @Geert: What do you think about this? This would be a first use-c=
ase for
> > > > > compatibles crossing SoC DTS files that I know of. I'm a bit unea=
sy
> > > > > going down this road.
> > > >=20
> > > > Me too ;-)
> > > >=20
> > > > > Would this not also effect the existing users of renesas,vin-r8a7=
79g0
> > > > > which would now need something similar to what you propose below =
with a
> > > > > list of SoC compatibles and a fallback.
> > > > >
> > > > > >
> > > > > >    reg:
> > > > > >      maxItems: 1
> > > > > >
> > > > > > Which requires no driver or dts changes. That could become:
> > > > > >       - items:
> > > > > >           - enum:
> > > > > >               - renesas,vin-r8a779h0 # R-Car V4L2
> > > > > >               - renesas,vin-r8a779i0 # R-Car R4P17
> > > > > >           - const: renesas,vin-r8a779g0 # R-Car V4H
> > > > >
> > > > > FWIW, on Gen2 where fallback es where useful compared to Gen3 we =
did
> > > > > this with "renesas,rcar-gen2-vin".
> > > >=20
> > > > We do know there are differences (albeit probably small) among the =
R-Car
> > > > Gen4 VIN implementations, so I am reluctant to add a family-specific
> > > > compatible value.  Typically we only use a family-specific compatib=
le
> > > > value if the IP cores are known (or better, assumed ;-) to be ident=
ical.
> > > >=20
> > > > And sometimes our assumptions turn out to be wrong...
> > > > See slides 25-33 (last two for the numbers) of my talk at ER2019
> > > > https://embedded-recipes.org/2019/talks/herd-your-socs-become-a-mat=
chmaker/
> > >=20
> > > Do Geert's slides help to explain the R-Car perspective on why a=20
> > > family-specific fallback compatible might not be desirable, and why t=
he=20
> > > SoC specific one is proposed?=20
> >=20
> > IIRC, it was you that wanted to use a "family-specific" fallback, I
> > don't understand what you want from me. If you look back at even the
> > context in this email, you can see you suggesting one and my counter
> > point.
>=20
> Sorry that I'm spreading my confusion around and taking up your time.

I don't care if non-native speakers of English say confusing things,
don't worry about that.

> I'm trying to understand if Geert's reply helped outline why a single=20
> SoC specific compatible is being used here, if so I was hoping a revised=
=20
> commit message would make this solution acceptable. =20
>=20
> If not I will try to summaries the issue and the different proposals so=
=20
> we can find a design that works and address some of the confusion before=
=20
> sending a new version.

These devices look, for all intents and purposes, to be compatible. If
they're not, *say* what is not compatible about them. Don't just say
"ohh there might be, but they're small", say exactly what - because your
driver makes them look compatible. It looks compatible with the a0 as
well... The vibe that comes across here is of being "afraid" of having
fallback compatibles that reference other SoCs - which is totally normal
for other vendors, not that there are any differences in programming
model between the VIN instances on these devices.

Thanks,
Conor.

--wcejodDkY53dGgEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnlx+QAKCRB4tDGHoIJi
0lRgAQCL24c+EjR8gJrl3ulZy9rnsIt1id468BrNImvnBZLBwgD/a1gy1vCrm9eZ
GQXN9AeUSh1MTwvDsVuEiH5xQyOaIgI=
=diKT
-----END PGP SIGNATURE-----

--wcejodDkY53dGgEf--

