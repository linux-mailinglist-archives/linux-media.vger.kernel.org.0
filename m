Return-Path: <linux-media+bounces-13750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ABC90F53E
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 19:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0877D1C224A3
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B8C155A5B;
	Wed, 19 Jun 2024 17:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkZWXkYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E001E87B;
	Wed, 19 Jun 2024 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718818658; cv=none; b=OdnLMCwESv+bXV4fYi1DSxaYGqgfmOB7xHNmWnIRfAsXgBZZulZH+0AR2Y4R3Mueo+L51une2+imgwtsF9hiURZnIBlMJQz56Z8iIJcCNhwFa/8t57Q+3ShB+zSxQpvZVULiLC09Fkj0wqlUHCwR6/Dp9nb53pigt7d0bmydM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718818658; c=relaxed/simple;
	bh=aTTUFWcg2KfCBZQyUcLHsG1W9EOcEhA72GIkli1rAjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/VkUSC7xKeLbHUID/9+UzhNWJx7DkaH1D62hsHI85MYiSUUhoSkfzXvDW7aY3XUHT/D0fOMFgsCw3G1qrWSotH6oIJvgpk4q8P9+Cyp+Y8RbtnGDbMgtS7ZxEnPUd5Mdr5Z04aFrRKgaWm0PpKZ2ld6mcvmqDLPF1/s7eER1nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkZWXkYJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18216C2BBFC;
	Wed, 19 Jun 2024 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818657;
	bh=aTTUFWcg2KfCBZQyUcLHsG1W9EOcEhA72GIkli1rAjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkZWXkYJ0650nk3Skne+YMQ35tM8hYlNF/QdJudkzL5FQEGh9y8n9bIx/GD8NGEnF
	 HzwuWFbOguznxmS/U05NEwW5vU1s4K+hkxKxDGRcWhukZpYfOc9m7ejAbS0wpXV4ze
	 OLTMg9cSzBIIyCbazuXgXQ0XfvoRfP+tLLSjUw0GpVk/GARc9AInzn7qi0d/NRq2JO
	 fhQCcUQng/ytMYTofKBIjReTdqceA+J7O+ywCjmksm2q3+rn+OI66AF5FJMeoQfTJb
	 TguBMxEJKYN04aUkmlhrA5b6HN4TTKwNf5UvWE9QQwVuzRbLl1tHpdAMErHzW/tUau
	 Sc7I4W4Yn+8JQ==
Date: Wed, 19 Jun 2024 18:37:31 +0100
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
Subject: Re: [PATCH v2 3/4] media: dt-bindings: rockchip: Document RK3588
 Video Decoder bindings
Message-ID: <20240619-contently-demote-769bf48d7eb6@spud>
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
 <20240619150029.59730-4-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D5HLkMsx9LZ0D828"
Content-Disposition: inline
In-Reply-To: <20240619150029.59730-4-detlev.casanova@collabora.com>


--D5HLkMsx9LZ0D828
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 10:57:20AM -0400, Detlev Casanova wrote:
> Document the Rockchip RK3588 Video Decoder bindings.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../bindings/media/rockchip,vdec.yaml         | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 08b02ec16755..22cb62faaa9b 100644
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
> +
>    power-domains:
>      maxItems: 1
> =20
>    iommus:
>      maxItems: 1
> =20
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to a reserved on-chip SRAM regions.
> +      Some SoCs, like rk3588 provide on-chip SRAM to store temporary
> +      buffers during decoding.
> +
>  required:
>    - compatible
>    - reg
> @@ -61,6 +89,24 @@ required:
>    - clock-names
>    - power-domains
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-vdec
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        clock-names:
> +          minItems: 5
> +
> +        resets:
> +          minItems: 5
> +        reset-names:
> +          minItems: 5

You need an else clause here to restrict sram, resets on the other
platforms and to cap clocks at maxItems: 4.

Thanks,
Conor.

--D5HLkMsx9LZ0D828
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMXWgAKCRB4tDGHoIJi
0unCAQC2SBHJSe0kI6JV8OXZNtLluXhS2J4UwBm+kjbN2zXMugD/Rnr/Zc9PCLvM
lEBc7CW/o9jDLrIyQYTKdCF2lJw0jwc=
=k/38
-----END PGP SIGNATURE-----

--D5HLkMsx9LZ0D828--

