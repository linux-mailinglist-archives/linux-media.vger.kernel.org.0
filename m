Return-Path: <linux-media+bounces-62449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJQFMEXVDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:49:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E3E5A2AAB
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACEDA302FC21
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC98A37C91B;
	Thu, 21 May 2026 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nr/5MxsX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAE637C92E;
	Thu, 21 May 2026 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356912; cv=none; b=dBiFas8ZB4FBUACXg6GTN4ImhcbF9sv4DvXFWQ9qngFRkEyZgPSG/+HWf3XuO9bq5Te/bDUWoyaAA8epbMPDGunfx/MEfJ5dfmSCwxI+NhSNSoC4syUOnYnpHD++lgWMyUwj7hiW3/0ytDOsWExvqKZEHmtvXpIuQbP5djlkhq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356912; c=relaxed/simple;
	bh=JbWnnPNF5D8VepDALfkAsOARx5rD2Ixzi0Gc5h2Hy5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvdhDci2oYJSEe0XTjGxenp49r5Cf4Hw/wGIW8BPqZccoYWTzrXK9p3FTY+CvFQ7fS7L9Rz2RCvRQceGdjoIvUOABNI6U6Lhc2r6vgJbbxPHSfSo4GdVI50InXerPaNRc4nDxZpWjQysltIYmCIymu4X+Mc+0rW9d1O5igfgZJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nr/5MxsX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB281F000E9;
	Thu, 21 May 2026 09:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779356910;
	bh=DXRx2enOUYbjtI+sYeF+ALprq4tUPMXtHgGO7g10er0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nr/5MxsXouaiqqGMvF2pm3b7mVfz6l3GPiC4rVIZ20lhqjjDkQeRIFBxpXDZyJAni
	 UJUS8iuS+FLmCL05IL2QkC0cm6O09OVolhYL/g4uTnVOrPJi9kFYFfH8qK0KR8ln23
	 hEOdzdTMC5Glj3+z7OAHblTkEA3HmGZUEaTaJtMPzqkY5OFkdRuD+NE9BUiOTRAbXg
	 H92PUzhnjs8ckkifISagoz54XUxiifdbQZ0uKU/FatZsombnjY+u89qQUdgb0lbq4s
	 vYDAf9Mm97rPRQ9tM3yjb4AMOC04GE71WALjDaoZYfqDCQvYRugqG5An+xuh8W6jm1
	 XvM/Qixtc8qFw==
Date: Thu, 21 May 2026 10:48:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234
 image sensor binding
Message-ID: <20260521-dangling-utensil-610af5e07d79@spud>
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-2-eagle.alexander923@gmail.com>
 <20260505101505.GB1547435@killaraus.ideasonboard.com>
 <CAP1tNvQBKWkd0e9Yr+3swhaiHvkzUV+Ewb1qLF2kEYZy78meCQ@mail.gmail.com>
 <20260505163713.GE1547435@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQd/alrM2dn73HFz"
Content-Disposition: inline
In-Reply-To: <20260505163713.GE1547435@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62449-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,ideasonboard.com,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 61E3E5A2AAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qQd/alrM2dn73HFz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 07:37:13PM +0300, Laurent Pinchart wrote:
> On Tue, May 05, 2026 at 05:09:18PM +0300, Alexander Shiyan wrote:
> > > On Fri, Mar 06, 2026 at 01:36:13PM +0300, Alexander Shiyan wrote:
> > > > Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> > > >
> > > > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > > > ---
> > > >  .../bindings/media/i2c/onnn,ar0234.yaml       | 109 ++++++++++++++=
++++
> > > >  1 file changed, 109 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onn=
n,ar0234.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar023=
4.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > > > new file mode 100644
> > > > index 000000000000..d93fa99e6535
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > > > @@ -0,0 +1,109 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0234.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: ON Semiconductor AR0234 1/2.6-inch CMOS Digital Image Sensor
> > > > +
> > > > +description:
> > > > +  The AR0234 is a 1/2.6-inch CMOS digital image sensor with a pixel
> > > > +  array of 1940x1220 pixels, capable of 1920x1200 resolution at up
> > > > +  to 120 fps. It supports MIPI CSI-2 output with 1, 2, or 4 data l=
anes,
> > > > +  and raw Bayer (8/10-bit) or monochrome output.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: onnn,ar0234cs
> > >
> > > Should we define separate compatible strings for the mono and colour
> > > variants ? I know you identify the variant at runtime in the driver, =
but
> > > avoid I2C communication at boot time can be beneficial (to reduce boot
> > > time, and also to avoid flashing the privacy LED on systems that have
> > > one, albeit the latter is probably less applicable to the AR0234).
> >=20
> > We could do it like this =E2=80=94 Color: ar0234cssc, Mono: ar0234cssm.
> > But the current approach is more universal...
> > Could we add two compatible strings and keep the base one for auto-dete=
ction?
> > For detection, it would still be good to check the identifier anyway...
> > Or just add two compatible strings but detect connected variant in any =
case?
>=20
> I see multiple use cases:
>=20
> 1. You know at build time that you have an AR0234CS, but the model (mono
>    or colour) is only known at runtime (e.g. a product exists in mono and
>    colour options, with the options being otherwise identical).
>=20
>    This can be implemented with a single compatible string
>    "onnn,ar0234cs" and a runtime check of the model in the driver, *or*
>    with two compatible strings for the two models and a runtime check in
>    the boot loader that will set the correct compatible string.

You can kinda have both of these, runtime detection on a common fallback
compatible, and the bootloader selecting the right dtb/overlay etc with
specific ones.

>=20
> 2. You know at build time what exact camera module you have, and you
>    want to avoid powering the sensor up at boot time (e.g. boot time
>    optimization, avoiding privacy LED flashing, ...).
>=20
>    This requires two separate compatible strings for the two models.
>=20
> 3. You know at build time what exact camera module you have, and you
>    want a runtime sanity check.
>=20
>    This requires two separate compatible strings for the two models.

Maybe in media land this kind of thing is okay, because the likelihood
of compatibility between models is low, but overall I dislike this kind
of thing as it causes problems when using fallbacks. Perhaps here that
doesn't matter at all because you're only doing colour/mono
differentiation, not validating that this is an ar0234cs?

> In order to cover all those use cases, we could use
>=20
> properties:
>   compatible:
>     enum:
>       - onnn,ar0234cssc
>       - onnn,ar0234cssm
>       - onnn,ar0234cs
>=20
> The first two compatible strings would cover use case 1 with the boot
> loader detection, use case 2, and use case 3. The last compatible string
> would cover use case 1 without the boot loader detection. This is waht
> the sony,imx296.yaml binding does. The sony,imx290.yaml binding, on the
> other hand, has deprecated the generic compatible string.
>=20
> We could also use
>=20
> properties:
>   compatible:
>     oneOf:
>       - const: onnn,ar0234cs
>       - items:
>           - enum:
>               - onnn,ar0234cssc
>               - onnn,ar0234cssm
>           - const: onnn,ar0234cs
>=20
> if we want a fallback compatible string, which could allow systems that
> only case about use case 1 without boot loader detection to only match
> on "onnn,ar0234cs" in their driver. I don't think we have any such
> bindings for image sensors.
>=20
> I don't think we've decided on a recommended practice.

I definitely don't like the first suggestion here, the second is more
acceptable. With the first, it definitely seems just like abusing the
compatible property to have different behaviour for the exact same
hardware.

| properties:
|   compatible:
|     items:=20
|       - enum:
|           - onnn,ar0234cssc
|           - onnn,ar0234cssm
|       - const: onnn,ar0234cs

Can also do this, but have all three devices in the driver, to promote
completely describing a device while also supporting lazy/cheap vendors
that want to reuse a dtb rather than implement two images or a selection
method. Obviously it'd produce dtbs_check warnings, but it is not as if
those sorts of vendors care about dtbs_check.
I mention vendors specifically here, since an end user can probably
update their dtb once they figure out which device they actually have,
which I think shouldn't be very difficult!


--qQd/alrM2dn73HFz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag7U6AAKCRB4tDGHoIJi
0hegAQCTWF971YBFqL2foYQhfHJeq25F7j2W8+ZqoFX3d4fzkQEAipHsGjiBcK0n
Fu699rqIQDm20ksVU5e9b9WLwxQAlQE=
=APJu
-----END PGP SIGNATURE-----

--qQd/alrM2dn73HFz--

