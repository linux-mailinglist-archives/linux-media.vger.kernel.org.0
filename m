Return-Path: <linux-media+bounces-12003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11758D08C2
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 949A5289646
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC6B7347E;
	Mon, 27 May 2024 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOthbMJW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77173474;
	Mon, 27 May 2024 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716827735; cv=none; b=iNE7nQ8r1827RvK0kUmL2Tn5/Mnt5BDNiJRgqukDyS/0F25QJGrclk2RSiNL073d39hZdovKnLqLJquI/zb9tv+i7IvOrE5ZQFRpi5TEDvBkGWRXdgki8YC4h9wDBw6rpweFi/15mDOhJ8iqo/+vNPtdVPNT6H/z8S/z+4W58Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716827735; c=relaxed/simple;
	bh=t2vPzI1PKumTQZg4X9Tb5UYqtmDPnozYgV2LwA4D4vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JF4pzUiRc2uk0qXi+z9kb3cTECbpEUZmGaM3IsJ+cFKKsrU8v8lD6B21ul8+JtLHfCQfXk7K5RJ9N8tUSgQlS1eWiCB/axXOr/YijROIcIcnNnSHpS2nnyiQBZy/aWHeIhaeIb9ikiCqyxUVASGK8Ze/NQFHcAQr04FlDDI9dFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOthbMJW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E3DC2BBFC;
	Mon, 27 May 2024 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716827735;
	bh=t2vPzI1PKumTQZg4X9Tb5UYqtmDPnozYgV2LwA4D4vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOthbMJWWqS2mDdQuqguvwsq366v9fKTYGQ4YNPPnilf+kZLPi4dfWkkoS9DBzfV7
	 1Pqj+yAQaiVdpTOQ2E5w8bzRORC+d+W9PgpLDq+syjJGBTWvtdaA4DloXuNLiqahWk
	 qQmOGtRxmZfxueakEqDwTc7lowX1OGb9VJaMLNmktrAoX+Ie+gOlqQS6GG5pAViP4v
	 8EPNCl0YRoMyDLW72sNLKrEKJDZLlswlvgqptnieblypqFOwHNigYlpbXNbKngiKlp
	 BBreqKYQ4aQWs7l0jOdQzn29Y/GRe446UzzhciTobzQ8Z8L3z6q07/kiimwixyghk0
	 Z2V/JY8HP6boQ==
Date: Mon, 27 May 2024 17:35:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,csi2: Add binding for V4M
Message-ID: <20240527-sip-retention-43e2a16a7a41@spud>
References: <20240527132046.1680595-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x8YAXeBb7nud+2Ex"
Content-Disposition: inline
In-Reply-To: <20240527132046.1680595-1-niklas.soderlund+renesas@ragnatech.se>


--x8YAXeBb7nud+2Ex
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 03:20:46PM +0200, Niklas S=F6derlund wrote:
> Document support for the CSI-2 module in the Renesas V4M (r8a779h0) SoC.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Another one not in a series, this should be with:
https://lore.kernel.org/all/20240527133221.1688830-8-niklas.soderlund+renes=
as@ragnatech.se/
Why isn't it?
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Send it with the driver next time,
Conor.

> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/=
Documentation/devicetree/bindings/media/renesas,csi2.yaml
> index 977ab188d654..80b77875874d 100644
> --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> @@ -32,6 +32,7 @@ properties:
>            - renesas,r8a77990-csi2 # R-Car E3
>            - renesas,r8a779a0-csi2 # R-Car V3U
>            - renesas,r8a779g0-csi2 # R-Car V4H
> +          - renesas,r8a779h0-csi2 # R-Car V4M
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.1
>=20

--x8YAXeBb7nud+2Ex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlS2UwAKCRB4tDGHoIJi
0o7dAPwIm/LVpHCub3hWPWSb6X50dqkbE4NZIaEA0foezkZyigD/Y4HdMRt8Ckuu
zcSV7KZ8l8VYzcGAB+2s6T+PWfwc8gQ=
=nd3V
-----END PGP SIGNATURE-----

--x8YAXeBb7nud+2Ex--

