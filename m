Return-Path: <linux-media+bounces-14173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A131917FE2
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 13:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E82F91F24A98
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCB317F4FA;
	Wed, 26 Jun 2024 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWl/tb+v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE716EB49;
	Wed, 26 Jun 2024 11:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719401969; cv=none; b=CkQYmc6WTcP9AAwgDGeyWUHOnhetdaWFcNwXokkyoPgApv1p5sfT9OiRdf8D0V/EBp3iAiJ8bq50hyjQvFtW9k7ZcSRXM8vARzMYvySqMQ9KcNJRdcV1nsWd2WfyVRJRzHBp5pF0EE4FNqfTrwZbpKmrLaGMU28oRRPjzvrrhxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719401969; c=relaxed/simple;
	bh=kRkfCImJpphL61TsH/FPQu7ahWgxwiDMU+kKj3oKfq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPDFlYiOkwbrgNNnZ4xOliz8/CVvslzCpuxAWjPaTYhPGknQyLaEQmLsWEeE6aLWj+7+TOCFiAh8E5Zu9TvxitStX/JPFt9anpWfGMaQVv9jl/tYrmb/CeuE3gzUgJM2uHvapCInqRrdpf5jcFNlzu8YlYU96KfQvPB9Wy4OOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWl/tb+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28569C2BD10;
	Wed, 26 Jun 2024 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719401969;
	bh=kRkfCImJpphL61TsH/FPQu7ahWgxwiDMU+kKj3oKfq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWl/tb+vxw8Pi9z5FQkdyA+ZUUrJeTyoXu/zs68576s9PbfrwwqErNN4u6W3rv7ef
	 k4OKJintgyK7M38PRG4Y5N7nQ8HB2W9h6A81Bs+N1PkhLvOF966rMyCiWSLE0wlbLB
	 mJxEKZfISFn/UFftY8SNdg97AUeYZIhLTofLFSuF5Oo9JD0KCp880FoQyWv4VR4Vrd
	 enL9VmlSYkRW6GMOYMh7vjJVrTTtQlV7Z0U8FunQMdY1pyiQTJiKtjgY3MnkagXDrP
	 8Lcw/AyuZ53cxyW4mPqLMzQRWwqmw8NuiiJ/CWR7SyJpVQ3W6kbic5jU/LQgtsFzTq
	 culDJGANHF0Xg==
Date: Wed, 26 Jun 2024 12:39:25 +0100
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
Subject: Re: [PATCH v4 4/5] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240626-enforced-flock-965380c1c1f0@spud>
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
 <20240624144108.1771189-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PaJQpqTPGDgXp5ks"
Content-Disposition: inline
In-Reply-To: <20240624144108.1771189-5-niklas.soderlund+renesas@ragnatech.se>


--PaJQpqTPGDgXp5ks
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 04:41:07PM +0200, Niklas S=F6derlund wrote:
> Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> This device is compatible with the VIN module on the other Gen4 SoC,
> V4H.

Provided a family compatible like this actually makes sense, and is not
just being done to appease my want of a fallback:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v3
> - State in commit message that device is compatible with the other Gen4
>   device.
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,vin.yaml
> index c3ef4fde7baf..ec8a8d87dc24 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -56,6 +56,7 @@ properties:
>        - items:
>            - enum:
>                - renesas,vin-r8a779g0 # R-Car V4H
> +              - renesas,vin-r8a779h0 # R-Car V4M
>            - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> =20
>    reg:
> --=20
> 2.45.2
>=20

--PaJQpqTPGDgXp5ks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnv97AAKCRB4tDGHoIJi
0lPRAP9Vx/JmTh01rKVl3wFBQxCJ1/bTq3388l7pe4ZzEft51AEAvz1LmbYPgLUk
64CUgQfDX9vQOoJStt3cCJYPoBa/ngI=
=ilSc
-----END PGP SIGNATURE-----

--PaJQpqTPGDgXp5ks--

