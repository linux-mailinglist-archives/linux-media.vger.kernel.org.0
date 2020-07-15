Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9955F221326
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 19:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgGOREL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 13:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgGOREL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 13:04:11 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED73C061755;
        Wed, 15 Jul 2020 10:04:10 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j4so3443556wrp.10;
        Wed, 15 Jul 2020 10:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Xco+JsvbbBxT/jk3vE6am4yzH9pwmE7ut0043KQMaFU=;
        b=SZO2XFjNX+tR4ZwY/EJ4TvoCmcHGcwuK/2OVn0YRTxvKkgoWomnXZXIvA5Ru7+Rpyo
         9QKgr79Lf4OHa89EChh8UmvKRB5kqTq6xeItuZSfOPRBnm+DPMEKs3bGk92sz82I98Yd
         Vy4avriXD26sXHwDhyru6Z7VNcskjVWIO8XVZ7pDzPbka3vPFUewGkMhMajqQODG5H8L
         emnQ4/3fijhPl3QhQkyYoLQ+fiJDehN1V4GM5/LS9WF2OY9K28yOsgHX5Jz95RlpcVRn
         dtfLYlkwhyRyY1ALCX3apfpHnLsJAz4Csv8RGq7vuRRVrIVdCKjTqFv9kdhv9aJZZQlv
         +X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Xco+JsvbbBxT/jk3vE6am4yzH9pwmE7ut0043KQMaFU=;
        b=mq/eLA+qPSZ0KyUlaXS+6LYjRwna35uTBV/TjYIir2sXVXJ1fwb8wqP6rigGMjaatD
         7bvU6Nba4WzEJq9Ww5PELy5u41SUREl7xuVv5fCv9vX5Hv0WaI02jGo/8kHgzgRrpu/g
         aQUCifLcTbcBKbfXvgCWzjOXJmh2D1fHpY4GwrYmwRamnEg74ZetQZMkNFAb1zELs0Dq
         vmMhD59cT7BQyJn6sA95y/uLvRp14nADvpNgZza9XaDSfTjFCaDYl4nqh0VZxj+EOYnn
         Z5WtLwAMQjgDFUQlSL5DhX7EAtQ50qcS1IjXKfvxTDkqhQwc08xua80LPk/0hrBd2vzO
         nrIA==
X-Gm-Message-State: AOAM533XVFENUNQQrZtR69j5JE5umeW4QuFpGdbcrtYqrxiRrsWkC5YD
        xz8QoFxojjxFx5nYMRRR2bz7AJL/Hr4=
X-Google-Smtp-Source: ABdhPJwoDeEwtX79FpuXlMeYgyh7FGGz9EGG4TPKQFmNMHnKoEp44mPZQ6UJ//ogFH1g0x/VjEJHnw==
X-Received: by 2002:adf:82e1:: with SMTP id 88mr313161wrc.376.1594832649130;
        Wed, 15 Jul 2020 10:04:09 -0700 (PDT)
Received: from [172.30.90.191] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id z6sm4017000wmf.33.2020.07.15.10.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 10:04:08 -0700 (PDT)
Subject: Re: [PATCH 1/8] dt-bindings: media: ov5640: Convert to json-schema
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
 <20200715140951.90753-2-jacopo+renesas@jmondi.org>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <8cb2a9a5-149e-54fb-4ce5-e7bf5d35ef03@gmail.com>
Date:   Wed, 15 Jul 2020 10:04:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715140951.90753-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 7/15/20 7:09 AM, Jacopo Mondi wrote:
> Convert the ov5640 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Hi Steve,
>    I've added myself as maintainer in the bindings, with your ack
> I would be happy to add myself as maintainer or reviewer for this driver
> in MAINTAINERS, as I've recently been looking after this driver, mostly
> for the MIPI CSI-2 interface part.

Sure that's fine, I have not been involved in this driver at all, except 
for the initial commit. I don't think I should be listed as a MAINTAINER 
of this driver or its bindings either, so feel free to remove my name 
from both.

Steve

>
> Thanks
>    j
>
> ---
>   .../devicetree/bindings/media/i2c/ov5640.txt  |  92 ---------
>   .../devicetree/bindings/media/i2c/ov5640.yaml | 181 ++++++++++++++++++
>   MAINTAINERS                                   |   1 +
>   3 files changed, 182 insertions(+), 92 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.yaml
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
> index 000000000000..9c32262a3621
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
> +  - Jacopo Mondi <jacopo@jmondi.org>
> +
> +description: -|
> +  OV5640 is a 5 megapixels image sensor capable of producing images in RBG, RAW,
> +  YUV and compressed formats. It features a MIPI CSI-2 and a parallel data
> +  interface and an I2C-compatible (CCI) control interface.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5640
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    description: Reference to the xclk input clock.
> +    maxItems: 1
> +
> +  clock-names:
> +    description: Should be "xclk".
> +    maxItems: 1
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
> +      As defined in Documentation/devicetree/bindings/media/video-interfaces.txt,
> +      valid values are 0 (sensor mounted upright) and 180 (sensor mounted upside
> +      down).
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
> +            description: Should be set to 0 (clock lane on hardware lane 0).
> +
> +          data-lanes:
> +            description: |
> +              Should be set to <1> or <1 2> (one or two CSI-2 lanes supported).
> +
> +          bus-width:
> +            description: |
> +              Shall be set to <8> for 8 bits parallel bus or <10> for 10 bits
> +              parallel bus.
> +
> +          data-shift:
> +            description: |
> +              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
> +              <0> for 10 bits parallel bus.
> +
> +          hsync-active:
> +            description: |
> +              Active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> +
> +          vsync-active:
> +            description: |
> +              Active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> +
> +          pclk-sample:
> +            description: |
> +              Sample data on rising (1) or falling (0) edge of the pixel clock
> +              signal.
> +
> +        required:
> +          - remote-endpoint
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
> +                    bus-width = <8>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c74d25c58e1a..0160d7567ed3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12605,6 +12605,7 @@ L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media_tree.git
>   F:	drivers/media/i2c/ov5640.c
> +F:	Documentation/devicetree/bindings/media/i2c/ov5640.yaml
>
>   OMNIVISION OV5647 SENSOR DRIVER
>   M:	Jacopo Mondi <jacopo@jmondi.org>
> --
> 2.27.0
>

