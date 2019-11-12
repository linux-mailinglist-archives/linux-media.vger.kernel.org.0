Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B90F8CF8
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 11:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfKLKjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 05:39:24 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:44985 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfKLKjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 05:39:23 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BA137E0012;
        Tue, 12 Nov 2019 10:39:11 +0000 (UTC)
Date:   Tue, 12 Nov 2019 11:41:10 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rcar-csi2: Convert bindings to json-schema
Message-ID: <20191112104110.nxjntjaqudaw2n7x@uno.localdomain>
References: <20191108021748.2584486-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3cjtus4lx7j7va7t"
Content-Disposition: inline
In-Reply-To: <20191108021748.2584486-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3cjtus4lx7j7va7t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,
   thanks for the patch

On Fri, Nov 08, 2019 at 03:17:48AM +0100, Niklas S=C3=B6derlund wrote:
> Convert Renesas R-Car MIPI CSI-2 receiver bindings documentation to
> json-schema.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  .../bindings/media/renesas,csi2.txt           | 107 ----------
>  .../bindings/media/renesas,csi2.yaml          | 200 ++++++++++++++++++
>  2 files changed, 200 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.=
txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.=
yaml
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.txt b/D=
ocumentation/devicetree/bindings/media/renesas,csi2.txt
> deleted file mode 100644
> index 2da6f60b2b5659f6..0000000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,csi2.txt
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -Renesas R-Car MIPI CSI-2
> -------------------------
> -
> -The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
> -Renesas R-Car and RZ/G2 family of devices. It is used in conjunction wit=
h the
> -R-Car VIN module, which provides the video capture capabilities.
> -
> -Mandatory properties
> ---------------------
> - - compatible: Must be one or more of the following
> -   - "renesas,r8a774a1-csi2" for the R8A774A1 device.
> -   - "renesas,r8a774b1-csi2" for the R8A774B1 device.
> -   - "renesas,r8a774c0-csi2" for the R8A774C0 device.
> -   - "renesas,r8a7795-csi2" for the R8A7795 device.
> -   - "renesas,r8a7796-csi2" for the R8A7796 device.
> -   - "renesas,r8a77965-csi2" for the R8A77965 device.
> -   - "renesas,r8a77970-csi2" for the R8A77970 device.
> -   - "renesas,r8a77980-csi2" for the R8A77980 device.
> -   - "renesas,r8a77990-csi2" for the R8A77990 device.
> -
> - - reg: the register base and size for the device registers
> - - interrupts: the interrupt for the device
> - - clocks: A phandle + clock specifier for the module clock
> - - resets: A phandle + reset specifier for the module reset
> -
> -The device node shall contain two 'port' child nodes according to the
> -bindings defined in Documentation/devicetree/bindings/media/
> -video-interfaces.txt. port@0 shall connect to the CSI-2 source. port@1
> -shall connect to all the R-Car VIN modules that have a hardware
> -connection to the CSI-2 receiver.
> -
> -- port@0- Video source (mandatory)
> -	- endpoint@0 - sub-node describing the endpoint that is the video source
> -
> -- port@1 - VIN instances (optional)
> -	- One endpoint sub-node for every R-Car VIN instance which is connected
> -	  to the R-Car CSI-2 receiver.
> -
> -Example:
> -
> -	csi20: csi2@fea80000 {
> -		compatible =3D "renesas,r8a7796-csi2";
> -		reg =3D <0 0xfea80000 0 0x10000>;
> -		interrupts =3D <0 184 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks =3D <&cpg CPG_MOD 714>;
> -		power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> -		resets =3D <&cpg 714>;
> -
> -		ports {
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -
> -			port@0 {
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -
> -				reg =3D <0>;
> -
> -				csi20_in: endpoint@0 {
> -					reg =3D <0>;
> -					clock-lanes =3D <0>;
> -					data-lanes =3D <1>;
> -					remote-endpoint =3D <&adv7482_txb>;
> -				};
> -			};
> -
> -			port@1 {
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -
> -				reg =3D <1>;
> -
> -				csi20vin0: endpoint@0 {
> -					reg =3D <0>;
> -					remote-endpoint =3D <&vin0csi20>;
> -				};
> -				csi20vin1: endpoint@1 {
> -					reg =3D <1>;
> -					remote-endpoint =3D <&vin1csi20>;
> -				};
> -				csi20vin2: endpoint@2 {
> -					reg =3D <2>;
> -					remote-endpoint =3D <&vin2csi20>;
> -				};
> -				csi20vin3: endpoint@3 {
> -					reg =3D <3>;
> -					remote-endpoint =3D <&vin3csi20>;
> -				};
> -				csi20vin4: endpoint@4 {
> -					reg =3D <4>;
> -					remote-endpoint =3D <&vin4csi20>;
> -				};
> -				csi20vin5: endpoint@5 {
> -					reg =3D <5>;
> -					remote-endpoint =3D <&vin5csi20>;
> -				};
> -				csi20vin6: endpoint@6 {
> -					reg =3D <6>;
> -					remote-endpoint =3D <&vin6csi20>;
> -				};
> -				csi20vin7: endpoint@7 {
> -					reg =3D <7>;
> -					remote-endpoint =3D <&vin7csi20>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/=
Documentation/devicetree/bindings/media/renesas,csi2.yaml
> new file mode 100644
> index 0000000000000000..a6d2b597c4944693
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> @@ -0,0 +1,200 @@
> +# SPDX-License-Identifier: GPL-2.0

GPL-2.0-only

> +# Copyright (C) 2019 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> +
> +description: |-
> +  The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for t=
he
> +  Renesas R-Car and RZ/G2 family of devices. It is used in conjunction w=
ith the
> +  R-Car VIN module, which provides the video capture capabilities.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,r8a774a1-csi2 # RZ/G2M
> +        - renesas,r8a774b1-csi2 # RZ/G2N
> +        - renesas,r8a774c0-csi2 # RZ/G2E
> +        - renesas,r8a7795-csi2  # R-Car H3
> +        - renesas,r8a7796-csi2  # R-Car M3-W
> +        - renesas,r8a77965-csi2 # R-Car M3-N
> +        - renesas,r8a77970-csi2 # R-Car V3M
> +        - renesas,r8a77980-csi2 # R-Car V3H
> +        - renesas,r8a77990-csi2 # R-Car E3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  ports:
> +    type: object
> +    description: |-
> +      A node containing input and output port nodes with endpoint defini=
tions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |-
> +          Input port node, single endpoint describing the CSI-2 transmit=
ter.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1

Does the R-Car CSI-2 receiver allows changing swapping the clock lane?
I see it allows swapping data lanes, but not the clock lane, through
register LSWAP.

Several Gen3 DTS specify that property, if you agree it could be
removed or you either fix the DTS as well by removing it, or you keep
the property here as optional

I however see that the clock continuous mode could be handled through
the ICLK_NONSTOP bit of LINKCNT register. Should the
clock-noncontinuous property be listed here ?

> +
> +              data-lanes:
> +                maxItems: 1
> +
> +              remote-endpoint:
> +                maxItems: 1
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false

I'm not sure about the additionalProperties intended use, but you seem
to place it in every node, something other bindings do not seems to
do.

> +
> +      port@1:
> +        type: object
> +        description: |-
> +          Output port node, multiple endpoints describing all the R-Car =
VIN
> +          modules connected the CSI-2 receiver.
> +
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +          reg:
> +            const: 1
> +
> +        patternProperties:
> +          "^endpoint@[0-9]+$":

Doesn't this allow endpoint@99 ? Should this be limited to the maxium
number of VINs  (16 if I'm not mistaken) ?


> +            type: object
> +
> +            properties:
> +              reg:
> +                maxItems: 1
> +
> +              remote-endpoint:
> +                maxItems: 1
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false

The textual bindings describe port@1 as optional but port@0 as
mandatory. If this is correct shouldn't we have it listed here as
required ?

Thanks
   j

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - power-domains
> +  - resets
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7796-sysc.h>
> +
> +    csi20: csi2@fea80000 {
> +            compatible =3D "renesas,r8a7796-csi2";
> +            reg =3D <0 0xfea80000 0 0x10000>;
> +            interrupts =3D <0 184 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&cpg CPG_MOD 714>;
> +            power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> +            resets =3D <&cpg 714>;
> +
> +            ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                            reg =3D <0>;
> +
> +                            csi20_in: endpoint {
> +                                    clock-lanes =3D <0>;
> +                                    data-lanes =3D <1>;
> +                                    remote-endpoint =3D <&adv7482_txb>;
> +                            };
> +                    };
> +
> +                    port@1 {
> +                            #address-cells =3D <1>;
> +                            #size-cells =3D <0>;
> +
> +                            reg =3D <1>;
> +
> +                            csi20vin0: endpoint@0 {
> +                                    reg =3D <0>;
> +                                    remote-endpoint =3D <&vin0csi20>;
> +                            };
> +                            csi20vin1: endpoint@1 {
> +                                    reg =3D <1>;
> +                                    remote-endpoint =3D <&vin1csi20>;
> +                            };
> +                            csi20vin2: endpoint@2 {
> +                                    reg =3D <2>;
> +                                    remote-endpoint =3D <&vin2csi20>;
> +                            };
> +                            csi20vin3: endpoint@3 {
> +                                    reg =3D <3>;
> +                                    remote-endpoint =3D <&vin3csi20>;
> +                            };
> +                            csi20vin4: endpoint@4 {
> +                                    reg =3D <4>;
> +                                    remote-endpoint =3D <&vin4csi20>;
> +                            };
> +                            csi20vin5: endpoint@5 {
> +                                    reg =3D <5>;
> +                                    remote-endpoint =3D <&vin5csi20>;
> +                            };
> +                            csi20vin6: endpoint@6 {
> +                                    reg =3D <6>;
> +                                    remote-endpoint =3D <&vin6csi20>;
> +                            };
> +                            csi20vin7: endpoint@7 {
> +                                    reg =3D <7>;
> +                                    remote-endpoint =3D <&vin7csi20>;
> +                            };
> +                    };
> +            };
> +    };
> --
> 2.23.0
>

--3cjtus4lx7j7va7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3KjEYACgkQcjQGjxah
VjxKhg/9G2SOl/qbMOrtj9Dyt5HojAZEwcl4z4nDG1VoAa7PWDmP1ByzHgL0Gvh+
riylL9bYgzckDGlXAVA99CXl3Jn6hBisDVakZbql5CA1F97xbF2T/EQUI812Hx5Y
x52HL7yPcPOzggxiyVhO/0gnZ08fp6/dbBobX+0DBE25WAkkMemHQR7GuPxCDQ6R
al+JtvKK5BtXAHLYtFqjH3pQv7FJ3ZoHyfkrCEioA0xf8w0rZ7O0YdDax4WevIQl
Yime8Knv7YkDkNTotEyJyzK9BNphk9ut6kYvJv42wKdy4T9AfySSMRAv2gqb9W+l
L/FrsVDNUUtjvOeUfgSg9OV6YfoNg/dRR4qy+llIT+zozBvk/I24MnFeQExjzoky
ejH+/WUEd+QKjbU5oCDh5R5Y3Guo6QZC3usX0FYo5Ml5wvUALkvbMCUnqxsx0snB
uAZtuqyp2PQIbiDCb0TEa1ZvtcDm3YqM1JAzfRf4PWK3Y2KwXUeTihwZaQgAPwtV
UspvT0V049Lmn4NhkJPZIKG3fSYChcAXeAANMAdNgYdS/NF4cErpP6w00SGE3DjP
lxYYtr9l0Z4UnI2As1og0owHm9q2Y962vchHLWTXpb8i7TnzuBE8cVjVO5xv1zJ7
4XUMmbyNJdLypL9XxDS2K7oLoPw6ByXdha4aNI7cIOiZGKIN4XA=
=31C9
-----END PGP SIGNATURE-----

--3cjtus4lx7j7va7t--
