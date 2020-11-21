Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16792BBF30
	for <lists+linux-media@lfdr.de>; Sat, 21 Nov 2020 14:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgKUN1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Nov 2020 08:27:51 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35549 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbgKUN1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Nov 2020 08:27:51 -0500
Received: by mail-qt1-f196.google.com with SMTP id t5so9353440qtp.2;
        Sat, 21 Nov 2020 05:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UlMTvQzViguAqFA+h2243IpAoQUVhvfvaewRLi7CYBw=;
        b=UghY6WJHeK421XIrkrIV/L6IuAJqfaNmwRFfYGcO6W5MYw0lthJ5hqCetotZ2KcYW+
         72x1Z6xYOhaTYxlP5MdqBJ2GYteHkIsbuk3lgfGit8Gjk3Bry6i/m4W77VLz+zOiZkHt
         z3KFwby+7XCzldva2BG/d6SNuXInrlra9AD1na5tvNI8GKIFuFJxJcdWYmiyd+6n6hJb
         5N2PbVonYKP2nDSVgryu1XLETWAX6oR8Km1oYdYn4gIO4Ze1Di8ZRML9V1Ric6qBDUSc
         gFvnsW4kVYOVn2nfnURW3f06RzuMsh1FefChHKb2eJhCdg3OapTATl9GhwFPiUA7AQqC
         W38A==
X-Gm-Message-State: AOAM530GzYMZal0R+KatJ1e+sqGoDLIKsX6NhUclbQAGUP8GcnpGixfw
        j+BHh6IkvjVz+eYRy89ntQ==
X-Google-Smtp-Source: ABdhPJxPf0PJQhqnPJF1nzc7GnT/AfZz/pTuxO2gDzPihvKyYwmNthXrAeHVJ7c7eAxyLbFTD2ILTg==
X-Received: by 2002:aed:2043:: with SMTP id 61mr10298811qta.191.1605965269158;
        Sat, 21 Nov 2020 05:27:49 -0800 (PST)
Received: from xps15 ([172.58.99.237])
        by smtp.gmail.com with ESMTPSA id b17sm3941101qkl.123.2020.11.21.05.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 05:27:48 -0800 (PST)
Received: (nullmailer pid 2125198 invoked by uid 1000);
        Sat, 21 Nov 2020 13:27:42 -0000
Date:   Sat, 21 Nov 2020 07:27:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v5] dt-bindings: leds: Add DT binding for Richtek
 RT8515
Message-ID: <20201121132742.GA2121607@robh.at.kernel.org>
References: <20201113124239.2667502-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113124239.2667502-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 13, 2020 at 01:42:38PM +0100, Linus Walleij wrote:
> Add a YAML devicetree binding for the Richtek RT8515
> dual channel flash/torch LED driver.
> 
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: phone-devel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
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
>  .../devicetree/bindings/leds/common.yaml      |   6 +
>  .../bindings/leds/richtek,rt8515.yaml         | 111 ++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index f1211e7045f1..92fa90b4a671 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -151,6 +151,12 @@ properties:
>        Maximum flash LED supply current in microamperes. Required for flash LED
>        nodes with configurable current.
>  
> +  torch-max-microamp:
> +    description:
> +      Maximum flash LED supply current in microamperes, when the flash LED is
> +      used as a torch (flashlight). This is usually lower than the flash mode
> +      maximum current, if the LED supports torch mode.
> +
>    flash-max-timeout-us:
>      description:
>        Maximum timeout in microseconds after which the flash LED is turned off.
> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> new file mode 100644
> index 000000000000..b1f69277c5d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> @@ -0,0 +1,111 @@
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
> +  richtek,rfs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 7680
> +    maximum: 367000
> +    description: The resistance value of the RFS resistor. This

Units? Add a defined unit suffix to the property name and you can drop 
the type.

> +      resistors limits the maximum flash current. This must be set
> +      for the property flash-max-microamp to work, the RFS resistor
> +      defines the range of the dimmer setting (brightness) of the
> +      flash LED.
> +
> +  richtek,rts:
> +    $ref: /schemas/types.yaml#/definitions/uint32
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
> +      torch-max-microamp:
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
> +        richtek,rfs = <16000>;
> +        richtek,rts = <100000>;
> +
> +        led {
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            flash-max-timeout-us = <250000>;
> +            flash-max-microamp = <150000>;
> +            torch-max-microamp = <25000>;
> +        };
> +    };
> +
> +...
> -- 
> 2.26.2
> 
