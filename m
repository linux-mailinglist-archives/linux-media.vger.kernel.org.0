Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51CE2B1135
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 23:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgKLWQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 17:16:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:56112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727370AbgKLWQ7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 17:16:59 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D7382222F;
        Thu, 12 Nov 2020 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605219417;
        bh=Ivd8lBQfLMzrN5XN81iPpYGqHNCPfIJCg6oeZP3qy/8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ceu3oPu/bmcwWrGDukiiCtd+i1kDxFoJl1gYIA/An57RS3cClhk/KhXHO7/rGbscU
         +A+NdBab4DbOJs5ohOi0LuhSqCqo4daSxLoygEBOO9F3nBmoHbTmQOSjS9oOCGaY30
         7omwH2HIxZZGdZ0eFcGuFZspgSzTwkEPHAPL+65s=
Received: by mail-oi1-f179.google.com with SMTP id t16so8161707oie.11;
        Thu, 12 Nov 2020 14:16:57 -0800 (PST)
X-Gm-Message-State: AOAM530dDFJczWGXASqGZTiIInWNq7efVthxMGjziL0+alCSqe0EBnoC
        Y4t+/9FT3glFmQfkyjIOtJO36cxPg/zZTbvjZQ==
X-Google-Smtp-Source: ABdhPJzltx1ky3YcpZfEiIxWybi9J6Xq8juMarkpa1fav6tzTutcFp57F/EBoZzLLryRVb4tDqkp+e71e/1u+ugE+hs=
X-Received: by 2002:aca:5dc2:: with SMTP id r185mr1318822oib.106.1605219416787;
 Thu, 12 Nov 2020 14:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20201112115646.2562467-1-linus.walleij@linaro.org>
In-Reply-To: <20201112115646.2562467-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 12 Nov 2020 16:16:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+VZZwimkozzug1cxMZc04mH0_KeWQw-SY73f0zQENwyQ@mail.gmail.com>
Message-ID: <CAL_Jsq+VZZwimkozzug1cxMZc04mH0_KeWQw-SY73f0zQENwyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v4] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 5:57 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
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
> index 08b6700ca61e..28bdf09b4af4 100644
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
> index 000000000000..5f65a20b997d
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
> +    maxItems: 1
> +    minimum: 7680
> +    maximum: 367000

You've mixed vocabulary for arrays (maxItems) and scalars.

You need a type reference.

> +    description: The resistance value of the RFS resisitor. This

typo

> +      resistors limits the maximum flash current. This must be set
> +      for the property flash-max-microamp to work, the RFS resistor
> +      defines the range of the dimmer setting (brightness) of the
> +      flash LED.
> +
> +  richtek,rts:
> +    maxItems: 1
> +    minimum: 7680
> +    maximum: 367000
> +    description: The resistance value of the RTS resisitor. This

Same issues here.

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
