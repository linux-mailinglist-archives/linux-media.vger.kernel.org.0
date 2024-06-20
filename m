Return-Path: <linux-media+bounces-13848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F709910CFA
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 18:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA10A289067
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9BA1B3739;
	Thu, 20 Jun 2024 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxsJiyep"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DA1B29C8;
	Thu, 20 Jun 2024 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900826; cv=none; b=VTdmXWhFpYUNDIVB/s5nQhNiIAYtI4HNMOnSla9RcYKSpmpzbaKfBRM6iYhOP1XLhLyjXHo1EwsD23lMxrK98WM9eDqsf+L46SvIDJ4O4KPhdz1i1e6Q0uVbF+XuzNxWRUY3xrmg4n4NEetvhtL2t784ubW6Ye24Szha9dovRuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900826; c=relaxed/simple;
	bh=KnOXbvU8KZ4215R34n+QAMLx/UGXjos+Ob1U2qvJudE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSSsWtvaRVM00Fs3dHxClcP29q8HURQ/Vr+2t9qMWInB++7qgXE6SuxaAazPiYf+qqv1xbr2qq0BCpw5XpHhQcA2n6dVz+E2dYRjC15JWenszayCknE4oDdlR72zHZKwH40IAy5SjXmBHi4iv5m5y8otulqQqzDiE1N13XhvTSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxsJiyep; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF84C2BD10;
	Thu, 20 Jun 2024 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900825;
	bh=KnOXbvU8KZ4215R34n+QAMLx/UGXjos+Ob1U2qvJudE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxsJiyepgezG1tUMpU4h3FbKi6Gxia9Ktnt7RIp5t5Z2F85K8x4ZUSMIJhV7J6Rtt
	 1YAl0vg20JwJSOH1QU0sZjCp3POU3zY0JAiJ8pOP8Fh2OiG8fZPo9I3oY8fSnfx5g8
	 jgDO5AAtjp8fawuk9hp7SJNZ+cf9o0gRds9zUrrWT/AwmWW2i/L0/efhy2+ZIzpIhs
	 OE5FxPyLSHZoROD6Ns8WpbleP5o+kibnzNnIhT2L/WxqnPXa8VrPVzQlAnQ7IgzzqL
	 uVfwZTw/yeexFkNKT8zD4dOYivzwy3Eb0xwKfMpgA/gjvzT+BxoS+2ALLENWKYqB6C
	 VGo2stX0pJaNA==
Date: Thu, 20 Jun 2024 17:27:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240620-gating-coherent-af984389b2d7@spud>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud>
 <20240619185607.GT382677@ragnatech.se>
 <20240619204321.GU382677@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rAeApIGv6bYD7fXM"
Content-Disposition: inline
In-Reply-To: <20240619204321.GU382677@ragnatech.se>


--rAeApIGv6bYD7fXM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 10:43:21PM +0200, Niklas S=F6derlund wrote:
> Hello again.
>=20
> On 2024-06-19 20:56:11 +0200, Niklas S=F6derlund wrote:
> > Hi Conor,
> >=20
> > On 2024-06-19 18:33:37 +0100, Conor Dooley wrote:
> > > On Wed, Jun 19, 2024 at 05:35:58PM +0200, Niklas S=F6derlund wrote:
> > > > Document support for the VIN module in the Renesas V4M (r8a779h0) S=
oC.
> > > >=20
> > > > Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnate=
ch.se>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >=20
> > > Didn't we just have a conversation about this, yet nothing has change=
d?
> > > NAK. Either you need a fallback or to explain why a fallback is not
> > > suitable _in this patch_.
> >=20
> > Sorry, I'm confused from the conclusion of our conversation in v2. I di=
d=20
> > add an explanation to why not fallback is used, but I added it to patch=
=20
> > 2/2 which adds the compatible to the driver.

If you're unsure at all just ask, better that than send a new version.

> >=20
> > It was my understanding that a SoC specific compatible was needed in=20
> > either case so, at lest to me, made more sens to explain why in the=20
> > driver patch the reason go into detail about the register differences=
=20
> > between the two. Sorry if I misunderstood. I can add the same=20
> > explanation to both patches, would this help explain why only a SoC=20
> > specific value is added?
> >=20
> >   The datasheet for the two SoCs have small nuances around the Pre-Clip
> >   registers ELPrC and EPPrC in three use-cases, interlaced images,
> >   embedded data and RAW8 input. On V4H the values written to the regist=
ers
> >   are based on odd numbers while on V4M they are even numbers, based on
> >   the input image size.
> >=20
> >   No board that uses these SoCs which also have the external peripherals
> >   to test these nuances exists. Most likely this is an issue in the
> >   datasheet, but to make this easy to address in the future do not add a
> >   common Gen4 fallback compatible. Instead uses SoC specific compatibles
> >   for both SoCs. This is what was done for Gen3 SoCs, which also had
> >   similar nuances in the register documentation.
>=20
> After have read thru v1 and v2 comments a few more times I think I might=
=20
> have spotted what I got wrong. If so I apologies for wasting your time=20
> reviewing this. I'm really trying to understand what I got wrong and=20
> address the review feedback.
>=20
> Is what you are asking for with a fallback something like this?
>=20
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -53,7 +53,11 @@ properties:
>                - renesas,vin-r8a77990 # R-Car E3
>                - renesas,vin-r8a77995 # R-Car D3
>                - renesas,vin-r8a779a0 # R-Car V3U
> +      - items:
> +          - enum:
>                - renesas,vin-r8a779g0 # R-Car V4H
> +              - renesas,vin-r8a779h0 # R-Car V4M
> +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
>=20
> If so I can see that working as I could still fix any issues that come=20
> from differences between V4H and V4M if needed. If so do you think it=20
> best to add this in two different patches? One to add the=20
> renesas,rcar-gen4-vin fallback (which will also need DTS updates to fix=
=20
> warnings from exciting users of V4H not listing the gen4 fallback) and=20
> one to add V4M?


I would just do:
diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Doc=
umentation/devicetree/bindings/media/renesas,vin.yaml
index 5539d0f8e74d..22bbad42fc03 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -54,6 +54,9 @@ properties:
               - renesas,vin-r8a77995 # R-Car D3
               - renesas,vin-r8a779a0 # R-Car V3U
               - renesas,vin-r8a779g0 # R-Car V4H
+      - items:
+          - const: renesas,vin-r8a779h0 # R-Car V4L2
+          - const: renesas,vin-r8a779g0 # R-Car V4H
=20
   reg:
     maxItems: 1

Which requires no driver or dts changes. That could become:
      - items:
          - enum:
              - renesas,vin-r8a779h0 # R-Car V4L2
              - renesas,vin-r8a779i0 # R-Car R4P17
          - const: renesas,vin-r8a779g0 # R-Car V4H

if there's another compatible device in the future.

> Apologies again for the confusion.

dw about it

--rAeApIGv6bYD7fXM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRYVAAKCRB4tDGHoIJi
0nJaAP4nbknEPXlFlb9tewu8DoPhP8rUH58pecFgjZaPmQaQUQEA67YiSVdkJkMf
kgcLhH6cH6DFISiEAS2REfPqdOPmZQU=
=Xp3h
-----END PGP SIGNATURE-----

--rAeApIGv6bYD7fXM--

