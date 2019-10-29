Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C83EE92DC
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 23:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbfJ2WMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 18:12:16 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46241 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfJ2WMP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 18:12:15 -0400
Received: by mail-ot1-f68.google.com with SMTP id 89so289570oth.13;
        Tue, 29 Oct 2019 15:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SqarsgJPthXn6oM9ADV9/jK1dg4SoeL4z7Sgacr/J3w=;
        b=UIryjo6ngzjoKeO2X5XlNKgIIa4PXFALdej2sM+oKwXRsqGwkJvztagNwv4gb8gO3U
         Bqt0PL1hqvwQo86rK2wnu1dThlx/veO6Elw2xm1zcUX6j4RcBVxcoCrbiW9e8LjE9Bpu
         5NDpXLVtYQJaqf1zu+eDMoHXnBl6OhLtVv5uLaDBWsg5RGmdISzO697szG7nhm0nlHBu
         UfNL4y+HGM8II+Mbicj9X4pZmyK4updIzRnlozdRUrP3VxhIc2yPlzWjm16cgrrnqDEC
         lmS1LbaLYztAqcWSOWmyUw6pL6SE4lRiup7rU3nY6AhY1lPjtk2RcuwWnN44k8PaipVn
         uGbw==
X-Gm-Message-State: APjAAAVQwQjVOdqNPz9ARir/xCulble7Oiy08IwXtesgTh91ZczNdEsS
        j7U54CQJ+J7mK1N2r1qeavEV+XvgBw==
X-Google-Smtp-Source: APXvYqz9d9COJfJQoVq1eheKmnYGgyyb98J60mtXo2ExMmYVqrYcF66Cj17ua1x7UNXnNop0QipqwQ==
X-Received: by 2002:a9d:3677:: with SMTP id w110mr20563598otb.258.1572387134711;
        Tue, 29 Oct 2019 15:12:14 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j188sm25564oih.54.2019.10.29.15.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 15:12:14 -0700 (PDT)
Date:   Tue, 29 Oct 2019 17:12:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191029221213.GB17996@bogus>
References: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
 <20191025175908.14260-2-manivannan.sadhasivam@linaro.org>
 <20191028122115.GB4928@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028122115.GB4928@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 28, 2019 at 02:21:15PM +0200, Sakari Ailus wrote:
> Hi Manivannan,
> 
> Thanks for the update.
> 
> On Fri, Oct 25, 2019 at 11:29:07PM +0530, Manivannan Sadhasivam wrote:
> > Add YAML devicetree binding for IMX296 CMOS image sensor.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/media/i2c/imx296.yaml | 98 +++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > new file mode 100644
> > index 000000000000..4e204fd7cf90
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > @@ -0,0 +1,98 @@
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
> > +
> > +  clock-frequency:
> > +    description:
> > +      Frequency of the mclk clock in Hertz.
> > +    default: 37125000
> 
> I think you could omit the default.

Yes, there's no default if it is required.
 
> > +
> > +  vddo-supply:
> > +    description:
> > +      Definition of the regulator used as interface power supply.
> > +    maxItems: 1
> > +
> > +  vdda-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply.
> > +    maxItems: 1
> > +
> > +  vddd-supply:
> > +    description:
> > +      Definition of the regulator used as digital power supply.
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description:
> > +      The phandle and specifier for the GPIO that controls sensor reset.
> > +    maxItems: 1
> > +
> > +  # See ../video-interfaces.txt for details

details on what?

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
> 
> I think the port and endpoint nodes should documented here as well.

port yes, but endpoint no. Unless you have endpoint properties other 
than remote-endpoint or reg.

> 
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
> 
> -- 
> Regards,
> 
> Sakari Ailus
