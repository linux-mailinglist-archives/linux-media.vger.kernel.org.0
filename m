Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D315A24F3B9
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 10:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgHXIOb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 04:14:31 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57777 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgHXIOa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 04:14:30 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0428AC0005;
        Mon, 24 Aug 2020 08:14:24 +0000 (UTC)
Date:   Mon, 24 Aug 2020 10:18:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@kernel.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx214: Convert to json-schema
Message-ID: <20200824081810.7xwheje64ps4nbvf@uno.localdomain>
References: <20200818121755.37706-1-jacopo+renesas@jmondi.org>
 <20200819132823.GH6049@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200819132823.GH6049@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Aug 19, 2020 at 04:28:23PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 18, 2020 at 02:17:55PM +0200, Jacopo Mondi wrote:
> > Convert the imx214 bindings document to json-schema and update
> > the MAINTAINERS file accordingly.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/media/i2c/sony,imx214.txt        |  53 --------
> >  .../bindings/media/i2c/sony,imx214.yaml       | 124 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 125 insertions(+), 54 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt b/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> > deleted file mode 100644
> > index f11f28a5fda4..000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -* Sony 1/3.06-Inch 13.13Mp CMOS Digital Image Sensor
> > -
> > -The Sony imx214 is a 1/3.06-inch CMOS active pixel digital image sensor with
> > -an active array size of 4224H x 3200V. It is programmable through an I2C
> > -interface.
> > -Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a maximum
> > -throughput of 1.2Gbps/lane.
> > -
> > -
> > -Required Properties:
> > -- compatible: Shall be "sony,imx214".
> > -- reg: I2C bus address of the device. Depending on how the sensor is wired,
> > -       it shall be <0x10> or <0x1a>;
> > -- enable-gpios: GPIO descriptor for the enable pin.
> > -- vdddo-supply: Chip digital IO regulator (1.8V).
> > -- vdda-supply: Chip analog regulator (2.7V).
> > -- vddd-supply: Chip digital core regulator (1.12V).
> > -- clocks: Reference to the xclk clock.
> > -- clock-frequency: Frequency of the xclk clock.
> > -
> > -Optional Properties:
> > -- flash-leds: See ../video-interfaces.txt
> > -- lens-focus: See ../video-interfaces.txt
> > -
> > -The imx214 device node shall contain one 'port' child node with
> > -an 'endpoint' subnode. For further reading on port node refer to
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -Required Properties on endpoint:
> > -- data-lanes: check ../video-interfaces.txt
> > -- link-frequencies: check ../video-interfaces.txt
> > -- remote-endpoint: check ../video-interfaces.txt
> > -
> > -Example:
> > -
> > -	camera-sensor@1a {
> > -		compatible = "sony,imx214";
> > -		reg = <0x1a>;
> > -		vdddo-supply = <&pm8994_lvs1>;
> > -		vddd-supply = <&camera_vddd_1v12>;
> > -		vdda-supply = <&pm8994_l17>;
> > -		lens-focus = <&ad5820>;
> > -		enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> > -		clocks = <&mmcc CAMSS_MCLK0_CLK>;
> > -		clock-frequency = <24000000>;
> > -		port {
> > -			imx214_ep: endpoint {
> > -				data-lanes = <1 2 3 4>;
> > -				link-frequencies = /bits/ 64 <480000000>;
> > -				remote-endpoint = <&csiphy0_ep>;
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> > new file mode 100644
> > index 000000000000..ddd4627214b1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> > @@ -0,0 +1,124 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx214.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/3.06-Inch 13.13Mp CMOS Digital Image Sensor
>
> s/Mp/MP/
>
> > +
> > +maintainers:
> > +  - Ricardo Ribalda <ribalda@kernel.org>
> > +
> > +description: -|
> > +  The Sony imx214 is a 1/3.06-inch CMOS active pixel digital image sensor with
>
> s/imx214/IMX214/
>
> > +  an active array size of 4224H x 3200V. It is programmable through an I2C
> > +  interface.  Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a
>
> s/  Image/ Image/
>
> > +  maximum throughput of 1.2Gbps/lane.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx214
> > +
> > +  reg:
> > +    description: -|
> > +      I2C device address. Depends on how the sensor is wired.
>
> I'd drop the description, it's fairly evident as it's an I2C device,
> isn't it ?
>
> > +    enum:
> > +      - 0x10
> > +      - 0x1a
> > +
> > +  clocks:
> > +    description: Reference to the xclk clock.
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description: Frequency of the xclk clock in Hz.
> > +
> > +  enable-gpios:
> > +    description: GPIO descriptor for the enable pin.
> > +    maxItems: 1
> > +
> > +  vdddo-supply:
> > +    description: Chip digital IO regulator (1.8V).
> > +    maxItems: 1
> > +
> > +  vdda-supply:
> > +    description: Chip analog regulator (2.7V).
> > +    maxItems: 1
> > +
> > +  vddd-supply:
> > +    description: Chip digital core regulator (1.12V).
> > +    maxItems: 1
> > +
> > +  flash-leds:
> > +    description: See ../video-interfaces.txt
> > +
> > +  lens-focus:
> > +    description: See ../video-interfaces.txt
> > +
> > +  port:
> > +    type: object
> > +    description: |
> > +      The device node must contain one 'port' child node for its digital output
> > +      video port, in accordance with the video interface bindings defined in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt.
>
> I'd drop this, the port node is already described as required below.
>
> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        properties:
> > +          remote-endpoint:
> > +            description: See ../video-interfaces.txt
> > +
> > +          data-lanes:
> > +            description: See ../video-interfaces.txt
>
> Shouldn't this also express that only 2 or 4 data lanes are allowed ?

I can't tell. I don't have the device manual, nor I'm the maintainer
of the driver, so I barely translated the existing bindings into yaml.
Spelling improvements apart, I won't modify the existing in this
patch, but possibly on top.

That' said, in this case the device description reports "supports 2 or
4 lanes" so that's probably the case and this could be done already ?

>
>             $ref: /schemas/types.yaml#/definitions/uint32-array
>             description: See ../video-interfaces.txt
>             anyOf:
>               - items:
>                   - const: 1
>                   - const: 2
>               - items:
>                   - const: 1
>                   - const: 2
>                   - const: 3
>                   - const: 4
>
> Maybe someone more experienced with YAML schemas could propose a better
> way to express this ? I initially tried to express it with enum instead
> of anyOf but couldn't get it to work.

FWIW I can trick the validator to work with

          data-lanes:
            description: See ../video-interfaces.txt
            enum:
              - [[1, 2]]
              - [[1, 2, 3, 4]]

If I drop the ugly double [[ ]] I get a complaint for:
camera-sensor@1a: port:endpoint:data-lanes: [[1, 2, 3, 4]] is not one of [[1, 2], [1, 2, 3, 4]]

which makes me think the way we express the property makes the
validator parse it as an array of arrays of uint32_t.

If no better suggestions, I'll take your in as a separate patch on
top.

>
> > +
> > +          link-frequencies:
>
>             $ref: /schemas/types.yaml#/definitions/uint64-array

Right!

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>

Thanks
  j

> > +            description: See ../video-interfaces.txt
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-frequency
> > +  - enable-gpios
> > +  - vdddo-supply
> > +  - vdda-supply
> > +  - vddd-supply
> > +  - port
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera-sensor@1a {
> > +            compatible = "sony,imx214";
> > +            reg = <0x1a>;
> > +            vdddo-supply = <&pm8994_lvs1>;
> > +            vddd-supply = <&camera_vddd_1v12>;
> > +            vdda-supply = <&pm8994_l17>;
> > +            lens-focus = <&ad5820>;
> > +            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> > +            clocks = <&camera_clk>;
> > +            clock-frequency = <24000000>;
> > +
> > +            port {
> > +                imx214_ep: endpoint {
> > +                    data-lanes = <1 2 3 4>;
> > +                    link-frequencies = /bits/ 64 <480000000>;
> > +                    remote-endpoint = <&csiphy0_ep>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6c8e98238a7b..d1a6173d3b64 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15918,7 +15918,7 @@ M:	Ricardo Ribalda <ribalda@kernel.org>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media_tree.git
> > -F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> > +F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> >  F:	drivers/media/i2c/imx214.c
> >
> >  SONY IMX219 SENSOR DRIVER
>
> --
> Regards,
>
> Laurent Pinchart
