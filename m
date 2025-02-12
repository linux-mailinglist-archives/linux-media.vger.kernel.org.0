Return-Path: <linux-media+bounces-26093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED9A33084
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 21:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCCD6188A46A
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2930720102E;
	Wed, 12 Feb 2025 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqfQ+0mS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9B71FF1C2;
	Wed, 12 Feb 2025 20:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739391108; cv=none; b=DZmwlI7RolODl6CTO/TIhWdPbWs9r13kXKvpEc/Wz0FFnF6knxvgwE3aMT1BVrP46vBE868SjtwsD6wJo2fpH/no8Q/QNZxUjZBjSdAm2FD+fSyVRrFsnF5FHTj4vEcUzEHVCU0tJlCDU7+J/uBgq+6raJNOjP+DR1XZGIlke/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739391108; c=relaxed/simple;
	bh=TYFAn0GjNtfs6GemvOBTR0+yVNV4Qawo3mDS4XiD+nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfNRidjTQrCBPXgoJHuW5bOr6HOzIXveMEpIsWuyFIySfCIRWXb28U58T31v+rwRv7MFlH+XrYI3FOtt0HQSELeOiqfGNtDnwhUNZsXzbyyIa6L43xEDjCpD3FdBL7BQeL/miXOPCDJbPz9kF6CL438F/WjyzdRoC1F6xVf/3oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqfQ+0mS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B900C4CEDF;
	Wed, 12 Feb 2025 20:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739391108;
	bh=TYFAn0GjNtfs6GemvOBTR0+yVNV4Qawo3mDS4XiD+nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqfQ+0mS9Zg1ixIFRAHqRE4ERBiPhWcrODe358e0hAfgFw652xbkbidE4Ro5Klwma
	 0iOg1iGnUI+pORnnPIh1L3ik8FDRJ0W51hbx2hPvhbeyJslcbCOEvNyYohkCs70QBS
	 B5bTi5XkG8aR2gZ1mzdh8G+2dJd1cnUYWn8NLN69brKCngDUg4JkBY6JSlTZ/e/vHs
	 smHP0tSG4sYzhumv9vumR9pt9hNEfRnsEYjMU/K3Db8Jm5VqpNgpn3Vtt7LoxogD3h
	 IHJ/R06itiI8Eng+PJcGrevuDyYNi4jn5tt7lVHb08dKmnevivhdGugZnieBpedkCD
	 jtRfiYf3jFCbA==
Date: Wed, 12 Feb 2025 20:11:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: maxim,max96717: add new properties
Message-ID: <20250212-policy-abdominal-052bf84a7d10@spud>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
 <20250211-ecard-dallying-94ced9b29fd9@spud>
 <20250212174209.GA3890372-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YbrQYOuJDAjTRr3o"
Content-Disposition: inline
In-Reply-To: <20250212174209.GA3890372-robh@kernel.org>


--YbrQYOuJDAjTRr3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 11:42:09AM -0600, Rob Herring wrote:
> On Tue, Feb 11, 2025 at 06:46:10PM +0000, Conor Dooley wrote:
> > On Fri, Feb 07, 2025 at 01:29:55PM +0200, Laurentiu Palcu wrote:
> > > Add 'maxim,override-mode' property to allow the user to toggle the pin
> > > configured chip operation mode and 'maxim,fsync-config' to configure =
the
> > > chip for relaying a frame synchronization signal, received from
> > > deserializer, to the attached sensor. The latter is needed for
> > > synchronizing the images in multi-sensor setups.
> > >=20
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > ---
> > >  .../bindings/media/i2c/maxim,max96717.yaml    | 28 +++++++++++++++++=
++
> > >  1 file changed, 28 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max967=
17.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > > index d1e8ba6e368ec..fae578d55fd4d 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > > @@ -42,10 +42,35 @@ properties:
> > >        number must be in range of [0, 10].
> > > =20
> > >    gpio-controller: true
> > > +  gpio-reserved-ranges: true
> > > =20
> > >    '#clock-cells':
> > >      const: 0
> > > =20
> > > +  maxim,override-mode:
> > > +    description: Toggle the operation mode from the pin configured o=
ne.
> > > +    type: boolean
> >=20
> > type: flag
>=20
> Err, no.
>=20
> You can do as-is or:
>=20
> $ref: /schemas/types.yaml#/definitions/flag

Eh, that's sloppy. I must have been rushing or distracted. Sorry.

> I am neutral as to which way. If I wasn't we'd make the meta-schema=20
> enforce one way or the other.

I'm biased towards flag, since I've seen confusion about setting the
boolean ones to false to disable them a bunch.

--YbrQYOuJDAjTRr3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ60AfwAKCRB4tDGHoIJi
0geKAQDLe3eIQ6mumtyudUl9hWgBgJ29g3asPK2JaEz2v8uvHgEApYpSDxB4ig/C
r+eMBlmm90OWTWRGOiJuspqXIYPu5gU=
=6lir
-----END PGP SIGNATURE-----

--YbrQYOuJDAjTRr3o--

