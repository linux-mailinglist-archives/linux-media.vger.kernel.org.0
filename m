Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CDC2D46C7
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 17:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729767AbgLIQcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 11:32:41 -0500
Received: from mail-oo1-f68.google.com ([209.85.161.68]:39118 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbgLIQcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 11:32:41 -0500
Received: by mail-oo1-f68.google.com with SMTP id k9so523770oop.6;
        Wed, 09 Dec 2020 08:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4omNtiiO8nUr1G+V5I9a46j4D8iodwqvt8f+y0SyraU=;
        b=Xa05RSLVMP6EnPX8GqFQIssDu1mUdw6qr7pDeiCfS0r0CFub0bnXoaftoyLqSJhmsz
         qZE4Fg6BivgTDqOEwBd9iRTNqez4H3o2nYGZ4u5PlrX7hDfoir6UpRa93YUQ8JTj1Pdp
         JpIFZ7jhub/6OevmQDMKWpo4CEOR6jtnt76LeKM1D6Yf+3NIMR2ZdcRUDS4PpHsBfyJ5
         APtwTGA6S3WXjFj1HVtu3PiCHnhuAIEL/qxLu+iAKrZO5gNvzarL4Xkt1m6C21FPYUzo
         EPMdc7VOrFv6yb0nAAOi+JIbForEMJqeZ7qovWnjOpSM6s5qmz0+XqTMt1qgaGJutzqQ
         M5Ww==
X-Gm-Message-State: AOAM531AsEPcNUvmMpFDs8LYuOprNMs6Svgcmvivd9M4aT0HQ26tAW25
        mPrgeXws6jgv277ARLpkcU023K9ioA==
X-Google-Smtp-Source: ABdhPJwRvn0q1PU1XuHM/CASZ9py7G4ZdWxcb7nyg7InCzL4iRuIiGIYPbIqZXxXaA2ZFBHILIDFAw==
X-Received: by 2002:a4a:e1b5:: with SMTP id 21mr2555657ooy.64.1607531520022;
        Wed, 09 Dec 2020 08:32:00 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w66sm427835oib.0.2020.12.09.08.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:31:58 -0800 (PST)
Received: (nullmailer pid 564420 invoked by uid 1000);
        Wed, 09 Dec 2020 16:31:57 -0000
Date:   Wed, 9 Dec 2020 10:31:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/2 v7] dt-bindings: leds: Add DT binding for Richtek
 RT8515
Message-ID: <20201209163157.GA501745@robh.at.kernel.org>
References: <20201201101350.1401956-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201101350.1401956-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 01, 2020 at 11:13:49AM +0100, Linus Walleij wrote:
> Add a YAML devicetree binding for the Richtek RT8515
> dual channel flash/torch LED driver.
> 
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: phone-devel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v6->v7:
> - Use led-max-microamp for the torch mode max current.
> - Drop the torch-specific new property from common.yaml in
>   favor of this property.
> - Collect Sakari's review tag.
> ChangeLog v5->v6:
> - Use the suffix -ohms for the resistor values as this gets
>   recognized by default by dtschema and is nominal.
> ChangeLog v4->v5:
> - Fix the RFS/RTS resistors to reference the u32 schema.
> - Fix resisitor speling error.
> ChangeLog v3->v4:
> - Add DT attributes for the RFS and RTS resistors, so that
>   the hardware-defined maximum current can be determined.
> - Add torch-max-microamp to the common bindings so we can
>   set an attribute for the max microamp in torch mode.
> - Add flash-max-microamp and torch-max-microamp as optional
>   to the LED node.
> - Slot in some elabortative descriptions of the new
>   properties and describe what the hardware is doing.
> - Cc phone-devel@vger.kernel.org
> ChangeLog v2->v3:
> - Add Sakari to CC
> - Resend
> ChangeLog v1->v2:
> - Explicitly inherit function, color and flash-max-timeout-us
>   from common.yaml
> - Add "led" node as required.
> ---
>  .../bindings/leds/richtek,rt8515.yaml         | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> new file mode 100644
> index 000000000000..3190e4fcfdf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/richtek,rt8515.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Richtek RT8515 1.5A dual channel LED driver
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The Richtek RT8515 is a dual channel (two mode) LED driver that
> +  supports driving a white LED in flash or torch mode. The maximum
> +  current for each mode is defined in hardware using two resistors
> +  RFS and RTS.
> +
> +properties:
> +  compatible:
> +    const: richtek,rt8515
> +
> +  enf-gpios:
> +    maxItems: 1
> +    description: A connection to the 'ENF' (enable flash) pin.
> +
> +  ent-gpios:
> +    maxItems: 1
> +    description: A connection to the 'ENT' (enable torch) pin.
> +
> +  richtek,rfs-ohms:
> +    minimum: 7680
> +    maximum: 367000
> +    description: The resistance value of the RFS resistor. This
> +      resistors limits the maximum flash current. This must be set
> +      for the property flash-max-microamp to work, the RFS resistor
> +      defines the range of the dimmer setting (brightness) of the
> +      flash LED.
> +
> +  richtek,rts-ohms:
> +    minimum: 7680
> +    maximum: 367000
> +    description: The resistance value of the RTS resistor. This
> +      resistors limits the maximum torch current. This must be set
> +      for the property torch-max-microamp to work, the RTS resistor
> +      defines the range of the dimmer setting (brightness) of the
> +      torch LED.
> +
> +  led:
> +    type: object
> +    $ref: common.yaml#

       additionalProperties: false

And then fix the error in the example.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    properties:
> +      function: true
> +      color: true
> +      flash-max-timeout-us: true
> +
> +      flash-max-microamp:
> +        maximum: 700000
> +        description: The maximum current for flash mode
> +          is hardwired to the component using the RFS resistor to
> +          ground. The maximum hardware current setting is calculated
> +          according to the formula Imax = 5500 / RFS. The lowest
> +          allowed resistance value is 7.86 kOhm giving an absolute
> +          maximum current of 700mA. By setting this attribute in
> +          the device tree, you can further restrict the maximum
> +          current below the hardware limit. This requires the RFS
> +          to be defined as it defines the maximum range.
> +
> +      led-max-microamp:
> +        maximum: 700000
> +        description: The maximum current for torch mode
> +          is hardwired to the component using the RTS resistor to
> +          ground. The maximum hardware current setting is calculated
> +          according to the formula Imax = 5500 / RTS. The lowest
> +          allowed resistance value is 7.86 kOhm giving an absolute
> +          maximum current of 700mA. By setting this attribute in
> +          the device tree, you can further restrict the maximum
> +          current below the hardware limit. This requires the RTS
> +          to be defined as it defines the maximum range.
> +
> +required:
> +  - compatible
> +  - ent-gpios
> +  - enf-gpios
> +  - led
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    led-controller {
> +        compatible = "richtek,rt8515";
> +        enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
> +        ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
> +        richtek,rfs-ohms = <16000>;
> +        richtek,rts-ohms = <100000>;
> +
> +        led {
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            flash-max-timeout-us = <250000>;
> +            flash-max-microamp = <150000>;
> +            torch-max-microamp = <25000>;

hint ^^^

> +        };
> +    };
> +
> +...
> -- 
> 2.26.2
> 
