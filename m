Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 770D518BB6E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 16:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgCSPoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 11:44:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48204 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbgCSPoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 11:44:34 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A60A6A53;
        Thu, 19 Mar 2020 16:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584632671;
        bh=hwZnoYroqcsfC5OilM724CM4HxaREyK5LGahL3aJmfU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IRODqzXFUr0MVZ9ql1jSz/DFgC4uoHZjBv0SlngeYx6cSAomXNK2bvrQSOuiC1LJ1
         uMuFWWZGeAJu3E6wLvgO3yUrhJXpXiwHAwEMP2SnqJ+8oju+suv9ksMPMi1zkEwO+/
         K//I0LAQ7izBCNu6tCNYegUYdYl9xlIL+o71PjZY=
Date:   Thu, 19 Mar 2020 17:44:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 5/5] media: dt-bindings: media: i2c: convert ov5645
 bindings to json-schema
Message-ID: <20200319154426.GE14585@pendragon.ideasonboard.com>
References: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584620363-2255-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200319151035.GC14585@pendragon.ideasonboard.com>
 <CA+V-a8unmH8LskcjNXLum5a=+YkYOj=kZ3oOK6YZGKE2t4qf6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8unmH8LskcjNXLum5a=+YkYOj=kZ3oOK6YZGKE2t4qf6w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Thu, Mar 19, 2020 at 03:38:46PM +0000, Lad, Prabhakar wrote:
> On Thu, Mar 19, 2020 at 3:10 PM Laurent Pinchart wrote:
> > On Thu, Mar 19, 2020 at 12:19:23PM +0000, Lad Prabhakar wrote:
> > > Convert ov5645 bindings to json-schema.
> >
> > \o/
>
> :)
> 
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/ov5645.txt  |  54 -------
> > >  .../devicetree/bindings/media/i2c/ov5645.yaml | 140 ++++++++++++++++++
> > >  2 files changed, 140 insertions(+), 54 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > deleted file mode 100644
> > > index 1c85c78ec58c..000000000000
> > > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > +++ /dev/null
> > > @@ -1,54 +0,0 @@
> > > -* Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
> > > -
> > > -The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
> > > -an active array size of 2592H x 1944V. It is programmable through a serial I2C
> > > -interface.
> > > -
> > > -Required Properties:
> > > -- compatible: Value should be "ovti,ov5645".
> > > -- clocks: Reference to the xclk clock.
> > > -- clock-names: Should be "xclk".
> > > -- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > > -  to the hardware pin PWDNB which is physically active low.
> > > -- reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > > -  the hardware pin RESETB.
> > > -- vdddo-supply: Chip digital IO regulator.
> > > -- vdda-supply: Chip analog regulator.
> > > -- vddd-supply: Chip digital core regulator.
> > > -
> > > -The device node must contain one 'port' child node for its digital output
> > > -video port, in accordance with the video interface bindings defined in
> > > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > -
> > > -Example:
> > > -
> > > -     &i2c1 {
> > > -             ...
> > > -
> > > -             ov5645: ov5645@3c {
> > > -                     compatible = "ovti,ov5645";
> > > -                     reg = <0x3c>;
> > > -
> > > -                     enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
> > > -                     reset-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
> > > -                     pinctrl-names = "default";
> > > -                     pinctrl-0 = <&camera_rear_default>;
> > > -
> > > -                     clocks = <&clks 200>;
> > > -                     clock-names = "xclk";
> > > -                     assigned-clocks = <&clks 200>;
> > > -                     assigned-clock-rates = <24000000>;
> > > -
> > > -                     vdddo-supply = <&camera_dovdd_1v8>;
> > > -                     vdda-supply = <&camera_avdd_2v8>;
> > > -                     vddd-supply = <&camera_dvdd_1v2>;
> > > -
> > > -                     port {
> > > -                             ov5645_ep: endpoint {
> > > -                                     clock-lanes = <1>;
> > > -                                     data-lanes = <0 2>;
> > > -                                     remote-endpoint = <&csi0_ep>;
> > > -                             };
> > > -                     };
> > > -             };
> > > -     };
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.yaml b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > > new file mode 100644
> > > index 000000000000..4bf58ad210c5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > > @@ -0,0 +1,140 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ov5645.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
> >
> > s/Mp/MP/ ?
>
> OK
> 
> > > +
> > > +maintainers:
> > > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > +
> > > +description: |-
> > > + The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
> > > + an active array size of 2592H x 1944V. It is programmable through a serial I2C
> > > + interface.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov5645
> > > +
> > > +  reg:
> > > +    description: I2C device address
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: xclk
> > > +
> > > +  assigned-clocks:
> > > +    maxItems: 1
> > > +
> > > +  assigned-clock-rates:
> > > +     items:
> > > +     - description: Must be 24MHz (24000000).
> >
> > These two properties shouldn't be part of the bindings, they're generic.
>
> In that case how do we specify whats the expected clock frequency ?

You could specify the frequency range supported by the sensor (6 MHz to
27 MHz) in the description of the clocks property. The fact that only 24
MHz is supported is a driver issue, and should not be reflected in the
DT bindings.

> > > +
> > > +  enable-gpios:
> > > +    description: |-
> > > +      Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > > +      to the hardware pin PWDNB which is physically active low.
> >
> > Specifying that the polarity is GPIO_ACTIVE_HIGH is confusing in my
> > opinion. If there's an inverter on the board, you'll need
> > GPIO_ACTIVE_LOW. We could possibly drop the sentence, as all GPIOs in DT
> > are supposed to be active high, but the fact that the GPIO name
> > corresponds to the opposite of the pin probably has to be documented. I
> > have no better wording to propose now I'm afraid, but it needs to be
> > addressed. Maybe Rob or Maxime could help.
>
> Agreed, will wait for either Rob/Maxime to comment.
> 
> > > +
> > > +  reset-gpios:
> > > +    description: |-
> > > +      Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > > +      the hardware pin RESETB.
> >
> > Here you could just drop the second sentence, or apply the same fix as
> > for enable-gpios.
>
> OK
> 
> > > +
> > > +  vdddo-supply:
> > > +    description:
> > > +      Chip digital IO regulator.
> >
> > You can move the description on the same line as the "description:" key.
> > Same below.
>
> Will fix that.
> 
> > > +
> > > +  vdda-supply:
> > > +    description:
> > > +      Chip analog regulator.
> > > +
> > > +  vddd-supply:
> > > +    description:
> > > +      Chip digital core regulator.
> > > +
> > > +  # See ../video-interfaces.txt for more details
> > > +  port:
> > > +    type: object
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +
> > > +        properties:
> > > +          data-lanes:
> > > +            description: |-
> > > +              The sensor supports two-lane operation.
> > > +              For two-lane operation the property must be set to <1 2>.
> > > +            items:
> > > +              - const: 1
> > > +              - const: 2
> >
> > What if only one lane is wired, does the sensor support that ?
>
> Comparing with ov5640 datasheet (Assuming its similar to it) the
> sensor can support
> single/dual lane but looking at the driver it only supports dual lane mode atm
> { OV5645_MIPI_CTRL00, 0x24 },

That's a driver limitation though, the bindings should support both.

> > > +
> > > +          clock-lanes:
> > > +            description:
> > > +              should be set to <0> (clock lane on hardware lane 0).
> > > +            items:
> > > +              - const: 0
> > > +
> > > +          remote-endpoint: true
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +          - clock-lanes
> > > +          - remote-endpoint
> > > +
> > > +        additionalProperties: false
> > > +
> > > +    additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - assigned-clocks
> > > +  - assigned-clock-rates
> >
> > Those two properties should be dropped.
>
> Will do that.
> 
> > > +  - enable-gpios
> > > +  - reset-gpios
> >
> > Are the GPIOs mandatory ? What if the signals are hardwired on the board
> > ?
>
> Yes as per the driver, which needs to be fixed for making these optional :)

We can make them optional in the bindings at a later point, or do so
already.

> > > +  - vdddo-supply
> > > +  - vdda-supply
> > > +  - vddd-supply
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c1 {
> >
> > s/i2c1/i2c/
>
> Will fix that.
> 
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        ov5645: sensor@3c {
> > > +            compatible = "ovti,ov5645";
> > > +            reg = <0x3c>;
> > > +            clocks = <&ov5645_cl>;
> > > +            clock-names = "xclk";
> > > +            assigned-clocks = <&ov5645_cl>;
> > > +            assigned-clock-rates = <24000000>;
> > > +            enable-gpios = <&gpio1 6 /* GPIO_ACTIVE_HIGH */>;
> > > +            reset-gpios = <&gpio5 20 /* GPIO_ACTIVE_LOW */>;
> > > +            vdddo-supply = <&camera_dovdd_1v8>;
> > > +            vdda-supply = <&camera_avdd_2v8>;
> > > +            vddd-supply = <&camera_dvdd_1v2>;
> > > +
> > > +            port {
> > > +                ov5645_0: endpoint {
> > > +                    remote-endpoint = <&csi1_ep>;
> > > +                    clock-lanes = <0>;
> > > +                    data-lanes = <1 2>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...

-- 
Regards,

Laurent Pinchart
