Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A513A4005F5
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 21:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349426AbhICTkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 15:40:10 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46665 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348976AbhICTkK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 15:40:10 -0400
Received: by mail-ot1-f42.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso304394ott.13;
        Fri, 03 Sep 2021 12:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vxZ7/IKrYvf4sUb2KR1Kn4kmKcTB6a6zAmQiBxZJvPI=;
        b=qwoP63LCsXGkqGdS1U0ZCaHRQouTUW2Y1uFRgVrZfelLi6z2atsU79Kn1pRvQvmtfC
         kvahrwZ1lbdaNseSgNHyks2ixQxT/ysYMabcR97jr65DiJE6L5ILlZW10NrCVqMPoeW5
         ZAzmwQJdxw975xDKQzr4wHksIpYArQZrOP2Tp00foEe9Jyohg5HbiWg3A5cxH5ktsn+F
         N18gFeia4LENzFZy/xh+Q7LEa+IS56LDtIUg0DSw88ODluSHM8SySE0aYujZ3eVXaZav
         huPr/XSW724m2XtiAPdeCY4A3nEs6hB2Lr/d8Ln+VywG976QtPioEhJQ9xnIOnEr4R2+
         Z80A==
X-Gm-Message-State: AOAM5328Ce1l9xyxjbTWcOt4RloM9Wh6fJh0HpSz+Nxcc3IhRkwLne4+
        k4PAYdW115akBo3+WI5b6Q==
X-Google-Smtp-Source: ABdhPJw289gJj0AxbR/U4vPg1x2vnJnuLUfNi/ZoXa1/Ea0jhSY6OEDLdCxXKDBhd4uMjneW5xEv2Q==
X-Received: by 2002:a05:6830:70d:: with SMTP id y13mr606742ots.278.1630697949687;
        Fri, 03 Sep 2021 12:39:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y26sm67318oih.2.2021.09.03.12.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:39:09 -0700 (PDT)
Received: (nullmailer pid 3331121 invoked by uid 1000);
        Fri, 03 Sep 2021 19:39:08 -0000
Date:   Fri, 3 Sep 2021 14:39:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v2 27/52] dt-bindings: media: Convert OV5640 binding to a
 schema
Message-ID: <YTJ53KbAeoO9sKEk@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-28-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-28-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 01, 2021 at 11:18:27AM +0200, Maxime Ripard wrote:
> The Omnivision OV5640 is supported by Linux thanks to its device tree
> binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: linux-media@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/media/i2c/ov5640.txt  |  92 -----------
>  .../bindings/media/i2c/ovti,ov5640.yaml       | 154 ++++++++++++++++++
>  2 files changed, 154 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> deleted file mode 100644
> index c97c2f2da12d..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -* Omnivision OV5640 MIPI CSI-2 / parallel sensor
> -
> -Required Properties:
> -- compatible: should be "ovti,ov5640"
> -- clocks: reference to the xclk input clock.
> -- clock-names: should be "xclk".
> -- DOVDD-supply: Digital I/O voltage supply, 1.8 volts
> -- AVDD-supply: Analog voltage supply, 2.8 volts
> -- DVDD-supply: Digital core voltage supply, 1.5 volts
> -
> -Optional Properties:
> -- reset-gpios: reference to the GPIO connected to the reset pin, if any.
> -	       This is an active low signal to the OV5640.
> -- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> -		   if any. This is an active high signal to the OV5640.
> -- rotation: as defined in
> -	    Documentation/devicetree/bindings/media/video-interfaces.txt,
> -	    valid values are 0 (sensor mounted upright) and 180 (sensor
> -	    mounted upside down).
> -
> -The device node must contain one 'port' child node for its digital output
> -video port, in accordance with the video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -OV5640 can be connected to a MIPI CSI-2 bus or a parallel bus endpoint.
> -
> -Endpoint node required properties for CSI-2 connection are:
> -- remote-endpoint: a phandle to the bus receiver's endpoint node.
> -- clock-lanes: should be set to <0> (clock lane on hardware lane 0)
> -- data-lanes: should be set to <1> or <1 2> (one or two CSI-2 lanes supported)
> -
> -Endpoint node required properties for parallel connection are:
> -- remote-endpoint: a phandle to the bus receiver's endpoint node.
> -- bus-width: shall be set to <8> for 8 bits parallel bus
> -	     or <10> for 10 bits parallel bus
> -- data-shift: shall be set to <2> for 8 bits parallel bus
> -	      (lines 9:2 are used) or <0> for 10 bits parallel bus
> -- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> -- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> -- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> -	       signal.
> -
> -Examples:
> -
> -&i2c1 {
> -	ov5640: camera@3c {
> -		compatible = "ovti,ov5640";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_ov5640>;
> -		reg = <0x3c>;
> -		clocks = <&clks IMX6QDL_CLK_CKO>;
> -		clock-names = "xclk";
> -		DOVDD-supply = <&vgen4_reg>; /* 1.8v */
> -		AVDD-supply = <&vgen3_reg>;  /* 2.8v */
> -		DVDD-supply = <&vgen2_reg>;  /* 1.5v */
> -		powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
> -		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> -		rotation = <180>;
> -
> -		port {
> -			/* MIPI CSI-2 bus endpoint */
> -			ov5640_to_mipi_csi2: endpoint {
> -				remote-endpoint = <&mipi_csi2_from_ov5640>;
> -				clock-lanes = <0>;
> -				data-lanes = <1 2>;
> -			};
> -		};
> -	};
> -};
> -
> -&i2c1 {
> -	ov5640: camera@3c {
> -		compatible = "ovti,ov5640";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_ov5640>;
> -		reg = <0x3c>;
> -		clocks = <&clk_ext_camera>;
> -		clock-names = "xclk";
> -
> -		port {
> -			/* Parallel bus endpoint */
> -			ov5640_to_parallel: endpoint {
> -				remote-endpoint = <&parallel_from_ov5640>;
> -				bus-width = <8>;
> -				data-shift = <2>; /* lines 9:2 are used */
> -				hsync-active = <0>;
> -				vsync-active = <0>;
> -				pclk-sample = <1>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> new file mode 100644
> index 000000000000..0283b1895a75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV5640 Image Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Steve Longerbeam <slongerbeam@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5640
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: XCLK Input Clock
> +
> +  clock-names:
> +    const: xclk
> +
> +  AVDD-supply:
> +    description: Analog voltage supply, 2.8 volts
> +
> +  DVDD-supply:
> +    description: Digital core voltage supply, 1.5 volts
> +
> +  DOVDD-supply:
> +    description: Digital I/O voltage supply, 1.8 volts
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: >
> +      Reference to the GPIO connected to the powerdown pin, if any.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: >
> +      Reference to the GPIO connected to the reset pin, if any.
> +
> +  rotation:
> +    enum: 
> +      - 0
> +      - 180
> +
> +  port:
> +    description: Digital Output Port
> +    $ref: /schemas/graph.yaml#/properties/port

This needs to be /schemas/graph.yaml#/$defs/port-base

Otherwise, it will fail when we start checking unevaluatedProperties.

> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          clock-lanes:
> +            const: 0
> +
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 2
> +            items:
> +              enum: [1, 2]
> +
> +          bus-width:
> +            enum: [8, 10]
> +
> +          data-shift:
> +            enum: [0, 2]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - AVDD-supply
> +  - DVDD-supply
> +  - DOVDD-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/clock/imx6qdl-clock.h>
> +      #include <dt-bindings/gpio/gpio.h>
> +
> +      i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          camera@3c {
> +              compatible = "ovti,ov5640";
> +              pinctrl-names = "default";
> +              pinctrl-0 = <&pinctrl_ov5640>;
> +              reg = <0x3c>;
> +              clocks = <&clks IMX6QDL_CLK_CKO>;
> +              clock-names = "xclk";
> +              DOVDD-supply = <&vgen4_reg>; /* 1.8v */
> +              AVDD-supply = <&vgen3_reg>;  /* 2.8v */
> +              DVDD-supply = <&vgen2_reg>;  /* 1.5v */
> +              powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
> +              reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> +              rotation = <180>;
> +
> +              port {
> +                  /* MIPI CSI-2 bus endpoint */
> +                  ov5640_to_mipi_csi2: endpoint {
> +                      remote-endpoint = <&mipi_csi2_from_ov5640>;
> +                      clock-lanes = <0>;
> +                      data-lanes = <1 2>;
> +                  };
> +              };
> +          };
> +      };
> +
> +  - |
> +      i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          camera@3c {
> +              compatible = "ovti,ov5640";
> +              pinctrl-names = "default";
> +              pinctrl-0 = <&pinctrl_ov5640>;
> +              reg = <0x3c>;
> +              clocks = <&clk_ext_camera>;
> +              clock-names = "xclk";
> +              DOVDD-supply = <&vgen4_reg>; /* 1.8v */
> +              AVDD-supply = <&vgen3_reg>;  /* 2.8v */
> +              DVDD-supply = <&vgen2_reg>;  /* 1.5v */
> +
> +              port {
> +                  /* Parallel bus endpoint */
> +                  ov5640_to_parallel: endpoint {
> +                      remote-endpoint = <&parallel_from_ov5640>;
> +                      bus-width = <8>;
> +                      data-shift = <2>; /* lines 9:2 are used */
> +                      hsync-active = <0>;
> +                      vsync-active = <0>;
> +                      pclk-sample = <1>;
> +                  };
> +              };
> +          };
> +      };
> +
> +...
> -- 
> 2.31.1
> 
> 
