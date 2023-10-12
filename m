Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE227C670F
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 09:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347176AbjJLHrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 03:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347078AbjJLHrh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 03:47:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29E3B7
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 00:47:35 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53db3811d8fso1289425a12.1
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 00:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697096854; x=1697701654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XzW2GUZBby073H1yfG7LD0k6AHxcDQwaeAJkEqdCdo=;
        b=SqQbhMNJWdUNx1HYQLy7uUaBl01j0Ml0T9Mx9VPu6U3Fowf3PoWaCszqltoYL39UTl
         cZzprabFq1l0NAbTSi3Qkn6ATLKOscafHjS11ZkLI5M8Lx6IXQctsAYRovZcLY3KoBjg
         QlCc/CD/V6N1+kr3HJ6M+MPiLQL29RDetuTlL6ZH91FZaE6K89MNQwrx0Q5aUSO52WoU
         +zwivDvyM16if2D8TbrA672eh6kSbV2KiZkDehg4wtB/J41NuDgJq+CHH4GdJCw83Vx3
         XXXDGWPxwocklYKy4JuDZDkOU4sGoy9v/4DrUeCxTMJ6MckUZlzO7GzgE5ThLSQ/7CUj
         Fh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697096854; x=1697701654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XzW2GUZBby073H1yfG7LD0k6AHxcDQwaeAJkEqdCdo=;
        b=IAco/j44Qo5+rxxwq7YGhNjOA2wwmd6NxCQ8xkzD8yPEcSridKkh2wtsQ+2M/8CDpk
         BYrS+M7t7Z5myprXYn4FeQklsV+TXeo2JwybfiYjlimbnUx0/b1trPwzIXncgFX9PI+6
         wuvqh4XNmcR6xEMW7azVPyWCp46IzxvhlPN4AiJNeomBm7bBIRTPMgeupD+aOjJjPmgq
         Qpx3X1ygQl/ZrLzjEKK+aOVnmcFq1dBU0vQZhOWCpGMRQuOtlhYYzSYbJaTq1drwei+L
         HYimtEjsuVrKLaEbp6Uj+Nt92dxrOyyGV8ouVxnNXZslf8ZhPXW18MsPXeF59Yp5DoLI
         4hYA==
X-Gm-Message-State: AOJu0YwRIfH0XuwIN6mRgSqSakVHgdV7HpYdGyfGQ2lVXHP5CMzj2oFe
        nQ8HT8V//5AnV3do2dVcUs+IqA==
X-Google-Smtp-Source: AGHT+IE1iKoWBWHHQ/TpCm3YxrfikbjkGB5KrfENrYNLXb7dB2SI7kcWuIYgisE+nkHSjY6KJtFPXA==
X-Received: by 2002:a05:6402:12d8:b0:523:b37e:b83b with SMTP id k24-20020a05640212d800b00523b37eb83bmr18413371edx.13.1697096854332;
        Thu, 12 Oct 2023 00:47:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id be25-20020a0564021a3900b005362c9905b2sm9822183edb.35.2023.10.12.00.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 00:47:33 -0700 (PDT)
Message-ID: <b214e763-2175-4de1-af54-43961ff94afb@linaro.org>
Date:   Thu, 12 Oct 2023 09:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for THine THP7312
 ISP
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
 <20231012012016.11535-2-laurent.pinchart@ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231012012016.11535-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2023 03:20, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> The THP7312 is an external ISP from THine. Add DT bindings for it.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/i2c/thine,thp7312.yaml     | 225 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> new file mode 100644
> index 000000000000..053b28fb0a89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> @@ -0,0 +1,225 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 Ideas on Board
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/thine,thp7312.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: THine THP7312
> +
> +maintainers:
> +  - Paul Elder <paul.elder@@ideasonboard.com>
> +
> +description:
> +  The THP7312 is a standalone ISP controlled over i2c, and is capable of
> +  various image processing and correction functions, including 3A control. It
> +  can be connected to CMOS image sensors from various vendors, supporting both
> +  MIPI CSI-2 and parallel interfaces. It can also output on either MIPI CSI-2
> +  or parallel. The hardware is capable of transmitting and receiving MIPI
> +  interlaved data strams with data types or multiple virtual channel
> +  identifiers.
> +
> +allOf:
> +  - $ref: ../video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: thine,thp7312
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C device address

Nothing improved here.

> +
> +  clocks:
> +    maxItems: 1
> +    description: CLKI clock input
> +
> +  thine,boot-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Boot mode of the THP7312. 0 is for standard streaming mode, for the
> +      THP7312 to be used as an ISP. 1 is for firmware flashing mode.

Why, for a given board, would you always boot device in one specific
mode but not the other? This does not look like property of DT.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Reference to the GPIO connected to the RESET_N pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  vddcore-supply:
> +    description:
> +      1.2V supply for core, PLL, MIPI rx and MIPI tx.
> +
> +  vhtermrx-supply:
> +    description:
> +      Supply for input (RX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
> +
> +  vddtx-supply:
> +    description:
> +      Supply for output (TX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
> +
> +  vddhost-supply:
> +    description:
> +      Supply for host interface. 1.8V, 2.8V, or 3.3V.
> +
> +  vddcmos-supply:
> +    description:
> +      Supply for sensor interface. 1.8V, 2.8V, or 3.3V.
> +
> +  vddgpio_0-supply:

And more of ignored feedback. I stop now.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

