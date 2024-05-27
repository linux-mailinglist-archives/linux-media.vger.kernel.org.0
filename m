Return-Path: <linux-media+bounces-12005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A148D08E3
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 680C8B26F59
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56708155C9D;
	Mon, 27 May 2024 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6M409X/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B609B61FDB;
	Mon, 27 May 2024 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716827846; cv=none; b=aLcP55dmQ6rOExIrmr6gZyK9P1W8o5Fj9dq/xY3RG7acugt2zl9SUd8WULcdtIswHL+q7JOZbbwCADBLcgKiTNECEV8E6RnaYyhAvgip8qy9p2iQPLocNsNTExxek6yyAm/KcPl3QALhSwB0J6YOoaSWYeWwwYAIB0+iSwn+Jcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716827846; c=relaxed/simple;
	bh=BjoUZstgL9cvzIbmFkn2AsuRLPgppqLofiy4CT1CceE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSU6sIc2NvrQ9XZ5BSrLFyJTs7RsVEb2RFDIPMs0YxHwdPaesgxBgVe+XV6WIkN2MNPWQmQK/cOtOhH+ey0mYD5YDfNERLgyl35UcpIH5ENztroN+Vodw3MQf5OZrlA5elB0FQuJOvuVw3CdsIv7fORRnHAiclnO5GrmnC/tags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6M409X/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5B4C2BBFC;
	Mon, 27 May 2024 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716827845;
	bh=BjoUZstgL9cvzIbmFkn2AsuRLPgppqLofiy4CT1CceE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6M409X/dhwmjcQQXMUMdrnigSm0LER5SC+tiv3XeOm3er4G4qZTk0/buOXlf5E6T
	 lp31eSd2ZWMZzfE2FmQJyG5PSwmip/jIwH5+iQNB5CAZqoAgx1FFNmtQ1s6VlPFhUl
	 iodRcR+MB7k/7x7JY+fMJX/YPeKrShQ5FKCbSivEdlKp+Ak+WTSOnmaO8txJQrvWJv
	 LUWEvTfU25kS9Qy5oRkXl9Od/qygUzBSRqtOgNnOdsBqCsTH3J3lSo18WdPayAWAGL
	 Kcat7Jqb9tj97zW2CBuSGWrVwgjS3zaIQtxXBR/zxPg+Sb4ZQ30m3zl2DhRZAgJfyi
	 UBiWz9RUVP5aQ==
Date: Mon, 27 May 2024 17:37:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Add binding for V4M
Message-ID: <20240527-replica-mace-2306a85ad5d7@spud>
References: <20240527131849.1678877-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Av3drsAQvMamhbV6"
Content-Disposition: inline
In-Reply-To: <20240527131849.1678877-1-niklas.soderlund+renesas@ragnatech.se>


--Av3drsAQvMamhbV6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 03:18:49PM +0200, Niklas S=F6derlund wrote:
> Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.

Which is different from the other devices how?
Should be with the driver:
https://lore.kernel.org/all/20240527132429.1683547-1-niklas.soderlund+renes=
as@ragnatech.se/

Thanks,
Conor.

>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,vin.yaml
> index 5539d0f8e74d..168cb02f8abe 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -54,6 +54,7 @@ properties:
>                - renesas,vin-r8a77995 # R-Car D3
>                - renesas,vin-r8a779a0 # R-Car V3U
>                - renesas,vin-r8a779g0 # R-Car V4H
> +              - renesas,vin-r8a779h0 # R-Car V4M
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.1
>=20

--Av3drsAQvMamhbV6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlS2wQAKCRB4tDGHoIJi
0pdmAQDqkPouk1LZTTZC3F2g0NFtuLoPzDNGZkPAdhDFTGSXIAD+MwZXvy0VMpKA
IctRTkTHPEK5seAnMmjCrWCJ1GOZTAE=
=Jrbd
-----END PGP SIGNATURE-----

--Av3drsAQvMamhbV6--

