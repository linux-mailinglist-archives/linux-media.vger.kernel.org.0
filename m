Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F76B431DBB
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 15:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbhJRNyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 09:54:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232327AbhJRNwa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 09:52:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B5116140A;
        Mon, 18 Oct 2021 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634564328;
        bh=+KNkz7Nw4XNYaPsxS3VoMilJ6IGWgKggJgF0Dx0aCjM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MK+Hi/zS2sheljq77TCabhacPeJQVWHNDrGJq/pijFuQzh5p18E+aAaCVAgmSsIZG
         YTI1EQcMkocgwYsyeeNvSG3Y+w4xb/nKUhQVSIltXstTektUD7bN7NV7urNftt7IPa
         3jbbTz322yXShepmB8RmvttQAkI/WmBuzso6N2AGIlbFtXIwuF5xwo4d50q64Q5pWP
         f06aXtzvACs7mN3nxi1NXbLnhIO54e1a2GxvVUjybxxoKH3Gi/ke4VwkDcg1sKxl1q
         cBq53MW20kewjYXIJpMQF1X88qfnfYFawMRPWo13xCpq/UcxEiYUGbh7o5omG3EC7E
         /9l/1e8ossTOQ==
Received: by mail-ed1-f54.google.com with SMTP id w14so71206519edv.11;
        Mon, 18 Oct 2021 06:38:48 -0700 (PDT)
X-Gm-Message-State: AOAM532tw9h02Cw9swMQEl43AE72XxILnpceN2EOu8u/Zz2TcW8/hPrO
        BZmae9Ddvswib+M047YOt3m9yCMCcy08W7XNjg==
X-Google-Smtp-Source: ABdhPJzC8FCPx06z5aKCjWFU3VIkGsOX3tAUk7AlT9uiEN0CIXyCaWz0JWKVLuQfIZRXr0NuuVoDXKwt65WpQ/4p1+s=
X-Received: by 2002:a05:6402:27d3:: with SMTP id c19mr43500965ede.70.1634564223968;
 Mon, 18 Oct 2021 06:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211006113254.3470-1-anil.mamidala@xilinx.com>
 <20211006113254.3470-2-anil.mamidala@xilinx.com> <YWiK/xXEQwC5HgWD@robh.at.kernel.org>
 <YWiRERUYZTBepOKU@pendragon.ideasonboard.com>
In-Reply-To: <YWiRERUYZTBepOKU@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 18 Oct 2021 08:36:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+DjGZpZgE7SiVeSQLsWFHOmBdK+sodUQAeBMd5QPYw0w@mail.gmail.com>
Message-ID: <CAL_Jsq+DjGZpZgE7SiVeSQLsWFHOmBdK+sodUQAeBMd5QPYw0w@mail.gmail.com>
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

On Thu, Oct 14, 2021 at 3:20 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Thu, Oct 14, 2021 at 02:54:39PM -0500, Rob Herring wrote:
> > On Wed, Oct 06, 2021 at 05:32:54AM -0600, Anil Kumar Mamidala wrote:
> > > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > > Add corresponding DT bindings.
> > >
> > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 202 +++++++++++++++++++++
> > >  1 file changed, 202 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > new file mode 100644
> > > index 0000000..d96e9db
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > @@ -0,0 +1,202 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > +
> > > +description: |-
> > > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > > +  Frames are output side by side or on two virtual channels.
> > > +
> > > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > > +  from the host.
> >
> > In your case, but in general I'd assume whatever sensors are used here
> > could be attached directly to an SoC with a built-in ISP?
>
> That is correct, the same sensors can be used with a different ISP
> (built-in or not), or even without any ISP.
>
> > The model and
> > power supplies you specify wouldn't be different, so I think the same
> > binding could be used for both. Though here, you probably just need a
> > subset. More below.
> >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: onnn,ap1302
> > > +
> > > +  reg:
> > > +    description: I2C device address.
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: Reference to the CLK clock.
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    description: Reference to the GPIO connected to the RST pin (active low).
> > > +    maxItems: 1
> > > +
> > > +  standby-gpios:
> > > +    description:
> > > +      Reference to the GPIO connected to the STANDBY pin (active high).
> > > +    maxItems: 1
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    unevaluatedProperties: false
> > > +    description: MIPI CSI-2 output interface to the host.
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          clock-noncontinuous:
> > > +            type: boolean
> > > +
> > > +          data-lanes:
> > > +            oneOf:
> > > +              - items:
> > > +                  - const: 1
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +
> > > +  sensors:
> > > +    type: object
> > > +    description: List of connected sensors
> > > +
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      onnn,model:
> > > +        $ref: "/schemas/types.yaml#/definitions/string"
> > > +        description: |
> > > +          Model of the connected sensors. Must be a valid compatible string.
> >
> > Then make it a compatible string and move into each child node.
>
> We started with that, but considered that it made mistakes more easily
> in the device tree. As the two sensors have to be identical (it's a
> limitation of the AP1302), moving the model to the sensor nodes means
> that someone could set two different models, and the driver will have to
> include corresponding validation code. It's more code on the driver
> side, and more complexity on the DT side. Does it actually bring us
> anything ?

1 schema instead of 2.

That doesn't really seem much more complex given you probably need to
make sure you have 2 and only 2 child nodes. You're checking a
property either outside or inside a loop:

// check model or...
// for_each_of_child_node()
   // ...check compatible
   // parse rest of node

// check 2 nodes setup.

>
> > > +
> > > +          If no sensor is connected, this property must no be specified, and
> > > +          the AP1302 can be used with it's internal test pattern generator.
> > > +
> > > +    patternProperties:
> > > +      "^sensor@[01]":
> > > +        type: object
> > > +        description: |
> > > +          Sensors connected to the first and second input, with one node per
> > > +          sensor.
> > > +
> > > +        properties:
> > > +          reg:
> > > +            description: AP1302 input port number
> > > +            maxItems: 1
> >
> > items:
> >   - enum: [ 0, 1]
> >
> > > +
> > > +        patternProperties:
> > > +          ".*-supply":
> >
> > You need to list the supplies out.
>
> Fair point, given that we have a list of supply names per sensor in the
> AP1302 driver.
>
> > I would make this a schema for the
> > sensor along with compatible. Here, you could either reference those if
> > you want to document the list of supported sensors or don't reference
> > them and just document 'reg'. With a compatible, the schema will be
> > applied anyways.
>
> This I'm more concerned about. The sensors may be the same when used
> with the AP1302 or when used standalone, but their integration in the
> system is quite different. With the AP1302, the reg value is the AP1302
> port number, while in the standalone case, it's an I2C address. We're
> just lucky that the #address-cells and #size-cells happen to be the same
> in both cases.

'reg' and everything associated with it are properties of the bus and
outside the scope of this binding. We have the same binding on devices
that can be on I2C or SPI for example.

> In the standalone case, there will be more properties
> that are not applicable here. How would we prevent all those other
> properties from being evaluated in the AP1302 case ?

I'm not all that worried about that, but you could have a different
compatible if you really wanted.

Rob
