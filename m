Return-Path: <linux-media+bounces-27648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D612A504F3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 17:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9B76166289
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 16:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEDC2512E8;
	Wed,  5 Mar 2025 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYwmc8SF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AFD199E89;
	Wed,  5 Mar 2025 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192169; cv=none; b=qlWJD2sMJ4+ICVarSGa/zY4kH+d2myjA9bQA+h9e3mWM711NQRVQzZNJol7xm3xUlSFHCte9HSnXYgf2OgEr4qnJPwTi6GvIS2NpDT2ZiNqTud1MOM9UGoK19/9bFY/kAuLqT+E4sJre5QdWtCeHLlD7T5fCPRTn+1gT4TSNWZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192169; c=relaxed/simple;
	bh=0hIYbCsMeqb7kL56RIQI9rjYbpOg3lzLQ/oYq1lezhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6kMULJtmdD5dyk85z6x4AEO31cOf23mkmcSXwQYRtCZJR/jSXrgj1KlSGp+NvJDFQxlac7EzEZFbJtpFF0WcxSreUET+TbRepqmt8W4TXibEE78b/z4LnTqjW5xj6E3u8DYhXdTjBUKMEuLAaInPX1V/8Oh4XrMkvFwUWJH8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYwmc8SF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F8EC4CED1;
	Wed,  5 Mar 2025 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741192169;
	bh=0hIYbCsMeqb7kL56RIQI9rjYbpOg3lzLQ/oYq1lezhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYwmc8SFlMCz0SjUCLkCg5sM4hgeqUJ8wEywmbLqH3HZnh9NwnnhV1Bys74v7iwzE
	 Oh1v8iRBYIEx0i8gw+MHKUjcLN8P93b7Cr52sybbyRz6GUQUMgLxx6s6zyPTbVTYWi
	 wDKcOi6QqmaVy5PC3DCuqvosYpSdBKkvwgtfC32JwbWEqgo7qyR0fiOM6iZQpZFeXy
	 jIVbgLUBlH1zxFBgVYiiXiJPY5VKh+U8X8qN78mtTzWt1u8KOXhclrAv9nSMhUA7ku
	 WQU6PoKhXduS0K3uv1uSw3cMY60lyFhncLtKeBlJbCEJP/ZsZb5TlEBk272BTwkJI9
	 v53di8JYWgbaQ==
Date: Wed, 5 Mar 2025 16:29:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	MauroCarvalhoChehab@mt.com, mchehab@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 2/8] MT9M114: Add pad-slew-rate DT-binding
Message-ID: <20250305-dislodge-bleep-53085727cf09@spud>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-3-mathis.foerst@mt.com>
 <Z8A66l02Et4J7hj4@kekkonen.localdomain>
 <20250228-helpless-delivery-42162772caa3@spud>
 <Z8boqvxEAhx7rG9Q@mt.com>
 <20250304-expend-isotope-cea613f4e9d5@spud>
 <Z8ggf4wXX6HAoCpS@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J2qPpIDsCInRLxq4"
Content-Disposition: inline
In-Reply-To: <Z8ggf4wXX6HAoCpS@mt.com>


--J2qPpIDsCInRLxq4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 10:59:27AM +0100, Mathis Foerst wrote:
> On Tue, Mar 04, 2025 at 04:39:34PM +0000, Conor Dooley wrote:
> > On Tue, Mar 04, 2025 at 12:48:58PM +0100, Mathis Foerst wrote:
> > > Hi Conor, Hi Sakari,
> > >=20
> > > On Fri, Feb 28, 2025 at 07:11:31PM +0000, Conor Dooley wrote:
> > > > On Thu, Feb 27, 2025 at 10:14:02AM +0000, Sakari Ailus wrote:
> > > > > Hi Mathis,
> > > > >=20
> > > > > On Wed, Feb 26, 2025 at 04:39:23PM +0100, Mathis Foerst wrote:
> > > > > > The MT9M114 supports the different slew rates (0 to 7) on the o=
utput pads.
> > > > >=20
> > > > > "the output pads" probably means pixel data interface (DVP or CSI=
-2)
> > > > > signals in this cases? I suppose this is about clock modulation?
> > > > > It'd be good to say that.
> > >=20
> > > The slew rate defines the slope of the voltage flanks on the output p=
ads (how fast
> > > the pads go from LOW to HIGH or vice versa). I tried to clarify the d=
escription.
> > >=20
> > > > >=20
> > > > > > At the moment, this is hardcoded to 7 (the fastest rate).
> > > > > > The user might want to change this values due to EMC requiremen=
ts.
> > > > > >=20
> > > > > > Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for=
 selecting
> > > > > > the desired slew rate.
> > > > > >=20
> > > > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml         | =
6 ++++++
> > > > > >  1 file changed, 6 insertions(+)
> > > > > >=20
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,m=
t9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > > > index 72e258d57186..666afe10c538 100644
> > > > > > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.=
yaml
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.=
yaml
> > > > > > @@ -74,6 +74,12 @@ properties:
> > > > > >      description: Bypass the internal PLL of the sensor to use =
EXTCLK directly as SYSCLK.
> > > > > >      type: boolean
> > > > > > =20
> > > > > > +  onnn,slew-rate:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > > > >=20
> > > > > No need to make this 8-bit (i.e. just use 32 bits).
> > >=20
> > > Okay, I thought 8-bit would fit the small value range [0,7]. Changed =
it to 32 bits.
> > >=20
> > > > >=20
> > > > > > +    description: Slew rate ot the output pads DOUT[7:0], LINE_=
VALID, FRAME_VALID and PIXCLK
> > > > >=20
> > > > > Please wrap at 80 characters.
> > > > >=20
> > > > > Is there more information on the effect than 7 is the fastest?
> > >=20
> > > There is no more information about the exact meaning of the values.
> > > As described above, the higher the value, the steeper the voltage fla=
nks.
> > >=20
> > > > >=20
> > > > > > +    minimum: 0
> > > > > > +    maximum: 7
> > > > >=20
> > > > > Please also add a default.
> > >=20
> > > Sure, I added the default value 7 that matches the currently hardcode=
d=20
> > > value in the driver.
> > >=20
> > > >=20
> > > > It'd also be great (IMO) if it were given in terms of actual units,=
 not
> > > > nebulous values that I assume to be the register values.
> > >=20
> > > I agree, but the documentation does not provide further details about=
 the
> > > unit of the value. So using the register value is my best-effort appr=
oach.
> >=20
> > If they don't provide em, how is anyone meant to calculate what's
> > correct? Trial and error?
>=20
> The correct slew-rate is a trade-off:
>=20
> You would usually start with the fastest slew-rate as it leads to an
> output signal that's as close as possible to a perfect square-wave.
> On higher link frequencies a too slow slew rate can cause the signal to
> not reach the HIGH voltage level before going to LOW again s.t. the
> reveiver cannot interpret the digital signal correctly.
>=20
> But steeper voltage flanks lead to higher electromagnetic emissions s.t.
> a device might not pass the electromagnetic compatibility (EMC)
> certification with the high slew rate.
> In this case you would lower the slew rate until your emissions are
> within the allowed range.
>=20
> The actual emissions depend on many factors like the PCB layout, the
> length and shielding of cables etc. This makes it hard to fully simulate
> them.
> So even if would know the exact unit of the configured slew rate of the
> camera sensor, it would not fully allow us to calculate the correct value
> for it.

So the answer is trial and error then?

--J2qPpIDsCInRLxq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8h75AAKCRB4tDGHoIJi
0lkzAQDbOQvQezidk2TtYmj15L2tdUMiDuFw7FAQm8cxbUH3TwEAlyDHSxYrRD73
zvJOMLo+F4attesobYF3SsMdadGWnAI=
=4U6I
-----END PGP SIGNATURE-----

--J2qPpIDsCInRLxq4--

