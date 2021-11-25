Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CD445D8FE
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 12:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239117AbhKYLUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 06:20:31 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:37730 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbhKYLSb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 06:18:31 -0500
Received: by mail-ua1-f44.google.com with SMTP id o1so11513989uap.4;
        Thu, 25 Nov 2021 03:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nXHfa52yI/jtVJeiwa2i1H6X+EqTPj1vRtdfS4MAfjA=;
        b=byipGA37dezQgW4QnAvdgSII3zdyZUmhi0Qtb5VbYeWZLyNwRg2BdRuT/id0xgxU+1
         cJgBCou7c6Us7g72XgxvUDIWBwQxjOe4H/HV/yjpKHqyFKvxSNYtrpcM1rC2pSJbV0yJ
         WTyQlSsjB53mikFFeCe7DhYI8TC6HpEQ41sza9un0KGZ7h7QBsXsN5Bm49qwBnuzXmhf
         pIkKPHLSHCvt4LV7BEezaNtrfZahv5BzwWXgvZVUozcEiZsaMqeU2FqanvVhmCkUJhh+
         6n+v3zUNLtmTrc2cLDxuZbYYL19+PQAlsGblwZuhK4gxswsTJmd5dv5Smy4rFUi8YJgB
         Q0gQ==
X-Gm-Message-State: AOAM532SpwjVR92MrVZg08+VO6EOnzoaNyj4c4qSAqhf4rfN4L6iUM55
        Orek6rVXDX6Ntu4Y9SzhgqMiS1ePbX7p8w==
X-Google-Smtp-Source: ABdhPJwLQhpqnZSenaQBpK/ZZn6CxVPk448n8NRkUoLllpduBsFAx/EQh60u9FhI5EyxHm1KtlMtHQ==
X-Received: by 2002:ab0:2696:: with SMTP id t22mr24001211uao.13.1637838919322;
        Thu, 25 Nov 2021 03:15:19 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 66sm1641841uao.0.2021.11.25.03.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 03:15:19 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id w23so11506261uao.5;
        Thu, 25 Nov 2021 03:15:18 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr8076065vst.68.1637838918551;
 Thu, 25 Nov 2021 03:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20210906102837.2190387-1-martin.kepplinger@puri.sm> <20210906102837.2190387-3-martin.kepplinger@puri.sm>
In-Reply-To: <20210906102837.2190387-3-martin.kepplinger@puri.sm>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Nov 2021 12:15:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVNhLa2p-ywmpcEj-sw+NyRNp2z9jsVqsXEDrKphivCQ@mail.gmail.com>
Message-ID: <CAMuHMdVVNhLa2p-ywmpcEj-sw+NyRNp2z9jsVqsXEDrKphivCQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kernel@puri.sm,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        shawnx.tu@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 6, 2021 at 12:30 PM Martin Kepplinger
<martin.kepplinger@puri.sm> wrote:
> Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.
>
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/i2c/hynix,hi846.yaml       | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> new file mode 100644
> index 000000000000..85a8877c2f38
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> +
> +description: |-
> +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> +  interface and CCI (I2C compatible) control bus. The output format
> +  is raw Bayer.
> +
> +properties:
> +  compatible:
> +    const: hynix,hi846
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Reference to the mclk clock.
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Reference to the GPIO connected to the RESETB pin. Active low.
> +    maxItems: 1
> +
> +  shutdown-gpios:
> +    description: Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
> +    maxItems: 1
> +
> +  vddio-supply:
> +    description: Definition of the regulator used for the VDDIO power supply.
> +
> +  vdda-supply:
> +    description: Definition of the regulator used for the VDDA power supply.
> +
> +  vddd-supply:
> +    description: Definition of the regulator used for the VDDD power supply.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +
> +        required:
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - assigned-clocks
> +  - assigned-clock-rates
> +  - vddio-supply
> +  - vdda-supply
> +  - vddd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hi846: camera@20 {
> +            compatible = "hynix,hi846";
> +            reg = <0x20>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_csi1>;
> +            clocks = <&clk 0>;
> +            assigned-clocks = <&clk 0>;
> +            assigned-clock-rates = <25000000>;
> +            vdda-supply = <&reg_camera_vdda>;
> +            vddd-supply = <&reg_camera_vddd>;
> +            vddio-supply = <&reg_camera_vddio>;
> +            reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
> +            shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                camera_out: endpoint {
> +                    remote-endpoint = <&csi1_ep1>;
> +                    link-frequencies = /bits/ 64
> +                        <80000000 200000000>;
> +                    data-lanes = <1 2>;

"make dt_binding_check":

    Documentation/devicetree/bindings/media/i2c/hynix,hi846.example.dt.yaml:
camera@20: port:endpoint: Unevaluated properties are not allowed
('link-frequencies', 'data-lanes' were unexpected)
    From schema: Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml

> +                };
> +            };
> +        };
> +    };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
