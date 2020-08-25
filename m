Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082E7252221
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 22:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHYUqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 16:46:21 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34362 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgHYUqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 16:46:20 -0400
Received: by mail-io1-f66.google.com with SMTP id w20so191207iom.1;
        Tue, 25 Aug 2020 13:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T212ljWm3/La6EYAf+l9ma6CbA8Y77If7HMdW/pDI54=;
        b=mZqazLc5VNUzyRrDEtbJZ7u+U6lw9WqAIe3H/+OxGOWXzq8QAf7uO/G3COrP86nyzE
         b6dqm3FxOOJb0nlAplamDHRb0blDvZ7dRCyS3r2a2kjm189PCSCKxCSQDOsxDTKqjCSk
         kDCTcWTlU9vrdkoZPq8xaIvnQulgMrfdDXE2GgGeobkxVKTRpDq76IkWz/xyg04UIY8i
         zfRTbpxbc32subHXf3b1oGAZ2jvLXUxc7uV1gvbyJQ9FfsQ8d5AnDUzktUz9Qok7IhhE
         oYnnWhfqRTksdXk67YbBSpN/SeEnU9Zx+VK8DWDk2DWZqgVVuMI8lO58e9HET2e0ybvX
         eCpA==
X-Gm-Message-State: AOAM530UZvkW9ZxrsNjRoZ45mXqacVD5n6EHs++2gxxnZjv0vaMRbmxn
        PRneC5ZzhLYxUAxzOBTfbQ==
X-Google-Smtp-Source: ABdhPJzpNgBnQJh4gFgM32Xr4XKkiDTDErx+sKhE1KreYvXhb37mQAndbwhtwbCBn2B0KTcP2+yxiA==
X-Received: by 2002:a6b:8fc9:: with SMTP id r192mr3433164iod.24.1598388378264;
        Tue, 25 Aug 2020 13:46:18 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id i10sm9076747ioo.49.2020.08.25.13.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 13:46:17 -0700 (PDT)
Received: (nullmailer pid 1298021 invoked by uid 1000);
        Tue, 25 Aug 2020 20:46:14 -0000
Date:   Tue, 25 Aug 2020 14:46:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@kernel.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx214: Convert to json-schema
Message-ID: <20200825204614.GB1199184@bogus>
References: <20200818121755.37706-1-jacopo+renesas@jmondi.org>
 <20200819132823.GH6049@pendragon.ideasonboard.com>
 <20200824081810.7xwheje64ps4nbvf@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824081810.7xwheje64ps4nbvf@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 10:18:10AM +0200, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Wed, Aug 19, 2020 at 04:28:23PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Tue, Aug 18, 2020 at 02:17:55PM +0200, Jacopo Mondi wrote:
> > > Convert the imx214 bindings document to json-schema and update
> > > the MAINTAINERS file accordingly.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  .../bindings/media/i2c/sony,imx214.txt        |  53 --------
> > >  .../bindings/media/i2c/sony,imx214.yaml       | 124 ++++++++++++++++++
> > >  MAINTAINERS                                   |   2 +-
> > >  3 files changed, 125 insertions(+), 54 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt b/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> > > deleted file mode 100644
> > > index f11f28a5fda4..000000000000
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> > > +++ /dev/null
> > > @@ -1,53 +0,0 @@
> > > -* Sony 1/3.06-Inch 13.13Mp CMOS Digital Image Sensor
> > > -
> > > -The Sony imx214 is a 1/3.06-inch CMOS active pixel digital image sensor with
> > > -an active array size of 4224H x 3200V. It is programmable through an I2C
> > > -interface.
> > > -Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a maximum
> > > -throughput of 1.2Gbps/lane.
> > > -
> > > -
> > > -Required Properties:
> > > -- compatible: Shall be "sony,imx214".
> > > -- reg: I2C bus address of the device. Depending on how the sensor is wired,
> > > -       it shall be <0x10> or <0x1a>;
> > > -- enable-gpios: GPIO descriptor for the enable pin.
> > > -- vdddo-supply: Chip digital IO regulator (1.8V).
> > > -- vdda-supply: Chip analog regulator (2.7V).
> > > -- vddd-supply: Chip digital core regulator (1.12V).
> > > -- clocks: Reference to the xclk clock.
> > > -- clock-frequency: Frequency of the xclk clock.
> > > -
> > > -Optional Properties:
> > > -- flash-leds: See ../video-interfaces.txt
> > > -- lens-focus: See ../video-interfaces.txt
> > > -
> > > -The imx214 device node shall contain one 'port' child node with
> > > -an 'endpoint' subnode. For further reading on port node refer to
> > > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > -
> > > -Required Properties on endpoint:
> > > -- data-lanes: check ../video-interfaces.txt
> > > -- link-frequencies: check ../video-interfaces.txt
> > > -- remote-endpoint: check ../video-interfaces.txt
> > > -
> > > -Example:
> > > -
> > > -	camera-sensor@1a {
> > > -		compatible = "sony,imx214";
> > > -		reg = <0x1a>;
> > > -		vdddo-supply = <&pm8994_lvs1>;
> > > -		vddd-supply = <&camera_vddd_1v12>;
> > > -		vdda-supply = <&pm8994_l17>;
> > > -		lens-focus = <&ad5820>;
> > > -		enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> > > -		clocks = <&mmcc CAMSS_MCLK0_CLK>;
> > > -		clock-frequency = <24000000>;
> > > -		port {
> > > -			imx214_ep: endpoint {
> > > -				data-lanes = <1 2 3 4>;
> > > -				link-frequencies = /bits/ 64 <480000000>;
> > > -				remote-endpoint = <&csiphy0_ep>;
> > > -			};
> > > -		};
> > > -	};
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> > > new file mode 100644
> > > index 000000000000..ddd4627214b1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> > > @@ -0,0 +1,124 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/sony,imx214.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony 1/3.06-Inch 13.13Mp CMOS Digital Image Sensor
> >
> > s/Mp/MP/
> >
> > > +
> > > +maintainers:
> > > +  - Ricardo Ribalda <ribalda@kernel.org>
> > > +
> > > +description: -|
> > > +  The Sony imx214 is a 1/3.06-inch CMOS active pixel digital image sensor with
> >
> > s/imx214/IMX214/
> >
> > > +  an active array size of 4224H x 3200V. It is programmable through an I2C
> > > +  interface.  Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a
> >
> > s/  Image/ Image/
> >
> > > +  maximum throughput of 1.2Gbps/lane.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx214
> > > +
> > > +  reg:
> > > +    description: -|
> > > +      I2C device address. Depends on how the sensor is wired.
> >
> > I'd drop the description, it's fairly evident as it's an I2C device,
> > isn't it ?
> >
> > > +    enum:
> > > +      - 0x10
> > > +      - 0x1a
> > > +
> > > +  clocks:
> > > +    description: Reference to the xclk clock.
> > > +    maxItems: 1
> > > +
> > > +  clock-frequency:
> > > +    description: Frequency of the xclk clock in Hz.
> > > +
> > > +  enable-gpios:
> > > +    description: GPIO descriptor for the enable pin.
> > > +    maxItems: 1
> > > +
> > > +  vdddo-supply:
> > > +    description: Chip digital IO regulator (1.8V).
> > > +    maxItems: 1
> > > +
> > > +  vdda-supply:
> > > +    description: Chip analog regulator (2.7V).
> > > +    maxItems: 1
> > > +
> > > +  vddd-supply:
> > > +    description: Chip digital core regulator (1.12V).
> > > +    maxItems: 1
> > > +
> > > +  flash-leds:
> > > +    description: See ../video-interfaces.txt
> > > +
> > > +  lens-focus:
> > > +    description: See ../video-interfaces.txt
> > > +
> > > +  port:
> > > +    type: object
> > > +    description: |
> > > +      The device node must contain one 'port' child node for its digital output
> > > +      video port, in accordance with the video interface bindings defined in
> > > +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> >
> > I'd drop this, the port node is already described as required below.
> >
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        properties:
> > > +          remote-endpoint:
> > > +            description: See ../video-interfaces.txt
> > > +
> > > +          data-lanes:
> > > +            description: See ../video-interfaces.txt
> >
> > Shouldn't this also express that only 2 or 4 data lanes are allowed ?
> 
> I can't tell. I don't have the device manual, nor I'm the maintainer
> of the driver, so I barely translated the existing bindings into yaml.
> Spelling improvements apart, I won't modify the existing in this
> patch, but possibly on top.
> 
> That' said, in this case the device description reports "supports 2 or
> 4 lanes" so that's probably the case and this could be done already ?
> 
> >
> >             $ref: /schemas/types.yaml#/definitions/uint32-array
> >             description: See ../video-interfaces.txt
> >             anyOf:
> >               - items:
> >                   - const: 1
> >                   - const: 2
> >               - items:
> >                   - const: 1
> >                   - const: 2
> >                   - const: 3
> >                   - const: 4
> >
> > Maybe someone more experienced with YAML schemas could propose a better
> > way to express this ? I initially tried to express it with enum instead
> > of anyOf but couldn't get it to work.
> 
> FWIW I can trick the validator to work with
> 
>           data-lanes:
>             description: See ../video-interfaces.txt
>             enum:
>               - [[1, 2]]
>               - [[1, 2, 3, 4]]
> 
> If I drop the ugly double [[ ]] I get a complaint for:
> camera-sensor@1a: port:endpoint:data-lanes: [[1, 2, 3, 4]] is not one of [[1, 2], [1, 2, 3, 4]]

That exposes that the data encoding is an array of an array which I 
don't really want to do in schemas. To fix this, we would need to 
rework the fix-ups for this case and they are fairly fragile code 
(which I've rewritten like 3 times now). 

I'd stick with Laurent's suggestion for now and put supporting this on 
my todo.

> which makes me think the way we express the property makes the
> validator parse it as an array of arrays of uint32_t.

In case you're curious, the reason why everything is an array of arrays 
is because dtc has no way of knowing if a given property is an array 
with a single element or always a scalar. And then we treat the 
bracketing in dts as significant. 

Rob
