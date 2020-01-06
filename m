Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84337131432
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 15:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgAFO5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 09:57:08 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50334 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgAFO5I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 09:57:08 -0500
Received: by mail-wm1-f66.google.com with SMTP id a5so15262943wmb.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 06:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4XoQkxgkZAvdX4n0R/Hf5buiUEi1NTKRWp+mFuPF3iU=;
        b=ttwGoU/jg/8vRQEm82RGRSdOMth62CiJWTJd5O76BMxtEZOJa/X/vfRdvIZdiUpMmE
         tJJlPwxMdK/JvDENuuX8oFDIb2C+HKR9raEm2Q36uKS7VBy5kLyHQ8FK2fg7uRAsPCqt
         /il6xeIHcOiBniwkPpgZVSiZ6liurl9j8hOkgnvL8BvkRJEGDGUXhBdc/t8BBKpmj8cB
         2LyENU0ASOA/VaciTp5GQQxLGVaoNNuNqUn5OYAIS5zeMSAb6EA7SVqvHVLLryafyFys
         Ox8TZFwWtsAMDSJC929xfbCtr6KiS/ftFQAo9iJeFsKSIN1GPkbziItKCYLnw15hKF/q
         0FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XoQkxgkZAvdX4n0R/Hf5buiUEi1NTKRWp+mFuPF3iU=;
        b=loWhVEp5MNQZRfUg3zHEFAvWum/JJsxWk7PMgnQOgTBYfBT5JULJffVnMUEsHAaKcp
         +36DI9ZehiHmrA9Hm0aFgj/zo4LdoLMw1//y49gdb6RU839bFI7fYRKx/LMD8bxg3Gom
         gvyX7srJZDI+rR694/+cE6Ol2x4wkNkgIi7sCgNucCVoSicn1NKmtpbSbiXMalsTDDoG
         4YYCF+E31ahRlQhxi2XbYNv/7qi02ZBrWCJI4QJ3tcen3bGRFFULM6CX0Q26W9PXgz8J
         c36eTkIZ+Sw46vsiQS8Tvm0AUKezDu3I2VxJ7uODPA9Ne8dBOrr6JlyI8xOShY6e7eNh
         LW+w==
X-Gm-Message-State: APjAAAU9AUUEaL9FIKLOL6Y6ONAZW0mojJOzHzSEYzZ5FwqyPvuIUOp4
        PWxSEWXJ6An6X21F3SFgI22c8RuVlcKUZt6clhzTfQ==
X-Google-Smtp-Source: APXvYqxfMwtQJoldMTRdltl3qv6Hgh73aLyhtwnyvgopmbyIZqd67/g0U4D/zDjh4yS9nl1GNCZMzjf38Wezasw1a3Y=
X-Received: by 2002:a1c:9814:: with SMTP id a20mr33759928wme.94.1578322623741;
 Mon, 06 Jan 2020 06:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-2-andrey.konovalov@linaro.org> <20191227141739.GD861@valkosipuli.retiisi.org.uk>
In-Reply-To: <20191227141739.GD861@valkosipuli.retiisi.org.uk>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 6 Jan 2020 14:56:47 +0000
Message-ID: <CAPY8ntDRWOXass1Et-bybw-e0YLvk6VJEqjR4ULh739LcrNudQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>, mchehab@kernel.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Peter Griffin <peter.griffin@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Fri, 27 Dec 2019 at 14:18, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Andrey,
>
> Thanks for the patchset.
>
> On Fri, Dec 27, 2019 at 03:21:13PM +0300, Andrey Konovalov wrote:
> > Add YAML device tree binding for IMX219 CMOS image sensor, and
> > the relevant MAINTAINERS entries.
> >
> > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > ---
> >  .../devicetree/bindings/media/i2c/imx219.yaml | 134 ++++++++++++++++++
> >  MAINTAINERS                                   |   8 ++
> >  2 files changed, 142 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > new file mode 100644
> > index 000000000000..b58aa49a7c03
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > @@ -0,0 +1,134 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> > +
> > +description: |-
> > +  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
> > +  with an active array size of 3280H x 2464V. It is programmable through
> > +  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
> > +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> > +  4 data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx219
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
>
> There's a single clock. Does it need a name? I'd just omit it.
>
> > +
> > +  VDIG-supply:
> > +    description:
> > +      Digital I/O voltage supply, 1.8 volts
> > +
> > +  VANA-supply:
> > +    description:
> > +      Analog voltage supply, 2.8 volts
> > +
> > +  VDDL-supply:
> > +    description:
> > +      Digital core voltage supply, 1.2 volts
> > +
> > +  xclr-gpios:
> > +    description: |-
> > +      Reference to the GPIO connected to the xclr pin, if any.
> > +      Must be released (set high) after all supplies are applied.
>
> A common name for this in camera sensors is xshutdown. I'd suggest to use
> that.
>
> > +
> > +  camera-clk:
> > +    type: object
> > +
> > +    description: Clock source for imx219
> > +
> > +    properties:
> > +      clock-frequency: true
> > +
> > +    required:
> > +      - clock-frequency
>
> Hmm. The driver doesn't seem to use this for anything.
>
> There are two approaches to this; either you can get and check the
> frequency, or specify it in DT bindings, set and then check it.
>
> See e.g. Documentation/devicetree/bindings/media/i2c/nokia,smia.txt (not in
> YAML though).
>
> > +
> > +  # See ../video-interfaces.txt for more details
> > +  port:
> > +    type: object
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        properties:
> > +          clock-lanes:
> > +            const: 0
>
> If the hardware does not support lane reordering, you can omit the
> clock-lanes property as it provides no information.
>
> > +
> > +          data-lanes:
> > +            description: |-
> > +              Should be <1 2> for two-lane operation, or <1 2 3 4> for
> > +              four-lane operation.
> > +            oneOf:
> > +              - const: [[ 1, 2 ]]
> > +              - const: [[ 1, 2, 3, 4 ]]
> > +
> > +          clock-noncontinuous:
> > +            type: boolean
> > +            description: |-
> > +              Presence of this boolean property decides whether the MIPI CSI-2
> > +              clock is continuous or non-continuous.
>
> How about: MIPI CSI-2 clock will be non-continuous if this property is
> present, otherwise it's continuous.
>
> > +
> > +        required:
> > +          - clock-lanes
> > +          - data-lanes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - VANA-supply
> > +  - VDIG-supply
> > +  - VDDL-supply
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
> > +        imx219: sensor@10 {
> > +            compatible = "sony,imx219";
> > +            reg = <0x10>;
> > +            clocks = <&imx219_clk>;
> > +            clock-names = "xclk";
> > +            VANA-supply = <&imx219_vana>;   /* 2.8v */
> > +            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
> > +            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
> > +
> > +            imx219_clk: camera-clk {
> > +                compatible = "fixed-clock";
> > +                #clock-cells = <0>;
> > +                clock-frequency = <24000000>;
> > +            };
> > +
> > +            port {
> > +                imx219_0: endpoint {
> > +                    remote-endpoint = <&csi1_ep>;
> > +                    clock-lanes = <0>;
> > +                    data-lanes = <1 2>;
> > +                    clock-noncontinuous;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ffa3371bc750..f7b6c24ec081 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15350,6 +15350,14 @@ S:   Maintained
> >  F:   drivers/media/i2c/imx214.c
> >  F:   Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> >
> > +SONY IMX219 SENSOR DRIVER
> > +M:   Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Is Dave aware of this? :-)

Yes, I'm aware, and happy to be listed as maintainer.
I'm very grateful to Andrey for his efforts in upstreaming this - it's
a task that I simply haven't the time for at present.

  Dave

> > +L:   linux-media@vger.kernel.org
> > +T:   git git://linuxtv.org/media_tree.git
> > +S:   Maintained
> > +F:   drivers/media/i2c/imx219.c
> > +F:   Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > +
> >  SONY IMX258 SENSOR DRIVER
> >  M:   Sakari Ailus <sakari.ailus@linux.intel.com>
> >  L:   linux-media@vger.kernel.org
>
> --
> Regards,
>
> Sakari Ailus
