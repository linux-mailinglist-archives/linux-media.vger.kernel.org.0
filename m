Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C35A1AAA94
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 16:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636773AbgDOOnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 10:43:55 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:38690 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S370876AbgDOOnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 10:43:42 -0400
Received: by mail-oo1-f68.google.com with SMTP id i9so880ool.5;
        Wed, 15 Apr 2020 07:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aS1Is431wFo8Y/I/7OGLepWmzb0NQKhnSdzX/bpKCuI=;
        b=B8Q96YOIJ9XJ+R+Wr5e8QhVSY8tPtC6K+vRwuLr+JgMBmXmKYH84rkW1fK38VT8tAl
         ol7ongFAIAS1xtcwJFTE+poAOmY7PPAVzD4Ek0xncMreDETVbzwvUdWie4ALa8hJU4LE
         kAYfUZPf54z0capKh1ns/KOd8ED+Ao7o/SOpcHf4Z/yKfgHDMIdyjVM404/0aguB7fzY
         T16DjkVyZRpw+2Vel1AA9aRbD+Bk3gE1wc2cO1Nnnfdc8gGzFz6cEHFgbzhxSNxi0Zp+
         ZCir0qQQP6N6F2MXTyXeFAvne+sDGqnZHdkiUBTT0kxmilmY6Qudqa5u9hlboe+vj9GL
         WywA==
X-Gm-Message-State: AGi0Pub/lRmtTrsjVx0mJS6AdJgYxNwAkSI0dJwVewzw05Ez1s4FxNTK
        dte0HVd6I7HRl4HnVMFvqA==
X-Google-Smtp-Source: APiQypJGYusZTJBkcMjHaBqRyKb0biS2xVvK01uI9ULQOUjb61LqMow83eT3yRCjWJJmofFaIfh/Rg==
X-Received: by 2002:a4a:db7b:: with SMTP id o27mr22967195ood.25.1586961819086;
        Wed, 15 Apr 2020 07:43:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k132sm6454033oih.9.2020.04.15.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 07:43:37 -0700 (PDT)
Received: (nullmailer pid 16201 invoked by uid 1000);
        Wed, 15 Apr 2020 14:43:36 -0000
Date:   Wed, 15 Apr 2020 09:43:36 -0500
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v5 5/5] media: dt-bindings: media: i2c: convert ov5645
 bindings to json-schema
Message-ID: <20200415144336.GA11960@bogus>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200406174346.GH16885@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406174346.GH16885@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 06, 2020 at 08:43:46PM +0300, Laurent Pinchart wrote:
> Hi Prabhakar,
> 
> Thank you for the patch.
> 
> On Mon, Apr 06, 2020 at 05:42:41PM +0100, Lad Prabhakar wrote:
> > Convert ov5645 bindings to json-schema.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov5645.txt  |  52 --------
> >  .../devicetree/bindings/media/i2c/ov5645.yaml | 126 ++++++++++++++++++
> >  2 files changed, 126 insertions(+), 52 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > deleted file mode 100644
> > index a55bb728ea48..000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > +++ /dev/null
> > @@ -1,52 +0,0 @@
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
> > index 000000000000..d5cdcf9a1c76
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ov5645.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision 1/4-Inch 5MP CMOS Digital Image Sensor
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
> > +    description: External clock frequency should range between 6MHz to 27MHz.
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xclk
> > +
> > +  enable-gpios:
> > +    description: |-
> > +      Chip enable GPIO. This corresponds to the hardware pin PWDNB which is
> > +      physically active low.
> > +
> > +  reset-gpios:
> > +    description: Chip reset GPIO. This corresponds to the hardware pin RESETB.
> > +
> > +  vdddo-supply:
> > +    description: Chip digital IO regulator.
> > +
> > +  vdda-supply:
> > +    description: Chip analog regulator.
> > +
> > +  vddd-supply:
> > +    description: Chip digital core regulator.
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
> 
> Don't you need
> 
> 		minItems: 1
> 		maxItems: 2
> 
> here ?

Yes.

> > +            description: |-
> > +              The sensor supports either one-lane, or two-lane operation.
> > +              For one-lane operation the property must be set to <1> and
> > +              for two-lane operation the property must be set to <1 2>.
> > +            items:
> > +              - const: 1
> > +              - const: 2
> > +
> > +          clock-lanes:
> 
> Same here,
> 
> 		maxItems: 1
> 
> ?

No, because the default is number of entries in 'items'.

> 
> > +            description:
> > +              should be set to <0> (clock lane on hardware lane 0).
> 
> I think you can drop the description, with the items below it's clear
> that the value has to be <0>.
> 
> > +            items:
> > +              - const: 0
> > +
> > +          remote-endpoint: true
> 
> Should this be
> 
>              remote-endpoint:
> 	       $ref: /schemas/types.yaml#/definitions/phandle

No, we can assume this has a type definition already.

Rob
