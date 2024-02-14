Return-Path: <linux-media+bounces-5166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D909B855072
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 18:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1604B1C21131
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 17:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3837E11F;
	Wed, 14 Feb 2024 17:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+LwPgyI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F55579B;
	Wed, 14 Feb 2024 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707932242; cv=none; b=BHrRmrSQkSaCFaejBoLJSbO7joAxUVllmsQ2kFCDDlzL9foVpiNPloCArkLLhkZaSC87+F+V4eFR9Fol5j9nBb7P4g5G+L2bHAX8jZvOaHkqEOlOQj+xEW3EXJ0RTdMI+4rmAeYtyt86yl72sCQj7/0AApPQsYe84T8Jpn6kNoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707932242; c=relaxed/simple;
	bh=ek0NtWmXn+TPNiS8vFBud6b8Ud2vwDMcMY53ZCY+JtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q67Q5q0WmjIkOLqVbWaaNoM6Mv7/UiruLPTI68fJjHigrjm5V6ZcBmv2r4iOJ8M9u3OeIMuKwFON8b79sP/CjzEdYKnGis4XpjZBIrvuhfZkvW2dhyWsG6skSz31rneWoSJ6WUoCodAoWHS3USJgunUjDjO0HQA65RnM7dPgl8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+LwPgyI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4215EC433C7;
	Wed, 14 Feb 2024 17:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707932241;
	bh=ek0NtWmXn+TPNiS8vFBud6b8Ud2vwDMcMY53ZCY+JtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+LwPgyIF84VQbj5U8WQ+0p7pORiBON/e13af5EX5X7Kn0Pt9QWqdSovyNxFILQWK
	 U9ITu+xJiXrz5c0ZeNeTcx/mxJvD7pvy+xa0NkE+9w4NFX9TMtPrH5fM9eaStrHcAy
	 KcTLqGw2jSbhQGt1Ffukl9WrwMjT69hNeLzhwjsmH8jL/kopEgTM0NKjZTvzr56e6/
	 d70KfOke0axc7ffOtRboRbA8935VXmWEnJzSukRXW9hV0+lnVhpB0PnpCVx59ISIwK
	 DRT4alC+YWwSTAQ/tylUdm4UZTWhjh/fgwNpJv3HUEeorDJOq3YUFhsdfuniDGUBva
	 nZ4GHIYvu8rIw==
Date: Wed, 14 Feb 2024 17:37:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240214-velcro-pushy-0cbd18b23361@spud>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <20240214142825.GA7873@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O6sj7yKlLqG4SpJ7"
Content-Disposition: inline
In-Reply-To: <20240214142825.GA7873@pendragon.ideasonboard.com>


--O6sj7yKlLqG4SpJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 04:28:25PM +0200, Laurent Pinchart wrote:
> Hi Dan,
>=20
> Thank you for the patch.
>=20
> On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
> > Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> >=20
> > Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v2:
> >=20
> > 	- Added clocks information
> > 	- Fixed the warnings raised by Rob
> >=20
> >  .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c5=
5.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml =
b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > new file mode 100644
> > index 000000000000..30038cfec3a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Mali-C55 Image Signal Processor
> > +
> > +maintainers:
> > +  - Daniel Scally <dan.scally@ideasonboard.com>
> > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: arm,mali-c55
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: ISP video clock
>=20
> I wonder if we need this clock. Granted, it's an input clock to the ISP,
> but it's part of the input video bus. I don't expect anyone would ever
> need to control it manually, it should be provided by the video source
> automatically.

I'd say that if there's a clock controller providing this clock, even if
it is implicit in the video feed it's good to have here. Being able to
increment the refcount on that clock would be good, even if you don't
actually control it manually?

>=20
> > +      - description: ISP AXI clock
> > +      - description: ISP AHB-lite clock
>=20
> These two other clocks look good to me.
>=20
> > +
> > +  clock-names:
> > +    items:
> > +      - const: vclk
> > +      - const: aclk
> > +      - const: hclk

Why not "video" "axi" "ahb-lite"? There's 3 useful letters between the
tree clock names you've provided - they're all clocks, so having "clk"
in them is just noise :)

Cheers,
Conor.

--O6sj7yKlLqG4SpJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcz6TAAKCRB4tDGHoIJi
0qn4AQCdJgBnLTSQ8gusKx8Zo7Jon05mtC/gi+jhKni5OcXmEgD+LLunh7p+YkjY
0u9tdxfmxPW4Wa7dkDdQSr7iSDDlUwY=
=B5rx
-----END PGP SIGNATURE-----

--O6sj7yKlLqG4SpJ7--

