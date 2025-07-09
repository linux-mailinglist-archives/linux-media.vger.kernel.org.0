Return-Path: <linux-media+bounces-37175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B43AFE140
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 09:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D90177928
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 07:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1C92701CA;
	Wed,  9 Jul 2025 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArGgHdYC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9626B778;
	Wed,  9 Jul 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045986; cv=none; b=k4l8bbcvcUwA+C4fm7PYijkChewD2OeCeGGTAac4WZIuaGRflLPvfaAEVxsMsbNzCaCgP9SwrSecNDWP94Rf5zRcoHVMvNQsEkLXo0nmpIza96DYncx/Gt+hrXkstbE963hDxR3QHzTAGh4tA2HeZdpkw5v51lExOb78fj2jeEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045986; c=relaxed/simple;
	bh=XGJO1qF1W88jDv2eYg4J5OBrEhD7F5oGqMlB4fWt0hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pcd6shxap76dYbGUwF7wY7Dpi4SseIZMa+TDorvvbOrZqPHaxVFQD/kMYIsxSFaV7wBrME1xvpnJxBIY+t/hZEZPTM5cq/MudboSwE2UoNQxTdRQqtxBAp/XUhzA8Er8x4O4zt6NdWkDEzLyRaXMALkKTR+8YNgvu9v/N1BoOoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArGgHdYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE05EC4CEF0;
	Wed,  9 Jul 2025 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752045986;
	bh=XGJO1qF1W88jDv2eYg4J5OBrEhD7F5oGqMlB4fWt0hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArGgHdYCKZHsx/nbUhRZhct5u/CYQqQXkROnnVmQgUpnfnLwDBWZl2erF0xvtbu+z
	 3IX8+1MzKkeL5/NrksE78L5M8ciRQzZjAWXcF6sdvSgtPPfKttGcUokP1Zbv/JfKP0
	 RngaMY2AK3Votb88feOEXLXj5/xxYSKmePwl4/NUBpbEDBcTxZ9bKu0zAoOr5muHLg
	 CCuVzmR7GIJIImbeN5Ki635W7gHy30bbZYEdevgkoZnsTI/o7vzM9GnXMGwk8t/+1A
	 Eo+ymv0XAJ0u46oXlN7DPQtr2erqhFq967A9PSD12h7G6yo02PbfoT5ALlMuMkLTMR
	 UcVXDNBgOOzGQ==
Date: Wed, 9 Jul 2025 09:26:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Yong Deng <yong.deng@magewell.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional
 interconnect properties
Message-ID: <20250709-misty-coot-of-fantasy-cfadfa@houat>
References: <20250704154628.3468793-1-paulk@sys-base.io>
 <20250704154628.3468793-2-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3dp6stoy65fmjbt7"
Content-Disposition: inline
In-Reply-To: <20250704154628.3468793-2-paulk@sys-base.io>


--3dp6stoy65fmjbt7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional
 interconnect properties
MIME-Version: 1.0

Hi,

On Fri, Jul 04, 2025 at 05:46:18PM +0200, Paul Kocialkowski wrote:
> An interconnect can be attached to the sun6i-a31-csi device, which is
> useful to attach the dma memory offset. Add related properties.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.=
yaml
> index 1aa5775ba2bc..978ef2dc0ae7 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -40,6 +40,12 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    const: dma-mem
> +

Is it really optional? My experience (despite being a bit outdated by
now) was that it was required for some SoCs, and missing for others.

Maxime

--3dp6stoy65fmjbt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG4ZmwAKCRAnX84Zoj2+
dpfVAX4m0wIWlJi7yTBavd5fvPfWar3XkMuz34mrDcOQKDkPGg6ob/DSG06XQSRv
JJDzvQQBfiDmcqsRoWtB2xTB/bD41pJBDgPdtqT5a0O13DZ464l3NFGDW16/98ZH
pKK5MMhi4w==
=m340
-----END PGP SIGNATURE-----

--3dp6stoy65fmjbt7--

