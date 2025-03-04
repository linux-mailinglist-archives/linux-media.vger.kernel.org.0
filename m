Return-Path: <linux-media+bounces-27506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56157A4E77A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED8B67AAE1C
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC4C27EC75;
	Tue,  4 Mar 2025 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqCDFYQe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0E1254B00;
	Tue,  4 Mar 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106380; cv=none; b=VXuY3oXGokjF4uuF+ZY4WIok7MCo3ncfBF7DrM8DY4yveKDJLCgsOUP6pvlOajfV6evhCaN5D5mcOSkh2smNd+ncKvIEEuaN/ONZyoVvEDImxg0t/SZ8Qn19TFXzaPwgxCAFWCdh9GmpwJigID6NXDa96VKife5UDa/vuY2MmWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106380; c=relaxed/simple;
	bh=GtZvw6f8Z5eNW+3bcxw3YYu0cJDMrovxZ+BIEA+TAeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZj+9msAneLFnxsmF1fp7865VaUw1Y5Hnq/greH4BSCq/t7RUQRgG9JrskaYRNL+qXryZSslTDf9Y/TRKgvRWSnXQaJg4CXQQqn6ZApejEHSS5VTkrYZdTR4+6eG6jnNTKWJ3ub5GrE7kI90F4qNDTb3n0/899K82/qa7te1dXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqCDFYQe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35771C4CEE9;
	Tue,  4 Mar 2025 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741106379;
	bh=GtZvw6f8Z5eNW+3bcxw3YYu0cJDMrovxZ+BIEA+TAeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqCDFYQe49SBsHlcGbi00NuputI544lsbO/cMWWB6pMtkLnl2yCpuxhHM5YHgHPiR
	 Fd3FZB/GfnJ+WP5iECGlIX9iGwp6nHt3R58d+18WCgAgoDLKjyg9WGm4OjCKBrJS0c
	 nSpSCIrtli8m1MIdTPM35gHnHS99qE8ttwxYaEP5R8Gv4hVp0ezoZoisV5WCBzWCUm
	 a6EZRo+p1GF++/SNU9SXYOVBAaSZ13GeKLl1XS/exRBA6r0fJ2Q0j8dhl9rG/eiePU
	 62SfJOkdTNN+Hk6DmundTzG1qPE0SRxVuljXM66XQVehOcb3Kmh6Uj7pV6zjQapG0c
	 P3Wx7mXUs9hRw==
Date: Tue, 4 Mar 2025 16:39:34 +0000
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
Message-ID: <20250304-expend-isotope-cea613f4e9d5@spud>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-3-mathis.foerst@mt.com>
 <Z8A66l02Et4J7hj4@kekkonen.localdomain>
 <20250228-helpless-delivery-42162772caa3@spud>
 <Z8boqvxEAhx7rG9Q@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dQ9D5BXcovtjIkOJ"
Content-Disposition: inline
In-Reply-To: <Z8boqvxEAhx7rG9Q@mt.com>


--dQ9D5BXcovtjIkOJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 12:48:58PM +0100, Mathis Foerst wrote:
> Hi Conor, Hi Sakari,
>=20
> On Fri, Feb 28, 2025 at 07:11:31PM +0000, Conor Dooley wrote:
> > On Thu, Feb 27, 2025 at 10:14:02AM +0000, Sakari Ailus wrote:
> > > Hi Mathis,
> > >=20
> > > On Wed, Feb 26, 2025 at 04:39:23PM +0100, Mathis Foerst wrote:
> > > > The MT9M114 supports the different slew rates (0 to 7) on the outpu=
t pads.
> > >=20
> > > "the output pads" probably means pixel data interface (DVP or CSI-2)
> > > signals in this cases? I suppose this is about clock modulation?
> > > It'd be good to say that.
>=20
> The slew rate defines the slope of the voltage flanks on the output pads =
(how fast
> the pads go from LOW to HIGH or vice versa). I tried to clarify the descr=
iption.
>=20
> > >=20
> > > > At the moment, this is hardcoded to 7 (the fastest rate).
> > > > The user might want to change this values due to EMC requirements.
> > > >=20
> > > > Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for sel=
ecting
> > > > the desired slew rate.
> > > >=20
> > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml         | 6 ++=
++++
> > > >  1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m1=
14.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > index 72e258d57186..666afe10c538 100644
> > > > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > @@ -74,6 +74,12 @@ properties:
> > > >      description: Bypass the internal PLL of the sensor to use EXTC=
LK directly as SYSCLK.
> > > >      type: boolean
> > > > =20
> > > > +  onnn,slew-rate:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > >=20
> > > No need to make this 8-bit (i.e. just use 32 bits).
>=20
> Okay, I thought 8-bit would fit the small value range [0,7]. Changed it t=
o 32 bits.
>=20
> > >=20
> > > > +    description: Slew rate ot the output pads DOUT[7:0], LINE_VALI=
D, FRAME_VALID and PIXCLK
> > >=20
> > > Please wrap at 80 characters.
> > >=20
> > > Is there more information on the effect than 7 is the fastest?
>=20
> There is no more information about the exact meaning of the values.
> As described above, the higher the value, the steeper the voltage flanks.
>=20
> > >=20
> > > > +    minimum: 0
> > > > +    maximum: 7
> > >=20
> > > Please also add a default.
>=20
> Sure, I added the default value 7 that matches the currently hardcoded=20
> value in the driver.
>=20
> >=20
> > It'd also be great (IMO) if it were given in terms of actual units, not
> > nebulous values that I assume to be the register values.
>=20
> I agree, but the documentation does not provide further details about the
> unit of the value. So using the register value is my best-effort approach.

If they don't provide em, how is anyone meant to calculate what's
correct? Trial and error?

--dQ9D5BXcovtjIkOJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8csxgAKCRB4tDGHoIJi
0mBdAQCh0+RwNviWTSOdkFgmzH6AVYCtzFNH8Vy/YBQEPCEirQEAo8Wp+QCf9P5F
XB0issuH+ym8sZdYbvhaKMOzJw3GpgU=
=vHbn
-----END PGP SIGNATURE-----

--dQ9D5BXcovtjIkOJ--

