Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93D2918DB52
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 23:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgCTWsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 18:48:42 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44466 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgCTWsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 18:48:42 -0400
Received: by mail-io1-f66.google.com with SMTP id v3so7669053iot.11;
        Fri, 20 Mar 2020 15:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A1uslfEoH7vNHdUhQmPCdcU9qvlFI6adpXPxHF0FMnE=;
        b=dJAuwJpcq7ItCiFo+a+MddeXvQwQAI8LTIo28qFcEWOuRivKSHukqyGzg3kTuI87vo
         Nr5G7Tl3AhcaCsYltVIxiv36/PDjCe8hVNElwHzmNy1oegqVt9XZAcz/gXRI08t7hPzz
         ONoyjQ2D1oEUFZH+HjxNM95KrTqsLCCeyaKGXwmLZ4jth/dw/Vki65fdOqywnFcgjJRU
         f6pGo8+ms8xlxQIUGvw4fUTBRcgISnUulIo96we0NNzTMyuU0wjOo2nCDo188T3d19C4
         Ni6NVUhRO34Iu30BTIVLu30e1PehX57KSZYNJCUGY/kNrJtrQdl7wqnNTMVj1HUhgHPG
         Zv6w==
X-Gm-Message-State: ANhLgQ1yY4o5DW1Z9Hk4iUF8TmDdN69d3mP/daKluKi0HO/JnEnAdLlf
        0sXtE6mmzCr0lvcQgAjR4A==
X-Google-Smtp-Source: ADFU+vtwXWnuppwnc14jRb856bQUQFUaxaVhGlFZFR9oFbLMkd2qPfBTmiy1HVaQaH4yTdHNcia0iA==
X-Received: by 2002:a6b:8b07:: with SMTP id n7mr9777692iod.55.1584744520519;
        Fri, 20 Mar 2020 15:48:40 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f2sm2115369ioj.34.2020.03.20.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 15:48:39 -0700 (PDT)
Received: (nullmailer pid 11861 invoked by uid 1000);
        Fri, 20 Mar 2020 22:48:36 -0000
Date:   Fri, 20 Mar 2020 16:48:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 5/5] media: dt-bindings: media: i2c: convert ov5645
 bindings to json-schema
Message-ID: <20200320224836.GA27024@bogus>
References: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584620363-2255-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200319151035.GC14585@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319151035.GC14585@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 19, 2020 at 05:10:35PM +0200, Laurent Pinchart wrote:
> Hi Prabhakar,
> 
> Thank you for the patch.
> 
> On Thu, Mar 19, 2020 at 12:19:23PM +0000, Lad Prabhakar wrote:
> > Convert ov5645 bindings to json-schema.
> 
> \o/
> 
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov5645.txt  |  54 -------
> >  .../devicetree/bindings/media/i2c/ov5645.yaml | 140 ++++++++++++++++++
> >  2 files changed, 140 insertions(+), 54 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > deleted file mode 100644
> > index 1c85c78ec58c..000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -* Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
> > -
> > -The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
> > -an active array size of 2592H x 1944V. It is programmable through a serial I2C
> > -interface.
> > -
> > -Required Properties:
> > -- compatible: Value should be "ovti,ov5645".
> > -- clocks: Reference to the xclk clock.
> > -- clock-names: Should be "xclk".
> > -- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > -  to the hardware pin PWDNB which is physically active low.
> > -- reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > -  the hardware pin RESETB.
> > -- vdddo-supply: Chip digital IO regulator.
> > -- vdda-supply: Chip analog regulator.
> > -- vddd-supply: Chip digital core regulator.
> > -
> > -The device node must contain one 'port' child node for its digital output
> > -video port, in accordance with the video interface bindings defined in
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -Example:
> > -
> > -	&i2c1 {
> > -		...
> > -
> > -		ov5645: ov5645@3c {
> > -			compatible = "ovti,ov5645";
> > -			reg = <0x3c>;
> > -
> > -			enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
> > -			reset-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
> > -			pinctrl-names = "default";
> > -			pinctrl-0 = <&camera_rear_default>;
> > -
> > -			clocks = <&clks 200>;
> > -			clock-names = "xclk";
> > -			assigned-clocks = <&clks 200>;
> > -			assigned-clock-rates = <24000000>;
> > -
> > -			vdddo-supply = <&camera_dovdd_1v8>;
> > -			vdda-supply = <&camera_avdd_2v8>;
> > -			vddd-supply = <&camera_dvdd_1v2>;
> > -
> > -			port {
> > -				ov5645_ep: endpoint {
> > -					clock-lanes = <1>;
> > -					data-lanes = <0 2>;
> > -					remote-endpoint = <&csi0_ep>;
> > -				};
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.yaml b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > new file mode 100644
> > index 000000000000..4bf58ad210c5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ov5645.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
> 
> s/Mp/MP/ ?
> 
> > +
> > +maintainers:
> > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +description: |-
> > + The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
> > + an active array size of 2592H x 1944V. It is programmable through a serial I2C
> > + interface.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov5645
> > +
> > +  reg:
> > +    description: I2C device address
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xclk
> > +
> > +  assigned-clocks:
> > +    maxItems: 1
> > +
> > +  assigned-clock-rates:
> > +     items:
> > +     - description: Must be 24MHz (24000000).
> 
> These two properties shouldn't be part of the bindings, they're generic.

The fact that they have 1 entry is part of this binding.


> > +  enable-gpios:
> > +    description: |-
> > +      Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > +      to the hardware pin PWDNB which is physically active low.
> 
> Specifying that the polarity is GPIO_ACTIVE_HIGH is confusing in my
> opinion. If there's an inverter on the board, you'll need
> GPIO_ACTIVE_LOW. We could possibly drop the sentence, as all GPIOs in DT
> are supposed to be active high, but the fact that the GPIO name
> corresponds to the opposite of the pin probably has to be documented. I
> have no better wording to propose now I'm afraid, but it needs to be
> addressed. Maybe Rob or Maxime could help.

All GPIOs in DT are active high? What? 

Using 'powerdown-gpios' would have made more sense here, but we're stuck 
with it now. In any case, the description was good enough before and I 
don't care to re-review it as part of the conversion.

> > +  reset-gpios:
> > +    description: |-
> > +      Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > +      the hardware pin RESETB.
> 
> Here you could just drop the second sentence, or apply the same fix as
> for enable-gpios.

A description that's specific to this chip seems good to me.
 
> > +
> > +  vdddo-supply:
> > +    description:
> > +      Chip digital IO regulator.
> 
> You can move the description on the same line as the "description:" key.
> Same below.
> 
> > +
> > +  vdda-supply:
> > +    description:
> > +      Chip analog regulator.
> > +
> > +  vddd-supply:
> > +    description:
> > +      Chip digital core regulator.
> > +
> > +  # See ../video-interfaces.txt for more details
> > +  port:
> > +    type: object
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +
> > +        properties:
> > +          data-lanes:
> > +            description: |-
> > +              The sensor supports two-lane operation.
> > +              For two-lane operation the property must be set to <1 2>.
> > +            items:
> > +              - const: 1
> > +              - const: 2
> 
> 
> What if only one lane is wired, does the sensor support that ?
> 
> > +
> > +          clock-lanes:
> > +            description:
> > +              should be set to <0> (clock lane on hardware lane 0).
> > +            items:
> > +              - const: 0
> > +
> > +          remote-endpoint: true
> > +
> > +        required:
> > +          - data-lanes
> > +          - clock-lanes
> > +          - remote-endpoint
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - assigned-clocks
> > +  - assigned-clock-rates
> 
> Those two properties should be dropped.
> 
> > +  - enable-gpios
> > +  - reset-gpios
> 
> Are the GPIOs mandatory ? What if the signals are hardwired on the board
> ?
> 
> > +  - vdddo-supply
> > +  - vdda-supply
> > +  - vddd-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c1 {
> 
> s/i2c1/i2c/
> 
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ov5645: sensor@3c {
> > +            compatible = "ovti,ov5645";
> > +            reg = <0x3c>;
> > +            clocks = <&ov5645_cl>;
> > +            clock-names = "xclk";
> > +            assigned-clocks = <&ov5645_cl>;
> > +            assigned-clock-rates = <24000000>;
> > +            enable-gpios = <&gpio1 6 /* GPIO_ACTIVE_HIGH */>;
> > +            reset-gpios = <&gpio5 20 /* GPIO_ACTIVE_LOW */>;
> > +            vdddo-supply = <&camera_dovdd_1v8>;
> > +            vdda-supply = <&camera_avdd_2v8>;
> > +            vddd-supply = <&camera_dvdd_1v2>;
> > +
> > +            port {
> > +                ov5645_0: endpoint {
> > +                    remote-endpoint = <&csi1_ep>;
> > +                    clock-lanes = <0>;
> > +                    data-lanes = <1 2>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> 
> -- 
> Regards,
> 
> Laurent Pinchart
