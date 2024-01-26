Return-Path: <linux-media+bounces-4225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F683DE5C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 17:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E875284C22
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 16:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2229D1D556;
	Fri, 26 Jan 2024 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ut8MVSe+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1201CD3A;
	Fri, 26 Jan 2024 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706285408; cv=none; b=MjbHCm/M1AvpwucCn9rfTPys3R7xhojuy/XDh+VhMbwBjB2eNZpc0FUd/W9c2UEP4+xUfdLJPJRi9Bpuyy+PTRmhKedIsMkO3W13sKQ8V3ASXsIAdBHj7GTgqLSzISjZ0JGShD1lYNfN8evuDh0GVqSvZCRwDuepMAwWLRJj7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706285408; c=relaxed/simple;
	bh=RuGe721aXOgItyEsXe/xUrOR8ZxZvSgNmsK+y5G9BUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnhhZxljHZVecD5GWnT1xeXqBtEFRi2E2O+cZxSSXIXfhoQp8egSNWoJ7vO47QNHq0Ytb68iSgQQKNtalWPGBvDX1JX1sdTyEXoh1gDx0MJzxsxRhdNqllwDOv5BdUGXvvdsMMAximVro0m20q6EMCHrLm3u/q8J0df4xGVOuiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ut8MVSe+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAF2C433C7;
	Fri, 26 Jan 2024 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706285407;
	bh=RuGe721aXOgItyEsXe/xUrOR8ZxZvSgNmsK+y5G9BUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ut8MVSe+jtKdSuxh4/aKm3Rl6XOZYAy3WyVpeLa3+zmrq4TBerSFex539spWsuq4F
	 yKg+S1viQCOLzWl+avm1l/qPjayBNVYGNg1KbGPLjKPeZTKDLlInVMKf3qimKzz94I
	 yLP1F1wJSqm0CASQev3LzRtT6Bv38GOj6A8xfKI3KrkI7NsL5xqyTnYe3bb1zj1qPt
	 oizoXreFUfIWQ7Y8LOPU08jt0LJl+b8y56xa6ni3KeFQxSEdmNOI+eEZavORaZSIXS
	 jFl1Mo3FLG1yVBCj7R9XquxjrKlofOcCik3ZztnurFwDzncHXjW8fY8wAePN/azjbR
	 eYB4ZvNf7SbsA==
Date: Fri, 26 Jan 2024 16:10:03 +0000
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
Subject: Re: [PATCH v2 2/5] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
Message-ID: <20240126-joystick-dividers-b319ba5e1cda@spud>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
 <20240126133116.121981-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="datV++l/1YXNpvxC"
Content-Disposition: inline
In-Reply-To: <20240126133116.121981-3-biju.das.jz@bp.renesas.com>


--datV++l/1YXNpvxC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 01:31:13PM +0000, Biju Das wrote:
> Document the CRU IP found in Renesas RZ/G2UL SoC.
>=20
> The CRU block on the RZ/G2UL SoC is identical to one found on the
> RZ/G2L SoC, but it does not support parallel input.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> v1->v2:
>  * Dropped the description from if/else block.
>  * Dropped driver reference from commit description.
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++++++++++---
>  1 file changed, 31 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.ya=
ml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> index 1e72b8808d24..bc1245127025 100644
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
> @@ -102,6 +99,36 @@ required:
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

--datV++l/1YXNpvxC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbPZWwAKCRB4tDGHoIJi
0rkOAQDgBl8yHHmgw/w0hEoSq68i0daBar9ofdJlimlGDCIcjAD/YmgzbXPfn5BY
SupcEQq83CHWwKPi5x6hymC2XkW02QQ=
=AZZL
-----END PGP SIGNATURE-----

--datV++l/1YXNpvxC--

