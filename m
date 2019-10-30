Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499B4E96A9
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 07:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfJ3GqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 02:46:06 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35072 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfJ3GqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 02:46:05 -0400
Received: by mail-pg1-f196.google.com with SMTP id c8so814952pgb.2
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2019 23:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cUna80mgrJuvwZng2S/zg9eJ2aJtl1v9W/4Z7bansiw=;
        b=aF/kblen9t7CI7DHz9bX09InKfJirCrxV3h4upoRTtuntFzgf+ordcplUGhDX3hTlI
         enA6URTjG0DKHNBi7J0mrKJnZ4kpZEXgZiuT0h9iNBlprIQJyJtZIMrytcelto9jQO7H
         MsopDsGzlopi41nNk+mnCl/lntEhDo13NN+XSceDsf0olDyv6lrE4MwZ8tOAOOOVRf37
         hs6uKnu6Ueo6jwa5fJv4IwEn/6bbxawQmu6ZcBnZkngNeMEiroT/u7fHnv6vpuw5IYke
         qnmMpHgGEebHdKWzYqH8bpUg+biG8CfvSfTg7sNHuFlVv8ytyegGt6zi0ypgzbIHLwXW
         LJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cUna80mgrJuvwZng2S/zg9eJ2aJtl1v9W/4Z7bansiw=;
        b=b8+wR0zkPi9iW/M3KkAlfZXNSJffJXk9SysiLT4AnXh0aEmqyagAoQtgFfteJtL5BK
         T68RR6eFrYckp1/NA8k7fP96QVR/vX/QZi4U7V+6m6ya3Rbuu+EcuNspTQ7rHSk51hPf
         hT7awKAltkCJuq9SdSjakir00Dhbh+gmHPP1FZGAdywp9A0VtUQMY+wFXheeTxgueTsh
         FvI4X3ITXUOmpGNtTBjA+zjG6tB1cBBO+s/jLVddpojUrUuwqQbZfnkD7Y55KUqtGcMX
         oDl/0swYyNC5wGZE1tDxAmjpHKDmN15HPBKS5tqU32jQ1US3cL2/CBFSe/WJ+PAzJhCu
         kCqQ==
X-Gm-Message-State: APjAAAUZuiwunEc8WiPqx60oETsLa1DCwkL+ptSZKFRoR9SWPri/Zoez
        P3VeEHxkuEMTqPEVgWImcbWCtuwUhA==
X-Google-Smtp-Source: APXvYqw4sy47eUnhMCq6S6rBb149xzsVxBxXpwL1klsrmUeuNOV3Z+gzN5hBEkI38UsF/yJrZuzh7A==
X-Received: by 2002:a63:f441:: with SMTP id p1mr31930177pgk.362.1572417964721;
        Tue, 29 Oct 2019 23:46:04 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:77d9:c9fa:423a:3851:8df4])
        by smtp.gmail.com with ESMTPSA id i63sm1270378pgc.31.2019.10.29.23.45.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2019 23:46:04 -0700 (PDT)
Date:   Wed, 30 Oct 2019 12:15:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191030064555.GB11637@Mani-XPS-13-9360>
References: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
 <20191025175908.14260-2-manivannan.sadhasivam@linaro.org>
 <20191028122115.GB4928@valkosipuli.retiisi.org.uk>
 <20191029221213.GB17996@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029221213.GB17996@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob, Sakari,

On Tue, Oct 29, 2019 at 05:12:13PM -0500, Rob Herring wrote:
> On Mon, Oct 28, 2019 at 02:21:15PM +0200, Sakari Ailus wrote:
> > Hi Manivannan,
> > 
> > Thanks for the update.
> > 
> > On Fri, Oct 25, 2019 at 11:29:07PM +0530, Manivannan Sadhasivam wrote:
> > > Add YAML devicetree binding for IMX296 CMOS image sensor.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  .../devicetree/bindings/media/i2c/imx296.yaml | 98 +++++++++++++++++++
> > >  1 file changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > new file mode 100644
> > > index 000000000000..4e204fd7cf90
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > @@ -0,0 +1,98 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > > +
> > > +maintainers:
> > > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > +
> > > +description: |-
> > > +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > > +  sensor with square pixel array and 1.58 M effective pixels. This chip
> > > +  features a global shutter with variable charge-integration time. It is
> > > +  programmable through I2C and 4-wire interfaces. The sensor output is
> > > +  available via CSI-2 serial data output (1 Lane).
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx296
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    description:
> > > +      Input clock for the sensor.
> > > +    items:
> > > +      - const: mclk
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      Frequency of the mclk clock in Hertz.
> > > +    default: 37125000
> > 
> > I think you could omit the default.
> 
> Yes, there's no default if it is required.
>

Okay.

> > > +
> > > +  vddo-supply:
> > > +    description:
> > > +      Definition of the regulator used as interface power supply.
> > > +    maxItems: 1
> > > +
> > > +  vdda-supply:
> > > +    description:
> > > +      Definition of the regulator used as analog power supply.
> > > +    maxItems: 1
> > > +
> > > +  vddd-supply:
> > > +    description:
> > > +      Definition of the regulator used as digital power supply.
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    description:
> > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > +    maxItems: 1
> > > +
> > > +  # See ../video-interfaces.txt for details
> 
> details on what?
>

Standard properties like endpoint, reg, etc...  I can remove it if not
required.

> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - clock-frequency
> > > +  - vddo-supply
> > > +  - vdda-supply
> > > +  - vddd-supply
> > 
> > I think the port and endpoint nodes should documented here as well.
> 
> port yes, but endpoint no. Unless you have endpoint properties other 
> than remote-endpoint or reg.
> 


Okay. Will document port.

Thanks,
Mani

> > 
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    imx296: camera-sensor@1a {
> > > +        compatible = "sony,imx296";
> > > +        reg = <0x1a>;
> > > +        reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> > > +        pinctrl-names = "default";
> > > +        pinctrl-0 = <&camera_rear_default>;
> > > +        clocks = <&gcc 90>;
> > > +        clock-names = "mclk";
> > > +        clock-frequency = <37125000>;
> > > +        vddo-supply = <&camera_vddo_1v8>;
> > > +        vdda-supply = <&camera_vdda_3v3>;
> > > +        vddd-supply = <&camera_vddd_1v2>;
> > > +
> > > +        port {
> > > +            imx296_ep: endpoint {
> > > +                remote-endpoint = <&csiphy0_ep>;
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > 
> > -- 
> > Regards,
> > 
> > Sakari Ailus
