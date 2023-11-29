Return-Path: <linux-media+bounces-1374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 594FC7FDA5B
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDD8CB21441
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64209347AC;
	Wed, 29 Nov 2023 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IU5r85yU"
X-Original-To: linux-media@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3509EBE;
	Wed, 29 Nov 2023 06:50:48 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1CCA240005;
	Wed, 29 Nov 2023 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701269446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zvhoy3MWU/kAI5JAksznH8O+bfmDG28Swkq325dgEQc=;
	b=IU5r85yUfzxDrsmU6tvwihH1x9zyvHde0BuNpwSYc7ufd5mB/Zzjm0I5QsjWyN+05xFd2R
	hVHbfBLQiMF8py9iAz7EqseLWAcTWSvVSPjn+ICbuydn4D1vLOSKUb8r/mW5bkfOzqp3A3
	5YGAwOvZzec+EHfLTrgtdyFdvcceXEDoCEIun2K4+PXO76h9l33ozsmWEdJ260VAXWXd4r
	+KKf7vVP5pyBaQxtWL5ROchoOhB0ZojiNAzzBdriVAzUr1i0mF/DgBjRQHmNDPkaeOE+3j
	HEvMlUjgOSTeXV3dctOFenhqncAqpdziMZPZu8Nb2li9BZPWKZx+GR/oSGNAnQ==
Date: Wed, 29 Nov 2023 15:50:45 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Mehdi Djait <mehdi.djait@bootlin.com>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 2/3] media: dt-bindings: media: i2c: Add bindings for
 TW9900
Message-ID: <ZWdPxfiB7sEUEKdd@aptenodytes>
References: <cover.1700235276.git.mehdi.djait@bootlin.com>
 <de0f0831cbbd64328b1e348168d5d6cf4bc65b0d.1700235276.git.mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a9fMN3vXS4yRSY1P"
Content-Disposition: inline
In-Reply-To: <de0f0831cbbd64328b1e348168d5d6cf4bc65b0d.1700235276.git.mehdi.djait@bootlin.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com


--a9fMN3vXS4yRSY1P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 17 Nov 23, 16:42, Mehdi Djait wrote:
> The Techwell TW9900 is a video decoder supporting multiple input
> standards such as PAL and NTSC and has a parallel BT.656 output
> interface.
>=20
> It's designed to be low-power, posesses some features such as a
> programmable comb-filter, and automatic input standard detection
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  .../bindings/media/i2c/techwell,tw9900.yaml   | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/techwell,=
tw9900.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.=
yaml b/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
> new file mode 100644
> index 000000000000..e37317f81072
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/techwell,tw9900.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Techwell TW9900 NTSC/PAL video decoder
> +
> +maintainers:
> +  - Mehdi Djait <mehdi.djait@bootlin.com>
> +
> +description:
> +  The tw9900 is a multi-standard video decoder, supporting NTSC, PAL sta=
ndards
> +  with auto-detection features.
> +
> +properties:
> +  compatible:
> +    const: techwell,tw9900
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: VDD power supply
> +
> +  reset-gpios:
> +    description: GPIO descriptor for the RESET input pin
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: GPIO descriptor for the POWERDOWN input pin
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Analog input port
> +
> +        properties:
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: CVBS over MUX0
> +
> +          endpoint@1:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: CVBS over MUX1
> +
> +          endpoint@2:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: Chroma over CIN0 and Y over MUX0
> +
> +          endpoint@3:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: Chroma over CIN0 and Y over MUX1
> +
> +        oneOf:
> +          - required:
> +              - endpoint@0
> +          - required:
> +              - endpoint@1
> +          - required:
> +              - endpoint@2
> +          - required:
> +              - endpoint@3
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for the decoder output.
> +
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - ports
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/display/sdtv-standards.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    composite_connector {
> +        compatible =3D "composite-video-connector";
> +        label =3D "tv";
> +        sdtv-standards =3D <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
> +
> +        port {
> +            composite_to_tw9900: endpoint {
> +                remote-endpoint =3D <&tw9900_to_composite>;
> +            };
> +        };
> +    };
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        video-decoder@44 {
> +            compatible =3D "techwell,tw9900";
> +            reg =3D <0x44>;
> +
> +            vdd-supply =3D <&tw9900_supply>;
> +            reset-gpios =3D <&gpio2 5 GPIO_ACTIVE_LOW>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    reg =3D <0>;
> +                    tw9900_to_composite: endpoint@0 {
> +                        reg =3D <0>;
> +                        remote-endpoint =3D <&composite_to_tw9900>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +                    endpoint {
> +                        remote-endpoint =3D <&cif_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> --=20
> 2.41.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--a9fMN3vXS4yRSY1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVnT8UACgkQ3cLmz3+f
v9ESKwf8DdcZc4vGwQ10PLCRGzjLRppEKoEyFXbC+BIQH/6ymemelleAp4rsqax+
j5Vb4+DpA7G73lnNlcgMicJBm9vIuvRTGIfgPdur0aK8GYg81Hx1uWL7jaC0/+e3
Q6MXtDYPrlsM9eMXRES68pS+gfTHnmkNUYsOI3oMgeWObyQP+IB+h00YLCgkAvGj
YeGT2/6ztevYBdVemYkTofUTUD5XQCEOrW1S9MnGcRGW5p6SLvTnE71k60orjncN
Jcss/QV07LktCWev+xWO6G8g3FK0mV5MeyTRUx/jbmf1oreiS2h6YGN8lSMGbFbb
1KOzl+MfasZrldZXsJjUG5BGRuY2xQ==
=JVMJ
-----END PGP SIGNATURE-----

--a9fMN3vXS4yRSY1P--

