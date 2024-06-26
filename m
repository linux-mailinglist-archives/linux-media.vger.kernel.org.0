Return-Path: <linux-media+bounces-14174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2940918010
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 13:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29E22B24CCE
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D3517FAB7;
	Wed, 26 Jun 2024 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeHviech"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D02AF1A;
	Wed, 26 Jun 2024 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402279; cv=none; b=s6LrIuNAmJuMJtCA+y3FA2l2UJO26cjqmE9JjUxmFSrSURWk7AwjEKvhvKy0e7oAqD1zX3tfW7y6j6vHXhGSjINsebm1+DQMuBCX5yU+H8lA4zGwH/jshZsqgbl/TDAiOjuxLalOuB/RTpqsHEgXBAw4h1EKBojIApSHMDIAQZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402279; c=relaxed/simple;
	bh=dzNm7Rn3JRCxyqhjENNnXuRr934pB7hRPY6HGqV4r1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtM6KS7b5F4um79RdiejtAu0oM5SrG6giIhmtH9DHLvznNuZRz8Cnb7SX83rlekgWAOOqpQduvHh4WL6hSQXCsLsO0eq63h8KrFc4a1UTg5iQQci2wCgsV3xk5Iz98n5iNA7aIMEPOywkwYpUaIP+oEBfmEBUCP0uaBYcRR0YUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeHviech; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130DDC2BD10;
	Wed, 26 Jun 2024 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719402279;
	bh=dzNm7Rn3JRCxyqhjENNnXuRr934pB7hRPY6HGqV4r1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeHviechy7sw3OLIO+wKjq54i3STME0WDyr/Q5w+Omo0kLJHyxyI76XLqIs/+A4lO
	 flcj5o1BMw5ycLIUpls8OdnBY7hYKeNTwwnqljSBKMUR/8uuAYwYLRTb1TlzJVV74h
	 5oWHh7CPtsN5GcKMGWYof0WTRO27hVuLLO96bP4cPAkyp3Px9tuOBuugGL6TxkHUUk
	 Ho2pYbvXd0Wjk7KdkLYqU5+foUtxIpBZsPPmYnhFfGcc76rkQb5a2J+urrkwkWZi2x
	 Fv3cnGVeZQ/GfQM2fGQGSy7YSf3KGAIO5tKYyC0dAVq3UqaxBtcdKzyI8YYqc/IQJY
	 FOvE0kU1W1NJQ==
Date: Wed, 26 Jun 2024 12:44:34 +0100
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
Subject: Re: [PATCH v4 1/5] dt-bindings: media: renesas,vin: Add Gen4 family
 fallback
Message-ID: <20240626-unnatural-ember-26ae8895c008@spud>
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
 <20240624144108.1771189-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+5WDzK+KTKIbfy3G"
Content-Disposition: inline
In-Reply-To: <20240624144108.1771189-2-niklas.soderlund+renesas@ragnatech.se>


--+5WDzK+KTKIbfy3G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 04:41:04PM +0200, Niklas S=F6derlund wrote:
> The two Gen4 SoCs released (V4H and V4M) that have a video capture
> pipeline the VIN IP are very similar.
>=20
> The datasheet for the two SoCs have small nuances around the Pre-Clip
> registers ELPrC and EPPrC in three use-cases, interlaced images,
> embedded data and RAW8 input. On V4H the values written to the registers
> are based on odd numbers while on V4M they are even numbers, values are
> based on the input image size. No board that uses these SoCs which also
> have the external peripherals to test these nuances exists. Most likely
> this is an issue in the datasheet.
>=20
> Before adding bindings for V4M add a family compatible fallback for
> Gen4. That way the driver only needs to be updated once for Gen4, and we
> still have the option to fix any problems in the driver if any testable
> differences between the two SoCs is found.
>=20
> There are already DTS files using the renesas,vin-r8a779g0 compatible
> which needs to be updated to not produce a warning for DTS checks. And
> the driver will need to kept compatible with renesas,vin-r8a779g0, but
> for new Gen4 SoCs such as V4M we can avoid this.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Same caveat here. Using the g model as a fallback is, as we already
discussed, an option too and would be less disruptive.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> * Changes since v3
> - New in v4.
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,vin.yaml
> index 5539d0f8e74d..c3ef4fde7baf 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -53,7 +53,10 @@ properties:
>                - renesas,vin-r8a77990 # R-Car E3
>                - renesas,vin-r8a77995 # R-Car D3
>                - renesas,vin-r8a779a0 # R-Car V3U
> +      - items:
> +          - enum:
>                - renesas,vin-r8a779g0 # R-Car V4H
> +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.2
>=20

--+5WDzK+KTKIbfy3G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnv/IgAKCRB4tDGHoIJi
0t7nAQDOClGCy1uCBRM4t/go/LUXp8oN5wMy4e6ytGrGno3KCwEAlYHFYRUobJ3N
IErC4mTjJM4DsZBki9s7Pg+CmGqxFQo=
=l03l
-----END PGP SIGNATURE-----

--+5WDzK+KTKIbfy3G--

