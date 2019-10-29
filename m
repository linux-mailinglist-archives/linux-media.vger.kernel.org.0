Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBACBE92D4
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 23:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfJ2WJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 18:09:31 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45465 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbfJ2WJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 18:09:31 -0400
Received: by mail-ot1-f66.google.com with SMTP id 41so289167oti.12;
        Tue, 29 Oct 2019 15:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BNHkx8n6XgkuYXTB/UGGaZ4IcfSgm5oAYgTMsZynWPI=;
        b=Q/5tMDOcmpBkVEaM7VdH3JYNjgZfXbjU6hYx9gv9yv/Vupw2XqxxOZtqTxkYaivF1f
         wxd0N01OE+y5yPO3691u5fOTYLGqUxqvI5JgRCEPPexQBrT/hE7RrhZU6wDZCqNM2c2u
         wEjmyVsn+u8wRxynzl2kAni4lnuzXU/S3tDSXWyGMUNiNAx/mssMBq5AUy080RyTRm6H
         NgQut/J3cIU3LC0ofjppQtgP+XdD/pX83yfovIKgQXZx8iXHvGH1+0HfmZxjqpFqwaP9
         xWO3l7HMan9m88JjXncIqJtav/z91zqFcTKE8gLgjf9V7CrRGiRZoGaZAAIVzPVa85m3
         mQNQ==
X-Gm-Message-State: APjAAAW+F8M57j6azzjvEvkzw7ZvC7ZlHnjJydwe6pgPOpy5nzoISMNc
        RxDFWRZSPsIN/ltHiBvYaQ==
X-Google-Smtp-Source: APXvYqxMzw9qF2YULgqtHqHTTivgKGofmqDJrOGVSt7uKu4vVNlqhTlrWxRSC/VX7gh5qb/B7miCDQ==
X-Received: by 2002:a05:6830:1403:: with SMTP id v3mr20312857otp.300.1572386970124;
        Tue, 29 Oct 2019 15:09:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q28sm92226otc.77.2019.10.29.15.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 15:09:29 -0700 (PDT)
Date:   Tue, 29 Oct 2019 17:09:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191029220928.GA17996@bogus>
References: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
 <20191025175908.14260-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025175908.14260-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 25, 2019 at 11:29:07PM +0530, Manivannan Sadhasivam wrote:
> Add YAML devicetree binding for IMX296 CMOS image sensor.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/imx296.yaml | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> new file mode 100644
> index 000000000000..4e204fd7cf90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description: |-
> +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> +  sensor with square pixel array and 1.58 M effective pixels. This chip
> +  features a global shutter with variable charge-integration time. It is
> +  programmable through I2C and 4-wire interfaces. The sensor output is
> +  available via CSI-2 serial data output (1 Lane).
> +
> +properties:
> +  compatible:
> +    const: sony,imx296
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Input clock for the sensor.
> +    items:
> +      - const: mclk
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the mclk clock in Hertz.
> +    default: 37125000
> +
> +  vddo-supply:
> +    description:
> +      Definition of the regulator used as interface power supply.
> +    maxItems: 1

You don't need 'maxItems' on *-supply. It's not an array.

> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +    maxItems: 1
> +
> +  vddd-supply:
> +    description:
> +      Definition of the regulator used as digital power supply.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      The phandle and specifier for the GPIO that controls sensor reset.
> +    maxItems: 1
> +
> +  # See ../video-interfaces.txt for details
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-frequency
> +  - vddo-supply
> +  - vdda-supply
> +  - vddd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    imx296: camera-sensor@1a {
> +        compatible = "sony,imx296";
> +        reg = <0x1a>;
> +        reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&camera_rear_default>;
> +        clocks = <&gcc 90>;
> +        clock-names = "mclk";
> +        clock-frequency = <37125000>;
> +        vddo-supply = <&camera_vddo_1v8>;
> +        vdda-supply = <&camera_vdda_3v3>;
> +        vddd-supply = <&camera_vddd_1v2>;
> +
> +        port {
> +            imx296_ep: endpoint {
> +                remote-endpoint = <&csiphy0_ep>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
