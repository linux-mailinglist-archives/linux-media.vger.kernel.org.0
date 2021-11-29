Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C48461BED
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 17:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345295AbhK2Qoh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 11:44:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38116 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242548AbhK2Qmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 11:42:36 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DAD52A5;
        Mon, 29 Nov 2021 17:39:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638203957;
        bh=JmrZZIhIr8JyRc8JbmSMnZNVrCsSNfrkLgqeCBUI7WQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PUsLzayti/g/y/BmT4i6W86tOwNjWWa2bUfv9HqG7bPWElUq+EveA7+ln7M6ctJ+i
         JWo48r98+gfict2uaYXRQhJQ/TkTuTPoiz8E1fHY2e4uKZ/P4gz9TYRZFx/ftbcd9U
         4tKiLvEVAQ2rGBn3hExf9c3RqzxvTYCBhVtFoXMc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211123214922.3981616-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211123214922.3981616-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] dt-bindings: staging: media: i2c: Add bindings for Maxim Integrated MAX96712
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Date:   Mon, 29 Nov 2021 16:39:14 +0000
Message-ID: <163820395480.3059017.6211390059943803938@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2021-11-23 21:49:22)
> Add bindings for Maxim Integrated MAX96712 deserializer. The MAX96712
> deserializer converts GMSL2 or GMSL1 serial inputs into MIPI CSI-2 D-PHY
> or C-PHY formatted outputs.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  .../staging/media/i2c/maxim,max96712.yaml     | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/staging/media/i2c/m=
axim,max96712.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/staging/media/i2c/maxim,ma=
x96712.yaml b/Documentation/devicetree/bindings/staging/media/i2c/maxim,max=
96712.yaml
> new file mode 100644
> index 0000000000000000..978f2c0e5caef567
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/staging/media/i2c/maxim,max96712.=
yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/staging/media/i2c/maxim,max96712.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
> +
> +maintainers:
> +  - Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> +
> +description: |
> +  The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into M=
IPI
> +  CSI-2 D-PHY or C-PHY formatted outputs. The device allows each link to
> +  simultaneously transmit bidirectional control-channel data while forwa=
rd
> +  video transmissions are in progress. The MAX96712 can accommodate as m=
any as
> +  four remotely located sensors using industry-standard coax or STP
> +  interconnects.
> +
> +  Each GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in t=
he
> +  forward direction and 187.5Mbps in the re- verse direction. In GMSL1 m=
ode, the

/re- verse/reverse/


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +  MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
> +  serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 =
mode.
> +
> +properties:
> +  compatible:
> +    const: maxim,max96712
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  enable-gpios: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: GMSL Input 0
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: GMSL Input 1
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: GMSL Input 2
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: GMSL Input 3
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes: true
> +
> +            required:
> +              - data-lanes
> +
> +    required:
> +      - port@4
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c@e6508000 {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            reg =3D <0 0xe6508000>;
> +
> +            gmsl0: gmsl-deserializer@49 {
> +                    compatible =3D "maxim,max96712";
> +                    reg =3D <0x49>;
> +                    enable-gpios =3D <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
> +
> +                    ports {
> +                            #address-cells =3D <1>;
> +                            #size-cells =3D <0>;
> +
> +                            port@4 {
> +                                    reg =3D <4>;
> +                                    max96712_out0: endpoint {
> +                                            clock-lanes =3D <0>;
> +                                            data-lanes =3D <1 2 3 4>;
> +                                            remote-endpoint =3D <&csi40_=
in>;
> +                                    };
> +                            };
> +                    };
> +            };
> +    };
> --=20
> 2.34.0
>
