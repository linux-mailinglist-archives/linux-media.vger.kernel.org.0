Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052212C5A56
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 18:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403883AbgKZRPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 12:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391544AbgKZRPg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 12:15:36 -0500
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F6BC0613D4;
        Thu, 26 Nov 2020 09:15:36 -0800 (PST)
Received: by mail-ua1-x942.google.com with SMTP id q4so723520ual.8;
        Thu, 26 Nov 2020 09:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pUVKuoWZA/P27xH4AfMqFfzecx2gpzbW2/mbWqy1KHY=;
        b=uRl2J2b9fv3xQG4VNSHpc8v54V7XtD9frG75nRQiFYqqDW4MDOcGaInf4J9V6brt7r
         lYSoUmwl3JmFL8EQyl+hs/xI73ABG3/BvcHi3MAEj6YNKwYS0QfpG01AZXhjc7xVypHW
         qBTmSgBAJkfCoWHeBN/MiC6YqzpX4OsiOc/+iFHtCG8ZlZjoIaifxiq1+ZpOzPN1FSOt
         GcuylkFVYSBGdjkFl2+0IMHPL2J7CWAmI4k/7C7Z8wuL3/8TnufWaP2k64ecLeSrrk73
         RQVnTOGphtJeyEQu1VcVTgC49lmMKrb7I3kg3Fxt+nKoXr6a+NqJK09aFXnPYLWyE8Dc
         dfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUVKuoWZA/P27xH4AfMqFfzecx2gpzbW2/mbWqy1KHY=;
        b=C58YzkeSmo8goUc9/UNvIKNP3IHLmUSbjCvv9OJ1yVkNBNDd++i9Ul9S0Jfy0VTSbz
         XNIJqKcuDAV10rNnanE/z/HL6Jg8dVX4zTKu1f0w9F3A3g7eA+rbnnKE4CH5rdj9spHI
         NSSWYvcZQgT/NfRD/w2K+Cwt/rr/wU3puIv/4UOLY9npCJfQyTJvPUORD0o81oDFX8xn
         72mWWKwzfFLXLNpzyz5aiCptFBshk8PATg/bZmzjSCV//IdV7Y4+nK/tsAoWtMbDLwQA
         k/LFnbU6DLjxoppwRYyCk2dPcPxdoog88cgDLzmzyaky6vN3vO/xnzpyJqeU2pTOv4SY
         xlBw==
X-Gm-Message-State: AOAM5335CyX/4B/hpwqfvhgJlFkgCWkoU58G4QhC7K3vwFmFcpZdv7t0
        QInJ0mRicIJXmAHLa9jtoOrbPDbypnJykGqpnnosDHQc1uk=
X-Google-Smtp-Source: ABdhPJzG/FdsWLFORa9ZtHNjvUVR7Wu+zJF5b1sD7g0IThUu6UfgA2wiLw3YWNthTclOPNh4f3BUMaS1rCz75Z4iC1w=
X-Received: by 2002:ab0:743:: with SMTP id h61mr2350174uah.4.1606410935365;
 Thu, 26 Nov 2020 09:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20201029172947.34315-1-kholk11@gmail.com> <20201029172947.34315-3-kholk11@gmail.com>
 <20201104214806.GA4175708@bogus>
In-Reply-To: <20201104214806.GA4175708@bogus>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Thu, 26 Nov 2020 18:15:22 +0100
Message-ID: <CAK7fi1a_Gtu9Bt_E6=5no7XKg4dsySz4tiuPzSYhR7mE2PHLrw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>, martin.botka1@gmail.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il giorno mer 4 nov 2020 alle ore 22:48 Rob Herring <robh@kernel.org>
ha scritto:
>
> On Thu, Oct 29, 2020 at 06:29:47PM +0100, kholk11@gmail.com wrote:
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > Add YAML device tree binding for IMX300 CMOS image sensor, and
> > the relevant MAINTAINERS entries.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
> >  MAINTAINERS                                   |   7 ++
> >  2 files changed, 119 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > new file mode 100644
> > index 000000000000..8f1d795f8072
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/2.3-Inch 8Mpixel Stacked CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - AngeloGioacchino Del Regno <kholk11@gmail.com>
> > +
> > +description: |-
> > +  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
> > +  sensor with a pixel size of 1.08um and an active array size of
> > +  5948H x 4140V. It is programmable through I2C interface at address 0x10.
> > +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> > +  4 data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx300
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  vdig-supply:
> > +    description:
> > +      Digital I/O voltage supply, 1.15-1.20 volts
> > +
> > +  vana-supply:
> > +    description:
> > +      Analog voltage supply, 2.2 volts
> > +
> > +  vddl-supply:
> > +    description:
> > +      Digital core voltage supply, 1.8 volts
> > +
> > +  reset-gpios:
>
> maxItems: 1
Agreed.

>
> > +    description: |-
> > +      Reference to the GPIO connected to the xclr pin, if any.
> > +      Must be released (set high) after all supplies are applied.
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
> > +              The sensor supports either two-lane, or four-lane operation,
> > +              but the driver currently supports only four-lane.
>
> What the driver is not relevant. Please define all possible
> configurations. Or just omit? What's the behavior if omitted?
>
I wrote this as to document the hardware (there is no datasheet around and
I fear that findings will be forgotten one day)... but if you say it's
not relevant...
...well, then I can as well just write it in my local notes and remove the info
from here.

> > +            items:
> > +              - const: 0
> > +              - const: 1
> > +              - const: 2
> > +              - const: 3
> > +
> > +          clock-noncontinuous: true
> > +
> > +          link-frequencies:
> > +            $ref: /schemas/types.yaml#/definitions/uint64-array
> > +            description:
> > +              Allowed data bus frequencies. The driver currently needs
> > +              to switch between 780000000 and 480000000 Hz in order to
> > +              guarantee functionality of all modes.
> > +
> > +        required:
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - vana-supply
> > +  - vdig-supply
> > +  - vddl-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        imx300: sensor@10 {
> > +            compatible = "sony,imx300";
> > +            reg = <0x10>;
> > +            clocks = <&imx300_xclk>;
> > +            vana-supply = <&imx300_vana>;   /* 2.2v */
> > +            vdig-supply = <&imx300_vdig>;   /* 1.2v */
> > +            vddl-supply = <&imx300_vddl>;   /* 1.8v */
> > +
> > +            port {
> > +                imx300_0: endpoint {
> > +                    remote-endpoint = <&csi1_ep>;
> > +                    data-lanes = <0 1 2 3>;
> > +                    clock-noncontinuous;
> > +                    link-frequencies = /bits/ 64 <780000000 480000000>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c66710dd7e0a..21ba41db0063 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16279,6 +16279,13 @@ T:   git git://linuxtv.org/media_tree.git
> >  F:   Documentation/devicetree/bindings/media/i2c/imx290.txt
> >  F:   drivers/media/i2c/imx290.c
> >
> > +SONY IMX300 SENSOR DRIVER
> > +M:   AngeloGioacchino Del Regno <kholk11@gmail.com>
> > +L:   linux-media@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > +F:   drivers/media/i2c/imx300.c
> > +
> >  SONY IMX319 SENSOR DRIVER
> >  M:   Bingbu Cao <bingbu.cao@intel.com>
> >  L:   linux-media@vger.kernel.org
> > --
> > 2.28.0
> >

Also, I'm sorry for the *very* late reply. I've been busy quite a lot
in these days!
By the way, I'll push a v3 for this one ASAP!

Yours,
Angelo
