Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E2443D38E
	for <lists+linux-media@lfdr.de>; Wed, 27 Oct 2021 23:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244194AbhJ0VLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 17:11:38 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33389 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235939AbhJ0VLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 17:11:37 -0400
Received: by mail-oi1-f169.google.com with SMTP id q129so5383231oib.0;
        Wed, 27 Oct 2021 14:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Hw83hMJmCtxiL5x7TuXqw5DZFTuJb4Rf63vmKsiFGQE=;
        b=ryL/Uvo1jXfpK0O0jmeEjL51hIJErsMREd2ajAMUXf1io/7+fn/1X2T+I3cW+zpCyl
         2w+M0baYMOZoKzSLlOZxQpCiAUlH7PqDRCZSL7xHouGPjU1ROUSgy08YZ4xSj3SUHONF
         G+KD/xe/j4Mg5fZfuDxC9VG+PJKEH3Sp8gsAowaadIiT0VcooxDoPqj1gubBfy7VesPL
         RPudYqJ5FJPYm/y5V7mjAmTxjEG3/Qaa1DwodR3f57eFSOx5VKuRZbKCrtmSeGx7gYu/
         lUKL+o4lIXvx8Wn3wM+/r4FoYwZZU5B1x6HlhvFigF/SjZe7VYagygflRe8Y+ZCrN+vB
         ypUg==
X-Gm-Message-State: AOAM533kvOBfsTp+vq1izD/8f1KPwqx9yrLDAQVIsnhGFOZjMGytF82m
        AE7IPrmUfpvcDzXeKerMIvdIPaVf9Q==
X-Google-Smtp-Source: ABdhPJy6uB62ShxE0tQNqd4saAwsNz9wnJhvJtX9VN/A/501WBXPSQMfMFiAn8dGkjT8ASce9vBqQQ==
X-Received: by 2002:a05:6808:1306:: with SMTP id y6mr56687oiv.160.1635368951322;
        Wed, 27 Oct 2021 14:09:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n187sm377317oif.52.2021.10.27.14.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:09:10 -0700 (PDT)
Received: (nullmailer pid 2164222 invoked by uid 1000);
        Wed, 27 Oct 2021 21:09:09 -0000
Date:   Wed, 27 Oct 2021 16:09:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v3] dt-bindings: adv748x: Convert bindings to json-schema
Message-ID: <YXm/9cVkJnMqwktY@robh.at.kernel.org>
References: <20211019192044.782830-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211019192044.782830-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 19, 2021 at 09:20:44PM +0200, Niklas Söderlund wrote:
> Convert ADV748X analog video decoder documentation to json-schema.
> 
> While converting the bindings extend it to enforce that all port@n nodes
> shall be encapsulated inside a ports node. This change does not have an
> effect on drivers parsing the ports@n nodes.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> * Changes sinve v2
> - Add adv748x.yaml to MAINTAINERS.
> - Update commit message.
> - Add myself to under the maintainers section after talking with Kieran.
> - Split reg in examples in two lines to match reg-names.
> 
> * Changes since v1
> - Update commit message to mention the added ports node.
> 
> Hello,
> 
> This conversion revealed a problem with the Renesas DTSI files for the
> adv7482 nodes. A fix for that have been submitted in a separate patch,
> 
>     [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes
> 
> Kind Regards,
> Niklas Söderlund
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt | 116 ----------
>  .../bindings/media/i2c/adv748x.yaml           | 213 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 214 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> deleted file mode 100644
> index 4f91686e54a6b939..0000000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -* Analog Devices ADV748X video decoder with HDMI receiver
> -
> -The ADV7481 and ADV7482 are multi format video decoders with an integrated
> -HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
> -from three input sources HDMI, analog and TTL.
> -
> -Required Properties:
> -
> -  - compatible: Must contain one of the following
> -    - "adi,adv7481" for the ADV7481
> -    - "adi,adv7482" for the ADV7482
> -
> -  - reg: I2C slave addresses
> -    The ADV748x has up to twelve 256-byte maps that can be accessed via the
> -    main I2C ports. Each map has it own I2C address and acts as a standard
> -    slave device on the I2C bus. The main address is mandatory, others are
> -    optional and remain at default values if not specified.
> -
> -Optional Properties:
> -
> -  - interrupt-names: Should specify the interrupts as "intrq1", "intrq2" and/or
> -		     "intrq3". All interrupts are optional. The "intrq3" interrupt
> -		     is only available on the adv7481
> -  - interrupts: Specify the interrupt lines for the ADV748x
> -  - reg-names : Names of maps with programmable addresses.
> -		It shall contain all maps needing a non-default address.
> -		Possible map names are:
> -		  "main", "dpll", "cp", "hdmi", "edid", "repeater",
> -		  "infoframe", "cbus", "cec", "sdp", "txa", "txb"
> -
> -The device node must contain one 'port' child node per device input and output
> -port, in accordance with the video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
> -are numbered as follows.
> -
> -	  Name		Type		Port
> -	---------------------------------------
> -	  AIN0		sink		0
> -	  AIN1		sink		1
> -	  AIN2		sink		2
> -	  AIN3		sink		3
> -	  AIN4		sink		4
> -	  AIN5		sink		5
> -	  AIN6		sink		6
> -	  AIN7		sink		7
> -	  HDMI		sink		8
> -	  TTL		sink		9
> -	  TXA		source		10
> -	  TXB		source		11
> -
> -The digital output port nodes, when present, shall contain at least one
> -endpoint. Each of those endpoints shall contain the data-lanes property as
> -described in video-interfaces.txt.
> -
> -Required source endpoint properties:
> -  - data-lanes: an array of physical data lane indexes
> -    The accepted value(s) for this property depends on which of the two
> -    sources are described. For TXA 1, 2 or 4 data lanes can be described
> -    while for TXB only 1 data lane is valid. See video-interfaces.txt
> -    for detailed description.
> -
> -Ports are optional if they are not connected to anything at the hardware level.
> -
> -Example:
> -
> -	video-receiver@70 {
> -		compatible = "adi,adv7482";
> -		reg = <0x70 0x71 0x72 0x73 0x74 0x75
> -		       0x60 0x61 0x62 0x63 0x64 0x65>;
> -		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
> -			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
> -
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		interrupt-parent = <&gpio6>;
> -		interrupt-names = "intrq1", "intrq2";
> -		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
> -			     <31 IRQ_TYPE_LEVEL_LOW>;
> -
> -		port@7 {
> -			reg = <7>;
> -
> -			adv7482_ain7: endpoint {
> -				remote-endpoint = <&cvbs_in>;
> -			};
> -		};
> -
> -		port@8 {
> -			reg = <8>;
> -
> -			adv7482_hdmi: endpoint {
> -				remote-endpoint = <&hdmi_in>;
> -			};
> -		};
> -
> -		port@a {
> -			reg = <10>;
> -
> -			adv7482_txa: endpoint {
> -				clock-lanes = <0>;
> -				data-lanes = <1 2 3 4>;
> -				remote-endpoint = <&csi40_in>;
> -			};
> -		};
> -
> -		port@b {
> -			reg = <11>;
> -
> -			adv7482_txb: endpoint {
> -				clock-lanes = <0>;
> -				data-lanes = <1>;
> -				remote-endpoint = <&csi20_in>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> new file mode 100644
> index 0000000000000000..30c361766ba3023e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> @@ -0,0 +1,213 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/adv748x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADV748X video decoder with HDMI receiver
> +
> +maintainers:
> +  - Kieran Bingham <kieran.bingham@ideasonboard.com>
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +
> +description:
> +  The ADV7481 and ADV7482 are multi format video decoders with an integrated
> +  HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
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
> +      The ADV748x has up to twelve 256-byte maps that can be accessed via the
> +      main I2C ports. Each map has it own I2C address and acts as a standard
> +      slave device on the I2C bus. The main address is mandatory, others are
> +      optional and remain at default values if not specified.
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: main
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
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
> +          Output port node, single endpoint describing the CSI-2 transmitter TXA.
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
> +          Output port node, single endpoint describing the CSI-2 transmitter TXB.
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

minItems: 1
maxItems: 3
items:
  enum: [ intrq1, intrq2, intrq3 ]

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

Similar here.

> +
> +additionalProperties: false
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
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        video-receiver@70 {
> +            compatible = "adi,adv7482";
> +            reg = <0x70 0x71 0x72 0x73 0x74 0x75
> +                   0x60 0x61 0x62 0x63 0x64 0x65>;
> +            reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
> +                        "infoframe", "cbus", "cec", "sdp", "txa", "txb";
> +
> +            interrupt-parent = <&gpio6>;
> +            interrupts = <30 IRQ_TYPE_LEVEL_LOW>, <31 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-names = "intrq1", "intrq2";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@7 {
> +                    reg = <7>;
> +
> +                    adv7482_ain7: endpoint {
> +                        remote-endpoint = <&cvbs_in>;
> +                    };
> +                };
> +
> +                port@8 {
> +                    reg = <8>;
> +
> +                    adv7482_hdmi: endpoint {
> +                        remote-endpoint = <&hdmi_in>;
> +                    };
> +                };
> +
> +                port@a {
> +                    reg = <10>;
> +
> +                    adv7482_txa: endpoint {
> +                        clock-lanes = <0>;
> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&csi40_in>;
> +                    };
> +                };
> +
> +                port@b {
> +                    reg = <11>;
> +
> +                    adv7482_txb: endpoint {
> +                        clock-lanes = <0>;
> +                        data-lanes = <1>;
> +                        remote-endpoint = <&csi20_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ee91c5472bc1540a..6ea3e63cbc7f33c3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1124,6 +1124,7 @@ M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	drivers/media/i2c/adv748x/*
> +F:	Documentation/devicetree/bindings/media/i2c/adv748x.yaml
>  
>  ANALOG DEVICES INC ADV7511 DRIVER
>  M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
> -- 
> 2.33.1
> 
> 
