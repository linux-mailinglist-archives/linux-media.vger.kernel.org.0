Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8483F3B0428
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 14:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhFVMWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 08:22:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46410 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhFVMWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 08:22:42 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5122AD6;
        Tue, 22 Jun 2021 14:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624364425;
        bh=/FdwHQV1jcqx1m2yunZRLGyU4cV3T2hzck8bpFjvWcw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eSn0QBKaM0qR+1s6PxBaN2Bo/T3FPRNSHSWWbu7rosw2yVnsv+7cx5hFxqhlR8oyg
         DYYXZYQ73hyWS6tWX9cW4cl7/0FvLoXGs2ryE3OcHiK3XkrbUnRqLQ546fxviIvqlr
         Ycbz7HEkAb4Ph+15mgbSyZQxA3AUZiH/9XT0Sx9Q=
Date:   Tue, 22 Jun 2021 15:19:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] dt-binding: media: document ON Semi AR0521 sensor
 bindings
Message-ID: <YNHVbFp2+Ow8CyCV@pendragon.ideasonboard.com>
References: <m3y2b25er8.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3y2b25er8.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

Thank you for the patch.

On Tue, Jun 22, 2021 at 01:18:35PM +0200, Krzysztof Hałasa wrote:
> This file documents DT bindings for the AR0521 camera sensor driver.
> Changes from v1:
> - added power management (power supplies).
> - small fixes

Please move the text below after a --- line, it shouldn't be included in
the commit message.

> The question still stands: is there a way to reliably put national
> unicode characters into:
> - commit messages for patches submitted via email,

This shouldn't be too much of a problem, as long as you MUA and MTA
don't mess up encoding.

> - C and other source files (comments and stuff like MODULE_AUTHOR).

This may be more problematic, especially in strings in source code.

> Yes, I know I can commit it myself correctly, but then propagating it
> upstream is problematic. Perhaps a pullable tree would be better?
> I guess I need to renew my old kernel.org account.
> 
> Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> new file mode 100644
> index 000000000000..29421daacc87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> @@ -0,0 +1,87 @@
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
> +    const: onnn,ar0521
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: reference to the xclk clock

You can drop the description, it's implied by the clock-names property.

> +    maxItems: 1
> +
> +  clock-names:
> +    const: xclk

Isn't the pin named extclk ?

> +
> +  vdd_io-supply:
> +    description:
> +      Definition of the regulator used as digital I/O (1.8 V) voltage supply.
> +
> +  vdd_core-supply:
> +    description:
> +      Definition of the regulator used as digital core (1.2 V) voltage supply.

It's not just the digital core, 1.2V is also needed for the PLL
(VDD_PLL) and the PHY (VDD_PHY). I'd call this vdd-supply.

> +  vcc_analog-supply:
> +    description:
> +      Definition of the regulator used as analog (2.7 V) voltage supply.

Similarly, I'd call this vaa-supply is is covers VAA and VAA_PIX
(there's no VCC_ANALOG pin).

> +
> +  reset-gpios:
> +    description: reset GPIO, usually active low
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: |
> +      Output video port: 1, 2 or 4 lanes.

The number of lanes should be described through the data-lanes endpoint
property.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port

Supplies should be mandatory as the chip needs them.

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
