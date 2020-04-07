Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3333F1A0895
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 09:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgDGHqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 03:46:37 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37430 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgDGHqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 03:46:37 -0400
Received: by mail-oi1-f194.google.com with SMTP id u20so695166oic.4;
        Tue, 07 Apr 2020 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eV6suJlufDkfaPy4xOCO1G2qeg8tCCUJrg7dZZNrJrU=;
        b=thJCazvMCaKSx5YaS9TJp4aIo1s7Xgg2S5lXPMBxW/rRS3oLGAJb9Cir3wHvUJvOfW
         1iISdoqu8yKLBES5nxUm33EI22hY6jRSN/MHsP4ZkY3OCxnZdd4S6DEUrtP1uxaRIv3Z
         G+122wYbMthquE3NvXtfBvd9wLaDLC1LK5VrP4AQ16mDRX+qj/ywWPGzO9IPHsdn0yQB
         D9vlCTp1mUwD1116jxIxYQVgtNNarWvQnw+RSR2ZZCQQ9Np5NQ2FZ4j8W1lbs8siPSqr
         ZigUAlcrK5BOlYZ2yZ4uMCZNfuXOJLwOrrY/hAkObB7CDyybhy9B2y1Q3eZUHCclYU1m
         ZYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eV6suJlufDkfaPy4xOCO1G2qeg8tCCUJrg7dZZNrJrU=;
        b=gvIcLVtzv3xHhk6pzPsmQeq0VFhJm4raBhRroGqPV34Rt+vSqoP9bxGH4in4Qkn2PU
         Vy8CC0v64vHGiaz3aC7I3DQGgEhmL51RXkASqZUbwRXeZ7ZmpW3y4zjnkVz6fDKYNXMS
         +Pqpvd5DljrLqkrrkrBZfYBDmmlIOn2tTEUPECHQ/sLTw+8ZYUKizS/X5IFl8z/uhshn
         C10MzatgfSX84dBMPo1vplhJbJA82ZaFVO2I9EW8JKP1uHfXYfsb0Nlt54AFgSVCWgRd
         Ke9WprygKh9AIGBN4j/zs1LvGoJdQe7UHjqWDYWX9WOnoE+it0foL3Dr13sz6bjoEexc
         +KzA==
X-Gm-Message-State: AGi0PuaUFX1iuV7Cjuj8KxtVzfWGS5KdbXFtUvXTcq4HMc+S0l+uwQIK
        TBumgjt+mXHc6DfaEksLSBf1IfL17M4jr+CiTQs=
X-Google-Smtp-Source: APiQypL+C5NbV1bUREOiE5KMFuKz5z27VmV/bGIbXh4J5TzoXlD5dagLYllGTPsmYn8pvwbu0DKCWjRpDpGhZelIVMc=
X-Received: by 2002:aca:5d83:: with SMTP id r125mr761837oib.8.1586245596071;
 Tue, 07 Apr 2020 00:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200406174346.GH16885@pendragon.ideasonboard.com>
In-Reply-To: <20200406174346.GH16885@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 7 Apr 2020 08:46:09 +0100
Message-ID: <CA+V-a8v2WVEbNyy+cwRKgH-xXtQgnPBfEgV+ssRVGhY96vv_0Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] media: dt-bindings: media: i2c: convert ov5645
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Mon, Apr 6, 2020 at 6:43 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
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
>                 minItems: 1
>                 maxItems: 2
>
> here ?
>
Agreed will add that.

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
>                 maxItems: 1
>
> ?
>
As above.

> > +            description:
> > +              should be set to <0> (clock lane on hardware lane 0).
>
> I think you can drop the description, with the items below it's clear
> that the value has to be <0>.
>
OK

> > +            items:
> > +              - const: 0
> > +
> > +          remote-endpoint: true
>
> Should this be
>
>              remote-endpoint:
>                $ref: /schemas/types.yaml#/definitions/phandle
>
OK shall replace it.

Cheers,
--Prabhakar

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
> > +  - enable-gpios
> > +  - reset-gpios
> > +  - vdddo-supply
> > +  - vdda-supply
> > +  - vddd-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ov5645: sensor@3c {
> > +            compatible = "ovti,ov5645";
> > +            reg = <0x3c>;
> > +            clocks = <&ov5645_cl>;
> > +            clock-names = "xclk";
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
