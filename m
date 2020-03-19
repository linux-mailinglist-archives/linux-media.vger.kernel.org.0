Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F33518BB44
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 16:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgCSPjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 11:39:16 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33350 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727619AbgCSPjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 11:39:16 -0400
Received: by mail-oi1-f194.google.com with SMTP id r7so3172438oij.0;
        Thu, 19 Mar 2020 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xqwcc6S0kuQFa+zD2BqIBFrPckbvb9FXyWKARQ5HTqg=;
        b=BLaLD9Yz0hSAFFYg1Th1jkWT8RmF3PIPbvMzQhAxGDelmNmYKYpTF3DkkeiXxLViwU
         ID9NzPhUkyB3oK74xQ25E0p8REnbl1AmMPQlwchV7OxrAr7PpC/13NSiS8VU/N/Emm7e
         RTXW7mtrwiDPXOuLeD+s3AHTWy8QprfND6dHGpuSJowZ7sr73SulQsN+va8vLxxjY1aG
         79KUbNwWhzW3v2diT2A+5o4Z1TVJq47ZCSuRKm1EBv1ipKG9AQoyODHzqBa+6LwhYM4K
         lIlep8iNXkoz0ac8fQ0FJ5dttB1+8h1NuKas105ok7DAllqidkwMCq9uMzPjmjgF0t4L
         Tm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xqwcc6S0kuQFa+zD2BqIBFrPckbvb9FXyWKARQ5HTqg=;
        b=FpnpAEwc4737ailpo4WtsNhOrBemBcNH2+uFby8Uo7hgBpzO/7iKxDRk0g/lhrmPbJ
         lxqhdqUV41CkeDAmT1PFDOqnIG6wfuF+NZ5/hL/wFaCLeYff9tK/hgZSEdjPjfhWURHW
         Opix9HeA0tMgKCSltIfNWong4UtQWvWUGLKnGcaq81xTLtd4DFLeXEzh3lms6+Vd4orF
         f4lMsEY3oR/sPWrJbLCDVFAh+r3MD/hhPLIC8EM8RNb1hneoL9/lLUX8MOGC4epKCTKa
         WzeUrNg2r6ni55V2G/vJWOGsRSKnkKJCDE/fXy1IRs1taDqmOV9PVsJiUKo3afGr42qx
         6jAg==
X-Gm-Message-State: ANhLgQ3Qc2VyoTDx0r/MKuZiETt0ONfgTCsD1kbQ/6IQqOjiQaB194TT
        FMjyt+gHVwYyKQCPLWgVlc94zm1G51Yen5NGl+vmKT07qes=
X-Google-Smtp-Source: ADFU+vsA6PIhyZl/qGUKPBe9lcqZk7raY3hc/S5FIkkayxMAMmm3MtgJ5tPVkgYE+2ONMQRG9XH2KwUj/e1ILloZiQY=
X-Received: by 2002:aca:ac89:: with SMTP id v131mr2830122oie.7.1584632352589;
 Thu, 19 Mar 2020 08:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584620363-2255-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200319151035.GC14585@pendragon.ideasonboard.com>
In-Reply-To: <20200319151035.GC14585@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 19 Mar 2020 15:38:46 +0000
Message-ID: <CA+V-a8unmH8LskcjNXLum5a=+YkYOj=kZ3oOK6YZGKE2t4qf6w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: dt-bindings: media: i2c: convert ov5645
 bindings to json-schema
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review.

On Thu, Mar 19, 2020 at 3:10 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Thu, Mar 19, 2020 at 12:19:23PM +0000, Lad Prabhakar wrote:
> > Convert ov5645 bindings to json-schema.
>
> \o/
>
:)

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
> > -     &i2c1 {
> > -             ...
> > -
> > -             ov5645: ov5645@3c {
> > -                     compatible = "ovti,ov5645";
> > -                     reg = <0x3c>;
> > -
> > -                     enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
> > -                     reset-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
> > -                     pinctrl-names = "default";
> > -                     pinctrl-0 = <&camera_rear_default>;
> > -
> > -                     clocks = <&clks 200>;
> > -                     clock-names = "xclk";
> > -                     assigned-clocks = <&clks 200>;
> > -                     assigned-clock-rates = <24000000>;
> > -
> > -                     vdddo-supply = <&camera_dovdd_1v8>;
> > -                     vdda-supply = <&camera_avdd_2v8>;
> > -                     vddd-supply = <&camera_dvdd_1v2>;
> > -
> > -                     port {
> > -                             ov5645_ep: endpoint {
> > -                                     clock-lanes = <1>;
> > -                                     data-lanes = <0 2>;
> > -                                     remote-endpoint = <&csi0_ep>;
> > -                             };
> > -                     };
> > -             };
> > -     };
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
OK
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
>
In that case how do we specify whats the expected clock frequency ?

> > +
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
>
Agreed, will wait for either Rob/Maxime to comment.

> > +
> > +  reset-gpios:
> > +    description: |-
> > +      Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > +      the hardware pin RESETB.
>
> Here you could just drop the second sentence, or apply the same fix as
> for enable-gpios.
>
OK

> > +
> > +  vdddo-supply:
> > +    description:
> > +      Chip digital IO regulator.
>
> You can move the description on the same line as the "description:" key.
> Same below.
>
Will fix that.

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
Comparing with ov5640 datasheet (Assuming its similar to it) the
sensor can support
single/dual lane but looking at the driver it only supports dual lane mode atm
{ OV5645_MIPI_CTRL00, 0x24 },

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
Will do that.

> > +  - enable-gpios
> > +  - reset-gpios
>
> Are the GPIOs mandatory ? What if the signals are hardwired on the board
> ?
>
Yes as per the driver, which needs to be fixed for making these optional :)

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
Will fix that.

Cheers,
--Prabhakar

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
