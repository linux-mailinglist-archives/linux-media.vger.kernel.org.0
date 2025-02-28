Return-Path: <linux-media+bounces-27254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45523A4A27A
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 20:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1270D3AB55A
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 19:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CB81F8735;
	Fri, 28 Feb 2025 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwP1+aqx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E727700D;
	Fri, 28 Feb 2025 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740769896; cv=none; b=dsUXz+ZL/wR7ryGrCLYnkqLNC5WbPSbjteu70Zlin42MJNXCi8G+aWxL0Go9YIOdTkkVJNhoPjWAXut7tq0y+zrY1bda38awFLLXDxyz519qGGfBsPfmKs+G0PqJbbjWfNdPR6Z+CoCQ8vDVUcWvwQacqcaiGGj0EEAp0kKF34k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740769896; c=relaxed/simple;
	bh=W/BKVB9AkMwAlyGZ1YJJyENUSPeJrYOUFfElGHnztP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/PJ4ftvwp6Iv9tngmKZjIPbHk7WjvBglHbsi1nwuzQrdoWF8KQYI0TtDRJfvQFgWQZF/Fy2fHKLLuFFY/fzQJZg8y7+DigD6kZ6zxcdb0r7HhnBbP5p2cY8xA9W7aEHKEYF0CEAtVsR0uglgsUeA6YKlVzLHhBO/2S6iWz8TR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwP1+aqx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CAFC4CED6;
	Fri, 28 Feb 2025 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740769896;
	bh=W/BKVB9AkMwAlyGZ1YJJyENUSPeJrYOUFfElGHnztP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gwP1+aqx63z5J48CJYRA+C9L41jmmswahBmgGrraayPLR9J/cbNk4Fp/pDr9+LFb4
	 0en5fCapFI6IqPg752Sa8ja5CfsDFNTuknWsyrwZEkl+T46UPu4VyJV6Nejl+IDv2V
	 OiDUkunyWR4aO+uGpw06/6NVeEZ9kC9Mm2a2m8y7wKt3nw4ElsZtRkDCEl8J19i4GW
	 WhHd+RkP5Ji9ghgwoodmXnLWpJVkgkLNfnNY5PV+TzrodQ13R31UjDLhJN9rFnyLn9
	 8yYG6l/0um5mW35dckdIACpqCDOOtefM9qLU/Eu70jFM8DpsAzjXufGQFgeu6cpNNO
	 TSEz1zKlAREaA==
Date: Fri, 28 Feb 2025 19:11:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mathis Foerst <mathis.foerst@mt.com>, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 2/8] MT9M114: Add pad-slew-rate DT-binding
Message-ID: <20250228-helpless-delivery-42162772caa3@spud>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-3-mathis.foerst@mt.com>
 <Z8A66l02Et4J7hj4@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qCNovWBlHUc0Sp+m"
Content-Disposition: inline
In-Reply-To: <Z8A66l02Et4J7hj4@kekkonen.localdomain>


--qCNovWBlHUc0Sp+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 10:14:02AM +0000, Sakari Ailus wrote:
> Hi Mathis,
>=20
> On Wed, Feb 26, 2025 at 04:39:23PM +0100, Mathis Foerst wrote:
> > The MT9M114 supports the different slew rates (0 to 7) on the output pa=
ds.
>=20
> "the output pads" probably means pixel data interface (DVP or CSI-2)
> signals in this cases? I suppose this is about clock modulation?
> It'd be good to say that.
>=20
> > At the moment, this is hardcoded to 7 (the fastest rate).
> > The user might want to change this values due to EMC requirements.
> >=20
> > Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for selecti=
ng
> > the desired slew rate.
> >=20
> > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > ---
> >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.y=
aml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > index 72e258d57186..666afe10c538 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > @@ -74,6 +74,12 @@ properties:
> >      description: Bypass the internal PLL of the sensor to use EXTCLK d=
irectly as SYSCLK.
> >      type: boolean
> > =20
> > +  onnn,slew-rate:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
>=20
> No need to make this 8-bit (i.e. just use 32 bits).
>=20
> > +    description: Slew rate ot the output pads DOUT[7:0], LINE_VALID, F=
RAME_VALID and PIXCLK
>=20
> Please wrap at 80 characters.
>=20
> Is there more information on the effect than 7 is the fastest?
>=20
> > +    minimum: 0
> > +    maximum: 7
>=20
> Please also add a default.

It'd also be great (IMO) if it were given in terms of actual units, not
nebulous values that I assume to be the register values.

>=20
> > +
> >  required:
> >    - compatible
> >    - reg
>=20
> --=20
> Regards,
>=20
> Sakari Ailus

--qCNovWBlHUc0Sp+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IKYwAKCRB4tDGHoIJi
0uKUAPwJ+iZVJPXHo7/4XtESXIajYoNUWJHiuCsZndzCr9009gEAvWWJzUZIFZIP
kWmg97xy34Y90j6dyJyGKOZjTPG++Qg=
=oWD8
-----END PGP SIGNATURE-----

--qCNovWBlHUc0Sp+m--

