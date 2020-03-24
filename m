Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A2A191A87
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 21:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbgCXUIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 16:08:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:34332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgCXUIK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 16:08:10 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 022D5208CA;
        Tue, 24 Mar 2020 20:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585080490;
        bh=qnuFcbci+wCyEzKvFPTbIqb2uSCwvM09/nFf6UX0bm8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0p/V+x2Kh6nt2c3zhy7moFyEIF/1GF33jWjPBL6bg/BQ3yYu+nMkIvzxOK5Lr2B6t
         IasTy5pwc7FKf5aoqT2l0gRUCNYcxTp8q0UZMJyGQlvRSLI/osUO+9RYl5Chefb9JJ
         N2ZylSIRhLjmPwqSX0KeUqu3f1Ihlfg49H9nIxE0=
Received: by mail-qt1-f173.google.com with SMTP id m33so138615qtb.3;
        Tue, 24 Mar 2020 13:08:09 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0LmZ82fKezCMYfWKcjvlTLHOydl3MYTTIyR0QCDlIeDtgCf6UE
        ojT8dK6HzGu0/29PmQ33JKkoy91sHO1Lw1GzAA==
X-Google-Smtp-Source: ADFU+vuorr9YWLX6wjXjfstQKIdZ2SXodpVMwDu9uiod9EM+nlGGWBNEBBumZ3f08XCXbGN7cDNf0WNJ3zVCp0VopGw=
X-Received: by 2002:ac8:59:: with SMTP id i25mr28341022qtg.110.1585080488970;
 Tue, 24 Mar 2020 13:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584620363-2255-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200319151035.GC14585@pendragon.ideasonboard.com> <20200320224836.GA27024@bogus>
 <20200320230211.GV5193@pendragon.ideasonboard.com>
In-Reply-To: <20200320230211.GV5193@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 24 Mar 2020 14:07:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Jh=mxsJ7Ye_HhFYUOzTDDUnoTCe9TaQrcCpQer+1=yQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Jh=mxsJ7Ye_HhFYUOzTDDUnoTCe9TaQrcCpQer+1=yQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: dt-bindings: media: i2c: convert ov5645
 bindings to json-schema
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
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 20, 2020 at 5:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Fri, Mar 20, 2020 at 04:48:36PM -0600, Rob Herring wrote:
> > On Thu, Mar 19, 2020 at 05:10:35PM +0200, Laurent Pinchart wrote:
> > > On Thu, Mar 19, 2020 at 12:19:23PM +0000, Lad Prabhakar wrote:
> > > > Convert ov5645 bindings to json-schema.
> > >
> > > \o/
> > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/ov5645.txt  |  54 -------
> > > >  .../devicetree/bindings/media/i2c/ov5645.yaml | 140 ++++++++++++++++++
> > > >  2 files changed, 140 insertions(+), 54 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > deleted file mode 100644
> > > > index 1c85c78ec58c..000000000000
> > > > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > +++ /dev/null
> > > > @@ -1,54 +0,0 @@
> > > > -* Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
> > > > -
> > > > -The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
> > > > -an active array size of 2592H x 1944V. It is programmable through a serial I2C
> > > > -interface.
> > > > -
> > > > -Required Properties:
> > > > -- compatible: Value should be "ovti,ov5645".
> > > > -- clocks: Reference to the xclk clock.
> > > > -- clock-names: Should be "xclk".
> > > > -- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > > > -  to the hardware pin PWDNB which is physically active low.
> > > > -- reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > > > -  the hardware pin RESETB.
> > > > -- vdddo-supply: Chip digital IO regulator.
> > > > -- vdda-supply: Chip analog regulator.
> > > > -- vddd-supply: Chip digital core regulator.
> > > > -
> > > > -The device node must contain one 'port' child node for its digital output
> > > > -video port, in accordance with the video interface bindings defined in
> > > > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > -
> > > > -Example:
> > > > -
> > > > - &i2c1 {
> > > > -         ...
> > > > -
> > > > -         ov5645: ov5645@3c {
> > > > -                 compatible = "ovti,ov5645";
> > > > -                 reg = <0x3c>;
> > > > -
> > > > -                 enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
> > > > -                 reset-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
> > > > -                 pinctrl-names = "default";
> > > > -                 pinctrl-0 = <&camera_rear_default>;
> > > > -
> > > > -                 clocks = <&clks 200>;
> > > > -                 clock-names = "xclk";
> > > > -                 assigned-clocks = <&clks 200>;
> > > > -                 assigned-clock-rates = <24000000>;
> > > > -
> > > > -                 vdddo-supply = <&camera_dovdd_1v8>;
> > > > -                 vdda-supply = <&camera_avdd_2v8>;
> > > > -                 vddd-supply = <&camera_dvdd_1v2>;
> > > > -
> > > > -                 port {
> > > > -                         ov5645_ep: endpoint {
> > > > -                                 clock-lanes = <1>;
> > > > -                                 data-lanes = <0 2>;
> > > > -                                 remote-endpoint = <&csi0_ep>;
> > > > -                         };
> > > > -                 };
> > > > -         };
> > > > - };
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.yaml b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > > > new file mode 100644
> > > > index 000000000000..4bf58ad210c5
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
> > > > @@ -0,0 +1,140 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/ov5645.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
> > >
> > > s/Mp/MP/ ?
> > >
> > > > +
> > > > +maintainers:
> > > > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > +
> > > > +description: |-
> > > > + The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
> > > > + an active array size of 2592H x 1944V. It is programmable through a serial I2C
> > > > + interface.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: ovti,ov5645
> > > > +
> > > > +  reg:
> > > > +    description: I2C device address
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: xclk
> > > > +
> > > > +  assigned-clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  assigned-clock-rates:
> > > > +     items:
> > > > +     - description: Must be 24MHz (24000000).
> > >
> > > These two properties shouldn't be part of the bindings, they're generic.
> >
> > The fact that they have 1 entry is part of this binding.
>
> I'm not sure to agree. assigned-clocks and assigned-clock-rates are very
> losely defined, and could be placed (at least in theory) in any node.
> Furthermore, in order to cotnrol the rate of xclk, we may need
> assigned-clocks and assigned-clock-rates entries for parents of the xclk
> clock too. There's really nothing that's specific to this device.
>
> Anway, I think the driver should just set the clock rate, so we can drop
> these two properties and skip arguing over them :-)

Works for me. :)

>
> > > > +  enable-gpios:
> > > > +    description: |-
> > > > +      Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > > > +      to the hardware pin PWDNB which is physically active low.
> > >
> > > Specifying that the polarity is GPIO_ACTIVE_HIGH is confusing in my
> > > opinion. If there's an inverter on the board, you'll need
> > > GPIO_ACTIVE_LOW. We could possibly drop the sentence, as all GPIOs in DT
> > > are supposed to be active high, but the fact that the GPIO name
> > > corresponds to the opposite of the pin probably has to be documented. I
> > > have no better wording to propose now I'm afraid, but it needs to be
> > > addressed. Maybe Rob or Maxime could help.
> >
> > All GPIOs in DT are active high? What?
>
> Re-reading my comment, I've expressed myself very badly here. The point
> is that the GPIO "object" (enable-gpios), conceptually, hides the
> polarity. What's exposed to the OS is something that can be asserted or
> deasserted to have an effect indicated by the GPIO name. The polarity
> then describes what electrical level of the physical GPIO pin
> corresponds to that action. In this case, asserting the GPIO performs
> the "enable" action. As this is connected to the PWDNB pin, we have to
> specify a polarity (active high) that is inverted compared to the PWDNB
> pin polarity (active low). This should be captured in the bindings, but
> syaing that "the polarity is GPIO_ACTIVE_HIGH" is wrong. The polarity
> depends on how the signal is routed on the board. I'm not sure how to
> express all these neatly in the bindings. We may not want to address it
> as part of the conversion to YAML, but I think template sentences for
> GPIO descriptions would be useful as guidelines for binding authors.

Yeah, this has come up a couple of times. I think it's important to
state what the polarity of the signal on the device is, but it is
confusing when there's an inverter in the middle.

Rob
