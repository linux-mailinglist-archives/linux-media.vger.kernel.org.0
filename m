Return-Path: <linux-media+bounces-4162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0783B072
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 18:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1337A1F20FFF
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 17:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9810B12AACB;
	Wed, 24 Jan 2024 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzSkNGeP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028B312A173;
	Wed, 24 Jan 2024 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706118573; cv=none; b=Lo4jq8h28h+G8FcnI0yiYrqRJnwbT3jzmg4NfR1YhTUVV46RV+1EI6Xa6yU4x7wwWhtc/zHdyXo6gJpOTm+HxUKSfl/eys/oJjJ4XVFLrCBT5iJuswLHPUQbdjrso0yHlk9256Ezy+7szEqKOBmfWK7DMlPKaxPmqkAVTmRql1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706118573; c=relaxed/simple;
	bh=T9pdvz/+Zv3/YdkeXQ+6rQsSCTZF8dSU2NutiU7+7N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY4MOPaLIx15S4GL2jyv6LlfN7ZVq9IaMNNW43xdH+pIFUuPz30r+Vmrt9b2tYUmTmHhkME/DCLkPErk4maIa9hfvFGYHvF4x92/H3aXEpvIR0TS+fnCK+1bIuCrSLq/8vWd3ZFpYUTy6VwIKXA/wu/R80H0PMhNEn+Cb2YpapQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzSkNGeP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8F0C433F1;
	Wed, 24 Jan 2024 17:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706118572;
	bh=T9pdvz/+Zv3/YdkeXQ+6rQsSCTZF8dSU2NutiU7+7N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzSkNGePQ87lQNv8DqSSUZUFxvu8jJ2XCBCaG0PLzAGzru/MUU2cWufvxZOpqNhhr
	 aAkmgWArsGP/DvUsSzI8HFWr4FbV2ZvVKOS/T0AoeSPXm/PJB63DMFuW+s1IbePrcI
	 IDEleEiOLUNajkomox4bqvcQO/9LLQ5x+uk/YhJYiDUTg6w9XjNvLvmCXvOuey3+zj
	 RQKtSf1A1QOcRWNLSqiAqI7WPtygROJYijC0JEhUbpCH/6LbTORKfH0VdJ3sBHL7XZ
	 BGU8o4Od5Q6E3FvPFE3IqaBBsbWkGeC+jqnz74BC4UKTVhW6Kdm8/yyhpWHeMaPMTQ
	 r5VkDPMktmO1Q==
Date: Wed, 24 Jan 2024 17:49:27 +0000
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
Subject: Re: [PATCH 1/5] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G2UL CSI-2 block
Message-ID: <20240124-financial-unfiled-2a5485fea2d4@spud>
References: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
 <20240123121720.294753-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZCLRJZum0B0YomyW"
Content-Disposition: inline
In-Reply-To: <20240123121720.294753-2-biju.das.jz@bp.renesas.com>


--ZCLRJZum0B0YomyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 12:17:16PM +0000, Biju Das wrote:
> Document the CSI-2 block which is part of CRU found in Renesas RZ/G2UL
> SoC.
>=20
> The CSI-2 block on the RZ/G2UL SoC is identical to one found on the
> RZ/G2L SoC.
>=20

> No driver changes are required as generic compatible string
> "renesas,rzg2l-csi2" will be used as a fallback on RZ/G2UL SoC.

Not super relevant to the bindings commit tbh.

>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.y=
aml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> index 67eea2ac1d22..7faa12fecd5b 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r9a07g043-csi2       # RZ/G2UL
>            - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
>            - renesas,r9a07g054-csi2       # RZ/V2L
>        - const: renesas,rzg2l-csi2
> --=20
> 2.25.1
>=20

--ZCLRJZum0B0YomyW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbFNpwAKCRB4tDGHoIJi
0vHmAQCXIglZMxvi5YkG5v6cJJk25OctH2NC+RGKvvCbyLHSxgD/atoSI6Rq+84l
CsOIatQn5YMH2z87uzeFVUaI7IbGEAQ=
=5oCH
-----END PGP SIGNATURE-----

--ZCLRJZum0B0YomyW--

