Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8D1C13C808
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 16:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgAOPih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 10:38:37 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45914 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgAOPih (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 10:38:37 -0500
Received: by mail-ot1-f68.google.com with SMTP id 59so16441715otp.12
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2020 07:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BJ0NYxx4q989BAE4YTr0c3eBStcbmse461fRCdYuon8=;
        b=CaKwkio7DvGsiA7rdWZ119QxYe2PIEcRG8sJa2T7bRmyWB0XHA9UchR7woLuQ4WmXU
         +mWwxxyTM74GZgJYs2vOUbHbMzF6b9d6qeiigOA/TaE9KiqO2+Hg/sBr81w0kh+NWwNd
         eVGQwNstWOen6KkfcYh4tvIeFp3bE4OH9xNGExEAKNkfJ8ZDBH+468I34NHziXvQMDNn
         SbaLKdMOMhF3g44DsVudy4ozgCzgosjUkz1UzlecbSe72GAMShY/AnTLMOUFxyVSsZTA
         2m+Rq7+/hPNDSJD7Amq0KFJm/Xb7WBrgciUws8ZZWYAGSW7TyQCZ3I1RSzReu8TkIVSn
         LLcA==
X-Gm-Message-State: APjAAAWTimkNp17G22RBUY/UNEE69CJnp95rKQV3+X5QNcDz/GXxazv8
        SzEnvTP5f2zKttEtjoEY1YMz+iQ=
X-Google-Smtp-Source: APXvYqwZ0o1IxRD5mdsnoaW3FsdrQOdOM0TZT55xKzZHnO3j22EhOE0kYcS+Lip01md+M596Jl2waA==
X-Received: by 2002:a9d:67ce:: with SMTP id c14mr3112658otn.106.1579102714480;
        Wed, 15 Jan 2020 07:38:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 6sm5729957oil.43.2020.01.15.07.38.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 07:38:33 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 09:38:33 -0600
Date:   Wed, 15 Jan 2020 09:38:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2] dt-bindings: rcar-vin: Convert bindings to json-schema
Message-ID: <20200115153832.GA19169@bogus>
References: <20200110201146.2312391-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200110201146.2312391-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 10, 2020 at 09:11:46PM +0100, Niklas Söderlund wrote:
> Convert Renesas R-Car VIN bindings documentation to json-schema.
> 
> As the examples in the bindings now can be tested add a new one which
> describes how the both a parallel and a CSI-2 source can be connected on
> Gen3 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/renesas,vin.txt | 217 ----------
>  .../bindings/media/renesas,vin.yaml           | 397 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 398 insertions(+), 218 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vin.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,vin.yaml


> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> new file mode 100644
> index 0000000000000000..62a2d75ea72b6597
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -0,0 +1,397 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright (C) 2020 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,vin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Video Input (VIN)
> +
> +maintainers:
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +
> +description:
> +  The R-Car Video Input (VIN) device provides video input capabilities for the
> +  Renesas R-Car family of devices.
> +
> +  Each VIN instance has a single parallel input that supports RGB and YUV video,
> +  with both external synchronization and BT.656 synchronization for the latter.
> +  Depending on the instance the VIN input is connected to external SoC pins, or
> +  on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:

Should be indented 2 more spaces.

> +          - renesas,vin-r8a7743  # RZ/G1M

And then 2 more here.

> +          - renesas,vin-r8a7744  # RZ/G1N
> +          - renesas,vin-r8a7745  # RZ/G1E
> +          - renesas,vin-r8a77470 # RZ/G1C
> +          - renesas,vin-r8a7790  # R-Car H2
> +          - renesas,vin-r8a7791  # R-Car M2-W
> +          - renesas,vin-r8a7792  # R-Car V2H
> +          - renesas,vin-r8a7793  # R-Car M2-N
> +          - renesas,vin-r8a7794  # R-Car E2
> +        - const: renesas,rcar-gen2-vin # Generic R-Car Gen2 or RZ/G1
> +
> +      - items:
> +        - enum:
> +          - renesas,vin-r8a774a1 # RZ/G2M
> +          - renesas,vin-r8a774b1 # RZ/G2N
> +          - renesas,vin-r8a774c0 # RZ/G2E
> +          - renesas,vin-r8a7778  # R-Car M1
> +          - renesas,vin-r8a7779  # R-Car H1
> +          - renesas,vin-r8a7795  # R-Car H3
> +          - renesas,vin-r8a7796  # R-Car M3-W
> +          - renesas,vin-r8a77965 # R-Car M3-N
> +          - renesas,vin-r8a77970 # R-Car V3M
> +          - renesas,vin-r8a77980 # R-Car V3H
> +          - renesas,vin-r8a77990 # R-Car E3
> +          - renesas,vin-r8a77995 # R-Car D3
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
> +  #The per-board settings for Gen2 and RZ/G1 platforms:
> +  port:
> +    type: object
> +    description:
> +      A node containing a parallel input with a singel endpoint definitions as

s/singel/single/

> +      documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      reg:
> +        const: 1

Node name should be port@1 rather than port then.

> +
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          hsync-active:
> +            description:
> +              If both HSYNC and VSYNC polarities are not specified, embedded
> +              synchronization is selected.
> +            default: 1
> +
> +          vsync-active:
> +            description:
> +              If both HSYNC and VSYNC polarities are not specified, embedded
> +              synchronization is selected.
> +            default: 1
> +
> +          field-active-even: true
> +
> +          bus-width: true
> +
> +          data-shift: true
> +
> +          data-enable-active:
> +            description: Polarity of CLKENB signal
> +            default: 1
> +
> +          pclk-sample: true
> +
> +          data-active: true
> +
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +  #The per-board settings for Gen3 and RZ/G2 platforms:
> +  renesas,id:
> +    description: VIN channel number
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ]

minimum: 0
maximum: 15

> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing input nodes with endpoint definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description:
> +          Input port node, single endpoint describing a parallel input source.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              hsync-active:
> +                description:
> +                  Default is active high. If both HSYNC and VSYNC polarities are not
> +                  specified, embedded synchronization is selected.
> +                enum: [ 0, 1 ]

We should assume the values on these common properties are defined 
elsewhere unless it's a subset.

> +
> +              vsync-active:
> +                description:
> +                  Default is active high. If both HSYNC and VSYNC polarities are not
> +                  specified, embedded synchronization is selected.
> +                enum: [ 0, 1 ]
> +
> +              field-active-even:
> +                description: Default is active high.
> +                enum: [ 0, 1 ]
> +
> +              bus-width:
> +                enum: [ 8, 10, 12, 16, 24, 32 ]
> +
> +              data-shift:
> +                enum: [ 0, 8 ]
> +
> +              data-enable-active:
> +                description: Polarity of CLKENB signal, default is active high.

Use 'default' to describe the default.

> +                enum: [ 0, 1 ]
> +
> +              pclk-sample:
> +                enum: [ 0, 1 ]
> +
> +              data-active:
> +                enum: [ 0, 1 ]
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description:
> +          Input port node, multiple endpoints describing all the R-Car CSI-2
> +          modules connected the VIN.
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
> +          endpoint@0:
> +            type: object
> +            description: Endpoint connected to CSI20.
> +
> +            properties:
> +              reg:
> +                const: 0
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +          endpoint@1:
> +            type: object
> +            description: Endpoint connected to CSI21.
> +
> +            properties:
> +              reg:
> +                const: 1
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +          endpoint@2:
> +            type: object
> +            description: Endpoint connected to CSI40.
> +
> +            properties:
> +              reg:
> +                const: 2
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +          endpoint@3:
> +            type: object
> +            description: Endpoint connected to CSI41.
> +
> +            properties:
> +              reg:
> +                const: 3
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - reg
> +              - remote-endpoint

None of these ports or endpoints are required?

> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - power-domains
> +  - resets
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        anyOf:
> +          - const: renesas,vin-r8a7778
> +          - const: renesas,vin-r8a7779
> +          - const: renesas,rcar-gen2-vin

Use 'enum' instead of anyOf+const.

> +then:
> +  required:
> +    - port
> +else:
> +  required:
> +    - renesas,id
> +    - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  # Device node example for Gen2 platform
> +  - |
> +    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
> +
> +    vin1: vin@e6ef1000 {
> +            compatible = "renesas,vin-r8a7790",
> +                         "renesas,rcar-gen2-vin";
> +            reg = <0 0xe6ef1000 0 0x1000>;
> +            interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 810>;
> +            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +            resets = <&cpg 810>;
> +
> +            port {
> +                    vin1ep0: endpoint {
> +                            remote-endpoint = <&adv7180>;
> +                            bus-width = <8>;
> +                    };
> +            };
> +    };
> +
> +  # Device node example for Gen3 platform with only CSI-2
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    vin0: video@e6ef0000 {
> +            compatible = "renesas,vin-r8a7795";
> +            reg = <0 0xe6ef0000 0 0x1000>;
> +            interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 811>;
> +            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +            resets = <&cpg 811>;
> +            renesas,id = <0>;
> +
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@1 {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            reg = <1>;
> +
> +                            vin0csi20: endpoint@0 {
> +                                    reg = <0>;
> +                                    remote-endpoint= <&csi20vin0>;
> +                            };
> +                            vin0csi40: endpoint@2 {
> +                                    reg = <2>;
> +                                    remote-endpoint= <&csi40vin0>;
> +                            };
> +                    };
> +            };
> +    };
> +
> +  # Device node example for Gen3 platform with CSI-2 and parallel
> +  - |
> +    #include <dt-bindings/clock/r8a77970-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a77970-sysc.h>
> +
> +    vin2: video@e6ef2000 {
> +            compatible = "renesas,vin-r8a77970";
> +            reg = <0 0xe6ef2000 0 0x1000>;
> +            interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 809>;
> +            power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +            resets = <&cpg 809>;
> +            renesas,id = <2>;
> +
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                            reg = <0>;
> +
> +                            vin2_in: endpoint {
> +                                    remote-endpoint = <&adv7612_out>;
> +                                    hsync-active = <0>;
> +                                    vsync-active = <0>;
> +                            };
> +                    };
> +
> +                    port@1 {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            reg = <1>;
> +
> +                            vin2csi40: endpoint@2 {
> +                                    reg = <2>;
> +                                    remote-endpoint = <&csi40vin2>;
> +                            };
> +                    };
> +            };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e30ba33be8ad833e..d75ad6e3f4e86523 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10315,7 +10315,7 @@ L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Supported
>  F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
> -F:	Documentation/devicetree/bindings/media/renesas,vin.txt
> +F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
>  F:	drivers/media/platform/rcar-vin/
>  
>  MEDIA DRIVERS FOR RENESAS - VSP1
> -- 
> 2.24.1
> 
