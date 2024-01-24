Return-Path: <linux-media+bounces-4161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B883B06A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 18:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93D8284710
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 17:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB49C129A7C;
	Wed, 24 Jan 2024 17:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+/i4+u5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11614129A81;
	Wed, 24 Jan 2024 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706118507; cv=none; b=Apira0A5q937rJC8kjpzhy0EUFgnV8J4maPm8iKkskMzT3plYGsv53nsltL9r//D6kYOpulSIYjOxUYIvU0lSW/bHhU+bvY3Wfb13twUFg4cA1/e0DpZb1qtE4j4NCAg+cqTH53yC5nQnrjtOueX6YUl/rd8Ku7XUIbOAd4Nerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706118507; c=relaxed/simple;
	bh=BbkMScLhqVnvvC3sAZx7c3tpYphfDb02SuRYxkgf36w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXduyy9kDD39V41i21CcpWykE2cMvo/r20MXCt4Nrm0UiuFWnSgzF8UQUHR5NOonWnke9jwo2JSJrHHSkVue6MGi2sWWnQC2De3nKIuYtUXkhu33osyHOB2AJjjh4SfWCEN/Q5IFA2cat36rrknZ7a9o6eAhn3gPEj6ej/NZoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+/i4+u5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06550C433F1;
	Wed, 24 Jan 2024 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706118506;
	bh=BbkMScLhqVnvvC3sAZx7c3tpYphfDb02SuRYxkgf36w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+/i4+u5rL6l1w+R098T6f9tuMlDEJL8v8d8LeEf8QmrcEZZmiRkJd48RPC8brbDX
	 lDYhYNaTWfohVdyAuA+u17UGsFRzS4WAEozcfRRbKjCwQ3XrQAp3eTyw6IVx0kDq8n
	 EplOiSYtFQkq57oJ+KeFxDGc3ZEXgZIzD9FB78w0o4mcCVoQB5p4Xlr5AJCud93mo3
	 vvO2kwwOaBUVEWdE92LvChu5SJoMLDrhif+Ea8rt6M/4v42KFUxXKF4Cz2Dax6NJdp
	 mzCLB75G0fSHN4PEDur7qy5sHVxoc6BHycIJblH75KYwIQm/Q5jCXLyBsT0urhxt/E
	 B8npuJFnaflBA==
Date: Wed, 24 Jan 2024 17:48:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 2/5] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
Message-ID: <20240124-staging-handgrip-a95b44189566@spud>
References: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
 <20240123121720.294753-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K/AxyHRMzTGCOuyb"
Content-Disposition: inline
In-Reply-To: <20240123121720.294753-3-biju.das.jz@bp.renesas.com>


--K/AxyHRMzTGCOuyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 12:17:17PM +0000, Biju Das wrote:
> Document the CRU IP found in Renesas RZ/G2UL SoC.
>=20
> The CRU block on the RZ/G2UL SoC is identical to one found on the
> RZ/G2L SoC, but it does not support parallel input.
>=20
> No driver changes are required as generic compatible string
> "renesas,rzg2l-cru" will be used as a fallback on RZ/G2UL SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 43 +++++++++++++++++--
>  1 file changed, 39 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.ya=
ml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> index 1e72b8808d24..7015a01fc1bc 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r9a07g043-cru       # RZ/G2UL
>            - renesas,r9a07g044-cru       # RZ/G2{L,LC}
>            - renesas,r9a07g054-cru       # RZ/V2L
>        - const: renesas,rzg2l-cru
> @@ -87,10 +88,6 @@ properties:
>            Input port node, describing the Image Processing module connec=
ted to the
>            CSI-2 receiver.
> =20
> -    required:
> -      - port@0
> -      - port@1
> -
>  required:
>    - compatible
>    - reg
> @@ -102,6 +99,44 @@ required:
>    - reset-names
>    - power-domains
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a07g044-cru
> +              - renesas,r9a07g054-cru
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: Parallel input
> +            port@1:
> +              description: CSI
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a07g043-cru
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0: false
> +            port@1:
> +              description: CSI-2

The description in the existing binding says that port @ 1 is CSI-2
already - but this patch seems to imply that it is only CSI-2 for the 43
model. I don't know the media stuff all that well, but is the port
actually CSI-2 on all 3 devices?

If so, I would drop the description stuff from here and just use the
if/else stuff to restrict the ports, rather than try to re-describe
them.

Cheers,
Conor.

> +
> +          required:
> +            - port@1
> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.25.1
>=20
>=20

--K/AxyHRMzTGCOuyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbFNZQAKCRB4tDGHoIJi
0prMAP9lJcXYsfb6XVr4/2nJ5ht7SvllvIZEM5TXWH5/r056lgEAmBKevTvrdJRV
L6YJwOMgKtnV9q+eobTMB52hBIl6sQM=
=tavn
-----END PGP SIGNATURE-----

--K/AxyHRMzTGCOuyb--

