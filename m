Return-Path: <linux-media+bounces-5309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B48585FC
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 20:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8AA12812F9
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 19:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542B7135A65;
	Fri, 16 Feb 2024 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AugAa9GC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB0433B0;
	Fri, 16 Feb 2024 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708110483; cv=none; b=SM3g6T5L7M8OrE6+1EBF0PEd6q9aq6UA1hgi0/EUDK+yB/WcUYFz1StMuFT1UVN+P5mnjh+/0L7P7KieXEQU+Sf1TZuwVYL/FSvEXIVY0gB+gXhvWtEKGNmw2mExmJ24vOOsUOSuGlYg8AXjhD+XLkwZ3VOctDXc7XfqS15n17g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708110483; c=relaxed/simple;
	bh=japET/leIP47UNLN6OC2SEbuPJH4MNioCZrfy5PbCok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP3NDWXL3fgw17YF2DIGBOKdt+oLnYgkIq5Eb+WJfXTL5YDWnfI+iH+PT6Sai+c/RtsmrmP10IX+ZYMcmlH7QHmLsDSwoE/l+ZQdNvtFTiHfMaMFfZm0689prSNS8se0LKmtpaVYgf+s2kpZ6mFB448fV1dY+m+bc2wj3wJCwsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AugAa9GC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD61C433C7;
	Fri, 16 Feb 2024 19:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708110483;
	bh=japET/leIP47UNLN6OC2SEbuPJH4MNioCZrfy5PbCok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AugAa9GC2/T89VLJj71TRRt8u5SkQn/eFM4J3NtjVQk6RKptQjS/CbCZTPaSbWr7x
	 SpKow+1LV2NRD9NVjX5aWmmbReIDntaiqdaLxsa+/hDsJkwUlflpqvPAYApCZiNRGo
	 p6rlwPz4BdjkptjZzAjgNHVfytDMd9YxkNLL1yQCppJDL5fCCTtOCCGxMgfD0Lz01V
	 y63x4RZIZKutHrYy3I5gQUtR6idObP6mzqamD+b2yTAk3pKuEgVer312G4LwMcwGLP
	 n92rzlE0EC4M3MOoGMKz0oMNfQ1lO+bketbgMbInOUYA5pwm2QGYlTjA9S3i71wvr8
	 xqGWVeY+sgFqg==
Date: Fri, 16 Feb 2024 19:07:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240216-caboose-poison-3052a4bb9eaf@spud>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <20240214142825.GA7873@pendragon.ideasonboard.com>
 <20240214-velcro-pushy-0cbd18b23361@spud>
 <20240215110205.GD7873@pendragon.ideasonboard.com>
 <e06b0792-187d-454b-aa62-d9c1e797df17@ideasonboard.com>
 <20240216132755.GA20376@pendragon.ideasonboard.com>
 <f5e63a8b-fb6c-449f-8ec3-26aed5b11b95@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sfDhR62w4u8OGMHn"
Content-Disposition: inline
In-Reply-To: <f5e63a8b-fb6c-449f-8ec3-26aed5b11b95@ideasonboard.com>


--sfDhR62w4u8OGMHn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 02:45:31PM +0000, Dan Scally wrote:

> > > > > > > +      - description: ISP AXI clock
> > > > > > > +      - description: ISP AHB-lite clock
> > > > > > These two other clocks look good to me.
> > > > > >=20
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: vclk
> > > > > > > +      - const: aclk
> > > > > > > +      - const: hclk
> > > > > Why not "video" "axi" "ahb-lite"? There's 3 useful letters betwee=
n the
> > > > > tree clock names you've provided - they're all clocks, so having =
"clk"
> > > > > in them is just noise :)
> > > > As far as I understand, the names proposed by Dan come directly fro=
m the
> > > > IP core documentation.
> > > This is the case, but I do take Conor's point that more descriptive n=
ames might be nicer - if I'm
> > > honest I just didn't think about it particularly given "Xclk" is such=
 a common name for them
> > > already, but having been poked into thinking about it I do agree.
> > Isn't the usual practice in DT bindings is to name GPIOs, clocks and re=
set
> > signals based on the hardware documentation ?
>=20
>=20
> Ah - I don't know honestly. If that's so then yeah - these are the names =
the documentation prescribes.

If a direct doc match is what you're going for, then sure, keep it.

--sfDhR62w4u8OGMHn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc+yjgAKCRB4tDGHoIJi
0olJAQD1XeyYvq7eUU1kc3RWmEQqYgrVam7innpr+WsdCIWbVwEA0W2MtdXieAk/
YdhMBAB4FxEYyjLNPi8cV6v57dDMdA8=
=7cwN
-----END PGP SIGNATURE-----

--sfDhR62w4u8OGMHn--

