Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 500BA574762
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 10:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbiGNImO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 04:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236882AbiGNImF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 04:42:05 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613A91D0E3
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:42:00 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id bn33so1306954ljb.13
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2esk9TdP6kdtHrSrnymcj6el8b1LRAbpAWkkLqJtl+Q=;
        b=QDY5mi3VIPpcKyFZhKZjk/KSiRRe16p/xCNRaSTyE6aOIVnY7Eoa1LCzB4pvzePsu4
         OuXzzOzB0Hp4/7IiNtsGFu5/VGOz0UoDfBPUY0FMOOUDHGWHF6Lt/FfuK8/EX9HEUIPZ
         LpOjPBk17d9pRExewm/BS3YZpvlUlnfs9ocNWNzzFIb4PWmhBX9DTQJus1Zw3Mq67TBx
         KqB7EC27vMSKGI5yU6Z5Y0zrYSBPfJfOlGTDbPMNW01ZuKk/He6r+AROyg6XFJ+FxUcL
         4l1DpDfzGopAyCdRU4HYaKK50UgoV+NE8MhM/JEx9WqzHe1WTmPSkUkeGeb7VMF8tmeI
         f75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2esk9TdP6kdtHrSrnymcj6el8b1LRAbpAWkkLqJtl+Q=;
        b=7zCsjnMD3OSRIElDU/gN8AXA7WfPl4a44x0PAP1EHEirqGtxNU8GrGicVoyUwjAyED
         fXzP24w/96kUpaF2s+A+9Koqw0V4RKqfMnZMLOWGDl4+lMPAOaXamI6L7w9Z/3Ys10O4
         pG+2dEKiuAV5YB+mFij6zJk3yL6XMotOEIGY3ACenAGEbvuaKK0L1OBbKZ6t2Z/ynGF/
         qMz2zURk743B/HhH32YajNTkLgaCglfUYIeqGmdyh9kNAWEecfXdER7TOAw3MZd42Ro/
         +hLu+VjihP07HuKM9YKgEum6OkVTxq6VoMKPpIIUGAlnWN0FkmIcYFHdMW1RY7OgDQcL
         RHOQ==
X-Gm-Message-State: AJIora/RqTX2P72eujX8puDX5n4zYT4H6Ze/o7G5xPpsGoYE6nJv1j6L
        ZNrub74UhDh/UVaQL/QGNS+bjQ==
X-Google-Smtp-Source: AGRyM1v/BYdsHg1HmjFFrY68+2Ov3PsFKUBHW91Dw9/ABXYMjZxuScitqUVCt4TauEg+rSdSSQgLeg==
X-Received: by 2002:a2e:8507:0:b0:25d:68a9:c417 with SMTP id j7-20020a2e8507000000b0025d68a9c417mr4018996lji.459.1657788118698;
        Thu, 14 Jul 2022 01:41:58 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id q8-20020a056512210800b00489e812f05asm244158lfr.21.2022.07.14.01.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 01:41:58 -0700 (PDT)
Message-ID: <80453ac7-3593-c1c1-a35c-6e660850de44@linaro.org>
Date:   Thu, 14 Jul 2022 10:41:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Content-Language: en-US
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
References: <cover.1657786765.git.vkh@melexis.com>
 <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2022 10:34, Volodymyr Kharuk wrote:
> Add device tree binding of the mlx7502x and update MAINTAINERS
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>

Wrong subject prefix. Remove trailing "binding".

> ---
>  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> new file mode 100644
> index 000000000000..4ac91f7a26b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Melexis ToF 7502x MIPI CSI-2 Sensor
> +
> +maintainers:
> +  - Volodymyr Kharuk <vkh@melexis.com>
> +
> +description: |-
> +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
> +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
> +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
> +  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
> +
> +properties:
> +  compatible:
> +    items:

No items. You have just one item.

> +      - enum:
> +          - melexis,mlx7502x
> +          - melexis,mlx75026
> +          - melexis,mlx75027
> +
> +  reg:
> +    maxItems: 1
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

These are not needed.

> +
> +  clocks:
> +    description: Clock frequency 8MHz
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply(2.7V).

s/Definition of the regulator used as //
(redundant)

> +
> +  vddif-supply:
> +    description:
> +      Definition of the regulator used as interface power supply(1.8V).

s/Definition of the regulator used as //

> +
> +  vddd-supply:
> +    description:
> +      Definition of the regulator used as digital power supply(1.2V).

s/Definition of the regulator used as //

> +
> +  vdmix-supply:
> +    description:
> +      Definition of the regulator used as mixed driver power supply(1.2V).

s/Definition of the regulator used as //

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Sensor GPIO Control (active low)
> +
> +  melexis,trig-gpios:
> +    maxItems: 1
> +    description:
> +      Hardware Trigger GPIO Control (active low)
> +      When the hardware trigger mode is enabled, this GPIO is used to generate
> +      a low level impulse for about 100us. The impulse triggers a new
> +      measurement cycle.
> +
> +  melexis,leden-gpios:
> +    maxItems: 1
> +    description:
> +      Led driver enable GPIO Control (active high)
> +      This GPIO notifies the illumination driver when it is safe to use led
> +      signals from the sensor.
> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
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
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +          clock-noncontinuous: true
> +          link-frequencies: true

You do not need these two, they come from video-interfaces.yaml

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +



Best regards,
Krzysztof
