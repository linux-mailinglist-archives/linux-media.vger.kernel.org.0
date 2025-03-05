Return-Path: <linux-media+bounces-27649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B00A504FD
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 17:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E25701886983
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 16:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAA7192B95;
	Wed,  5 Mar 2025 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFAN/icr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB72C15350B;
	Wed,  5 Mar 2025 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192228; cv=none; b=Kdrzhw7GfwJ2SwzIIF93NbMZWb8QjH4WMOc/+DdrktlezwafxPLi2ZfFnGcbG0fuWCaO1EaDeQ+JrCdh91QriyHBxPQVrJajEXvNJjY6B4YrmG46um4uQByCdV50aJ+TBBMX+k0FGzYi31/YcNni2lCJVMr9V8xv+O6E98fgwlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192228; c=relaxed/simple;
	bh=FZKrVRaLdOeP4MYB8JeHLpJJFV9GJ95YyHm9V1A+EI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDOMtIUhVp2HJZjooUFxNXdaetQJCBAF2zwshfnxF8KX45gtXvKbdLKKJekcocHbYmmejjbF/6NjR9Nx/Lb2l2rRU4We09CRxDdDuEODgkWnFpjs16SsYLj/iUf81aozqhTst4zB3wRcsFV/Kl+cHejBC6PCSGx0QaY5BdHn30o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFAN/icr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D941C4CED1;
	Wed,  5 Mar 2025 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741192227;
	bh=FZKrVRaLdOeP4MYB8JeHLpJJFV9GJ95YyHm9V1A+EI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFAN/icr7W76+KJ0Rq9dSt6QQQfSjqArVeLB6e1WgjQs4LzF9tAeKQB2Ub3yjfsZr
	 YxJ9JtF4HzXojHSfd7nnuAK5SJsoK4hEwre3fUBQS+IyxgUN3AeNAa+OJ+KuxI1jpI
	 4hlphX/rre/vzom02wgn4SkUF1pNpz4kcnAKhCeWVOgdvM+1ZcQDCfkV7e9MfK5tob
	 oCpb5L0hUj67FHwggx6JuJkTEtb1Ly1tJbbAKfyFaNOUC3/SJhxkuofSu9ePbijRW9
	 sEcKwG8/F2xysGW51EcERUvW9Ykv6maqMf7+q1af5a30X7krJL34rA3jc/9i5RXOjX
	 dsDqzwCkvBscw==
Date: Wed, 5 Mar 2025 16:30:23 +0000
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
Message-ID: <20250305-droplet-freemason-a21045aac0c0@spud>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-3-mathis.foerst@mt.com>
 <Z8A66l02Et4J7hj4@kekkonen.localdomain>
 <20250228-helpless-delivery-42162772caa3@spud>
 <Z8boqvxEAhx7rG9Q@mt.com>
 <20250304-expend-isotope-cea613f4e9d5@spud>
 <Z8ggf4wXX6HAoCpS@mt.com>
 <20250305-dislodge-bleep-53085727cf09@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="arAqwr9aNN/Ixv2i"
Content-Disposition: inline
In-Reply-To: <20250305-dislodge-bleep-53085727cf09@spud>


--arAqwr9aNN/Ixv2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 04:29:24PM +0000, Conor Dooley wrote:
> On Wed, Mar 05, 2025 at 10:59:27AM +0100, Mathis Foerst wrote:
> > On Tue, Mar 04, 2025 at 04:39:34PM +0000, Conor Dooley wrote:
> > > On Tue, Mar 04, 2025 at 12:48:58PM +0100, Mathis Foerst wrote:
> > > > Hi Conor, Hi Sakari,
> > > >=20
> > > > On Fri, Feb 28, 2025 at 07:11:31PM +0000, Conor Dooley wrote:
> > > > > On Thu, Feb 27, 2025 at 10:14:02AM +0000, Sakari Ailus wrote:
> > > > > > Hi Mathis,
> > > > > >=20
> > > > > > On Wed, Feb 26, 2025 at 04:39:23PM +0100, Mathis Foerst wrote:
> > > > > > > The MT9M114 supports the different slew rates (0 to 7) on the=
 output pads.
> > > > > >=20
> > > > > > "the output pads" probably means pixel data interface (DVP or C=
SI-2)
> > > > > > signals in this cases? I suppose this is about clock modulation?
> > > > > > It'd be good to say that.
> > > >=20
> > > > The slew rate defines the slope of the voltage flanks on the output=
 pads (how fast
> > > > the pads go from LOW to HIGH or vice versa). I tried to clarify the=
 description.
> > > >=20
> > > > > >=20
> > > > > > > At the moment, this is hardcoded to 7 (the fastest rate).
> > > > > > > The user might want to change this values due to EMC requirem=
ents.
> > > > > > >=20
> > > > > > > Add the 'pad-slew-rate' property to the MT9M114 DT-bindings f=
or selecting
> > > > > > > the desired slew rate.
> > > > > > >=20
> > > > > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml         =
| 6 ++++++
> > > > > > >  1 file changed, 6 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn=
,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.ya=
ml
> > > > > > > index 72e258d57186..666afe10c538 100644
> > > > > > > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m11=
4.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m11=
4.yaml
> > > > > > > @@ -74,6 +74,12 @@ properties:
> > > > > > >      description: Bypass the internal PLL of the sensor to us=
e EXTCLK directly as SYSCLK.
> > > > > > >      type: boolean
> > > > > > > =20
> > > > > > > +  onnn,slew-rate:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > > > > >=20
> > > > > > No need to make this 8-bit (i.e. just use 32 bits).
> > > >=20
> > > > Okay, I thought 8-bit would fit the small value range [0,7]. Change=
d it to 32 bits.
> > > >=20
> > > > > >=20
> > > > > > > +    description: Slew rate ot the output pads DOUT[7:0], LIN=
E_VALID, FRAME_VALID and PIXCLK
> > > > > >=20
> > > > > > Please wrap at 80 characters.
> > > > > >=20
> > > > > > Is there more information on the effect than 7 is the fastest?
> > > >=20
> > > > There is no more information about the exact meaning of the values.
> > > > As described above, the higher the value, the steeper the voltage f=
lanks.
> > > >=20
> > > > > >=20
> > > > > > > +    minimum: 0
> > > > > > > +    maximum: 7
> > > > > >=20
> > > > > > Please also add a default.
> > > >=20
> > > > Sure, I added the default value 7 that matches the currently hardco=
ded=20
> > > > value in the driver.
> > > >=20
> > > > >=20
> > > > > It'd also be great (IMO) if it were given in terms of actual unit=
s, not
> > > > > nebulous values that I assume to be the register values.
> > > >=20
> > > > I agree, but the documentation does not provide further details abo=
ut the
> > > > unit of the value. So using the register value is my best-effort ap=
proach.
> > >=20
> > > If they don't provide em, how is anyone meant to calculate what's
> > > correct? Trial and error?
> >=20
> > The correct slew-rate is a trade-off:
> >=20
> > You would usually start with the fastest slew-rate as it leads to an
> > output signal that's as close as possible to a perfect square-wave.
> > On higher link frequencies a too slow slew rate can cause the signal to
> > not reach the HIGH voltage level before going to LOW again s.t. the
> > reveiver cannot interpret the digital signal correctly.
> >=20
> > But steeper voltage flanks lead to higher electromagnetic emissions s.t.
> > a device might not pass the electromagnetic compatibility (EMC)
> > certification with the high slew rate.
> > In this case you would lower the slew rate until your emissions are
> > within the allowed range.
> >=20
> > The actual emissions depend on many factors like the PCB layout, the
> > length and shielding of cables etc. This makes it hard to fully simulate
> > them.
> > So even if would know the exact unit of the configured slew rate of the
> > camera sensor, it would not fully allow us to calculate the correct val=
ue
> > for it.
>=20
> So the answer is trial and error then?

And I guess, keep the register values if there's no actual unit
corresponding to these values.

--arAqwr9aNN/Ixv2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8h8HgAKCRB4tDGHoIJi
0iNgAP4/5ILbrecosxmqIUpVl/pQnufWwdGLuIxAiiZZSkmcDAD/exHRHMwO7Q+J
6r27sqSU8+Dmar195qzIZhHo0hJ+Cg8=
=ZPDb
-----END PGP SIGNATURE-----

--arAqwr9aNN/Ixv2i--

