Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55D55502C34
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 17:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348301AbiDOPC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 11:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbiDOPC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 11:02:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA3A85BF3
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 07:59:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-70-106-nat.elisa-mobile.fi [85.76.70.106])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DB0C276;
        Fri, 15 Apr 2022 16:59:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650034796;
        bh=hps5ZKOth/18UPo8Toyaypkpt7B33tzmrtRVDIIGWpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QAw191f8/s26tGW/byXiONwGiQaf6/TDsG4pbPjDmKDtTwtwoZTvRyY9umisy9eaO
         sfhyN5Jb2lvrmKkRXGuaTdTLxCFKHQdLHtjfl/w+xdxM4mUjQAXJmFBGFBC2cCRqXZ
         JYQgrZKee5rcJ/iaPoWLQ42dVwbkYb5Yv+XyqiX4=
Date:   Fri, 15 Apr 2022 17:59:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 4/5] media: dt-bindings: media: i2c: Add ST VGXY61
 camera sensor binding
Message-ID: <YlmIZgabGuSjrBfR@pendragon.ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-5-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220415111845.27130-5-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thank you for the patch.

On Fri, Apr 15, 2022 at 01:18:44PM +0200, Benjamin Mugnier wrote:
> Add device tree binding for the ST VGXY61 camera sensor, and update
> MAINTAINERS file.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../bindings/media/i2c/st,st-vgxy61.yaml      | 125 ++++++++++++++++++
>  MAINTAINERS                                   |   9 ++
>  2 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> new file mode 100644
> index 000000000000..24bff161a661
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2022 STMicroelectronics SA.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics VGxy61 HDR Global Shutter Sensor Family Device Tree Bindings
> +
> +maintainers:
> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
> +
> +description: |-
> +  STMicroelectronics VGxy61 family has a CSI-2 output port. CSI-2 output is a
> +  quad lanes 800Mbps per lane.
> +  Supported formats are RAW8, RAW10, RAW12, RAW14 and RAW16.
> +  Following part number are supported
> +  - VG5661 and VG6661 are 1.6 Mpx (1464 x 1104) monochrome and color sensors.
> +  Maximum frame rate is 75 fps.
> +  - VG5761 and VG6761 are 2.3 Mpx (1944 x 1204) monochrome and color sensors.
> +  Maximum frame rate is 60 fps.
> +
> +properties:
> +  compatible:
> +    const: st,st-vgxy61
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
> +      - const: xclk

If there's a single clock you can drop the clock name.

> +
> +  VCORE-supply:
> +    description:
> +      Sensor digital core supply. Must be 1.2 volts.
> +
> +  VDDIO-supply:
> +    description:
> +      Sensor digital IO supply. Must be 1.8 volts.
> +
> +  VANA-supply:
> +    description:
> +      Sensor analog supply. Must be 2.8 volts.
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the reset pin, if any.
> +      This is an active low signal to the vgxy61.
> +
> +  invert-gpios-polarity:

Vendor-specific properties should have a vendor prefix (e.g.
st,inver-gpios-polarity).

> +    description:
> +      If gpios polarity should be inversed

What is this though, what GPIOs does it invert ?

> +    type: boolean
> +
> +  slave-mode:
> +    description:
> +      If the sensor operates in slave mode
> +    type: boolean
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            description:
> +              CSI lanes to use
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +          remote-endpoint: true
> +
> +        required:
> +          - clock-lane
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - VCORE-supply
> +  - VDDIO-supply
> +  - VANA-supply

The port property should be required too.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        vgxy61: csi2tx@10 {
> +            compatible = "st,st-vgxy61";
> +            reg = <0x10>;
> +            status = "okay";

That's the default, it's not needed in DT examples.

> +            clocks = <&clk_ext_camera>;

There's no clock-names. Have you run DT bindings validation ? It should
have reported an error.

> +            VCORE-supply = <&v1v2>;
> +            VDDIO-supply = <&v1v8>;
> +            VANA-supply = <&v2v8>;
> +            reset-gpios = <&mfxgpio 18 GPIO_ACTIVE_LOW>;
> +            port {
> +                ep0: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&mipi_csi2_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..6233e073da30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18664,6 +18664,15 @@ S:	Maintained
>  F:	Documentation/hwmon/stpddc60.rst
>  F:	drivers/hwmon/pmbus/stpddc60.c
>  
> +ST VGXY61 DRIVER
> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.txt
> +F:	drivers/media/i2c/st-vgxy61.c
> +
>  ST VL53L0X ToF RANGER(I2C) IIO DRIVER
>  M:	Song Qiang <songqiang1304521@gmail.com>
>  L:	linux-iio@vger.kernel.org

-- 
Regards,

Laurent Pinchart
