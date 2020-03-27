Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26171195F3C
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 20:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgC0Two (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 15:52:44 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38051 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0Two (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 15:52:44 -0400
Received: by mail-io1-f67.google.com with SMTP id m15so11143461iob.5;
        Fri, 27 Mar 2020 12:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+h5WiL9yDo8DkU2jbfgkSKoKNNnl8C3Rpuw/b0KqEYM=;
        b=JglqOaLSpKvSgdQFkaB3fDD0EOtMWSRbMkR41B2VlNLEmD0e/ODBqAXfZI1BZa3gwR
         cbUOQOYnylu5pHwIk9nB4mi5W5Q3dHs7j7jnHwLUD7tsAv7VFX4XavfHtsWHmtgLlIsK
         dqEFqKgX9SpMPVn1AeD2HXg/Zl6Qki/7iEVbOB4nUEsSHn0EvKJB6WkwSUp8cYWj+5jA
         JSacYCQ1mvvbUwn6HDkUmqvGyUjS7/HxU8jVyWHNen5GKDfvOKggtybKpMSIx5K/w++G
         IbdNDJkgI+zwAYMmNS8kBQyDILnY9aC6xFgYik/vcmJU8mIg3rDjE2XwURNL6qJeVMzA
         //Rg==
X-Gm-Message-State: ANhLgQ0L3e1HgFZeRxMHIXsgIyC1ub4q6QlQpyPl8Uyt84GA5u7mQpD+
        XJFZxq6CuTnuBvlkcKhShQ==
X-Google-Smtp-Source: ADFU+vsK32F4dANjFY+gLtTfj1X809p0ibUbCDxQyexbLSei5QcyLHd/MOZ6eJsMkrpoSb0WgyDw3g==
X-Received: by 2002:a02:856a:: with SMTP id g97mr500259jai.97.1585338762113;
        Fri, 27 Mar 2020 12:52:42 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id i16sm2207096ils.40.2020.03.27.12.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:52:41 -0700 (PDT)
Received: (nullmailer pid 32723 invoked by uid 1000);
        Fri, 27 Mar 2020 19:52:39 -0000
Date:   Fri, 27 Mar 2020 13:52:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 26/28] dt-bindings: spi: Convert spi-pxa2xx to json-schema
Message-ID: <20200327195239.GA28087@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-27-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-27-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:20AM +0100, Lubomir Rintel wrote:
> A straightforward conversion of the the spi-pxa2xx binding to DT schema
> format using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../bindings/spi/marvell,mmp2-ssp.yaml        | 58 +++++++++++++++++++
>  .../devicetree/bindings/spi/spi-pxa2xx.txt    | 27 ---------
>  2 files changed, 58 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-pxa2xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml b/Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml
> new file mode 100644
> index 0000000000000..de6b6a53b70d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)

Same issue on license...

> +# Copyright 2019,2020 Lubomir Rintel <lkundrak@v3.sk>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/marvell,mmp2-ssp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PXA2xx SSP SPI Controller bindings
> +
> +maintainers:
> +  - Lubomir Rintel <lkundrak@v3.sk>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: marvell,mmp2-ssp
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  ready-gpios:
> +    description: |
> +      GPIO used to signal a SPI master that the FIFO is filled and we're
> +      ready to service a transfer. Only useful in slave mode.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

> +  - '#address-cells'
> +  - '#size-cells'

spi-controller.yaml handles these being required and also that they 
aren't for slave mode.

> +
> +dependencies:
> +  ready-gpios: [ spi-slave ]
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/marvell,mmp2.h>
> +    spi@d4035000 {
> +        compatible = "marvell,mmp2-ssp";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0xd4035000 0x1000>;
> +        clocks = <&soc_clocks MMP2_CLK_SSP0>;
> +        interrupts = <0>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/spi/spi-pxa2xx.txt b/Documentation/devicetree/bindings/spi/spi-pxa2xx.txt
> deleted file mode 100644
> index e30e0c2a4bce1..0000000000000
> --- a/Documentation/devicetree/bindings/spi/spi-pxa2xx.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -PXA2xx SSP SPI Controller
> -
> -Required properties:
> -- compatible: Must be "marvell,mmp2-ssp".
> -- reg: Offset and length of the device's register set.
> -- interrupts: Should be the interrupt number.
> -- clocks: Should contain a single entry describing the clock input.
> -- #address-cells:  Number of cells required to define a chip select address.
> -- #size-cells: Should be zero.
> -
> -Optional properties:
> -- cs-gpios: list of GPIO chip selects. See the SPI bus bindings,
> -  Documentation/devicetree/bindings/spi/spi-bus.txt
> -- spi-slave: Empty property indicating the SPI controller is used in slave mode.
> -- ready-gpios: GPIO used to signal a SPI master that the FIFO is filled
> -  and we're ready to service a transfer. Only useful in slave mode.
> -
> -Child nodes represent devices on the SPI bus
> -  See ../spi/spi-bus.txt
> -
> -Example:
> -	ssp1: spi@d4035000 {
> -		compatible = "marvell,mmp2-ssp";
> -		reg = <0xd4035000 0x1000>;
> -		clocks = <&soc_clocks MMP2_CLK_SSP0>;
> -		interrupts = <0>;
> -	};
> -- 
> 2.25.1
> 
