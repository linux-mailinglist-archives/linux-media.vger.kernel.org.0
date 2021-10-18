Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7962431F1D
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 16:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbhJROQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 10:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbhJROQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 10:16:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF612C019764;
        Mon, 18 Oct 2021 06:50:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC2F88C6;
        Mon, 18 Oct 2021 15:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634565001;
        bh=zuYgLQxAGL5X7Bt0cfrzXSvnfk4+OaGwE61NgmImZBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gDUbX7tb9AgTxRHLlGlX3wDEM9hjD9ym6SGEmLV8ACgBqgz7Falaj170wB7DgNYdR
         P4T44i2JFg6TbqBJgtwwPhywVark59UgTV9JC3xWJIRwjsHMFvY5EyL3iR7GGmR4b5
         BRsv4PVyvxyCx9TkaKsMFVh8ff+UW0e7IrOCJh8s=
Date:   Mon, 18 Oct 2021 16:49:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Anil Kumar Mamidala <anil.mamidala@xilinx.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 AP1302
Message-ID: <YW17d1nj3vyjiYu+@pendragon.ideasonboard.com>
References: <20211006113254.3470-1-anil.mamidala@xilinx.com>
 <20211006113254.3470-2-anil.mamidala@xilinx.com>
 <YWiK/xXEQwC5HgWD@robh.at.kernel.org>
 <YWiRERUYZTBepOKU@pendragon.ideasonboard.com>
 <CAL_Jsq+DjGZpZgE7SiVeSQLsWFHOmBdK+sodUQAeBMd5QPYw0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+DjGZpZgE7SiVeSQLsWFHOmBdK+sodUQAeBMd5QPYw0w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Mon, Oct 18, 2021 at 08:36:51AM -0500, Rob Herring wrote:
> On Thu, Oct 14, 2021 at 3:20 PM Laurent Pinchart wrote:
> > On Thu, Oct 14, 2021 at 02:54:39PM -0500, Rob Herring wrote:
> > > On Wed, Oct 06, 2021 at 05:32:54AM -0600, Anil Kumar Mamidala wrote:
> > > > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > > > Add corresponding DT bindings.
> > > >
> > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 202 +++++++++++++++++++++
> > > >  1 file changed, 202 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > new file mode 100644
> > > > index 0000000..d96e9db
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > @@ -0,0 +1,202 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > > > +
> > > > +maintainers:
> > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > +
> > > > +description: |-
> > > > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > > > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > > > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > > > +  Frames are output side by side or on two virtual channels.
> > > > +
> > > > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > > > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > > > +  from the host.
> > >
> > > In your case, but in general I'd assume whatever sensors are used here
> > > could be attached directly to an SoC with a built-in ISP?
> >
> > That is correct, the same sensors can be used with a different ISP
> > (built-in or not), or even without any ISP.
> >
> > > The model and
> > > power supplies you specify wouldn't be different, so I think the same
> > > binding could be used for both. Though here, you probably just need a
> > > subset. More below.
> > >
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: onnn,ap1302
> > > > +
> > > > +  reg:
> > > > +    description: I2C device address.
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    description: Reference to the CLK clock.
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-gpios:
> > > > +    description: Reference to the GPIO connected to the RST pin (active low).
> > > > +    maxItems: 1
> > > > +
> > > > +  standby-gpios:
> > > > +    description:
> > > > +      Reference to the GPIO connected to the STANDBY pin (active high).
> > > > +    maxItems: 1
> > > > +
> > > > +  port:
> > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +    unevaluatedProperties: false
> > > > +    description: MIPI CSI-2 output interface to the host.
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > +        unevaluatedProperties: false
> > > > +
> > > > +        properties:
> > > > +          clock-noncontinuous:
> > > > +            type: boolean
> > > > +
> > > > +          data-lanes:
> > > > +            oneOf:
> > > > +              - items:
> > > > +                  - const: 1
> > > > +              - items:
> > > > +                  - const: 1
> > > > +                  - const: 2
> > > > +              - items:
> > > > +                  - const: 1
> > > > +                  - const: 2
> > > > +                  - const: 3
> > > > +                  - const: 4
> > > > +
> > > > +        required:
> > > > +          - data-lanes
> > > > +
> > > > +  sensors:
> > > > +    type: object
> > > > +    description: List of connected sensors
> > > > +
> > > > +    properties:
> > > > +      "#address-cells":
> > > > +        const: 1
> > > > +
> > > > +      "#size-cells":
> > > > +        const: 0
> > > > +
> > > > +      onnn,model:
> > > > +        $ref: "/schemas/types.yaml#/definitions/string"
> > > > +        description: |
> > > > +          Model of the connected sensors. Must be a valid compatible string.
> > >
> > > Then make it a compatible string and move into each child node.
> >
> > We started with that, but considered that it made mistakes more easily
> > in the device tree. As the two sensors have to be identical (it's a
> > limitation of the AP1302), moving the model to the sensor nodes means
> > that someone could set two different models, and the driver will have to
> > include corresponding validation code. It's more code on the driver
> > side, and more complexity on the DT side. Does it actually bring us
> > anything ?
> 
> 1 schema instead of 2.

I'm not follow you here, given that we would need two different
compatible strings according to your suggestion below. Won't that be two
schemas ?

> That doesn't really seem much more complex given you probably need to
> make sure you have 2 and only 2 child nodes. You're checking a
> property either outside or inside a loop:
> 
> // check model or...
> // for_each_of_child_node()
>    // ...check compatible
>    // parse rest of node
> 
> // check 2 nodes setup.

I didn't say it would be extremely complex, but it's still additional
complexity on both the driver side and the DT side.

> > > > +
> > > > +          If no sensor is connected, this property must no be specified, and
> > > > +          the AP1302 can be used with it's internal test pattern generator.
> > > > +
> > > > +    patternProperties:
> > > > +      "^sensor@[01]":
> > > > +        type: object
> > > > +        description: |
> > > > +          Sensors connected to the first and second input, with one node per
> > > > +          sensor.
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            description: AP1302 input port number
> > > > +            maxItems: 1
> > >
> > > items:
> > >   - enum: [ 0, 1]
> > >
> > > > +
> > > > +        patternProperties:
> > > > +          ".*-supply":
> > >
> > > You need to list the supplies out.
> >
> > Fair point, given that we have a list of supply names per sensor in the
> > AP1302 driver.
> >
> > > I would make this a schema for the
> > > sensor along with compatible. Here, you could either reference those if
> > > you want to document the list of supported sensors or don't reference
> > > them and just document 'reg'. With a compatible, the schema will be
> > > applied anyways.
> >
> > This I'm more concerned about. The sensors may be the same when used
> > with the AP1302 or when used standalone, but their integration in the
> > system is quite different. With the AP1302, the reg value is the AP1302
> > port number, while in the standalone case, it's an I2C address. We're
> > just lucky that the #address-cells and #size-cells happen to be the same
> > in both cases.
> 
> 'reg' and everything associated with it are properties of the bus and
> outside the scope of this binding. We have the same binding on devices
> that can be on I2C or SPI for example.

There's no "bus" as such in this case. The AP1302 firmware handles the
sensors and hides them completely from Linux. We have no control bus
accessible by Linux for the sensors, and thus no driver binding to the
sensors. The reg property is specific to the AP1302 here, so it's not
out of scope of this binding.

> > In the standalone case, there will be more properties
> > that are not applicable here. How would we prevent all those other
> > properties from being evaluated in the AP1302 case ?
> 
> I'm not all that worried about that, but you could have a different
> compatible if you really wanted.

So that's two schemas, one for the sensor when used normally, and one
when used connected to the AP1302. That's not nice at all :-( I don't
think it's a good idea, given that the sensors are not exposed to Linux.

-- 
Regards,

Laurent Pinchart
