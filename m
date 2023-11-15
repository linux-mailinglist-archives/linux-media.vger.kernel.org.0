Return-Path: <linux-media+bounces-411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E297ED70F
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 23:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AAD62813C5
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 22:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3B143159;
	Wed, 15 Nov 2023 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmMLQCK/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444DE43175;
	Wed, 15 Nov 2023 22:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F444C433C7;
	Wed, 15 Nov 2023 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700086565;
	bh=LijZpOSPLU8ZYO5qZvZXUj9vAcU8GvcxBZEjnQcs/cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmMLQCK//CqEp88VijmZZXx4ipZrjPLpijnmJzMcECHbamofIo4qOy+e2TfJ6iQqk
	 4H+tLQHBWmMAGiqAgZgcZMI+MM3C05T87QoCPiUFaQJ79AeMJQkS6/IloSalxbNS6G
	 KLHJmEkkqZkr+9HALE/UO19FmukYAAOs65/8eq8IpLH3NivgzZmEF42L/FAEkb79/5
	 cvbzhOAawnpPgtDAhIrhmdR3Qvf/mv+fU/i7AUddOXYsD1rD5IzPiPNFqB7hOKz9I6
	 GcRtyra3gGGm3be2B1PD02/y/QetUtNlw+RvQsDXRo7ScDXhUHCHEEM6lGkdgVYBfG
	 D4EhJEXaxKSrQ==
Date: Wed, 15 Nov 2023 22:16:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <20231115-jawless-visitor-4f6b8742fa86@squawk>
References: <20231115141507.37572-1-jacopo.mondi@ideasonboard.com>
 <20231115141507.37572-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dxNayO0Tp2agsiNh"
Content-Disposition: inline
In-Reply-To: <20231115141507.37572-2-jacopo.mondi@ideasonboard.com>


--dxNayO0Tp2agsiNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 03:15:06PM +0100, Jacopo Mondi wrote:
> Add bindings for OmniVision OV64A40.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/media/i2c/ovti,ov64a40.yaml      | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64=
a40.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yam=
l b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> new file mode 100644
> index 000000000000..15fbe86bba10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov64a40.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV64A40 Image Sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov64a40
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog voltage supply, 2.8 volts
> +
> +  dvdd-supply:
> +    description: Digital core voltage supply, 1.1 volts
> +
> +  dovdd-supply:
> +    description: Digital I/O voltage supply, 1.8 volts
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          bus-type:
> +            enum:
> +              - 1 # MIPI CSI-2 C-PHY
> +              - 4 # MIPI CSI-2 D-PHY
> +          data-lanes: true
> +          link-frequencies: true
> +          clock-noncontinuous: true
> +          remote-endpoint: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/gpio/gpio.h>
> +
> +      i2c {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          camera@36 {
> +              compatible =3D "ovti,ov64a40";
> +              reg =3D <0x36>;
> +              clocks =3D <&camera_clk>;
> +              dovdd-supply =3D <&vgen4_reg>;
> +              avdd-supply =3D <&vgen3_reg>;
> +              dvdd-supply =3D <&vgen2_reg>;
> +              powerdown-gpios =3D <&gpio1 9 GPIO_ACTIVE_HIGH>;
> +              reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> +              rotation =3D <180>;
> +              orientation =3D <2>;
> +
> +              port {
> +                  endpoint {
> +                      remote-endpoint =3D <&mipi_csi2_in>;
> +                      bus-type =3D <4>;
> +                      data-lanes =3D <1 2 3 4>;
> +                      link-frequencies =3D /bits/ 64 <456000000>;
> +                  };
> +              };
> +          };
> +      };
> +
> +...
> --
> 2.41.0
>=20

--dxNayO0Tp2agsiNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVVDHgAKCRB4tDGHoIJi
0iTmAQCpVOCrXHeVB3uxEQDwvdKGxp2p6iA56WxIs3dn5DA1PgD/eYGbAPNyY1XH
cED168/r9ercwJKgam9ZJ5k++PBn9QI=
=4W6q
-----END PGP SIGNATURE-----

--dxNayO0Tp2agsiNh--

