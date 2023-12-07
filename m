Return-Path: <linux-media+bounces-1898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE18808E6D
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 18:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA81D1C20A13
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 17:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EF748CDD;
	Thu,  7 Dec 2023 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uryj+pFN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745B45978;
	Thu,  7 Dec 2023 17:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AC0C433C8;
	Thu,  7 Dec 2023 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701969328;
	bh=/NZy2kf75bJHAraLx4pRXvEeYyqAAqrTseqq1t9//Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uryj+pFN/z19lqg/7cEn4xKACWxpDihfcbOk/XC7lpDOzL+WX5z5VlVKW/3cvc+s4
	 NnYm2WFY7rSGpPSslqD1J6I3Wpr1chYU20ZNrbVvFkl2993ctJ7h/psl1WiexVzUjD
	 8YGtfVufiZ5612U10APSlebah/U99YbyjvEdSPCgjfnElDbT0UYOawzzgTCkqdmJ2m
	 ET+dOj3b6u51JOd/VhhorhTNoRSjmL4GcqgEbKzGpzxePYQSnCSqCXQbtGaITrMvcA
	 hKG2dqxFyUBsO9mrBFlgazs0xmbU8WLuGrDy5M8ZlrJTb9Ehndy63JZSb5e9thcvci
	 dhCJS1KngpLuQ==
Date: Thu, 7 Dec 2023 17:15:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: ov8856: decouple lanes and link
 frequency from driver
Message-ID: <20231207-antics-tummy-5316e38477de@spud>
References: <20231207142356.100453-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OSYC6STl8ciQnFnr"
Content-Disposition: inline
In-Reply-To: <20231207142356.100453-1-krzysztof.kozlowski@linaro.org>


--OSYC6STl8ciQnFnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 03:23:56PM +0100, Krzysztof Kozlowski wrote:
> The data lanes and link frequency were set to match exiting Linux driver
> limitations, however bindings should be independent of chosen Linux
> driver support.
>=20
> Decouple these properties from the driver to match what is actually
> supported by the hardware.
>=20
> This also fixes DTS example:
>=20
>   ov8856.example.dtb: camera@10: port:endpoint:link-frequencies:0: [36000=
0000] is too short
>=20
> Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-inte=
rfaces schemas")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Changes in v2:
> 1. Rework approach: decouple bindings from driver instead of fixing
>    DTS example (Sakari)

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/media/i2c/ov8856.yaml | 21 +++++++++++--------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Do=
cumentation/devicetree/bindings/media/i2c/ov8856.yaml
> index 57f5e48fd8e0..71102a71cf81 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> @@ -67,19 +67,22 @@ properties:
> =20
>          properties:
>            data-lanes:
> -            description: |-
> -              The driver only supports four-lane operation.
> -            items:
> -              - const: 1
> -              - const: 2
> -              - const: 3
> -              - const: 4
> +            oneOf:
> +              - items:
> +                  - const: 1
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> =20
>            link-frequencies:
>              description: Frequencies listed are driver, not h/w limitati=
ons.
> -            maxItems: 2
>              items:
> -              enum: [ 360000000, 180000000 ]
> +              enum: [ 1440000000, 720000000, 360000000, 180000000 ]
> =20
>          required:
>            - link-frequencies
> --=20
> 2.34.1
>=20

--OSYC6STl8ciQnFnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXH9qwAKCRB4tDGHoIJi
0hyzAP9aNR0uAwPrTbmO+v6W10FcAGLU1UTX15VyHl6zTw/+zwD7BNYOXpLbWO6V
oavXs+cccjna3l+eCE+iR8mzZg9kRgg=
=+455
-----END PGP SIGNATURE-----

--OSYC6STl8ciQnFnr--

