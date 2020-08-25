Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B682520FF
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 21:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgHYTu4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 15:50:56 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46223 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726570AbgHYTuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 15:50:54 -0400
Received: by mail-io1-f65.google.com with SMTP id d18so4453081iop.13;
        Tue, 25 Aug 2020 12:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A/K9hgoNgX1yqNOPP0vdW/Zwp8hH78Dq/iAwIqDHpJ0=;
        b=dxmn8lLmoFft64nQiOXMjNV2Addw4ZkZN887DAHHZl6zuCiYQB/jq2PTstv7onWTuq
         R8ce/85dZdU+nsZaZ5pl3gTcuY37zbgRndKTLYptWCa5RGyXJTvPBI6FbOwQ29lBQh8N
         /4ucf5j/KBe6SNnAVjrpRaSQcDSe+Qqb/d4OGQtNE0StoCUVD1H0R5iUqAHps11J+34b
         gcA2naG94n1ic+G4lNujbW9syeQIwMQaxwDEnc/SLEWetDce7zgroUb55EdFxRzuTv02
         VWYiUxmQRw97ZZQs7XNbmOYstp8JvBHUoeNKNVSBQWcijOm+dWojCLh8/bAOxMGxgKux
         l6qg==
X-Gm-Message-State: AOAM531yqYCv64WX+nxdtW7NlmQHK9ZL7v9peXZmshrAGaPn8kZXmdoy
        iJuKBTT9jFN0FQ9JDKa9mFYN2BCWKNhP
X-Google-Smtp-Source: ABdhPJzn0LaWc5LtdVi27oS/66l314ee6b3xtm1XvtotF/5uQAPTfONRn55/eTulnpWZAPL56wpLXg==
X-Received: by 2002:a02:6d0e:: with SMTP id m14mr11998125jac.23.1598385052474;
        Tue, 25 Aug 2020 12:50:52 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id u17sm8977ilb.44.2020.08.25.12.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 12:50:51 -0700 (PDT)
Received: (nullmailer pid 1210818 invoked by uid 1000);
        Tue, 25 Aug 2020 19:50:49 -0000
Date:   Tue, 25 Aug 2020 13:50:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@kernel.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx214: Convert to json-schema
Message-ID: <20200825195049.GA1199184@bogus>
References: <20200818121755.37706-1-jacopo+renesas@jmondi.org>
 <20200819132823.GH6049@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819132823.GH6049@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

There's different ways with minItems/maxItems, but that still uses 
anyOf and doesn't end up being any better.

Rob
