Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46198E7144
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 13:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbfJ1MV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 08:21:57 -0400
Received: from retiisi.org.uk ([95.216.213.190]:34830 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726302AbfJ1MV5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 08:21:57 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 5727D634C87;
        Mon, 28 Oct 2019 14:21:16 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iP41L-0001Ir-Cg; Mon, 28 Oct 2019 14:21:15 +0200
Date:   Mon, 28 Oct 2019 14:21:15 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191028122115.GB4928@valkosipuli.retiisi.org.uk>
References: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
 <20191025175908.14260-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025175908.14260-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

Thanks for the update.

On Fri, Oct 25, 2019 at 11:29:07PM +0530, Manivannan Sadhasivam wrote:
> Add YAML devicetree binding for IMX296 CMOS image sensor.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/imx296.yaml | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> new file mode 100644
> index 000000000000..4e204fd7cf90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description: |-
> +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> +  sensor with square pixel array and 1.58 M effective pixels. This chip
> +  features a global shutter with variable charge-integration time. It is
> +  programmable through I2C and 4-wire interfaces. The sensor output is
> +  available via CSI-2 serial data output (1 Lane).
> +
> +properties:
> +  compatible:
> +    const: sony,imx296
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
> +      - const: mclk
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the mclk clock in Hertz.
> +    default: 37125000

I think you could omit the default.

> +
> +  vddo-supply:
> +    description:
> +      Definition of the regulator used as interface power supply.
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +    maxItems: 1
> +
> +  vddd-supply:
> +    description:
> +      Definition of the regulator used as digital power supply.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      The phandle and specifier for the GPIO that controls sensor reset.
> +    maxItems: 1
> +
> +  # See ../video-interfaces.txt for details
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-frequency
> +  - vddo-supply
> +  - vdda-supply
> +  - vddd-supply

I think the port and endpoint nodes should documented here as well.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    imx296: camera-sensor@1a {
> +        compatible = "sony,imx296";
> +        reg = <0x1a>;
> +        reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&camera_rear_default>;
> +        clocks = <&gcc 90>;
> +        clock-names = "mclk";
> +        clock-frequency = <37125000>;
> +        vddo-supply = <&camera_vddo_1v8>;
> +        vdda-supply = <&camera_vdda_3v3>;
> +        vddd-supply = <&camera_vddd_1v2>;
> +
> +        port {
> +            imx296_ep: endpoint {
> +                remote-endpoint = <&csiphy0_ep>;
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Sakari Ailus
