Return-Path: <linux-media+bounces-62356-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEQEC7cwDmrj7wUAu9opvQ
	(envelope-from <linux-media+bounces-62356-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:07:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBCB59BC4F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A910331472A2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D51B3B6377;
	Wed, 20 May 2026 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDeuvVsq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACDE1684BE;
	Wed, 20 May 2026 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314662; cv=none; b=mXQ0k1jyyt4tznkI9xDoCSLQoU+z9+owbi4MrZx4NnN+kCVaG3H2urnADxW8UuFf8dXwmD0P+4BU6fvzoZRdP8vIQDFEUdhd/AZzbRFjL6faS7b33S6Tn0XE8QW26dxmVeg/RyP2mCBntT4XZngEidOEbW1Xo10csCqRZUlkov0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314662; c=relaxed/simple;
	bh=lauJzeOc9xY6dli1/lcbNeHa2u80M5UeyIntEbI0VPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMj3oK6x1veW+lamvo/K+Y21pTBiH+yobjkQ8MQ77MY8pHrY0SX+4FEt1shF+09mZ438IS3ZZzyYfxYVIwIayVLuzLPD8m3ASmTZSHswtkeZXcNRJ81iVLYsEssKjd7LX/XCAFFrflJFb50IQcQ3vmAFklfTN1l0fek+pRP9W0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDeuvVsq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8307C1F000E9;
	Wed, 20 May 2026 22:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779314661;
	bh=huh1l7TB6L+RLVoIHz62VVC1mnw9hGaHg2C3LXaLDFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nDeuvVsqCmV/w8lEo5E97Xr0wNd5pkPxV1WYz6iXHWp+BeS1le6/ROvStsRGjpPZf
	 QB9gOLg6uAF/TA095MRXWOz5MSdKzCyFX4fXn82A+EFjgYZQgU15Lb4YpeqbLjsqQD
	 xlUdsCK0egc0xFW5ig5q50KY3T6BYVVNcTmAnZlxA5oOl3bp1E03FaKwVTQpcmVCIJ
	 joJyhr88iFl6kw+Y8rcBMGRHfYqtc4mgrnaxKPO+0BT2LDG1hQDr1ASl76k/iFk2d5
	 GCcX2/pYL8U5BBey56jDIZEvNHQ5cWC5TBa0M3+p9pmPEd9fyjRQZJcSRNfRrmk9ju
	 5IcMxykNMG8pQ==
Date: Wed, 20 May 2026 23:04:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Lachlan Michael <Lachlan.Michael@sony.com>,
	Ryuichi Tadano <Ryuichi.Tadano@sony.com>,
	Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add Sony IMX678
Message-ID: <20260520-during-rocklike-a7436513d559@spud>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com>
 <20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com>
 <20260520-crusher-species-cf707a9a8b46@spud>
 <177929757691.2341049.18374545669142492074@selene>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43X9UaX6PnW3Efgq"
Content-Disposition: inline
In-Reply-To: <177929757691.2341049.18374545669142492074@selene>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62356-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Queue-Id: DCBCB59BC4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--43X9UaX6PnW3Efgq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 07:19:36PM +0200, Jai Luthra wrote:
> Hi Conor,
>=20
> Thank you for the review.
>=20
> Quoting Conor Dooley (2026-05-20 17:56:29)
> > On Wed, May 20, 2026 at 05:17:25PM +0200, Jai Luthra wrote:
> > > Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can out=
put
> > > pixels over MIPI CSI-2 bus. Add bindings for it.
> > >=20
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > > Changes in v3:
> > > - Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN, ins=
tead of `xclr-gpios`
> > > Changes in v2:
> > > - Add per-variant compatibles for mono and colour, alongside the
> > >   generic fallback, so the variant can be declared without powering
> > >   the sensor at probe.
> > > - Rename reset GPIO to xclr as that's what it's called in the
> > >   datasheet, and how it behaves
> > > - Reference the generic video interface devices schema and switch to
> > >   unevaluatedProperties.
> > > - Drop "link-frequencies: true"
> > > - Drop the T: entry for media.git from MAINTAINERS.
> > > ---
> > >  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 129 +++++++++++=
++++++++++
> > >  MAINTAINERS                                        |   6 +
> > >  2 files changed, 135 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.=
yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > new file mode 100644
> > > index 000000000000..d85745ddbefd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > @@ -0,0 +1,129 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (C) 2026 Ideas on Board Oy
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony IMX678 Sensor
> > > +
> > > +maintainers:
> > > +  - Jai Luthra <jai.luthra@ideasonboard.com>
> > > +
> > > +description:
> > > +  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type s=
olid-state
> > > +  image sensor with a square pixel array and 8.40M (3856x2180) effec=
tive pixels.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - sony,imx678
> > > +      - sony,imx678-aamr
> > > +      - sony,imx678-aaqr
> > > +    description:
> > > +      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and=
 a mono
> > > +      variant (IMX678-AAMR). An internal register can also help dete=
ct this at
> > > +      runtime.
> >=20
> > I don't understand the compatibles here. If aaqr is tge colour variant,
> > and aamr is mono, what does the suffix-less compatible represent?
>=20
> Sorry, I had seen Laurent's comment on this area in v2 but forgot to upda=
te
> it in this revision.
>=20
> The suffix-less compatible is for the cases where a product comes in two
> variants with the sensor being either mono or color.

This response is very weird. It's worded in a really generic way that
barely seems to be a response to my mail. We aren't talking about
"a product" here, we are specifically talking about the imx678, and we
know it comes it these variants. There are no "cases" involved.

> It allows sharing DT blobs amongst the two variants, where the driver
> powers the sensor on and reads the register to figure out if it is mono
> or color.

To be honest, I don't really get why the driver uses the specific
compatibles at all, if it can just determine if it is colour or mono at
runtime. Seems to me like this should be
compatible:
  items:
    - enum:
       - imx678-aamr
       - imx678-aaqr
    - const: imx678

Or just entirely drop the suffixed compatibles from the binding, since
you can detect mono v colour at runtime. The justification for the
aamr/aaqr compatibles seems to be that it avoids powering on the device
to check, but it looks like you unconditionally power it on and check
which variant it is, so that argument holds no water.

> It allows sharing DT blobs amongst the two variants, where the driver
> powers the sensor on and reads the register to figure out if it is mono
> or color.

Why would you want to share the dtb anyway? That makes no sense to
me as a usecase in the first place. If the sensor isn't part of the
board, you should be using an overlay or something similar to apply it,
because if you can swap the sensor you can also have no sensor!

Also doesn't your driver print a warning if you did this anyway?

> > Your commit message says:
> > > - Add per-variant compatibles for mono and colour, alongside the
> > >   generic fallback, so the variant can be declared without powering
> > >   the sensor at probe.
> > But that's not what you have permitted in the binding, you've described
> > 3 different variants and using the one with no suffix as a fallback will
> > produce validation errors.
> >=20
>=20
> "fallback" was a wrong choice of word, I'll update the description in v4.
>=20
> > I think this probably is
> > pw-bot: changes-requested
> >=20
> > Thanks,
> > Conor.
>=20
> Thanks,
>     Jai

--43X9UaX6PnW3Efgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag4v4AAKCRB4tDGHoIJi
0jy6AQCR+moMY+VjpI0n5ldHplzQEeCnJ4IdUq8G+Pz8ZIGkhwD/Z/jTgFZvLmPM
FUPrgn6RL6ZgxkdDAVxmAzhhVSuFtwY=
=ky5Y
-----END PGP SIGNATURE-----

--43X9UaX6PnW3Efgq--

