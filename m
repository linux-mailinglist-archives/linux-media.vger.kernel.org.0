Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5586A433C6D
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 18:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhJSQh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 12:37:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234403AbhJSQhz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 12:37:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D580761372;
        Tue, 19 Oct 2021 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634661341;
        bh=t49fabp9Rfx1p92oCVg5Q37XFSqXUlR4XnM5csMMH+I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=er+RrJb/mpqWHpwy4/tkl/h/3USK/scnMiv4TtRM/BRM0yORiZguEscDaMHD0qxun
         tr0zJZ6hBASmkfo6x5TAy32ViDzDY33D5V4tafLH6CZZSBnz1QUOe2hfxFBV8LSSqm
         wfu4v1lsCyDtF6R95CoaWabfEsY2ZlQxaofBQ5zrDRjhLPNO3emI6hWmd66rWuEir0
         qxZEULJxVzidT+8E/Pa3Pe6td4ThIb0VTwKKCEEEJGa5hl5nb5SO4WHtQEpmI/gndw
         +eR7tnT6Os8aZZGHPSoP5uzvPPx+eEHDabcm6c9+U3dyN1lcAkH1uqYu3opwA5OkcT
         Ve1DwIyyXSXJA==
Received: by mail-ed1-f50.google.com with SMTP id g10so14858908edj.1;
        Tue, 19 Oct 2021 09:35:41 -0700 (PDT)
X-Gm-Message-State: AOAM5325wN5bx5fNh2AaDzSV7oirhUQUMQH6UNOS+YZwUGS+ixGBzReH
        GUYhr1Oac6rrWlTfcBU7n63XcA7KcfT3TP4X8g==
X-Google-Smtp-Source: ABdhPJyOQ4I0nlKEjIn9sPypvjSCRL7wp1i7gqhfUE23s+bWssKSLXMWKBtgCWZCoWDaN3SZtx31rh4UJnjjaMybmU0=
X-Received: by 2002:a17:906:9399:: with SMTP id l25mr37839139ejx.363.1634661168559;
 Tue, 19 Oct 2021 09:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211006113254.3470-1-anil.mamidala@xilinx.com>
 <20211006113254.3470-2-anil.mamidala@xilinx.com> <YWiK/xXEQwC5HgWD@robh.at.kernel.org>
 <YWiRERUYZTBepOKU@pendragon.ideasonboard.com> <CAL_Jsq+DjGZpZgE7SiVeSQLsWFHOmBdK+sodUQAeBMd5QPYw0w@mail.gmail.com>
 <YW17d1nj3vyjiYu+@pendragon.ideasonboard.com>
In-Reply-To: <YW17d1nj3vyjiYu+@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 19 Oct 2021 11:32:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKXB9MY7rdQZZ6NyuLXWBVKeS4m4kGX8OX5pYU6ZjeFPg@mail.gmail.com>
Message-ID: <CAL_JsqKXB9MY7rdQZZ6NyuLXWBVKeS4m4kGX8OX5pYU6ZjeFPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for AP1302
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Anil Kumar Mamidala <anil.mamidala@xilinx.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 8:50 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Mon, Oct 18, 2021 at 08:36:51AM -0500, Rob Herring wrote:
> > On Thu, Oct 14, 2021 at 3:20 PM Laurent Pinchart wrote:
> > > On Thu, Oct 14, 2021 at 02:54:39PM -0500, Rob Herring wrote:
> > > > On Wed, Oct 06, 2021 at 05:32:54AM -0600, Anil Kumar Mamidala wrote:
> > > > > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > > > > Add corresponding DT bindings.
> > > > >
> > > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > > ---
> > > > >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 202 +++++++++++++++++++++
> > > > >  1 file changed, 202 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > new file mode 100644
> > > > > index 0000000..d96e9db
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > @@ -0,0 +1,202 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > > > > +
> > > > > +maintainers:
> > > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > > +
> > > > > +description: |-
> > > > > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > > > > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > > > > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > > > > +  Frames are output side by side or on two virtual channels.
> > > > > +
> > > > > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > > > > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > > > > +  from the host.
> > > >
> > > > In your case, but in general I'd assume whatever sensors are used here
> > > > could be attached directly to an SoC with a built-in ISP?
> > >
> > > That is correct, the same sensors can be used with a different ISP
> > > (built-in or not), or even without any ISP.
> > >
> > > > The model and
> > > > power supplies you specify wouldn't be different, so I think the same
> > > > binding could be used for both. Though here, you probably just need a
> > > > subset. More below.
> > > >
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: onnn,ap1302
> > > > > +
> > > > > +  reg:
> > > > > +    description: I2C device address.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    description: Reference to the CLK clock.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  reset-gpios:
> > > > > +    description: Reference to the GPIO connected to the RST pin (active low).
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  standby-gpios:
> > > > > +    description:
> > > > > +      Reference to the GPIO connected to the STANDBY pin (active high).
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  port:
> > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > +    unevaluatedProperties: false
> > > > > +    description: MIPI CSI-2 output interface to the host.
> > > > > +
> > > > > +    properties:
> > > > > +      endpoint:
> > > > > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > > +        unevaluatedProperties: false
> > > > > +
> > > > > +        properties:
> > > > > +          clock-noncontinuous:
> > > > > +            type: boolean
> > > > > +
> > > > > +          data-lanes:
> > > > > +            oneOf:
> > > > > +              - items:
> > > > > +                  - const: 1
> > > > > +              - items:
> > > > > +                  - const: 1
> > > > > +                  - const: 2
> > > > > +              - items:
> > > > > +                  - const: 1
> > > > > +                  - const: 2
> > > > > +                  - const: 3
> > > > > +                  - const: 4
> > > > > +
> > > > > +        required:
> > > > > +          - data-lanes
> > > > > +
> > > > > +  sensors:
> > > > > +    type: object
> > > > > +    description: List of connected sensors
> > > > > +
> > > > > +    properties:
> > > > > +      "#address-cells":
> > > > > +        const: 1
> > > > > +
> > > > > +      "#size-cells":
> > > > > +        const: 0
> > > > > +
> > > > > +      onnn,model:
> > > > > +        $ref: "/schemas/types.yaml#/definitions/string"
> > > > > +        description: |
> > > > > +          Model of the connected sensors. Must be a valid compatible string.
> > > >
> > > > Then make it a compatible string and move into each child node.
> > >
> > > We started with that, but considered that it made mistakes more easily
> > > in the device tree. As the two sensors have to be identical (it's a
> > > limitation of the AP1302), moving the model to the sensor nodes means
> > > that someone could set two different models, and the driver will have to
> > > include corresponding validation code. It's more code on the driver
> > > side, and more complexity on the DT side. Does it actually bring us
> > > anything ?
> >
> > 1 schema instead of 2.
>
> I'm not follow you here, given that we would need two different
> compatible strings according to your suggestion below. Won't that be two
> schemas ?

Depends on how different they are. If it's just disallowing some
properties for one compatible, that's probably just an if/then schema.
And I said you *could* have different ones.

> > That doesn't really seem much more complex given you probably need to
> > make sure you have 2 and only 2 child nodes. You're checking a
> > property either outside or inside a loop:
> >
> > // check model or...
> > // for_each_of_child_node()
> >    // ...check compatible
> >    // parse rest of node
> >
> > // check 2 nodes setup.
>
> I didn't say it would be extremely complex, but it's still additional
> complexity on both the driver side and the DT side.
>
> > > > > +
> > > > > +          If no sensor is connected, this property must no be specified, and
> > > > > +          the AP1302 can be used with it's internal test pattern generator.
> > > > > +
> > > > > +    patternProperties:
> > > > > +      "^sensor@[01]":
> > > > > +        type: object
> > > > > +        description: |
> > > > > +          Sensors connected to the first and second input, with one node per
> > > > > +          sensor.
> > > > > +
> > > > > +        properties:
> > > > > +          reg:
> > > > > +            description: AP1302 input port number
> > > > > +            maxItems: 1
> > > >
> > > > items:
> > > >   - enum: [ 0, 1]
> > > >
> > > > > +
> > > > > +        patternProperties:
> > > > > +          ".*-supply":
> > > >
> > > > You need to list the supplies out.
> > >
> > > Fair point, given that we have a list of supply names per sensor in the
> > > AP1302 driver.
> > >
> > > > I would make this a schema for the
> > > > sensor along with compatible. Here, you could either reference those if
> > > > you want to document the list of supported sensors or don't reference
> > > > them and just document 'reg'. With a compatible, the schema will be
> > > > applied anyways.
> > >
> > > This I'm more concerned about. The sensors may be the same when used
> > > with the AP1302 or when used standalone, but their integration in the
> > > system is quite different. With the AP1302, the reg value is the AP1302
> > > port number, while in the standalone case, it's an I2C address. We're
> > > just lucky that the #address-cells and #size-cells happen to be the same
> > > in both cases.
> >
> > 'reg' and everything associated with it are properties of the bus and
> > outside the scope of this binding. We have the same binding on devices
> > that can be on I2C or SPI for example.
>
> There's no "bus" as such in this case. The AP1302 firmware handles the
> sensors and hides them completely from Linux. We have no control bus
> accessible by Linux for the sensors, and thus no driver binding to the
> sensors. The reg property is specific to the AP1302 here, so it's not
> out of scope of this binding.

If 'reg' is used, then then it is a bus of some kind in the DT
definition of a bus. It's 'the way you address child devices' if you
want to not use 'bus'.

> > > In the standalone case, there will be more properties
> > > that are not applicable here. How would we prevent all those other
> > > properties from being evaluated in the AP1302 case ?
> >
> > I'm not all that worried about that, but you could have a different
> > compatible if you really wanted.
>
> So that's two schemas, one for the sensor when used normally, and one
> when used connected to the AP1302. That's not nice at all :-( I don't
> think it's a good idea, given that the sensors are not exposed to Linux.

Obviously they are exposed in some way or we wouldn't be having this
conversation.

Also, on the supplies, once you list them out, couldn't they be
different per sensor model? How would you support that? That's going
to mean a schema per sensor model.

Rob
