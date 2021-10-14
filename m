Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4727B42E2A8
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 22:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhJNUW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 16:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhJNUW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 16:22:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E5DC061570;
        Thu, 14 Oct 2021 13:20:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78DED2F3;
        Thu, 14 Oct 2021 22:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634242848;
        bh=f32F8tEoMdmDds2PtCo/SAzfEpYM2JYBSHycxeGrJxs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BFx2GzAbqqIpIWq3uRwy512n9C133x2td9B/m6/Ut/cEr/cfXEYKDunENF4pokRM2
         YcFuHTFCnKD1+9HPXO5VYk/bprML8+4ynZejGFhKxHfvGXa0kttt55x7FR56IFum6q
         BQLQibaeHYeUYvTfn0wXXdpXthA7LnK/JlsP1Scg=
Date:   Thu, 14 Oct 2021 23:20:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Anil Kumar Mamidala <anil.mamidala@xilinx.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@iki.fi, naveenku@xilinx.com,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 AP1302
Message-ID: <YWiRERUYZTBepOKU@pendragon.ideasonboard.com>
References: <20211006113254.3470-1-anil.mamidala@xilinx.com>
 <20211006113254.3470-2-anil.mamidala@xilinx.com>
 <YWiK/xXEQwC5HgWD@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YWiK/xXEQwC5HgWD@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Thu, Oct 14, 2021 at 02:54:39PM -0500, Rob Herring wrote:
> On Wed, Oct 06, 2021 at 05:32:54AM -0600, Anil Kumar Mamidala wrote:
> > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > Add corresponding DT bindings.
> > 
> > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > ---
> >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 202 +++++++++++++++++++++
> >  1 file changed, 202 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > new file mode 100644
> > index 0000000..d96e9db
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > @@ -0,0 +1,202 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > +
> > +description: |-
> > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > +  Frames are output side by side or on two virtual channels.
> > +
> > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > +  from the host.
> 
> In your case, but in general I'd assume whatever sensors are used here 
> could be attached directly to an SoC with a built-in ISP?

That is correct, the same sensors can be used with a different ISP
(built-in or not), or even without any ISP.

> The model and 
> power supplies you specify wouldn't be different, so I think the same 
> binding could be used for both. Though here, you probably just need a 
> subset. More below.
> 
> > +
> > +properties:
> > +  compatible:
> > +    const: onnn,ap1302
> > +
> > +  reg:
> > +    description: I2C device address.
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: Reference to the CLK clock.
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description: Reference to the GPIO connected to the RST pin (active low).
> > +    maxItems: 1
> > +
> > +  standby-gpios:
> > +    description:
> > +      Reference to the GPIO connected to the STANDBY pin (active high).
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    unevaluatedProperties: false
> > +    description: MIPI CSI-2 output interface to the host.
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          clock-noncontinuous:
> > +            type: boolean
> > +
> > +          data-lanes:
> > +            oneOf:
> > +              - items:
> > +                  - const: 1
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +
> > +        required:
> > +          - data-lanes
> > +
> > +  sensors:
> > +    type: object
> > +    description: List of connected sensors
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      onnn,model:
> > +        $ref: "/schemas/types.yaml#/definitions/string"
> > +        description: |
> > +          Model of the connected sensors. Must be a valid compatible string.
> 
> Then make it a compatible string and move into each child node.

We started with that, but considered that it made mistakes more easily
in the device tree. As the two sensors have to be identical (it's a
limitation of the AP1302), moving the model to the sensor nodes means
that someone could set two different models, and the driver will have to
include corresponding validation code. It's more code on the driver
side, and more complexity on the DT side. Does it actually bring us
anything ?

> > +
> > +          If no sensor is connected, this property must no be specified, and
> > +          the AP1302 can be used with it's internal test pattern generator.
> > +
> > +    patternProperties:
> > +      "^sensor@[01]":
> > +        type: object
> > +        description: |
> > +          Sensors connected to the first and second input, with one node per
> > +          sensor.
> > +
> > +        properties:
> > +          reg:
> > +            description: AP1302 input port number
> > +            maxItems: 1
> 
> items:
>   - enum: [ 0, 1]
> 
> > +
> > +        patternProperties:
> > +          ".*-supply":
> 
> You need to list the supplies out.

Fair point, given that we have a list of supply names per sensor in the
AP1302 driver.

> I would make this a schema for the 
> sensor along with compatible. Here, you could either reference those if 
> you want to document the list of supported sensors or don't reference 
> them and just document 'reg'. With a compatible, the schema will be 
> applied anyways.

This I'm more concerned about. The sensors may be the same when used
with the AP1302 or when used standalone, but their integration in the
system is quite different. With the AP1302, the reg value is the AP1302
port number, while in the standalone case, it's an I2C address. We're
just lucky that the #address-cells and #size-cells happen to be the same
in both cases. In the standalone case, there will be more properties
that are not applicable here. How would we prevent all those other
properties from being evaluated in the AP1302 case ?

> > +            description: Power supplies for the sensor
> > +
> > +        required:
> > +          - reg
> > +
> > +        additionalProperties: false
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> > +    # How can we express that onnn,model requires one sensor object to be set ?
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - port
> > +  - sensors
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera@3c {
> > +            compatible = "onnn,ap1302";
> > +            reg = <0x3c>;
> > +
> > +            clocks = <&clk24mhz>;
> > +
> > +            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
> > +            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
> > +
> > +            port {
> > +                isp1_out: endpoint {
> > +                    remote-endpoint = <&seninf_in1>;
> > +                    data-lanes = <1 2 3 4>;
> > +                };
> > +            };
> > +
> > +            sensors {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                onnn,model = "onnn,ar0144";
> > +
> > +                sensor@0 {
> > +                    reg = <0>;
> > +
> > +                    vdd-supply = <&mt6358_vcamd_reg>;
> > +                    vaa-supply = <&mt6358_vcama1_reg>;
> > +                    vddio-supply = <&reg_1p8v_ext>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera@3c {
> > +            compatible = "onnn,ap1302";
> > +            reg = <0x3c>;
> > +
> > +            clocks = <&topckgen 0>;
> > +
> > +            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
> > +            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
> > +
> > +            port {
> > +                isp2_out: endpoint {
> > +                    remote-endpoint = <&seninf_in1>;
> > +                    data-lanes = <1 2>;
> > +                };
> > +            };
> > +
> > +            sensors {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +            };
> > +        };
> > +    };
> > +
> > +...

-- 
Regards,

Laurent Pinchart
