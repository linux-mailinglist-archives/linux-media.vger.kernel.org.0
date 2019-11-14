Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56174FC89B
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 15:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfKNOPI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 09:15:08 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:36279 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfKNOPI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 09:15:08 -0500
Received: by mail-oi1-f180.google.com with SMTP id j7so5380485oib.3;
        Thu, 14 Nov 2019 06:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=gcL+cCps1XEbvom3DJi1H0YNvrqxKgbmfQNhyR0Wbes=;
        b=bAIwWJTdREJImQbxcnCr+2coOOt+fCcMWxWf6XghLYch5egAQpE3wgKNDqBWUMotvt
         2kaZs2m1itR4OTH7wNChZaEr3Z9a6vTBD5gws7152PppecwcHsxeahnZvcu6KmcSCBJN
         TZuonG22dOKwKB9XkadjO4xjX6bZids6iMngYP+CRm9T6xy7HbOycdOuHod8xN1/XAhG
         v05PPCtHqDg8NAmr7E1rcpEqqixZZ5Qdc7K+dPfmsYo8w0yK4ANrI/S7D1hyBt8VPdDJ
         RFXypyee1VFCh+rnEmfknJQMude/fNd7OPJd9h4i8diiB8bRxmezN8qXrNF0sIZzfe8J
         kdrg==
X-Gm-Message-State: APjAAAV4ljt2IGbkplExS0oJO8epLsssX+EBpXYM49cCQXBPVlbZmiza
        y3yhju++U6s0bmuS59nW7FbBc6I=
X-Google-Smtp-Source: APXvYqxnCbw04IOwN/6GS6ahDFop3WLjpbLkwgzwAgxcL6xh0k+ed/GJmNMOjAIf0XpQQatPW5n64Q==
X-Received: by 2002:aca:450:: with SMTP id 77mr3723326oie.113.1573740906604;
        Thu, 14 Nov 2019 06:15:06 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z66sm1938576ota.54.2019.11.14.06.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 06:15:05 -0800 (PST)
Date:   Thu, 14 Nov 2019 08:15:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: rcar-vin: Convert bindings to
 json-schema
Message-ID: <20191114141505.GA22574@bogus>
References: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
 <20191108021609.2584272-4-niklas.soderlund+renesas@ragnatech.se>
 <20191112094231.ssi2qaksvn7djxmq@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112094231.ssi2qaksvn7djxmq@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 10:42:31AM +0100, Jacopo Mondi wrote:
> Hi Niklas,
>    thanks for the patch
> 
> On Fri, Nov 08, 2019 at 03:16:09AM +0100, Niklas Söderlund wrote:
> > Convert Renesas R-Car VIN bindings documentation to json-schema.
> >
> > As the examples in the bindings now can be tested add a new one which
> > describes how the both a parallel and a CSI-2 source can be connected on
> > Gen3 SoCs.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../devicetree/bindings/media/renesas,vin.txt | 217 ----------
> >  .../bindings/media/renesas,vin.yaml           | 409 ++++++++++++++++++
> >  2 files changed, 409 insertions(+), 217 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vin.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/renesas,vin.yaml


> > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > new file mode 100644
> > index 0000000000000000..be261d9a98d62dcd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > @@ -0,0 +1,409 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> I think you should use GPL-2.0-only
> 
> > +# Copyright (C) 2019 Renesas Electronics Corp.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/renesas,vin.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car Video Input (VIN)
> > +
> > +maintainers:
> > +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> 
> I also put the mailing lists here, not sure if that's desired.

Not really. A Renesas list is fine, but no need for linux-media as the 
file path will pick that up.

> > +
> > +description: |-
> > +  The R-Car Video Input (VIN) device provides video input capabilities for the
> > +  Renesas R-Car family of devices.
> > +
> > +  Each VIN instance has a single parallel input that supports RGB and YUV video,
> > +  with both external synchronization and BT.656 synchronization for the latter.
> > +  Depending on the instance the VIN input is connected to external SoC pins, or
> > +  on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +        - enum:
> > +          - renesas,vin-r8a7743  # RZ/G1M
> > +          - renesas,vin-r8a7744  # RZ/G1N
> > +          - renesas,vin-r8a7745  # RZ/G1E
> > +          - renesas,vin-r8a77470 # RZ/G1C
> > +          - renesas,vin-r8a7790  # R-Car H2
> > +          - renesas,vin-r8a7791  # R-Car M2-W
> > +          - renesas,vin-r8a7792  # R-Car V2H
> > +          - renesas,vin-r8a7793  # R-Car M2-N
> > +          - renesas,vin-r8a7794  # R-Car E2
> > +        - const: renesas,rcar-gen2-vin # Generic R-Car Gen2 or RZ/G1
> > +
> > +      - items:
> > +        - enum:
> > +          - renesas,vin-r8a774a1 # RZ/G2M
> > +          - renesas,vin-r8a774b1 # RZ/G2N
> > +          - renesas,vin-r8a774c0 # RZ/G2E
> > +          - renesas,vin-r8a7778  # R-Car M1
> > +          - renesas,vin-r8a7779  # R-Car H1
> > +          - renesas,vin-r8a7795  # R-Car H3
> > +          - renesas,vin-r8a7796  # R-Car M3-W
> > +          - renesas,vin-r8a77965 # R-Car M3-N
> > +          - renesas,vin-r8a77970 # R-Car V3M
> > +          - renesas,vin-r8a77980 # R-Car V3H
> > +          - renesas,vin-r8a77990 # R-Car E3
> > +          - renesas,vin-r8a77995 # R-Car D3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  #The per-board settings for Gen2 and RZ/G1 platforms:
> > +  port:
> > +    type: object
> > +    description: |-
> > +      A node containing a parallel input with a singel endpoint definitions as
> > +      documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +    properties:
> > +      reg:
> > +        const: 1
> 
> Do you need reg for the single 'port' ?
> 
> > +
> > +      endpoint:
> > +        type: object
> > +
> > +        properties:
> > +          hsync-active:
> > +            description: |-
> > +              Default is active high. If both HSYNC and VSYNC polarities are not
> > +              specified, embedded synchronization is selected.
> > +            enum: [ 0, 1 ]
> > +
> > +          vsync-active:
> > +            description: |-
> > +              Default is active high. If both HSYNC and VSYNC polarities are not
> > +              specified, embedded synchronization is selected.
> > +            enum: [ 0, 1 ]
> > +
> > +          field-active-even:
> > +            description: Default is active high.
> > +            enum: [ 0, 1 ]
> > +
> > +          bus-width:
> > +            enum: [ 8, 10, 12, 16, 24, 32 ]
> > +
> > +          data-shift:
> > +            enum: [ 0, 8 ]
> > +
> > +          data-enable-active:
> > +            description: Polarity of CLKENB signal, default is active high.
> > +            enum: [ 0, 1 ]
> > +
> > +          pclk-sample:
> > +            enum: [ 0, 1 ]
> > +
> > +          data-active:
> > +            enum: [ 0, 1 ]
> > +
> > +          remote-endpoint:
> > +            maxItems: 1
> > +
> > +        required:
> > +          - remote-endpoint
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +  #The per-board settings for Gen3 and RZ/G2 platforms:
> > +  renesas,id:
> > +    description: VIN channel number
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +      - enum: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ]
> > +
> > +  ports:
> > +    type: object
> > +    description: |-
> > +      A node containing input nodes with endpoint definitions as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: |-
> > +          Input port node, single endpoint describing a parallel input source.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              hsync-active:
> > +                description: |-

Drop the literal block (|-).

> > +                  Default is active high. If both HSYNC and VSYNC polarities are not
> > +                  specified, embedded synchronization is selected.

Express defaults as a schema:

default: 1

> > +                enum: [ 0, 1 ]

Unless a subset of possible values apply, assume this is defined 
elsewhere (hopefully someone converts video-interfaces.txt to schema 
soon).

> > +
> > +              vsync-active:
> > +                description: |-
> > +                  Default is active high. If both HSYNC and VSYNC polarities are not
> > +                  specified, embedded synchronization is selected.
> > +                enum: [ 0, 1 ]
> > +
> > +              field-active-even:
> > +                description: Default is active high.
> > +                enum: [ 0, 1 ]
> > +
> > +              bus-width:
> > +                enum: [ 8, 10, 12, 16, 24, 32 ]
> > +
> > +              data-shift:
> > +                enum: [ 0, 8 ]
> 
> Why are those two not described ? I feel like or you either refrain
> from describing all poperties and point the reader to
> video-interfaces.txt, or you describe all of them, at least to provide
> an indication of the default if the property is not specified.
> 
> > +
> > +              data-enable-active:
> > +                description: Polarity of CLKENB signal, default is active high.
> > +                enum: [ 0, 1 ]
> > +
> > +              pclk-sample:
> > +                enum: [ 0, 1 ]
> > +
> > +              data-active:
> > +                enum: [ 0, 1 ]
> > +
> > +              remote-endpoint:
> > +                maxItems: 1

Just 'true' is enough here. Assume it's defined as a phandle elsewhere.

> > +
> > +            required:
> > +              - remote-endpoint
> > +
> > +            additionalProperties: false
> > +
> > +        additionalProperties: false
> > +
> > +      port@1:
> > +        type: object
> > +        description: |-
> > +          Input port node, multiple endpoints describing all the R-Car CSI-2
> > +          modules connected the VIN.
> > +
> > +        properties:
> > +          '#address-cells':
> > +            const: 1
> > +
> > +          '#size-cells':
> > +            const: 0
> > +
> > +          reg:
> > +            const: 1
> > +
> > +          endpoint@0:
> > +            type: object
> > +            description: Endpoint connected to CSI20.
> > +
> > +            properties:
> > +              reg:
> > +                const: 0
> > +
> > +              remote-endpoint:
> > +                maxItems: 1
> > +
> > +            required:
> > +              - reg
> > +              - remote-endpoint
> > +
> > +            additionalProperties: false
> > +
> > +          endpoint@1:
> > +            type: object
> > +            description: Endpoint connected to CSI21.
> > +
> > +            properties:
> > +              reg:
> > +                const: 1
> > +
> > +              remote-endpoint:
> > +                maxItems: 1
> > +
> > +            required:
> > +              - reg
> > +              - remote-endpoint
> > +
> > +            additionalProperties: false
> > +
> > +          endpoint@2:
> > +            type: object
> > +            description: Endpoint connected to CSI40.
> > +
> > +            properties:
> > +              reg:
> > +                const: 2
> > +
> > +              remote-endpoint:
> > +                maxItems: 1
> > +
> > +            required:
> > +              - reg
> > +              - remote-endpoint
> > +
> > +            additionalProperties: false
> > +
> > +          endpoint@3:
> > +            type: object
> > +            description: Endpoint connected to CSI41.
> > +
> > +            properties:
> > +              reg:
> > +                const: 3
> > +
> > +              remote-endpoint:
> > +                maxItems: 1
> > +
> > +            required:
> > +              - reg
> > +              - remote-endpoint
> 
> Here and in the other endpoints of port@1, do you need required
> properties ? As I read in writing-schema.rts:
> "Unless noted otherwise, all properties are required."

That is referring to schema properties ($id, properties, title, etc.), 
not binding properties. That's also just the top-level 
properties/keywords. If that's confusing, try reading the meta-schemas 
which has schema keywords as both properties and schema.


> > +
> > +            additionalProperties: false
> > +
> > +        additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - power-domains
> > +  - resets
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        anyOf:
> > +          - const: renesas,vin-r8a7778
> > +          - const: renesas,vin-r8a7779
> > +          - const: renesas,rcar-gen2-vin
> > +then:
> > +  required:
> > +    - port
> > +else:
> > +  required:
> > +    - renesas,id
> > +    - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # Device node example for Gen2 platform
> > +  - |
> > +    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/r8a7790-sysc.h>
> > +
> > +    vin1: vin@e6ef1000 {
> > +            compatible = "renesas,vin-r8a7790",
> > +                         "renesas,rcar-gen2-vin";
> > +            reg = <0 0xe6ef1000 0 0x1000>;
> > +            interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> > +            clocks = <&cpg CPG_MOD 810>;
> > +            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> > +            resets = <&cpg 810>;
> > +
> > +            port {
> > +                    vin1ep0: endpoint {
> > +                            remote-endpoint = <&adv7180>;
> > +                            bus-width = <8>;
> > +                    };
> > +            };
> > +    };
> > +
> > +  # Device node example for Gen3 platform with only CSI-2
> > +  - |
> > +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > +
> > +    vin0: video@e6ef0000 {
> > +            compatible = "renesas,vin-r8a7795";
> > +            reg = <0 0xe6ef0000 0 0x1000>;
> > +            interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> > +            clocks = <&cpg CPG_MOD 811>;
> > +            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> > +            resets = <&cpg 811>;
> > +            renesas,id = <0>;
> > +
> > +            ports {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> > +                    port@1 {
> > +                            #address-cells = <1>;
> > +                            #size-cells = <0>;
> > +
> > +                            reg = <1>;
> > +
> > +                            vin0csi20: endpoint@0 {
> > +                                    reg = <0>;
> > +                                    remote-endpoint= <&csi20vin0>;
> > +                            };
> > +                            vin0csi40: endpoint@2 {
> > +                                    reg = <2>;
> > +                                    remote-endpoint= <&csi40vin0>;
> > +                            };
> > +                    };
> > +            };
> > +    };
> > +
> > +  # Device node example for Gen3 platform with CSI-2 and parallel
> > +  - |
> > +    #include <dt-bindings/clock/r8a77970-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/r8a77970-sysc.h>
> > +
> > +    vin2: video@e6ef2000 {
> > +            compatible = "renesas,vin-r8a77970";
> > +            reg = <0 0xe6ef2000 0 0x1000>;
> > +            interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> > +            clocks = <&cpg CPG_MOD 809>;
> > +            power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> > +            resets = <&cpg 809>;
> > +            renesas,id = <2>;
> > +
> > +            ports {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> > +                    port@0 {
> > +                            reg = <0>;
> > +
> > +                            vin2_in: endpoint {
> > +                                    remote-endpoint = <&adv7612_out>;
> > +                                    hsync-active = <0>;
> > +                                    vsync-active = <0>;
> > +                            };
> > +                    };
> > +
> > +                    port@1 {
> > +                            #address-cells = <1>;
> > +                            #size-cells = <0>;
> > +
> > +                            reg = <1>;
> > +
> > +                            vin2csi40: endpoint@2 {
> > +                                    reg = <2>;
> > +                                    remote-endpoint = <&csi40vin2>;
> > +                            };
> > +                    };
> > +            };
> > +    };
> 
> I can't really comment on the json-schema most complex parts, but from
> a device point of view, minors apart, it seems sane to me.
> 
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Thanks
>   j
> 
> > --
> > 2.23.0
> >


