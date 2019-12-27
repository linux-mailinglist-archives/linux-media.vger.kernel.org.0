Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9317B12B51A
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 15:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfL0OSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 09:18:17 -0500
Received: from retiisi.org.uk ([95.216.213.190]:58858 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726053AbfL0OSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 09:18:16 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 8EDE9634C86;
        Fri, 27 Dec 2019 16:17:39 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ikqQt-00017H-TA; Fri, 27 Dec 2019 16:17:39 +0200
Date:   Fri, 27 Dec 2019 16:17:39 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, ezequiel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
Message-ID: <20191227141739.GD861@valkosipuli.retiisi.org.uk>
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-2-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191227122114.23075-2-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

Thanks for the patchset.

On Fri, Dec 27, 2019 at 03:21:13PM +0300, Andrey Konovalov wrote:
> Add YAML device tree binding for IMX219 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/imx219.yaml | 134 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> new file mode 100644
> index 000000000000..b58aa49a7c03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +
> +description: |-
> +  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
> +  with an active array size of 3280H x 2464V. It is programmable through
> +  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx219
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xclk

There's a single clock. Does it need a name? I'd just omit it.

> +
> +  VDIG-supply:
> +    description:
> +      Digital I/O voltage supply, 1.8 volts
> +
> +  VANA-supply:
> +    description:
> +      Analog voltage supply, 2.8 volts
> +
> +  VDDL-supply:
> +    description:
> +      Digital core voltage supply, 1.2 volts
> +
> +  xclr-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies are applied.

A common name for this in camera sensors is xshutdown. I'd suggest to use
that.

> +
> +  camera-clk:
> +    type: object
> +
> +    description: Clock source for imx219
> +
> +    properties:
> +      clock-frequency: true
> +
> +    required:
> +      - clock-frequency

Hmm. The driver doesn't seem to use this for anything.

There are two approaches to this; either you can get and check the
frequency, or specify it in DT bindings, set and then check it.

See e.g. Documentation/devicetree/bindings/media/i2c/nokia,smia.txt (not in
YAML though).

> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          clock-lanes:
> +            const: 0

If the hardware does not support lane reordering, you can omit the
clock-lanes property as it provides no information.

> +
> +          data-lanes:
> +            description: |-
> +              Should be <1 2> for two-lane operation, or <1 2 3 4> for
> +              four-lane operation.
> +            oneOf:
> +              - const: [[ 1, 2 ]]
> +              - const: [[ 1, 2, 3, 4 ]]
> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              Presence of this boolean property decides whether the MIPI CSI-2
> +              clock is continuous or non-continuous.

How about: MIPI CSI-2 clock will be non-continuous if this property is
present, otherwise it's continuous.

> +
> +        required:
> +          - clock-lanes
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - VANA-supply
> +  - VDIG-supply
> +  - VDDL-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx219: sensor@10 {
> +            compatible = "sony,imx219";
> +            reg = <0x10>;
> +            clocks = <&imx219_clk>;
> +            clock-names = "xclk";
> +            VANA-supply = <&imx219_vana>;   /* 2.8v */
> +            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
> +            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
> +
> +            imx219_clk: camera-clk {
> +                compatible = "fixed-clock";
> +                #clock-cells = <0>;
> +                clock-frequency = <24000000>;
> +            };
> +
> +            port {
> +                imx219_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2>;
> +                    clock-noncontinuous;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ffa3371bc750..f7b6c24ec081 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15350,6 +15350,14 @@ S:	Maintained
>  F:	drivers/media/i2c/imx214.c
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>  
> +SONY IMX219 SENSOR DRIVER
> +M:	Dave Stevenson <dave.stevenson@raspberrypi.com>

Is Dave aware of this? :-)

> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	drivers/media/i2c/imx219.c
> +F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +
>  SONY IMX258 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org

-- 
Regards,

Sakari Ailus
