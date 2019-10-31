Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7DCEB16D
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 14:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbfJaNpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 09:45:24 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35824 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbfJaNpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 09:45:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id d13so4428801pfq.2
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2019 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B4S3LkETZTQ6ciTtg+e4/uC9IOySHk8KduItAFIDCAk=;
        b=KVauYvVSqsYWwSxOsteFFPrRimBn3s6dfVYJPLzP/z3LcsfsDO/h9ST4jQH6/Au/D5
         CY65Z5zdq4G7NHpb17ZLHkVV2lp+aNBPNGGr2ZUq+0mkno2gL40mDh7CPP6iF05oCyYX
         xbC2P2Hi13dEu55xAmMNe5FjzHJiW8uYrCVVbz9zqk3LVWLcZEj4g/PjgHn+MwncGcBF
         UzFUlpfv9/oVlYkzhbH9p1Tek1X5VWAC9mHf6iewIGKmFCgYJeJhvbl1q+Rft5QE/CaZ
         y64ojSEFKoEm+dqTqj3axvCH4zV7DlRNr5I4opyn0gQN0UBtnvk9lYlfZPxVYvUpPZBD
         LZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B4S3LkETZTQ6ciTtg+e4/uC9IOySHk8KduItAFIDCAk=;
        b=k93waEjunhc9ivG0d3tmi9ghOt2VF/5e1Yk4wvPJYZUsynaMYfiLjC70ite0/KtH4a
         rk63bEiNTLtnnC29jDmCdtDHgxtGbMXZpyAYY9tpNsG22a9ywD7adNldmNbN4lXvgwwg
         74L3DZOepxt/VqhBeWufdwbHaSpDwP4vuao8iHizpkAOeXoFUxfisn07skMWWKP8V1kN
         u7S3krox1W9smiJXECEXl/4sDarTeESCo/bArnyB5pdh/GhMVID0kZXHJAubM0D9Ht+Q
         eeuN6dcYRvi+P969bDvArYpPar2J9LeDK4UIdPCMXfGwoZDhnCbLYn/dj7Jq+bzO4ONc
         VIzQ==
X-Gm-Message-State: APjAAAUo/z5V8Vb1nxOd8nv/q5SWNsF82mwEByYD6QGpKu9zXfCjzLiM
        WH2Hv04WkrR4vhR0ZBlZyQhY
X-Google-Smtp-Source: APXvYqyuqikEx9a3SP3UIaKfDeFTz5s3pu4Hg2hMzULCTaQWQKi9SfavbFkVlqJwlYsJqfgnYKSBzw==
X-Received: by 2002:a63:d70e:: with SMTP id d14mr6718846pgg.10.1572529521194;
        Thu, 31 Oct 2019 06:45:21 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id f5sm4898579pjq.24.2019.10.31.06.45.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 06:45:20 -0700 (PDT)
Date:   Thu, 31 Oct 2019 19:15:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191031134512.GB24273@mani>
References: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
 <20191030094902.32582-2-manivannan.sadhasivam@linaro.org>
 <20191031131538.GA9170@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031131538.GA9170@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Oct 31, 2019 at 03:15:38PM +0200, Laurent Pinchart wrote:
> Hi Mani,
> 
> Thank you for the patch.
> 
> On Wed, Oct 30, 2019 at 03:19:01PM +0530, Manivannan Sadhasivam wrote:
> > Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
> > add MAINTAINERS entry for the binding and driver.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/media/i2c/imx296.yaml | 94 +++++++++++++++++++
> >  MAINTAINERS                                   |  8 ++
> >  2 files changed, 102 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > new file mode 100644
> > index 000000000000..c04ec2203268
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > @@ -0,0 +1,94 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > +
> > +maintainers:
> > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +
> > +description: |-
> > +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > +  sensor with square pixel array and 1.58 M effective pixels. This chip
> > +  features a global shutter with variable charge-integration time. It is
> > +  programmable through I2C and 4-wire interfaces. The sensor output is
> > +  available via CSI-2 serial data output (1 Lane).
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx296
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description:
> > +      Input clock for the sensor.
> > +    items:
> > +      - const: mclk
> 
> The pin is named INCK, let's name the clock accordingly.
>

Okay, I thought generic names are preferred here!
 
> > +  clock-frequency:
> > +    description:
> > +      Frequency of the mclk clock in Hertz.
> 
> This shouldn't be needed, you can retrieve the clock frequency at
> runtime from the clock source.
> 

Unless the clock source is a fixed one! What if the clock source comes from
SoC? We need to set the rate, right?

> > +  vddo-supply:
> > +    description:
> > +      Definition of the regulator used as interface power supply.
> > +
> > +  vdda-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply.
> > +
> > +  vddd-supply:
> > +    description:
> > +      Definition of the regulator used as digital power supply.
> 
> Do we really need three regulators ? I agree that the sensor has three
> power rails, but aren't they usually powered by regulators that are
> tied together, without individual control ? The IMX926 specifications
> require the three power supplies to raise within 200ms, which we should
> be able to ensure in software. What does your board use, does it have
> multiple GPIOs to control each power supply ? If not I wonder if we
> could just define vddd-supply now, and add vdda-supply and vddo-supply
> later if we need to support systems that can control the supplies
> individually.
> 

The whole power supply model is a bit rotten. In my case, there are 3 different
regulators used with no software control. So, I can't control the rise time
(I assume that they are handled by the external power regulator itself).

So to be sane, I just documented with the assumption of fixed-regulators.

Thanks,
Mani
> > +  reset-gpios:
> > +    description:
> > +      The phandle and specifier for the GPIO that controls sensor reset.
> > +    maxItems: 1
> > +
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - clock-frequency
> > +  - vddo-supply
> > +  - vdda-supply
> > +  - vddd-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    imx296: camera-sensor@1a {
> > +        compatible = "sony,imx296";
> > +        reg = <0x1a>;
> > +        reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&camera_rear_default>;
> > +        clocks = <&gcc 90>;
> > +        clock-names = "mclk";
> > +        clock-frequency = <37125000>;
> > +        vddo-supply = <&camera_vddo_1v8>;
> > +        vdda-supply = <&camera_vdda_3v3>;
> > +        vddd-supply = <&camera_vddd_1v2>;
> > +
> > +        port {
> > +            imx296_ep: endpoint {
> > +                remote-endpoint = <&csiphy0_ep>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 55199ef7fa74..51194bb2c392 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15140,6 +15140,14 @@ S:	Maintained
> >  F:	drivers/media/i2c/imx274.c
> >  F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
> >  
> > +SONY IMX296 SENSOR DRIVER
> > +M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +L:	linux-media@vger.kernel.org
> > +T:	git git://linuxtv.org/media_tree.git
> > +S:	Maintained
> > +F:	drivers/media/i2c/imx296.c
> > +F:	Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > +
> >  SONY IMX319 SENSOR DRIVER
> >  M:	Bingbu Cao <bingbu.cao@intel.com>
> >  L:	linux-media@vger.kernel.org
> 
> -- 
> Regards,
> 
> Laurent Pinchart
