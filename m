Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF49292B68
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 18:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgJSQ00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 12:26:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:50580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730025AbgJSQ0Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 12:26:25 -0400
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D891421D81;
        Mon, 19 Oct 2020 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603124784;
        bh=1tJbuVlWIhR9+3W7fjyD1W3o3IhxC52MeE1RdO8F+xU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SWa14kOW/ZS7j+YS7HC0xhVYkzuE1IacaPzN6lRnXr0I9u8CN8um8dVCnxEW3egu7
         UYfGwgnwUqJemWweEsQoLbNZ5bEbU1P3IeI08CekRsOdDSqtPUxUJU5vLIJrDgAluR
         162T9gUjhtw/wPsJ4dt1SXsoRZQni0Fg2BUEsCdQ=
Received: by mail-ed1-f41.google.com with SMTP id l16so10922126eds.3;
        Mon, 19 Oct 2020 09:26:23 -0700 (PDT)
X-Gm-Message-State: AOAM532KsCOVDlnWQl4tUqOgTx0Mha5KbYZVH8jB8h5rGD9jHmEr9uYw
        7zo49dwdEEanhrPRfOqGcDh/HwjsYqmfd2mveo0=
X-Google-Smtp-Source: ABdhPJy9MdlUDwZRpI2rSd2NdAovXzospjx8uacv1HDyzeoY++bGYjByZvkOGAVKznThlskx7qEcN1U0g81yC5Ps+4E=
X-Received: by 2002:aa7:d1d5:: with SMTP id g21mr631324edp.348.1603124782290;
 Mon, 19 Oct 2020 09:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201018123106.14917-1-kholk11@gmail.com> <20201018123106.14917-3-kholk11@gmail.com>
In-Reply-To: <20201018123106.14917-3-kholk11@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 19 Oct 2020 18:26:10 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcNth=+V7sWQV7-o9+mHseP0RJGXrPbU7smMFZgFcxGPQ@mail.gmail.com>
Message-ID: <CAJKOXPcNth=+V7sWQV7-o9+mHseP0RJGXrPbU7smMFZgFcxGPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
To:     kholk11@gmail.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 18 Oct 2020 at 14:36, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add YAML device tree binding for IMX300 CMOS image sensor, and
> the relevant MAINTAINERS entries.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/imx300.yaml | 115 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx300.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx300.yaml b/Documentation/devicetree/bindings/media/i2c/imx300.yaml
> new file mode 100644
> index 000000000000..82fb19c5018c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx300.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx300.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.3-Inch 8Mpixel Stacked CMOS Digital Image Sensor
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <kholk11@gmail.com>
> +
> +description: |-
> +  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
> +  sensor with a pixel size of 1.08um and an active array size of
> +  5948H x 4140V. It is programmable through I2C interface at address 0x10.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx300
> +
> +  reg:
> +    description: I2C device address

Skip the description, it is obvious.

> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  VDIG-supply:
> +    description:
> +      Digital I/O voltage supply, 1.15-1.20 volts
> +
> +  VANA-supply:
> +    description:
> +      Analog voltage supply, 2.2 volts
> +
> +  VDDL-supply:

Lower-case for all three supplies.

> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The sensor supports either two-lane, or four-lane operation.
> +              If this property is omitted four-lane operation is assumed.
> +              For four-lane operation the property must be set to <0 1 2 3>.
> +            items:
> +              - const: 0
> +              - const: 1
> +              - const: 2
> +              - const: 3

You miss here two-lane option (oneOf). Seems there is a default, so
you could add here "default: <0 1 2 3>

> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              MIPI CSI-2 clock is non-continuous if this property is present,
> +              otherwise it's continuous.
> +
> +          link-frequencies:
> +            $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies.
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - VANA-supply
> +  - VDIG-supply
> +  - VDDL-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx300: sensor@10 {
> +            compatible = "sony,imx300";
> +            reg = <0x10>;
> +            clocks = <&imx300_xclk>;
> +            VANA-supply = <&imx300_vana>;   /* 2.2v */
> +            VDIG-supply = <&imx300_vdig>;   /* 1.2v */
> +            VDDL-supply = <&imx300_vddl>;   /* 1.8v */
> +
> +            port {
> +                imx300_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <0 1 2 3>;
> +                    clock-noncontinuous;
> +                    link-frequencies = /bits/ 64 <780000000 480000000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c66710dd7e0a..231937d9d16a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16279,6 +16279,14 @@ T:     git git://linuxtv.org/media_tree.git
>  F:     Documentation/devicetree/bindings/media/i2c/imx290.txt
>  F:     drivers/media/i2c/imx290.c
>
> +SONY IMX300 SENSOR DRIVER
> +M:     AngeloGioacchino Del Regno <kholk11@gmail.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media_tree.git

Skip the Git tree, unless you manage it.

Best regards,
Krzysztof
