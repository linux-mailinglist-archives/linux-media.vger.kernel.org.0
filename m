Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324B433DD19
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 20:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240263AbhCPTFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 15:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240278AbhCPTFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 15:05:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42C6C06174A;
        Tue, 16 Mar 2021 12:05:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B0818C8;
        Tue, 16 Mar 2021 20:05:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615921512;
        bh=lpHXpSmqZxg+EsBalKfJXJM/ZIrj3NcbxBRt6CrzGxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=monw+slIFUECw/2chd5CzabLpgE3y4JRxPWXfliAVLbqkvysLEIoFOW+ErQoXBui+
         cGJ0FxpcKUX41X+5lCCXdWKE2+uDv3Bk8JAt9jglUEFirg87H1/HzgSoltoI1WMUNe
         2a/4eOpDDGISQ/waYes/eid06W7rYnlp3hZIt0Y0=
Date:   Tue, 16 Mar 2021 21:04:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: RFC: dt-binding: media: document ON Semi AR0521 sensor bindings
Message-ID: <YFEBRGF20xhpHese@pendragon.ideasonboard.com>
References: <m3o8fjs02a.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3o8fjs02a.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

Thank you for the patch.

On Tue, Mar 16, 2021 at 02:25:01PM +0100, Krzysztof Hałasa wrote:
> This file documents DT bindings for the AR0521 camera sensor driver.
> 
> Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> new file mode 100644
> index 000000000000..f649d4cbcb37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0521.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AR0521 MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Krzysztof Halasa <khalasa@piap.pl>
> +
> +description: |-
> +  The AR0521 is a raw CMOS image sensor with MIPI CSI-2 and
> +  I2C-compatible control interface.
> +
> +properties:
> +  compatible:
> +    const: on-semi,ar0521

That's not the correct prefix for ON Semiconductor. See
Documentation/devicetree/bindings/vendor-prefixes.yaml. Or just the name
of this file :-)

> +
> +  reg:
> +    description: I2C bus address of the sensor device

You can drop this, it's implicit for I2C devices.

> +    maxItems: 1
> +
> +  clocks:
> +    description: reference to the xclk clock
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xclk
> +
> +  reset-gpios:
> +    description: active low reset GPIO
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description: |
> +      Output video port: 1, 2 or 4 lanes. See ../video-interfaces.txt.

You can use the OF graph and video interfaces schema, see commit
066a94e28a23 in mainline.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ar0521: camera-sensor@36 {
> +                    compatible = "onnn,ar0521";
> +                    reg = <0x36>;
> +                    pinctrl-names = "default";
> +                    pinctrl-0 = <&pinctrl_mipi_camera>;
> +
> +                    clocks = <&clks IMX6QDL_CLK_CKO>;
> +                    clock-names = "xclk";
> +
> +                    reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +
> +                    port {
> +                           mipi_camera_to_mipi_csi2: endpoint {
> +                                    remote-endpoint = <&mipi_csi2_in>;
> +                                    data-lanes = <1 2 3 4>;
> +                            };
> +                    };
> +            };
> +    };

-- 
Regards,

Laurent Pinchart
