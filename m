Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7A3224437
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgGQT2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgGQT2j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:28:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076B3C0619D2;
        Fri, 17 Jul 2020 12:28:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A43CA71D;
        Fri, 17 Jul 2020 21:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595014115;
        bh=58QEPNZGsWJAPDZPK7BhOSK2O4YcM/L7nyRGhJuGKE0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=afEArUYLz22IY1RHxusn8pQZtK8xScBT9qJB9M6LxPrN2E6tDbRCHq3iQUL5vxNoj
         npH+V1t2Q54Lz+M+PYukyDYp1wKsgdp5V50YTyfXIA/HE/SipfW+cnckPjieNJHqGW
         MfXbMzfezx56eKACHjGRMHgfTusGEyVOc4G3Hg78=
Date:   Fri, 17 Jul 2020 22:28:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] dt-bindings: media: ov5640: Convert to json-schema
Message-ID: <20200717192827.GB5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-2-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:47PM +0200, Jacopo Mondi wrote:
> Convert the ov5640 bindings document to json-schema.
> 
> This commit ports the existing bindings, clean up patches
> will follow.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5640.txt  |  92 ---------
>  .../devicetree/bindings/media/i2c/ov5640.yaml | 181 ++++++++++++++++++
>  2 files changed, 181 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.yaml
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
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> new file mode 100644
> index 000000000000..ceeacc91c801
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -0,0 +1,181 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov5640.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV5640 MIPI CSI-2 / parallel sensor
> +
> +maintainers:
> +  - Steve Longerbeam <slongerbeam@gmail.com>
> +
> +description: -|
> +  The OV5640 is a 5 megapixels image sensor capable of producing images in RGB,
> +  RAW, YUV and compressed formats. It features a MIPI CSI-2 and a parallel data
> +  interface and an I2C-compatible (CCI) control interface.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5640
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xclk
> +
> +  DOVDD-supply:
> +    description: Digital I/O voltage supply, 1.8 volts.
> +    maxItems: 1
> +
> +  AVDD-supply:
> +    description: Analog voltage supply, 2.8 volts.
> +    maxItems: 1
> +
> +  DVDD-supply:
> +    description: Digital core voltage supply.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: |
> +      Reference to the GPIO connected to the reset pin, if any. This is an
> +      active low signal to the OV5640.
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: |
> +      Reference tot he GPIO connected to the powerdown pin, if any. This is an
> +      active high signal to the OV5640.
> +    maxItems: 1
> +
> +  rotation:
> +    description: |
> +      As defined in Documentation/devicetree/bindings/media/video-interfaces.txt
> +    enum: [0, 180]
> +
> +  port:
> +    type: object
> +    description: |
> +      The device node must contain one 'port' child node for its digital output
> +      video port, in accordance with the video interface bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +      OV5640 can be connected to a MIPI CSI-2 bus or a parallel bus endpoint.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          remote-endpoint:
> +            description: A phandle to the bus receiver's endpoint node.
> +
> +          clock-lanes:
> +            const: 0
> +
> +          data-lanes:
> +            description: |
> +              Should be set to <1> or <1 2> (one or two CSI-2 lanes supported).

I think you can drop the description, it just duplicates the values
below.

> +            oneOf:
> +              - items:
> +                - const: 1
> +              - items:
> +                - const: 1
> +                - const: 2

This could also be written

            minItems: 1
            items:
              - const: 1
              - const: 2

> +
> +          bus-width:
> +            description: |
> +              Shall be set to <8> for 8 bits parallel bus or <10> for 10 bits
> +              parallel bus.

I think I'd drop the description here too. We need to eventually convert
Documentation/devicetree/bindings/media/video-interfaces.txt to YAML,
and descriptions will be stored there.

> +            enum: [8, 10]
> +
> +          data-shift:
> +            description: |
> +              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
> +              <0> for 10 bits parallel bus.
> +            enum: [0, 2]
> +
> +          hsync-active:
> +            enum: [0, 1]
> +
> +          vsync-active:
> +            enum: [0, 1]
> +
> +          pclk-sample:
> +            enum: [0, 1]
> +
> +        required:
> +          - remote-endpoint

You could add

        allOf:
          - if:
              properties:
                bus-width:
                  const: 8
            then:
              properties:
                data-shift:
                  const: 2
              required:
                - data-shift
          - if:
              properties:
                bus-width:
                  const: 10
            then:
              properties:
                data-shift:
                  const: 0
              required:
                - data-shift

To document the relationship between bus-width and data-shift in rules
instead of in the data-shift description.

Could you please take these comments into account for other patches in
the series, where applicable ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - DOVDD-supply
> +  - AVDD-supply
> +  - DVDD-supply
> +  - port
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@3c {
> +            compatible = "ovti,ov5640";
> +            reg = <0x3c>;
> +            clocks = <&clks IMX6QDL_CLK_CKO>;
> +            clock-names = "xclk";
> +            DOVDD-supply = <&vgen4_reg>; /* 1.8v */
> +            AVDD-supply = <&vgen3_reg>;  /* 2.8v */
> +            DVDD-supply = <&vgen2_reg>;  /* 1.5v */
> +            powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> +            rotation = <180>;
> +
> +            port {
> +                ov5640_to_mipi_csi2: endpoint {
> +                    remote-endpoint = <&mipi_csi2_from_ov5640>;
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +    };
> +
> +    i2c1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@3c {
> +            compatible = "ovti,ov5640";
> +            reg = <0x3c>;
> +            clocks = <&clks IMX6QDL_CLK_CKO>;
> +            clock-names = "xclk";
> +            DOVDD-supply = <&vgen4_reg>; /* 1.8v */
> +            AVDD-supply = <&vgen3_reg>;  /* 2.8v */
> +            DVDD-supply = <&vgen2_reg>;  /* 1.5v */
> +            powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> +            rotation = <180>;
> +
> +            port {
> +                ov5640_to_parallel: endpoint {
> +                    remote-endpoint = <&parallel_from_ov5640>;
> +                    bus-width = <10>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
