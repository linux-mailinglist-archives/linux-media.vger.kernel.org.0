Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FDE1CEF6D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 10:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgELIqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 04:46:49 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47662 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725776AbgELIqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 04:46:49 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id B71B2634C87;
        Tue, 12 May 2020 11:45:51 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jYQXv-0001pI-Gk; Tue, 12 May 2020 11:45:51 +0300
Date:   Tue, 12 May 2020 11:45:51 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Add MT9M114 camera
 sensor binding
Message-ID: <20200512084551.GY867@valkosipuli.retiisi.org.uk>
References: <20200511233456.9722-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511233456.9722-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the patch.

On Tue, May 12, 2020 at 02:34:55AM +0300, Laurent Pinchart wrote:
> Add device tree binding for the ON Semiconductor MT9M114 CMOS camera
> sensor.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/i2c/onnn,mt9m114.yaml      | 188 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 195 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> new file mode 100644
> index 000000000000..2c3c691aacfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor 1/6-inch 720p CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |-
> +  The ON Semiconductor MT9M114 is a 1/6-inch 720p (1.26 Mp) CMOS digital image
> +  sensor with an active pixel-array size of 1296H x 976V. It is programmable
> +  through an I2C interface and outputs image data over a 8-bit parallel or
> +  1-lane MIPI CSI-2 connection.
> +
> +properties:
> +  compatible:
> +    const: onnn,mt9m114
> +
> +  reg:
> +    description: I2C device address
> +    enum:
> +      - 0x48
> +      - 0x5d
> +
> +  clocks:
> +    description: EXTCLK clock signal
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description:
> +      Core digital voltage supply, 1.8V
> +
> +  vddio-supply:
> +    description:
> +      I/O digital voltage supply, 1.8V or 2.8V
> +
> +  vaa-supply:
> +    description:
> +      Analog voltage supply, 2.8V
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the RESET_BAR pin, if any (active
> +      low).
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          bus-type:
> +            enum: [4, 5, 6]
> +
> +          clock-lanes:
> +            items:
> +              - const: 0
> +
> +          data-lanes:
> +            items:
> +              - const: 1
> +
> +          bus-width:
> +            items:
> +              - const: 8
> +
> +          hsync-active:
> +            items:
> +              - const: 1
> +
> +          vsync-active:
> +            items:
> +              - const: 1

Is there anything to configure here with these properties apart from
bus-type? If not, they should be omitted.

> +
> +        required:
> +          - bus-type
> +
> +        allOf:
> +          - if:
> +              properties:
> +                bus-type:
> +                  const: 4
> +            then:
> +              properties:
> +                bus-width: false
> +                hsync-active: false
> +                vsync-active: false
> +
> +          - if:
> +              properties:
> +                bus-type:
> +                  const: 5
> +            then:
> +              properties:
> +                clock-lanes: false
> +                data-lanes: false
> +
> +          - if:
> +              properties:
> +                bus-type:
> +                  const: 6
> +            then:
> +              properties:
> +                clock-lanes: false
> +                data-lanes: false
> +                hsync-active: false
> +                vsync-active: false
> +
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdd-supply
> +  - vddio-supply
> +  - vaa-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sensor@48 {
> +            compatible = "onnn,mt9m114";
> +            reg = <0x48>;
> +
> +            clocks = <&clk24m 0>;
> +
> +            reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
> +
> +            vddio-supply = <&reg_cam_1v8>;
> +            vdd-supply = <&reg_cam_1v8>;
> +            vaa-supply = <&reg_2p8v>;
> +
> +            port {
> +                endpoint {
> +                    bus-type = <4>;
> +                    clock-lanes = <0>;
> +                    data-lanes = <1>;
> +                    remote-endpoint = <&mipi_csi_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sensor@5d {
> +            compatible = "onnn,mt9m114";
> +            reg = <0x5d>;
> +
> +            clocks = <&clk24m 0>;
> +
> +            reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
> +
> +            vddio-supply = <&reg_cam_1v8>;
> +            vdd-supply = <&reg_cam_1v8>;
> +            vaa-supply = <&reg_2p8v>;
> +
> +            port {
> +                endpoint {
> +                    bus-type = <5>;
> +                    bus-width = <8>;
> +                    hsync-active = <1>;
> +                    vsync-active = <1>;
> +                    remote-endpoint = <&parallel_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 091ec22c1a23..61d2fb6d049e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11457,6 +11457,13 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/mt9m032.c
>  F:	include/media/i2c/mt9m032.h
>  
> +MT9M114 ON SEMICONDUCTOR SENSOR DRIVER
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c.onnn,mt9m114.yaml

s/\./\//

> +
>  MT9P031 APTINA CAMERA SENSOR
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
> -- 
> Regards,
> 
> Laurent Pinchart

Wow! Even your git format-patch is polite. 8-)

-- 
Kind regards,

Sakari Ailus
