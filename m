Return-Path: <linux-media+bounces-26021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D39A3140B
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 19:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20F797A3337
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 18:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB2B2512C7;
	Tue, 11 Feb 2025 18:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcZ6MW66"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1DD1E3DFD;
	Tue, 11 Feb 2025 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298335; cv=none; b=RmuLLWYLhVJm7ksC5qYWhqel6hwpmorDrDLIDbYUoOOxPI+GA3AjKavSnVdr80ETF9Bt2jZ2SQUk8x1q2l7F1VnEH1wS4gId+TehD+6jgOdxbOV0RfwZknC5pIPFep8xbKi2m9BKyVvjD5RohwRPctMXlp3ULoY2LhwA7E1CiX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298335; c=relaxed/simple;
	bh=m2wqFcz+v1UAQgc1YqCV1MB5c8CjM8VI4vZEBEicwuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG1yywoG2F8rgm2I5c6tkg/4D6PldxpJseGBNqVqynhTnYRRcJ5N8w3mug0RYMlZmGEkejTxJzWui5hD0ZsqkhKfHiMohPEudxxUeV9hJWNDNyM+Ffi78FrpWbPKJypRAam3GPk4JvcgMnFQ0yro2AMFl09fzVLvODXIAuF1iTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcZ6MW66; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4FDC4CEDD;
	Tue, 11 Feb 2025 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739298334;
	bh=m2wqFcz+v1UAQgc1YqCV1MB5c8CjM8VI4vZEBEicwuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcZ6MW66T4mSGkn1IwJAlhhTn3L0yjP+6Z7DRxfw3s4YqIlseachoNLve9XqrtKST
	 O7kakKZ94Sd2Yu78QMBC3Dr/WdRoJ2so2S1L41JELSj/ACMf/mxOI+bHnylY1jVKcc
	 dMsuMXlnGRzwoWfJoZi1/TrpfhzmANqViCcdJIzbF6JggwgSSxJK+oEL00vmrdL5KS
	 RSieRcUqvmt7CZ1wVrCkKeRR63k36qyRQ1krBypUtiXLRZXTfTWGxHfDHARbLFjQgS
	 9heWZK/oLn9k+37SuiRtcCnmN6i6/DQvs1xS+yOr2Wvwj9Nc0R2FUl627260njtMvP
	 UzFpNQsC+PHyw==
Date: Tue, 11 Feb 2025 18:25:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: media: st,stmipid02: correct
 lane-polarities maxItems
Message-ID: <20250211-labrador-spotter-27df2d2bbe02@spud>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
 <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hFoqtL9VL6EAg4Q/"
Content-Disposition: inline
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>


--hFoqtL9VL6EAg4Q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:04:31AM +0100, Alain Volmat wrote:
> The MIPID02 can use up to 2 data lanes which leads to having a maximum
> item number of 3 for the lane-polarities since this also contains the
> clock lane.
>=20
> CC: stable@vger.kernel.org
> Fixes: c2741cbe7f8a ("dt-bindings: media: st,stmipid02: Convert the text =
bindings to YAML")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.ya=
ml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> index b68141264c0e9fe0e530ce3b06fa3434fa712b38..4d40e75b4e1efff673647dff7=
bf984c89abca4cf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> @@ -71,7 +71,7 @@ properties:
>                  description:
>                    Any lane can be inverted or not.
>                  minItems: 1
> -                maxItems: 2
> +                maxItems: 3
> =20
>              required:
>                - data-lanes
>=20
> --=20
> 2.34.1
>=20

--hFoqtL9VL6EAg4Q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uWGAAKCRB4tDGHoIJi
0vx+AP42lFkGgFbVvjv8uVhpy2pgbgrr0qVFB5kRBVK83SQAOQEA+V9bGwFArr3m
dzI4HLmfDst/Jxk9UYibYgg4vtsczA0=
=Rwgi
-----END PGP SIGNATURE-----

--hFoqtL9VL6EAg4Q/--

