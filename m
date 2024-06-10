Return-Path: <linux-media+bounces-12892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A9902AA1
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E88C6283B96
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 21:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5253C5B69E;
	Mon, 10 Jun 2024 21:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCn4DE7P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE16F303;
	Mon, 10 Jun 2024 21:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718055153; cv=none; b=G5zAckwIWR2isANNwal93k1A3+6PwbFxFV15nBxOl2+J2ZVfkHj3bkuybfeBumaOEmmOTtEoB4QLH8V+8GeCLPnpiJ6Z1iJtIfCmXv+w0T+bfdmxWhWEla5/uvDeIpcmeDIi6TxQionm7x++eCyVINuZqSXjyae+9KeoIN/dlpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718055153; c=relaxed/simple;
	bh=vKDG0Hj2x02NzRvs1P4c8KxG47eguF+5FL0Qoh+qR2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV2drmsdBC9UYly+O1oY2MDFWTr0Pw00iLgoND+FIMv8nMYYwksnIiXcJBsiZ7oz4IIPzIrrZWDqYY7tCejBUnTUmPvG2TKmhcbMZYYJ7KMUBA3Vkm2Fpz1fkIYYpjCEIf3NwQH71dv+mV/7Ds/Kz7NDWHDzpvz2W9GD0MeHQsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCn4DE7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B703C2BBFC;
	Mon, 10 Jun 2024 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718055153;
	bh=vKDG0Hj2x02NzRvs1P4c8KxG47eguF+5FL0Qoh+qR2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCn4DE7PNPTS2IAfFi5MwSVUmdQBiOhs2hiopg6LfVfS0blPdi+jqX0upo34jyU9j
	 Wp5hInakTmnxnz/zdGz+A5L9jOtrxq2DGg40nQKl2eDc6eLrj/3jHdrHVKAgE2RJ6R
	 e344X1aJrCC+y5uGdiJIm11o9UDYKpk+joaiIBqTfriCmcajZbWKQbxJI1RVgvdh+i
	 nzodtzxe45gvVXBnvzSNtjVOSLneVqHO9iMcueOIr4oA7FKC39t3wpQm83ElkZOfDn
	 pZfVdXZcqiRC2dJNpgechhei8g/axwSygwh88BZoI3DGQ1BTNx5hLAF2F9Q2XQ5RIW
	 ldn96VSawyX1w==
Date: Mon, 10 Jun 2024 22:32:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240610-yoga-antler-e6447592de16@spud>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
 <20240610-screen-wolverine-78370c66d40f@spud>
 <20240610165935.GA382677@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rp2D1YW89B4IOca+"
Content-Disposition: inline
In-Reply-To: <20240610165935.GA382677@ragnatech.se>


--rp2D1YW89B4IOca+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 06:59:35PM +0200, Niklas S=F6derlund wrote:
> Hi Conor,
>=20
> Thanks for your feedback.
>=20
> On 2024-06-10 17:03:49 +0100, Conor Dooley wrote:
> > On Mon, Jun 10, 2024 at 01:31:23PM +0200, Niklas S=F6derlund wrote:
> > > Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> > >=20
> > > Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
=2Ese>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml=
 b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > index 5539d0f8e74d..168cb02f8abe 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > @@ -54,6 +54,7 @@ properties:
> > >                - renesas,vin-r8a77995 # R-Car D3
> > >                - renesas,vin-r8a779a0 # R-Car V3U
> > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > +              - renesas,vin-r8a779h0 # R-Car V4M
> >=20
> > Your driver patch suggests that this is compatible with the g variant.
>=20
> Currently it is. But that not always be true, I tried to outline this in=
=20
> to cover letter.

To be honest, I don't usually read cover letters when reviewing bindings.
Information about why things are/are not compatible should be in a
commit itself.

>     The V4M capture pipeline is similar to the other Gen4 SoC supported
>     upstream already V4H. Currently all futures supported for VIN on V4M =
are
>     also supported by V4H and the driver code can be shared. But as done =
for
>     other R-Car IP bindings a new dedicated binding for V4M is created.
>     This have proved prudent in the past where quirks are found even with=
in
>     the same generation as more advance use-cases are enabled.

I don't understand how this precludes using the g variant as a fallback
compatible. I'm not suggesting that you don't add a specific one for the
h variant.

Thanks,
Conor.

--rp2D1YW89B4IOca+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmdw7QAKCRB4tDGHoIJi
0mF2AQDHZgiGMIhr2JtZTtPBM+AL2RVAYfqjFXSJ/epzN0s9XQD9GgrZHFSXIvTs
CCLf1XlIfs4zoqQIgVW+IBDUeeUj/wg=
=3rF3
-----END PGP SIGNATURE-----

--rp2D1YW89B4IOca+--

