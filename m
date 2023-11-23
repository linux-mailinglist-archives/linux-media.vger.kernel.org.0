Return-Path: <linux-media+bounces-934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6D7F6571
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 18:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F6AE1C20E1C
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 17:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07642405DA;
	Thu, 23 Nov 2023 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5nnDdwL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3575D3FE5B;
	Thu, 23 Nov 2023 17:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AFBC433CA;
	Thu, 23 Nov 2023 17:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700760703;
	bh=x6t0DakrfOazLqCXf+qyEeqOmEgp+z5KyR3L1q47Slg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5nnDdwLpT1dfd91tmCi8xRhIdHcFHo13nexVEoEyTjk551Kz8iUnYi0a7kz/v+5C
	 pan8dcUSFxZy567tDaTjAMsbSs1Db0sNUvMgQjlajS7xRVrC7wBNH57/Pq7nmP/xju
	 um2I5AbY5d+hs9OuO1I7fpaK7AyRp0tzxh3YZuYgd3by58qEzXbEuwmnJHIZzCLEp1
	 b80S7PwMqKOmKn2l6oabIfvQtJp64+tWn6gnGnbA6TV3EDHHiN1DsZEpb6MpBHS+jO
	 iklcSTwvSUNyEjbfp+Z+JKnQsT29XOXLf7xAkaTud6/9+CW57Op8R9UVvlDHpoOslt
	 +UJKj+Owx/s2A==
Date: Thu, 23 Nov 2023 17:31:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, 10572168@qq.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
	andy.shevchenko@gmail.com, bingbu.cao@intel.com,
	dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Document GC08A3
 bindings
Message-ID: <20231123-magical-rupture-83251807e995@spud>
References: <20231123115104.32094-1-zhi.mao@mediatek.com>
 <20231123115104.32094-2-zhi.mao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="01MH2fFNhMpUwwbA"
Content-Disposition: inline
In-Reply-To: <20231123115104.32094-2-zhi.mao@mediatek.com>


--01MH2fFNhMpUwwbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 07:51:03PM +0800, Zhi Mao wrote:
> Add YAML device tree binding for GC08A3 CMOS image sensor,=20
> and the relevant MAINTAINERS entries.
>=20
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>

Please test your bindings.

> ---
>  .../bindings/media/i2c/galaxycore,gc08a3.yaml | 128 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycor=
e,gc08a3.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a=
3.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> new file mode 100644
> index 000000000000..089ea321da91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc08a3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GalaxyCore gc08a3 1/4" 8M Pixel MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Zhi Mao <zhi.mao@mediatek.com>
> +
> +description: |-

The |- is not needed, you have no formatting to preserve.

> +  The gc08a3 is a raw image sensor with an MIPI CSI-2 image data
> +  interface and CCI (I2C compatible) control bus. The output format
> +  is raw Bayer.
> +
> +properties:
> +  compatible:
> +    const: GalaxyCore,gc08a3

Please remove the capitals.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Reference to the mclk clock.

Pointless, just use maxItems: 1.

> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: Reference to the GPIO connected to the RESETB pin. Acti=
ve low.
> +    maxItems: 1
> +

> +  vddio-supply:
> +    description: Definition of the regulator used for the VDDIO power su=
pply.
> +
> +  vdda-supply:
> +    description: Definition of the regulator used for the VDDA power sup=
ply.
> +
> +  vddd-supply:
> +    description: Definition of the regulator used for the VDDD power sup=
ply.

These descriptions can all be replaced with "foo-supply: true" IMO.

> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

> +  - assigned-clocks
> +  - assigned-clock-rates

Why are these required?

> +  - vddio-supply
> +  - vdda-supply
> +  - vddd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        sensor0@2 {
> +            status =3D "okay";
> +            compatible =3D "GalaxyCore,gc08a3";
> +            reg =3D <0x31>;
> +
> +            clocks =3D <&topckgen CLK_TOP_CAMTG>,
> +                <&topckgen CLK_TOP_UNIVPLL_192M_D8>;
> +            clock-names =3D "xvclk", "freq_mux";
> +            clock-frequency =3D <24000000>;
> +
> +            assigned-clocks =3D <&topckgen CLK_TOP_CAMTG>,
> +                    <&topckgen CLK_TOP_UNIVPLL_192M_D8>;
> +            assigned-clock-parents =3D <&topckgen CLK_TOP_UNIVPLL_192M_D=
8>;
> +            assigned-clock-rates =3D <0>, <24000000>;
> +
> +            enable-gpios =3D <&pio 19 GPIO_ACTIVE_HIGH>;
> +
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&camera_pins_cam0>;
> +
> +            avdd-supply =3D <&mt6359_vfe28_ldo_reg>;
> +
> +            port {
> +                sensor0_out_2: endpoint {
> +                    data-lanes =3D <1 2 3 4>;
> +                    link-frequencies =3D /bits/ 64 <336000000 207000000>;
> +                    remote-endpoint =3D <&seninf_csi_port_0_in_2>;
> +                };
> +            };
> +        };
> +
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 309b94c328c8..a0bbec0bfee2 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -502,6 +502,8 @@ patternProperties:
>      description: Fujitsu Ltd.
>    "^fxtec,.*":
>      description: FX Technology Ltd.
> +  "^GalaxyCore,.*":
> +    description: GalaxyCore Inc.
>    "^gardena,.*":
>      description: GARDENA GmbH
>    "^gateway,.*":
> --=20
> 2.25.1
>=20

--01MH2fFNhMpUwwbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+MdwAKCRB4tDGHoIJi
0nBfAQC7ikdh/7CYWD8MVt9f89SRYiuaWItKq/AI5yLxntzi+wD+JZEaDfqSeBAQ
bZZuGrDAOKC/vGwQGO7ePPmXs4tOsw0=
=zkKC
-----END PGP SIGNATURE-----

--01MH2fFNhMpUwwbA--

