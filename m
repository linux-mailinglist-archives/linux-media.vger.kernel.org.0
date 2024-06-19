Return-Path: <linux-media+bounces-13749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E64390F527
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 19:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD6D1F21F69
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046CF15252E;
	Wed, 19 Jun 2024 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/PeXlYG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4547779;
	Wed, 19 Jun 2024 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718818421; cv=none; b=LSJVHC/qSbexOwnzHNLyAJz5cv2gsR+sHuWeyW6hpMtK3IPAT4TKC/U5LFtEb2C7HUIBbE0JtTqwjucBc3KCNtOH5+zyZLlCFrysgdjBiBIVudFqLEiJ/jufmLlphHzo/B7kE8aDwfKt8aFSjjXDlnD9xrolULuCnzKtYKXvJpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718818421; c=relaxed/simple;
	bh=jBQbrbECAxZQb03o9hjYR2DC5XcpH4RFuYhnr8rFRXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAHqlTs55iRZKRwIxOXwE8TNpUVox3JLE9Sancr5V2OBYQ5x01U+nBT25Whmahyq4lhvDq2ik6PL09IlfpAxW6/ogEJeRwAcA1/FIOD7i1zsPL2cYva52R03oN0FY2Kyefnxax9glClyO8BHFjptqbdKEgfVCfuj8yXZOBbuHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/PeXlYG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A0AC2BBFC;
	Wed, 19 Jun 2024 17:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818421;
	bh=jBQbrbECAxZQb03o9hjYR2DC5XcpH4RFuYhnr8rFRXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/PeXlYGKJ01rP7FrfGj/zPeeSHHYDD2Ut2a8yU0kS7JkDKgQzGdGpbmqAnYtumbE
	 pIcNPU5BKJNdTP73PeNZu0TcbIyvmDdFlp+czBvah+b0tnsbeYXFihwLsHOfpCgBFX
	 n6r+zaVJTIT/uwSOVBm2ri8p863yuLzazW9iNooZpy8e1WZGgQU63xUb+4oCG4MSTZ
	 fPWGXnGPf+s6CLTit7HKOCZQQK2gxCyIttuQlsYyiz7CxxcOk93CwdF46vgNkdBOex
	 6qgY+tHzq8gmapEgRguhHbEjDTPIxYwipIoruFsy/lEugltSBYpPlXAnI4kN6LMKWU
	 d4aLGafNRtKJA==
Date: Wed, 19 Jun 2024 18:33:37 +0100
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
Message-ID: <20240619-passage-iodine-9f944b26a30d@spud>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dWpIEbyvW2ujKmwW"
Content-Disposition: inline
In-Reply-To: <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>


--dWpIEbyvW2ujKmwW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 05:35:58PM +0200, Niklas S=F6derlund wrote:
> Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Didn't we just have a conversation about this, yet nothing has changed?
NAK. Either you need a fallback or to explain why a fallback is not
suitable _in this patch_.

Thanks,
Conor.

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
> 2.45.2
>=20

--dWpIEbyvW2ujKmwW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMWcAAKCRB4tDGHoIJi
0s6XAP4s/yplPNpynA5D4eo3i0F1REW7NdZrUp19y6lcOKGvSgEA4C54jB1wmtKO
mRenRWDwEyTonhBlh3nesRdn42gXgwk=
=N6UY
-----END PGP SIGNATURE-----

--dWpIEbyvW2ujKmwW--

