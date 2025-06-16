Return-Path: <linux-media+bounces-34957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A6ADB514
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3576B171025
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6461DB958;
	Mon, 16 Jun 2025 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qt6DkzSv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDDC220F54;
	Mon, 16 Jun 2025 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086907; cv=none; b=dyN0wtc3WOVLTlH60wSHz90v3QIZy/8+sLm27OmAsmT/PBCfUrPDCs+TttPf1iH4TQ0WnGOvhW/mbr7bAPAhwRNVf8w857MnisrKt7JVZtG8twt4FlnYtuklSgwa8ilEJQKknFhn4xRAg2sIf1uO1T5A+wsg1r97n5QzZ2u50kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086907; c=relaxed/simple;
	bh=S01e6i/248142ZN8T1QwXvUAAnTI2Pm0YebVCw7eric=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7WudD/DPZ7SDXv8ZysOpgycpHiJgznTACNlTi7I7Z6r36MrDjX/B6NVQ++eDIY/WfdNCRb1l9giNj9ii24IwRV+2bb+CM437pOM0medcLqfKIc/2ittd38rAXtH2m+pJS17xiBlk+5aTqcgBeT6IZhwovtLm4A9Bvqe5EJlfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qt6DkzSv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CD0C4CEEA;
	Mon, 16 Jun 2025 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750086907;
	bh=S01e6i/248142ZN8T1QwXvUAAnTI2Pm0YebVCw7eric=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qt6DkzSvMTZ2pDGD6PCVS11LpUE02bgSxx6mN5V/nvlZgNsarKHguqkC4KcmcE2q2
	 dXMo1u9wvwAGu4LZt0pJq20fIykloL6HNR1DK0fB2xERYlirsiknDHLcCQ1J3+vfUm
	 NQBZpdOjWkZjT36MsYxXlvCTvETWKTlvpTL8caXCtAN9GS1oNxM9trTaEexaHjWjTC
	 V0uu9MNA+hJhTMnOtlaoXyHOZK/aTrmB+92CjX/VNw1W9iiYEU8y3rQQCCG8IImhg0
	 XFg3D8f7LE3Jn32Ek3OG/y9wcJtKOld5QF7frs2hYx6MbJp8QZFDq7HQNFI74c4cmQ
	 n5L7gejiKda7w==
Date: Mon, 16 Jun 2025 16:15:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Verisilicon
Message-ID: <20250616-cold-dingy-7a3112a52273@spud>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8nOZplPpgsff+FjY"
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-2-benjamin.gaignard@collabora.com>


--8nOZplPpgsff+FjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 04:55:49PM +0200, Benjamin Gaignard wrote:
> Verisilicon Microelectronics is a company based in Shanghai, China,
> developping hardware blocks for SoC.
>=20
> https://verisilicon.com/
>=20
> Add their name to the list of vendors.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 5d2a7a8d3ac6..1baf8304c9ac 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1635,6 +1635,8 @@ patternProperties:
>      description: Variscite Ltd.
>    "^vdl,.*":
>      description: Van der Laan b.v.
> +  "^verisilicon,.*":
> +    description: VeriSilicon Microelectronics
>    "^vertexcom,.*":
>      description: Vertexcom Technologies, Inc.
>    "^via,.*":
> --=20
> 2.43.0
>=20

--8nOZplPpgsff+FjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFA09QAKCRB4tDGHoIJi
0ghsAP0R8V9T4k3Bxyhe/X3aEh32l4IHKw5Cn9bsimUNs+RG8AEAg2TMoYlnM6jW
L6gXbFxHvE9paMA6qFOLCYdHw86GVAo=
=Lgt1
-----END PGP SIGNATURE-----

--8nOZplPpgsff+FjY--

