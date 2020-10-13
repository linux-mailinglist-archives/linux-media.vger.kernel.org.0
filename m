Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B07F28D1D5
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 18:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389352AbgJMQJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 12:09:21 -0400
Received: from mga01.intel.com ([192.55.52.88]:23661 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389140AbgJMQJR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 12:09:17 -0400
IronPort-SDR: JhCe7MXYQlmCpdDuOoIkziWCZPx0OJb7JN8VHGafvof1dEfsWLvPcUdb7nFCeB5uL58uGKCa5e
 xeb+omwQ4G9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="183422196"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="183422196"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 09:09:12 -0700
IronPort-SDR: D768KbAySx9Kbo3ZDqAR1PIDRjyV9XICJsxcKmhs5sjdM5hbxWs1wfD/mT6L01cO/5SjS88rRQ
 5otU3yO8w0ng==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="346240414"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 09:09:10 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8FB09205E8; Tue, 13 Oct 2020 19:09:08 +0300 (EEST)
Date:   Tue, 13 Oct 2020 19:09:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: ov2680: convert bindings to yaml
Message-ID: <20201013160908.GC13341@paasikivi.fi.intel.com>
References: <20201013152647.537323-1-rmfrfs@gmail.com>
 <20201013152647.537323-2-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013152647.537323-2-rmfrfs@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

Thanks for the patch.

On Tue, Oct 13, 2020 at 04:26:45PM +0100, Rui Miguel Silva wrote:
> Convert ov2680 sensor bindings documentation to yaml schema, remove
> the textual bindings document and update MAINTAINERS entry.
> 
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/ov2680.txt  |  46 ------
>  .../devicetree/bindings/media/i2c/ov2680.yaml | 131 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 132 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.txt b/Documentation/devicetree/bindings/media/i2c/ov2680.txt
> deleted file mode 100644
> index 11e925ed9dad..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ov2680.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -* Omnivision OV2680 MIPI CSI-2 sensor
> -
> -Required Properties:
> -- compatible: should be "ovti,ov2680".
> -- clocks: reference to the xvclk input clock.
> -- clock-names: should be "xvclk".
> -- DOVDD-supply: Digital I/O voltage supply.
> -- DVDD-supply: Digital core voltage supply.
> -- AVDD-supply: Analog voltage supply.
> -
> -Optional Properties:
> -- reset-gpios: reference to the GPIO connected to the powerdown/reset pin,
> -               if any. This is an active low signal to the OV2680.
> -
> -The device node must contain one 'port' child node for its digital output
> -video port, and this port must have a single endpoint in accordance with
> - the video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Endpoint node required properties for CSI-2 connection are:
> -- remote-endpoint: a phandle to the bus receiver's endpoint node.
> -- clock-lanes: should be set to <0> (clock lane on hardware lane 0).
> -- data-lanes: should be set to <1> (one CSI-2 lane supported).
> -
> -Example:
> -
> -&i2c2 {
> -	ov2680: camera-sensor@36 {
> -		compatible = "ovti,ov2680";
> -		reg = <0x36>;
> -		clocks = <&osc>;
> -		clock-names = "xvclk";
> -		reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> -		DOVDD-supply = <&sw2_reg>;
> -		DVDD-supply = <&sw2_reg>;
> -		AVDD-supply = <&reg_peri_3p15v>;
> -
> -		port {
> -			ov2680_to_mipi: endpoint {
> -				remote-endpoint = <&mipi_from_sensor>;
> -				clock-lanes = <0>;
> -				data-lanes = <1>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> new file mode 100644
> index 000000000000..2516215a511d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov2680.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV2680 CMOS Sensor
> +
> +maintainers:
> +  - Rui Miguel Silva <rmfrfs@gmail.com>
> +
> +description: |-
> +  The OV2680 color sensor is a low voltage, high performance 1/5 inch UXGA (2
> +  megapixel) CMOS image sensor that provides a single-chip UXGA (1600 x 1200)
> +  camera. It provides full-frame, sub-sampled, or windowed 10-bit images in
> +  various formats via the control of the Serial Camera Control Bus (SCCB)
> +  interface.  The OV2680 has an image array capable of operating at up to 30
> +  frames per second (fps) in UXGA resolution.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov2680
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Input clock for the sensor.
> +    items:
> +      - const: xvclk
> +
> +  reset-gpios:
> +    description:
> +      The phandle and specifier for the GPIO that controls sensor reset.
> +      This corresponds to the hardware pin XSHUTDOWN which is physically
> +      active low.
> +
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as interface power supply.
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as digital power supply.
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      A node containing an output port node with an endpoint definition
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint: true

This can be omitted.

> +
> +          data-lanes:
> +            description: |-
> +              The driver only supports one-lane operation.
> +            items:
> +              - const: 1
> +
> +          clock-lanes:
> +            description: |-
> +              The driver only supports one-lane operation.

What driver supports is not a concern in DT bindings.

Instead they describe what the hardware supports.

clock-lanes can be removed if it's always zero.

If the hardware only supports a single data lane, the data-lanes property
can go, too.

> +            items:
> +              - const: 0
> +
> +        required:
> +          - remote-endpoint
> +          - data-lanes
> +          - clock-lanes
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dovdd-supply
> +  - avdd-supply
> +  - dvdd-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov2680: camera-sensor@36 {
> +                compatible = "ovti,ov2680";
> +                reg = <0x36>;
> +                clocks = <&osc>;
> +                clock-names = "xvclk";
> +                reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> +
> +                dovdd-supply = <&sw2_reg>;
> +                dvdd-supply = <&sw2_reg>;
> +                avdd-supply = <&reg_peri_3p15v>;
> +
> +                port {
> +                        ov2680_to_mipi: endpoint {
> +                                remote-endpoint = <&mipi_from_sensor>;
> +                                clock-lanes = <0>;
> +                                data-lanes = <1>;
> +                        };
> +                };
> +        };
> +    };
> +...
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2e85e114c9c3..926dcdc4794c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12775,7 +12775,7 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/ov2680.txt
> +F:	Documentation/devicetree/bindings/media/i2c/ov2680.yaml
>  F:	drivers/media/i2c/ov2680.c
>  
>  OMNIVISION OV2685 SENSOR DRIVER

-- 
Kind regards,

Sakari Ailus
