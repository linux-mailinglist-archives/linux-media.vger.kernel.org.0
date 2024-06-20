Return-Path: <linux-media+bounces-13843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7175B910AE6
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 18:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 255261F22D6D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CC81B14EC;
	Thu, 20 Jun 2024 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aq74HY/e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E71B143A;
	Thu, 20 Jun 2024 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899315; cv=none; b=fC8Cld56lMHyMQWAsL96GuNpGMgxQTTrQapffxz5K7rLIad/iUz54qjmlH4H4ICZkIzh6GpplXMJsgHZhYzqZAnOJN9qW8cWZE3WPOBo7ZJirVL/IrudnKHjsfNFQZTkXe7eUIUhtEyOxStn94K2UpFIgo+G78rXZR0x6P5ls30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899315; c=relaxed/simple;
	bh=V0ZRCVEkL9xvrdNgLyQfRm+vLHBlxj8ql16aQp+/5OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdxfNFNrs/GgFHWFQ233o6WciOkQx7ezq65/qMVj/0vGFdK8tqovhM2bcU1FjBzhB1pJT8T90S4DbZoc5LjNFIR7QGpJXD/wncWRNiD6jHMaAwATrykoH9ytsGyozWsVs1vL+je12y893BeLujga5qr5zzoPADlTsdgdlrl/kso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aq74HY/e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1166C2BD10;
	Thu, 20 Jun 2024 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899315;
	bh=V0ZRCVEkL9xvrdNgLyQfRm+vLHBlxj8ql16aQp+/5OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aq74HY/evqwGDs7XSFADEXqTYws3XqaPebwjZAD0k6cwiWKR8Gy1OynOqu51L0Q4h
	 xfh0fvcxVb+b7uZgIkZhB4609aGNiJdHdFgyoZ4L6OKgrcXNlt+XVN3Ld2aXHHGjWc
	 isk2r47WfEod6S2tsJ6jF7g/mOpnRDkRHBwLkCjbCf+LCU20DKwrOhX8CIA7GIE4Vc
	 cLh1yMoUahoqVMz+RZwk1RvrQ1XhCH9IwAiZoHBzD2uAkjWLBKbZDO57fDdPOwNjpb
	 glhmsr041yPbE69ciTuYWED3QcUAeIDi5M2bclc5FHJ/vlrJzDTMEcvqXnGHi9c8Nr
	 yOWE6F38jJYSg==
Date: Thu, 20 Jun 2024 17:01:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>, Alex Bee <knaerzche@gmail.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 3/4] media: dt-bindings: rockchip: Document RK3588
 Video Decoder bindings
Message-ID: <20240620-unsmooth-surfer-b62ed94b4a5e@spud>
References: <20240620142532.406564-1-detlev.casanova@collabora.com>
 <20240620142532.406564-4-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZhJn1SX/DkOq9GFq"
Content-Disposition: inline
In-Reply-To: <20240620142532.406564-4-detlev.casanova@collabora.com>


--ZhJn1SX/DkOq9GFq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:19:45AM -0400, Detlev Casanova wrote:
> Document the Rockchip RK3588 Video Decoder bindings.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../bindings/media/rockchip,vdec.yaml         | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 08b02ec16755..d44f6b0d2c55 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - const: rockchip,rk3399-vdec
> +      - const: rockchip,rk3588-vdec
>        - items:
>            - enum:
>                - rockchip,rk3228-vdec
> @@ -30,29 +31,56 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> +    minItems: 4
>      items:
>        - description: The Video Decoder AXI interface clock
>        - description: The Video Decoder AHB interface clock
>        - description: The Video Decoded CABAC clock
>        - description: The Video Decoder core clock
> +      - description: The Video decoder HEVC CABAC clock
> =20
>    clock-names:
> +    minItems: 4
>      items:
>        - const: axi
>        - const: ahb
>        - const: cabac
>        - const: core
> +      - const: hevc_cabac
> =20
>    assigned-clocks: true
> =20
>    assigned-clock-rates: true
> =20
> +  resets:
> +    items:
> +      - description: The Video Decoder AXI interface reset
> +      - description: The Video Decoder AHB interface reset
> +      - description: The Video Decoded CABAC reset
> +      - description: The Video Decoder core reset
> +      - description: The Video decoder HEVC CABAC reset
> +
> +  reset-names:
> +    items:
> +      - const: rst_axi
> +      - const: rst_ahb
> +      - const: rst_cabac
> +      - const: rst_core
> +      - const: rst_hevc_cabac

I should have noticed this last time, but drop the "rst_", these are all
resets. With that,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--ZhJn1SX/DkOq9GFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRSbAAKCRB4tDGHoIJi
0q7QAQDJlNfQDbzPdmJ1RausFnn0zlMVyAJTYhKDcOeA2MbIbwEAr09bKJzKA6Th
GXbZJTjRrfW0abU6ps1HhASV6DVAQAs=
=fWXH
-----END PGP SIGNATURE-----

--ZhJn1SX/DkOq9GFq--

