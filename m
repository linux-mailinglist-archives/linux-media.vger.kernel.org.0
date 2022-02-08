Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4349F4AE15D
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 19:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353551AbiBHSrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 13:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385359AbiBHSri (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 13:47:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162AAC0613CA;
        Tue,  8 Feb 2022 10:47:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2D2EA04;
        Tue,  8 Feb 2022 19:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644346055;
        bh=hdzvF1bmDZLlj1lpTvDHJFfwOWcf/KydTHjftAnwTHA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nHPtqvOKVr1q54neD4n5fKTfpip7nWH0OjNwRtqzSHMy0OT8rdG7tfZRxvJWhDOD+
         f9cz28QwIufikSpSX1DUpLuvXnkBOYPpgvgjxx+2xw9v+Cb5vWTNUnZJ6i2NTG5gdR
         qpOKqc85PgiAK7o7QMotxKGNPALstl9GrvDJ6nA0=
Date:   Tue, 8 Feb 2022 20:47:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add MT9M114
 camera sensor binding
Message-ID: <YgK6xAgAVHUSsQND@pendragon.ideasonboard.com>
References: <20220207012055.15158-1-laurent.pinchart@ideasonboard.com>
 <20220207012055.15158-2-laurent.pinchart@ideasonboard.com>
 <YgKfdR72TNavj68v@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgKfdR72TNavj68v@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Feb 08, 2022 at 06:51:01PM +0200, Sakari Ailus wrote:
> On Mon, Feb 07, 2022 at 03:20:54AM +0200, Laurent Pinchart wrote:
> > Add device tree binding for the onsemi MT9M114 CMOS camera sensor.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Use graph schema
> > - Drop unneeded properties
> > - Rename ON Semiconductor to onsemi
> > ---
> >  .../bindings/media/i2c/onnn,mt9m114.yaml      | 110 ++++++++++++++++++
> >  MAINTAINERS                                   |   7 ++
> >  2 files changed, 117 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > new file mode 100644
> > index 000000000000..55b67833f9a1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: onsemi 1/6-inch 720p CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +description: |-
> > +  The onsemi MT9M114 is a 1/6-inch 720p (1.26 Mp) CMOS digital image sensor
> > +  with an active pixel-array size of 1296H x 976V. It is programmable through
> > +  an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
> > +  CSI-2 connection.
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
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          bus-type:
> > +            enum: [4, 5, 6]
> 
> With bus-type 5, shouldn't you have the parallel interface sync signal
> polarity properties? Possibly also others if the hardware supports them.

As far as I can tell, the hardware has fixed polarities for all signals.
Both hsync and vsync (called LINE_VALID and FRAME_VALID here) are active
high.

> > +
> > +          remote-endpoint: true
> > +
> > +          # The number and mapping of lanes (for CSI-2), and the bus width and
> > +          # signal polarities (for parallel and BT.656) are fixed and must not
> > +          # be specified.
> > +
> > +        required:
> > +          - bus-type
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
> > +                    remote-endpoint = <&mipi_csi_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f41088418aae..e9919a359c12 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13096,6 +13096,13 @@ T:	git git://linuxtv.org/media_tree.git
> >  F:	drivers/media/i2c/mt9m032.c
> >  F:	include/media/i2c/mt9m032.h
> >  
> > +MT9M114 ONSEMI SENSOR DRIVER
> > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://linuxtv.org/media_tree.git
> > +F:	Documentation/devicetree/bindings/media/i2c.onnn,mt9m114.yaml
> > +
> >  MT9P031 APTINA CAMERA SENSOR
> >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org

-- 
Regards,

Laurent Pinchart
