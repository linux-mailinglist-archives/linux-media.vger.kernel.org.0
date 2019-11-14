Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64CC1FCAB7
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 17:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfKNQZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 11:25:58 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34255 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfKNQZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 11:25:57 -0500
Received: by mail-oi1-f196.google.com with SMTP id l202so5829122oig.1;
        Thu, 14 Nov 2019 08:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/NTmWPmp8GMLo6UVdc+VGmjKBW/gWIFHb/AVLkYiROg=;
        b=Zj5qFzT0YmEnriONVBtflgEwzlSNY/pYqq3x/IeONkfUuYMuuVeRrUMB1PIJJRdPH4
         B4/cbR9ZEn0qhER7kcVDgfYTVUabEQlKjgEE5nUWMk2Qqp+n9H7jgvspqdR7hEj9eoUd
         qLsflUzWUFkWsD14r9RvfCr9hn/7I5zKsdEm/5uOhgsj+nvvIAvVDytNlaxZvTbB+M3L
         D8i+XK+7ZaNpyZhJPU16Dk9nPaFgNnBLG8+DF04Xue8azzbUJGAsXSTh2ZAlGOqF8cpu
         PSUxHybwaiY5OVtgijjZ93FLGVnLJbVB1uMW8DChi91h2ztrwIFHhZO+AqYn4DYWPSil
         sHoA==
X-Gm-Message-State: APjAAAUWSNYZCN4PnknThbhBcdQT3k+vTBexEM3CBJiqFSN6ILNSOdsI
        A9MrYwYveG2xZDNBjdjZas7roZ0=
X-Google-Smtp-Source: APXvYqx3Ony5vD2zT/+w0HVcd09IyLTLfgtFi6iX9MgkLqkYxtMFglwyF0tV/CWms0+vzYVYIpyftg==
X-Received: by 2002:aca:3f87:: with SMTP id m129mr4299050oia.30.1573748755626;
        Thu, 14 Nov 2019 08:25:55 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b62sm1931528oia.6.2019.11.14.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 08:25:54 -0800 (PST)
Date:   Thu, 14 Nov 2019 10:25:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rcar-csi2: Convert bindings to json-schema
Message-ID: <20191114162554.GA31116@bogus>
References: <20191108021748.2584486-1-niklas.soderlund+renesas@ragnatech.se>
 <20191112104110.nxjntjaqudaw2n7x@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112104110.nxjntjaqudaw2n7x@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 11:41:10AM +0100, Jacopo Mondi wrote:
> Hi Niklas,
>    thanks for the patch
> 
> On Fri, Nov 08, 2019 at 03:17:48AM +0100, Niklas Söderlund wrote:
> > Convert Renesas R-Car MIPI CSI-2 receiver bindings documentation to
> > json-schema.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../bindings/media/renesas,csi2.txt           | 107 ----------
> >  .../bindings/media/renesas,csi2.yaml          | 200 ++++++++++++++++++
> >  2 files changed, 200 insertions(+), 107 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> > deleted file mode 100644
> > index 2da6f60b2b5659f6..0000000000000000
> > --- a/Documentation/devicetree/bindings/media/renesas,csi2.txt
> > +++ /dev/null
> > @@ -1,107 +0,0 @@
> > -Renesas R-Car MIPI CSI-2
> > -------------------------
> > -
> > -The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
> > -Renesas R-Car and RZ/G2 family of devices. It is used in conjunction with the
> > -R-Car VIN module, which provides the video capture capabilities.
> > -
> > -Mandatory properties
> > ---------------------
> > - - compatible: Must be one or more of the following
> > -   - "renesas,r8a774a1-csi2" for the R8A774A1 device.
> > -   - "renesas,r8a774b1-csi2" for the R8A774B1 device.
> > -   - "renesas,r8a774c0-csi2" for the R8A774C0 device.
> > -   - "renesas,r8a7795-csi2" for the R8A7795 device.
> > -   - "renesas,r8a7796-csi2" for the R8A7796 device.
> > -   - "renesas,r8a77965-csi2" for the R8A77965 device.
> > -   - "renesas,r8a77970-csi2" for the R8A77970 device.
> > -   - "renesas,r8a77980-csi2" for the R8A77980 device.
> > -   - "renesas,r8a77990-csi2" for the R8A77990 device.
> > -
> > - - reg: the register base and size for the device registers
> > - - interrupts: the interrupt for the device
> > - - clocks: A phandle + clock specifier for the module clock
> > - - resets: A phandle + reset specifier for the module reset
> > -
> > -The device node shall contain two 'port' child nodes according to the
> > -bindings defined in Documentation/devicetree/bindings/media/
> > -video-interfaces.txt. port@0 shall connect to the CSI-2 source. port@1
> > -shall connect to all the R-Car VIN modules that have a hardware
> > -connection to the CSI-2 receiver.
> > -
> > -- port@0- Video source (mandatory)
> > -	- endpoint@0 - sub-node describing the endpoint that is the video source
> > -
> > -- port@1 - VIN instances (optional)
> > -	- One endpoint sub-node for every R-Car VIN instance which is connected
> > -	  to the R-Car CSI-2 receiver.
> > -
> > -Example:
> > -
> > -	csi20: csi2@fea80000 {
> > -		compatible = "renesas,r8a7796-csi2";
> > -		reg = <0 0xfea80000 0 0x10000>;
> > -		interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks = <&cpg CPG_MOD 714>;
> > -		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > -		resets = <&cpg 714>;
> > -
> > -		ports {
> > -			#address-cells = <1>;
> > -			#size-cells = <0>;
> > -
> > -			port@0 {
> > -				#address-cells = <1>;
> > -				#size-cells = <0>;
> > -
> > -				reg = <0>;
> > -
> > -				csi20_in: endpoint@0 {
> > -					reg = <0>;
> > -					clock-lanes = <0>;
> > -					data-lanes = <1>;
> > -					remote-endpoint = <&adv7482_txb>;
> > -				};
> > -			};
> > -
> > -			port@1 {
> > -				#address-cells = <1>;
> > -				#size-cells = <0>;
> > -
> > -				reg = <1>;
> > -
> > -				csi20vin0: endpoint@0 {
> > -					reg = <0>;
> > -					remote-endpoint = <&vin0csi20>;
> > -				};
> > -				csi20vin1: endpoint@1 {
> > -					reg = <1>;
> > -					remote-endpoint = <&vin1csi20>;
> > -				};
> > -				csi20vin2: endpoint@2 {
> > -					reg = <2>;
> > -					remote-endpoint = <&vin2csi20>;
> > -				};
> > -				csi20vin3: endpoint@3 {
> > -					reg = <3>;
> > -					remote-endpoint = <&vin3csi20>;
> > -				};
> > -				csi20vin4: endpoint@4 {
> > -					reg = <4>;
> > -					remote-endpoint = <&vin4csi20>;
> > -				};
> > -				csi20vin5: endpoint@5 {
> > -					reg = <5>;
> > -					remote-endpoint = <&vin5csi20>;
> > -				};
> > -				csi20vin6: endpoint@6 {
> > -					reg = <6>;
> > -					remote-endpoint = <&vin6csi20>;
> > -				};
> > -				csi20vin7: endpoint@7 {
> > -					reg = <7>;
> > -					remote-endpoint = <&vin7csi20>;
> > -				};
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > new file mode 100644
> > index 0000000000000000..a6d2b597c4944693
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > @@ -0,0 +1,200 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> GPL-2.0-only
> 
> > +# Copyright (C) 2019 Renesas Electronics Corp.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/renesas,csi2.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car MIPI CSI-2 receiver
> > +
> > +maintainers:
> > +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > +
> > +description: |-
> > +  The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
> > +  Renesas R-Car and RZ/G2 family of devices. It is used in conjunction with the
> > +  R-Car VIN module, which provides the video capture capabilities.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - renesas,r8a774a1-csi2 # RZ/G2M
> > +        - renesas,r8a774b1-csi2 # RZ/G2N
> > +        - renesas,r8a774c0-csi2 # RZ/G2E
> > +        - renesas,r8a7795-csi2  # R-Car H3
> > +        - renesas,r8a7796-csi2  # R-Car M3-W
> > +        - renesas,r8a77965-csi2 # R-Car M3-N
> > +        - renesas,r8a77970-csi2 # R-Car V3M
> > +        - renesas,r8a77980-csi2 # R-Car V3H
> > +        - renesas,r8a77990-csi2 # R-Car E3
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
> > +  ports:
> > +    type: object
> > +    description: |-

Drop the literal block when not needed.

> > +      A node containing input and output port nodes with endpoint definitions
> > +      as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: |-
> > +          Input port node, single endpoint describing the CSI-2 transmitter.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> 
> Does the R-Car CSI-2 receiver allows changing swapping the clock lane?
> I see it allows swapping data lanes, but not the clock lane, through
> register LSWAP.
> 
> Several Gen3 DTS specify that property, if you agree it could be
> removed or you either fix the DTS as well by removing it, or you keep
> the property here as optional
> 
> I however see that the clock continuous mode could be handled through
> the ICLK_NONSTOP bit of LINKCNT register. Should the
> clock-noncontinuous property be listed here ?
> 
> > +
> > +              data-lanes:
> > +                maxItems: 1
> > +
> > +              remote-endpoint:
> > +                maxItems: 1

Not an array. Just 'true' is sufficient.

> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +              - remote-endpoint
> > +
> > +            additionalProperties: false
> > +
> > +        additionalProperties: false
> 
> I'm not sure about the additionalProperties intended use, but you seem
> to place it in every node, something other bindings do not seems to
> do.

It means any other property not listed here will be an error. Simple 
bindings should have it, but it doesn't work for ones which include 
another schema file.

> > +
> > +      port@1:
> > +        type: object
> > +        description: |-
> > +          Output port node, multiple endpoints describing all the R-Car VIN
> > +          modules connected the CSI-2 receiver.
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
> > +        patternProperties:
> > +          "^endpoint@[0-9]+$":
> 
> Doesn't this allow endpoint@99 ? Should this be limited to the maxium
> number of VINs  (16 if I'm not mistaken) ?

And it is also decimal instead of hex.

> 
> 
> > +            type: object
> > +
> > +            properties:
> > +              reg:
> > +                maxItems: 1
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
> > +        additionalProperties: false
> 
> The textual bindings describe port@1 as optional but port@0 as
> mandatory. If this is correct shouldn't we have it listed here as
> required ?
> 
> Thanks
>    j
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - power-domains
> > +  - resets
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/r8a7796-sysc.h>
> > +
> > +    csi20: csi2@fea80000 {
> > +            compatible = "renesas,r8a7796-csi2";
> > +            reg = <0 0xfea80000 0 0x10000>;
> > +            interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
> > +            clocks = <&cpg CPG_MOD 714>;
> > +            power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +            resets = <&cpg 714>;
> > +
> > +            ports {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> > +                    port@0 {
> > +                            reg = <0>;
> > +
> > +                            csi20_in: endpoint {
> > +                                    clock-lanes = <0>;
> > +                                    data-lanes = <1>;
> > +                                    remote-endpoint = <&adv7482_txb>;
> > +                            };
> > +                    };
> > +
> > +                    port@1 {
> > +                            #address-cells = <1>;
> > +                            #size-cells = <0>;
> > +
> > +                            reg = <1>;
> > +
> > +                            csi20vin0: endpoint@0 {
> > +                                    reg = <0>;
> > +                                    remote-endpoint = <&vin0csi20>;
> > +                            };
> > +                            csi20vin1: endpoint@1 {
> > +                                    reg = <1>;
> > +                                    remote-endpoint = <&vin1csi20>;
> > +                            };
> > +                            csi20vin2: endpoint@2 {
> > +                                    reg = <2>;
> > +                                    remote-endpoint = <&vin2csi20>;
> > +                            };
> > +                            csi20vin3: endpoint@3 {
> > +                                    reg = <3>;
> > +                                    remote-endpoint = <&vin3csi20>;
> > +                            };
> > +                            csi20vin4: endpoint@4 {
> > +                                    reg = <4>;
> > +                                    remote-endpoint = <&vin4csi20>;
> > +                            };
> > +                            csi20vin5: endpoint@5 {
> > +                                    reg = <5>;
> > +                                    remote-endpoint = <&vin5csi20>;
> > +                            };
> > +                            csi20vin6: endpoint@6 {
> > +                                    reg = <6>;
> > +                                    remote-endpoint = <&vin6csi20>;
> > +                            };
> > +                            csi20vin7: endpoint@7 {
> > +                                    reg = <7>;
> > +                                    remote-endpoint = <&vin7csi20>;
> > +                            };
> > +                    };
> > +            };
> > +    };
> > --
> > 2.23.0
> >


