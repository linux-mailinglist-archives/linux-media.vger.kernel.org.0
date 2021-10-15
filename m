Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9498042EFD2
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 13:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235358AbhJOLlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 07:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbhJOLlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 07:41:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA45DC061570;
        Fri, 15 Oct 2021 04:39:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57EEA2E3;
        Fri, 15 Oct 2021 13:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634297987;
        bh=ashv+mDLLLPJVSewkCEt0uHUKrTpej6rwd8hE5LQOco=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PDcFTZQGglXHTY2tq+5DlSPrNQlNR+NtWeX0ocmUoFMu2ykbWy1I/8q30O8QV7CU2
         olKYthW87cmn0HJ0jI76uU0BUHiYS393COt9YPutIJ8neU4uj0pK90/XUaOg4jm/QG
         +RK/qI+AZTGg79G5fr3wrK984rPEiL70Bo+GfDlk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211014105236.1947798-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211014105236.1947798-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] dt-bindings: adv748x: Convert bindings to json-schema
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Date:   Fri, 15 Oct 2021 12:39:44 +0100
Message-ID: <163429798440.4171071.15971721694401389459@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2021-10-14 11:52:36)
> Convert ADV748X analog video decoder documentation to json-schema.
>=20
> While converting the bindings extend it to enforce that all port@n nodes
> shall be encapsulated inside a ports node. This change do not effect

Trivial nit:
'This change does not affect'
or
'This change does not have an effect on'

> drivers parsing the ports@n nodes.
>=20

Glad to hear it ;-)

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Changes since v1
> - Update commit message to mention the added ports node.
>=20
> Hello,
>=20
> This conversion revealed a problem with the Renesas DTSI files for the
> adv7482 nodes. A fix for that have been submitted in a separate patch,
>=20

Great.

>     [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes
>=20
> Kind Regards,
> Niklas S=C3=B6derlund
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt | 116 ----------
>  .../bindings/media/i2c/adv748x.yaml           | 211 ++++++++++++++++++
>  2 files changed, 211 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Do=
cumentation/devicetree/bindings/media/i2c/adv748x.txt
> deleted file mode 100644
> index 4f91686e54a6b939..0000000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -* Analog Devices ADV748X video decoder with HDMI receiver
> -
> -The ADV7481 and ADV7482 are multi format video decoders with an integrat=
ed
> -HDMI receiver. They can output CSI-2 on two independent outputs TXA and =
TXB
> -from three input sources HDMI, analog and TTL.
> -
> -Required Properties:
> -
> -  - compatible: Must contain one of the following
> -    - "adi,adv7481" for the ADV7481
> -    - "adi,adv7482" for the ADV7482
> -
> -  - reg: I2C slave addresses
> -    The ADV748x has up to twelve 256-byte maps that can be accessed via =
the
> -    main I2C ports. Each map has it own I2C address and acts as a standa=
rd
> -    slave device on the I2C bus. The main address is mandatory, others a=
re
> -    optional and remain at default values if not specified.
> -
> -Optional Properties:
> -
> -  - interrupt-names: Should specify the interrupts as "intrq1", "intrq2"=
 and/or
> -                    "intrq3". All interrupts are optional. The "intrq3" =
interrupt
> -                    is only available on the adv7481
> -  - interrupts: Specify the interrupt lines for the ADV748x
> -  - reg-names : Names of maps with programmable addresses.
> -               It shall contain all maps needing a non-default address.
> -               Possible map names are:
> -                 "main", "dpll", "cp", "hdmi", "edid", "repeater",
> -                 "infoframe", "cbus", "cec", "sdp", "txa", "txb"
> -
> -The device node must contain one 'port' child node per device input and =
output
> -port, in accordance with the video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt. The port n=
odes
> -are numbered as follows.
> -
> -         Name          Type            Port
> -       ---------------------------------------
> -         AIN0          sink            0
> -         AIN1          sink            1
> -         AIN2          sink            2
> -         AIN3          sink            3
> -         AIN4          sink            4
> -         AIN5          sink            5
> -         AIN6          sink            6
> -         AIN7          sink            7
> -         HDMI          sink            8
> -         TTL           sink            9
> -         TXA           source          10
> -         TXB           source          11
> -
> -The digital output port nodes, when present, shall contain at least one
> -endpoint. Each of those endpoints shall contain the data-lanes property =
as
> -described in video-interfaces.txt.
> -
> -Required source endpoint properties:
> -  - data-lanes: an array of physical data lane indexes
> -    The accepted value(s) for this property depends on which of the two
> -    sources are described. For TXA 1, 2 or 4 data lanes can be described
> -    while for TXB only 1 data lane is valid. See video-interfaces.txt
> -    for detailed description.
> -
> -Ports are optional if they are not connected to anything at the hardware=
 level.
> -
> -Example:
> -
> -       video-receiver@70 {
> -               compatible =3D "adi,adv7482";
> -               reg =3D <0x70 0x71 0x72 0x73 0x74 0x75
> -                      0x60 0x61 0x62 0x63 0x64 0x65>;
> -               reg-names =3D "main", "dpll", "cp", "hdmi", "edid", "repe=
ater",
> -                           "infoframe", "cbus", "cec", "sdp", "txa", "tx=
b";
> -
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
> -               interrupt-parent =3D <&gpio6>;
> -               interrupt-names =3D "intrq1", "intrq2";
> -               interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>,
> -                            <31 IRQ_TYPE_LEVEL_LOW>;
> -
> -               port@7 {
> -                       reg =3D <7>;
> -
> -                       adv7482_ain7: endpoint {
> -                               remote-endpoint =3D <&cvbs_in>;
> -                       };
> -               };
> -
> -               port@8 {
> -                       reg =3D <8>;
> -
> -                       adv7482_hdmi: endpoint {
> -                               remote-endpoint =3D <&hdmi_in>;
> -                       };
> -               };
> -
> -               port@a {
> -                       reg =3D <10>;
> -
> -                       adv7482_txa: endpoint {
> -                               clock-lanes =3D <0>;
> -                               data-lanes =3D <1 2 3 4>;
> -                               remote-endpoint =3D <&csi40_in>;
> -                       };
> -               };
> -
> -               port@b {
> -                       reg =3D <11>;
> -
> -                       adv7482_txb: endpoint {
> -                               clock-lanes =3D <0>;
> -                               data-lanes =3D <1>;
> -                               remote-endpoint =3D <&csi20_in>;
> -                       };
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml b/D=
ocumentation/devicetree/bindings/media/i2c/adv748x.yaml
> new file mode 100644
> index 0000000000000000..37df0441d8790c6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> @@ -0,0 +1,211 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/adv748x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADV748X video decoder with HDMI receiver
> +
> +maintainers:

Optionally...
+ Niklas? ;-)

> +  - Kieran Bingham <kieran.bingham@ideasonboard.com>
> +
> +description:
> +  The ADV7481 and ADV7482 are multi format video decoders with an integr=
ated
> +  HDMI receiver. They can output CSI-2 on two independent outputs TXA an=
d TXB
> +  from three input sources HDMI, analog and TTL.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - adi,adv7481
> +          - adi,adv7482
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 12
> +    description:
> +      The ADV748x has up to twelve 256-byte maps that can be accessed vi=
a the
> +      main I2C ports. Each map has it own I2C address and acts as a stan=
dard
> +      slave device on the I2C bus. The main address is mandatory, others=
 are
> +      optional and remain at default values if not specified.
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: main
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sd=
p, txa, txb ]

Is there any way to specify that these have to be used uniquely? I.e. no
duplciates? Or is that automatic?



> +
> +  interrupts: true
> +
> +  interrupt-names: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      "^port@[0-7]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port nodes for analog inputs AIN[0-7].
> +
> +    properties:
> +      port@8:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port node for HDMI.
> +
> +      port@9:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port node for TTL.
> +
> +      port@a:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Output port node, single endpoint describing the CSI-2 transmi=
tter TXA.

I guess there's nothing to explicitly state if it's a sink or a source
in the port nodes?

The table made it nice and clear which were sink/source ... and that
gets a bit obfuscated here.

Of course it's mentioned as they are "Input" or "Output" nodes, but I
liked the clarity the table had.

Not a blocker though I don't think....


> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@b:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Output port node, single endpoint describing the CSI-2 transmi=
tter TXB.

I do like that we managed to align TXA =3D port 10 =3D a and TXB =3D port 1=
1 =3D
b...



> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                maxItems: 1
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,adv7481
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 3
> +
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - enum: [ intrq1, intrq2, intrq3 ]
> +            - enum: [ intrq1, intrq2, intrq3 ]
> +            - enum: [ intrq1, intrq2, intrq3 ]
> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 2
> +
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - enum: [ intrq1, intrq2 ]
> +            - enum: [ intrq1, intrq2 ]
> +
> +additionalProperties: false

Ah yes, this is actually an improvement on the earlier version as now
it's clear that there is a difference between the number of IRQs which
wasn't evident before.

> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        video-receiver@70 {
> +            compatible =3D "adi,adv7482";
> +            reg =3D <0x70 0x71 0x72 0x73 0x74 0x75 0x60 0x61 0x62 0x63 0=
x64 0x65>;

I know this was like that before, but it seems odd having 0x70-75, then
0x60-65.

The 'main' has to be 70, and probably kept first, which is probably why
I split it into two lines at least....

Is there a specific reason it's been joined up to a single line here?


Anyway, I don't see any blockers here - just discussion points really,
and I'm pleased to see it converted.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +            reg-names =3D "main", "dpll", "cp", "hdmi", "edid", "repeate=
r",
> +                        "infoframe", "cbus", "cec", "sdp", "txa", "txb";
> +
> +            interrupt-parent =3D <&gpio6>;
> +            interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>, <31 IRQ_TYPE_LEVEL_L=
OW>;
> +            interrupt-names =3D "intrq1", "intrq2";
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@7 {
> +                    reg =3D <7>;
> +
> +                    adv7482_ain7: endpoint {
> +                        remote-endpoint =3D <&cvbs_in>;
> +                    };
> +                };
> +
> +                port@8 {
> +                    reg =3D <8>;
> +
> +                    adv7482_hdmi: endpoint {
> +                        remote-endpoint =3D <&hdmi_in>;
> +                    };
> +                };
> +
> +                port@a {
> +                    reg =3D <10>;
> +
> +                    adv7482_txa: endpoint {
> +                        clock-lanes =3D <0>;
> +                        data-lanes =3D <1 2 3 4>;
> +                        remote-endpoint =3D <&csi40_in>;
> +                    };
> +                };
> +
> +                port@b {
> +                    reg =3D <11>;
> +
> +                    adv7482_txb: endpoint {
> +                        clock-lanes =3D <0>;
> +                        data-lanes =3D <1>;
> +                        remote-endpoint =3D <&csi20_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> --=20
> 2.33.0
>
