Return-Path: <linux-media+bounces-62444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHFtI1jYDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:03:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C075A2DF5
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B938B321F354
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F233377541;
	Thu, 21 May 2026 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGsfH6bT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F558369990;
	Thu, 21 May 2026 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355847; cv=none; b=nZCLhkh7lmLS4UqiYnEGiS0R2BTNAB/PGFfCg7Zcen7xZVRinvTVflO9nvyAyt3Lan1+o4fScrSa3cdNCFiVtwShbCOcdYjvVWum/3gDELsztdx8WEuXT3aOsZZ87WTR+niE/jV2OZLqOHR7JRcL0wx/Dg91dcQgNDXWUiKxXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355847; c=relaxed/simple;
	bh=+zM+fm8iBDAyOpIPzGw5gJxypV7XbWxh/YJ5XceYGzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DET1jKb05HK+xHqr0pRqwlLISXYGkQZxjCX4PtENZbE8XF3mHdzndzomdCAnHaQhQQ2xRusy8BLV5Xm6UIDbNkA2pyHJa0bp9CRflINyuOulP0MV5Vlcjl7stN6CEoxgVsvT46DPYDuCnYDDSWvuBxE7ociW23tov1/lPw/sfV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGsfH6bT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5C51F000E9;
	Thu, 21 May 2026 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779355845;
	bh=AcGKeHrTqtK4Qhgbme8qyLwDptN6YU6pxaKT4jWGjZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGsfH6bTaGp41twuspfGdXdD6FvtHjgphcA4HCjpKPqVpyByt0HP0pFVUGrLIx6Pu
	 FhlCeUgmrYiItWeBewHpqI8bSqm+5Zx2s9al+uY+O90JEWIcC9kplfuRmBBU/WwPLi
	 D8BpnrRMDB0pHNDjco24ZdecuZKBHXJcI33iGDmZMeMTyXvbwHQOhuTfaHSJRyvnVL
	 +9QOWHnfT9GRtBMyEqKc51SNrS6u6ukpan6hgNH5J9dkmM8oFWymvk0DMDfdfE8Pvt
	 Q7opMGFhWPBgOz+KpnE9U+CKfzZC873zp7G7avzI1Sf0WKn+6Q6x49a5/fxLG2LG9U
	 Aq/eY2Em2UxOA==
Date: Thu, 21 May 2026 10:30:40 +0100
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
Message-ID: <20260521-upturned-human-8c3b764067dc@spud>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com>
 <20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com>
 <20260520-crusher-species-cf707a9a8b46@spud>
 <177929757691.2341049.18374545669142492074@selene>
 <20260520-during-rocklike-a7436513d559@spud>
 <177934865612.2341049.12699321483523040036@selene>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NiXAy3Gls+152Bmp"
Content-Disposition: inline
In-Reply-To: <177934865612.2341049.12699321483523040036@selene>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62444-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Queue-Id: E8C075A2DF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--NiXAy3Gls+152Bmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 09:30:56AM +0200, Jai Luthra wrote:
> Quoting Conor Dooley (2026-05-21 00:04:16)
> > On Wed, May 20, 2026 at 07:19:36PM +0200, Jai Luthra wrote:
> > > Quoting Conor Dooley (2026-05-20 17:56:29)
> > > > On Wed, May 20, 2026 at 05:17:25PM +0200, Jai Luthra wrote:
> > > > > Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can=
 output
> > > > > pixels over MIPI CSI-2 bus. Add bindings for it.
> > > > >=20
> > > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > > > ---
> > > > > Changes in v3:
> > > > > - Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN,=
 instead of `xclr-gpios`
> > > > > Changes in v2:
> > > > > - Add per-variant compatibles for mono and colour, alongside the
> > > > >   generic fallback, so the variant can be declared without poweri=
ng
> > > > >   the sensor at probe.
> > > > > - Rename reset GPIO to xclr as that's what it's called in the
> > > > >   datasheet, and how it behaves
> > > > > - Reference the generic video interface devices schema and switch=
 to
> > > > >   unevaluatedProperties.
> > > > > - Drop "link-frequencies: true"
> > > > > - Drop the T: entry for media.git from MAINTAINERS.
> > > > > ---
> > > > >  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 129 +++++++=
++++++++++++++
> > > > >  MAINTAINERS                                        |   6 +
> > > > >  2 files changed, 135 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx=
678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..d85745ddbefd
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > > > @@ -0,0 +1,129 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +# Copyright (C) 2026 Ideas on Board Oy
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Sony IMX678 Sensor
> > > > > +
> > > > > +maintainers:
> > > > > +  - Jai Luthra <jai.luthra@ideasonboard.com>
> > > > > +
> > > > > +description:
> > > > > +  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel ty=
pe solid-state
> > > > > +  image sensor with a square pixel array and 8.40M (3856x2180) e=
ffective pixels.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - sony,imx678
> > > > > +      - sony,imx678-aamr
> > > > > +      - sony,imx678-aaqr
> > > > > +    description:
> > > > > +      The IMX678 sensor exists in a colour variant (IMX678-AAQR)=
 and a mono
> > > > > +      variant (IMX678-AAMR). An internal register can also help =
detect this at
> > > > > +      runtime.
> > > >=20
> > > > I don't understand the compatibles here. If aaqr is tge colour vari=
ant,
> > > > and aamr is mono, what does the suffix-less compatible represent?
> > >=20
> > > Sorry, I had seen Laurent's comment on this area in v2 but forgot to =
update
> > > it in this revision.
> > >=20
> > > The suffix-less compatible is for the cases where a product comes in =
two
> > > variants with the sensor being either mono or color.
> >=20
> > This response is very weird. It's worded in a really generic way that
> > barely seems to be a response to my mail. We aren't talking about
> > "a product" here, we are specifically talking about the imx678, and we
> > know it comes it these variants. There are no "cases" involved.
> >=20
>=20
> It's very myopic to say bindings should only care about the camera sensor
> on its own and not how or where it is integrated in, which is usually a
> "product".

Ah, I definitely misunderstood what you meant by "product". It was not
clear to me that "product" in this context did not mean the camera that
we were discussing a binding for.

> Maybe my response won't sound "weird" (?) if you see Dave's comment on v1:
> https://lore.kernel.org/all/CAPY8ntBi88-dd2HxxftErf8h5-ERRPcGy5KJ-+oF7jaw=
NOJpuA@mail.gmail.com/
> and Laurent's recent proposal(s) for handling this for a different sensor:
> https://lore.kernel.org/linux-media/20260505163713.GE1547435@killaraus.id=
easonboard.com/
>=20
> Both of those threads have you in CC, so I assumed you were aware. That's=
 a
> higher bar for "being aware of something" than DT maintainers often have
> for contributors, like Krzysztof's comment with unnecessarily snappy tone
> about the reset-gpio on v2.

I get too much email to read every single thread. If something was
reviewed by Krzysztof or Rob I don't open it, unless something piques my
interest. I think I average 700 binding related emails per day with all
the new sashiko-bot mails included, I wouldn't be able to have a life if
I read them all! If I review a patch where I didn't review earlier
revisions do I look at the binding patch on lore, but I don't generally
care about the driver patches. Laurent's proposal was a reply to something
long deleted from my mailbox, so I highly doubt I opened it.

I personally don't expect contributors to have any wider awareness, but
every maintainer differs in their expectations of contributors, across
all subsystems.

> > > It allows sharing DT blobs amongst the two variants, where the driver
> > > powers the sensor on and reads the register to figure out if it is mo=
no
> > > or color.
> >=20
> > To be honest, I don't really get why the driver uses the specific
> > compatibles at all, if it can just determine if it is colour or mono at
> > runtime. Seems to me like this should be
> > compatible:
> >   items:
> >     - enum:
> >        - imx678-aamr
> >        - imx678-aaqr
> >     - const: imx678
>=20
> Yes, that's the other proposal. The downside being having a certainty of
> the variant at integration time, and not allowing sharing binary blobs
> as-is between two "products" that differ only in which of the two sensor
> variants it ships with.

To be the devil's advocate, nothing stops someone from shipping a
devicetree for a "product" like this with the specific compatibles
omitted!
That said, if someone is building two different products, with two
different SKUs and two different BoMs, I don't really see why they can't
ship different images (or the same image, with a way for the bootloader
to figure out which dtb to load), so this can be achieved without having
to permit a binding like this.

> > Or just entirely drop the suffixed compatibles from the binding, since
> > you can detect mono v colour at runtime. The justification for the
> > aamr/aaqr compatibles seems to be that it avoids powering on the device
> > to check, but it looks like you unconditionally power it on and check
> > which variant it is, so that argument holds no water.
> >=20
> > > It allows sharing DT blobs amongst the two variants, where the driver
> > > powers the sensor on and reads the register to figure out if it is mo=
no
> > > or color.
> >=20
> > Why would you want to share the dtb anyway? That makes no sense to
> > me as a usecase in the first place. If the sensor isn't part of the
> > board, you should be using an overlay or something similar to apply it,
> > because if you can swap the sensor you can also have no sensor!
> >=20
> > Also doesn't your driver print a warning if you did this anyway?
> >=20
>=20
> I thought the bindings are for the hardware and all its potential usecase=
s,
> and not tied to a specific driver or OS? Has that changed??
>=20
> What we do in the linux driver today should be irrelevant to it.

The reason I brought up the points about the driver is that I thought
that either you had forgotten to implement the things you were using as
justification, or you were inventing justifications on the fly to avoid
making changes. To me, what the driver does (or doesn't do) is very
relevant when you're trying to justify something we would ordinarily
not permit.
Remember, having distinct multiple compatibles for the same hardware so
that you can induce different software behaviour is not something we
typically permit. While we do want to support all use cases, it isn't
always the case that devicetree is the right place to do it.

Additionally, it saves me having to send another email in response to
the driver!

> The specific compatibles are useful for the potential usecase of not waki=
ng
> up the sensor to save boot-time or avoiding privacy LED flash at multiple
> stages of the boot process.

This is a valid justification for keeping the specific compatibles.
Although this is effectively the same as "avoid powering on the device
to check", providing reasons why this has value makes it a much stronger
argument.

Hope that helps,
Conor.

--NiXAy3Gls+152Bmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag7QwAAKCRB4tDGHoIJi
0l7qAP9/JZ5JG2tJX6+fba1bmKXOtCpL08AGgsxcyvrzoXuLxwEAhqcciOHDK/JX
1NgVDKyCj7auPiH9xdYGgiEA5SH0Gw0=
=ifaP
-----END PGP SIGNATURE-----

--NiXAy3Gls+152Bmp--

