Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA011CFFF7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 22:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgELU6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 16:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgELU6V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 16:58:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8359DC061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 13:58:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 830F351F;
        Tue, 12 May 2020 22:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589317098;
        bh=/mnJ4MtQSS4w5bU8kZ/cIav/b4TfuADK8tFNIpNpUQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aJa9qOMlXVzobNOvBJ6tQT7GudZzaYLdJ0Xob8j63EkIscw4YE1FGxISUBm6uk2zk
         uu1xIkcKHyQyVIJcrwFrOE5QjBS5NAr8TPhsU8LEps4BdDqX+3cJ1sKAk2cGhbHZ4f
         /wVh5xBvIgIOTbeLsYVK3yfVGSslw9vn47Uq2SDU=
Date:   Tue, 12 May 2020 23:58:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Add MT9M114 camera
 sensor binding
Message-ID: <20200512205812.GF28527@pendragon.ideasonboard.com>
References: <20200511233456.9722-1-laurent.pinchart@ideasonboard.com>
 <20200512084551.GY867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200512084551.GY867@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, May 12, 2020 at 11:45:51AM +0300, Sakari Ailus wrote:
> On Tue, May 12, 2020 at 02:34:55AM +0300, Laurent Pinchart wrote:
> > Add device tree binding for the ON Semiconductor MT9M114 CMOS camera
> > sensor.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../bindings/media/i2c/onnn,mt9m114.yaml      | 188 ++++++++++++++++++
> >  MAINTAINERS                                   |   7 +
> >  2 files changed, 195 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > new file mode 100644
> > index 000000000000..2c3c691aacfd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > @@ -0,0 +1,188 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ON Semiconductor 1/6-inch 720p CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +description: |-
> > +  The ON Semiconductor MT9M114 is a 1/6-inch 720p (1.26 Mp) CMOS digital image
> > +  sensor with an active pixel-array size of 1296H x 976V. It is programmable
> > +  through an I2C interface and outputs image data over a 8-bit parallel or
> > +  1-lane MIPI CSI-2 connection.
> > +
> > +properties:
> > +  compatible:
> > +    const: onnn,mt9m114
> > +
> > +  reg:
> > +    description: I2C device address
> > +    enum:
> > +      - 0x48
> > +      - 0x5d
> > +
> > +  clocks:
> > +    description: EXTCLK clock signal
> > +    maxItems: 1
> > +
> > +  vdd-supply:
> > +    description:
> > +      Core digital voltage supply, 1.8V
> > +
> > +  vddio-supply:
> > +    description:
> > +      I/O digital voltage supply, 1.8V or 2.8V
> > +
> > +  vaa-supply:
> > +    description:
> > +      Analog voltage supply, 2.8V
> > +
> > +  reset-gpios:
> > +    description: |-
> > +      Reference to the GPIO connected to the RESET_BAR pin, if any (active
> > +      low).
> > +
> > +  # See ../video-interfaces.txt for more details
> > +  port:
> > +    type: object
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        properties:
> > +          bus-type:
> > +            enum: [4, 5, 6]
> > +
> > +          clock-lanes:
> > +            items:
> > +              - const: 0
> > +
> > +          data-lanes:
> > +            items:
> > +              - const: 1
> > +
> > +          bus-width:
> > +            items:
> > +              - const: 8
> > +
> > +          hsync-active:
> > +            items:
> > +              - const: 1
> > +
> > +          vsync-active:
> > +            items:
> > +              - const: 1
> 
> Is there anything to configure here with these properties apart from
> bus-type? If not, they should be omitted.

The bindings make those properties optional. Do you think that we
generally should require them not to be present when their value is
fixed ? This implies that the mt9m114 driver won't be able to parse them
(not that it would need any particular information anyway). It also
implies that, if the driver wants to call __v4l2_fwnode_endpoint_parse()
(indirectly as that's a static function), it will need to fill the flags
with the hardcoded values before calling the function. This however
conflicts with __v4l2_fwnode_endpoint_parse() zeroing vep->bus when the
bus type is unknown, and the bus type can't be hardcoded as there are
three options. The other option would be for the driver to fill the
flags after calling __v4l2_fwnode_endpoint_parse() if it wants to rely
on the contents of v4l2_fwnode_endpoint through the code, which could be
the best option.

And I've now read the documentation of
v4l2_fwnode_endpoint_alloc_parse():

 * This function parses the V4L2 fwnode endpoint specific parameters from the
 * firmware. The caller is responsible for assigning @vep.bus_type to a valid
 * media bus type. The caller may also set the default configuration for the
 * endpoint --- a configuration that shall be in line with the DT binding
 * documentation. Should a device support multiple bus types, the caller may
 * call this function once the correct type is found --- with a default
 * configuration valid for that type.
 *
 * As a compatibility means guessing the bus type is also supported by setting
 * @vep.bus_type to V4L2_MBUS_UNKNOWN. The caller may not provide a default
 * configuration in this case as the defaults are specific to a given bus type.
 * This functionality is deprecated and should not be used in new drivers and it
 * is only supported for CSI-2 D-PHY, parallel and Bt.656 buses.

If V4L2_MBUS_UNKNOWN is deprecated, what is the caller supposed to do
when multiple bus types are supported by the device ? I'm having a bit
of trouble figuring out how everything fits together.

The other consequence of forbidding these properties is that the
connected entity won't be able to parse the DT properties of the sensor
endpoint, but that's probably an improvement, as doing so would be
layering violation. It however means that generic helper functions would
have equal trouble (as shown by the above explanation).

> > +
> > +        required:
> > +          - bus-type
> > +
> > +        allOf:
> > +          - if:
> > +              properties:
> > +                bus-type:
> > +                  const: 4
> > +            then:
> > +              properties:
> > +                bus-width: false
> > +                hsync-active: false
> > +                vsync-active: false
> > +
> > +          - if:
> > +              properties:
> > +                bus-type:
> > +                  const: 5
> > +            then:
> > +              properties:
> > +                clock-lanes: false
> > +                data-lanes: false
> > +
> > +          - if:
> > +              properties:
> > +                bus-type:
> > +                  const: 6
> > +            then:
> > +              properties:
> > +                clock-lanes: false
> > +                data-lanes: false
> > +                hsync-active: false
> > +                vsync-active: false
> > +
> > +        unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - vdd-supply
> > +  - vddio-supply
> > +  - vaa-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        sensor@48 {
> > +            compatible = "onnn,mt9m114";
> > +            reg = <0x48>;
> > +
> > +            clocks = <&clk24m 0>;
> > +
> > +            reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
> > +
> > +            vddio-supply = <&reg_cam_1v8>;
> > +            vdd-supply = <&reg_cam_1v8>;
> > +            vaa-supply = <&reg_2p8v>;
> > +
> > +            port {
> > +                endpoint {
> > +                    bus-type = <4>;
> > +                    clock-lanes = <0>;
> > +                    data-lanes = <1>;
> > +                    remote-endpoint = <&mipi_csi_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        sensor@5d {
> > +            compatible = "onnn,mt9m114";
> > +            reg = <0x5d>;
> > +
> > +            clocks = <&clk24m 0>;
> > +
> > +            reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
> > +
> > +            vddio-supply = <&reg_cam_1v8>;
> > +            vdd-supply = <&reg_cam_1v8>;
> > +            vaa-supply = <&reg_2p8v>;
> > +
> > +            port {
> > +                endpoint {
> > +                    bus-type = <5>;
> > +                    bus-width = <8>;
> > +                    hsync-active = <1>;
> > +                    vsync-active = <1>;
> > +                    remote-endpoint = <&parallel_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 091ec22c1a23..61d2fb6d049e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11457,6 +11457,13 @@ T:	git git://linuxtv.org/media_tree.git
> >  F:	drivers/media/i2c/mt9m032.c
> >  F:	include/media/i2c/mt9m032.h
> >  
> > +MT9M114 ON SEMICONDUCTOR SENSOR DRIVER
> > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://linuxtv.org/media_tree.git
> > +F:	Documentation/devicetree/bindings/media/i2c.onnn,mt9m114.yaml
> 
> s/\./\//
> 
> > +
> >  MT9P031 APTINA CAMERA SENSOR
> >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> 
> Wow! Even your git format-patch is polite. 8-)

:-)

-- 
Regards,

Laurent Pinchart
