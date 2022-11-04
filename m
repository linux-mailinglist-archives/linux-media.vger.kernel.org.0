Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A252E619758
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 14:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbiKDNRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 09:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbiKDNRS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 09:17:18 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECFE2EF2C
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 06:17:17 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id a27so2960589qtw.10
        for <linux-media@vger.kernel.org>; Fri, 04 Nov 2022 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5ySO5jr33f+wuxOAm3hrJnArCjyIYHNtdweCjfablk=;
        b=Pe7F1nAWJpb7eo1eOTOupi6VKP4LsNFhFa4/9tf2BDW70bV7bqco1pBz5Ec0cMS7j5
         hivzK5RtmKrr5JUEhzHQbWx70mkNGYusBv2ahZLdWvvLnvjnEYI0GCJVzqgeW1hO7q2R
         C13BNbVrBmrSDVxXwM/NZJ4g2kaN/0yaOfaJJHFJRZtGHpuAV70VND7YnGizKJnTQkuC
         Zqgxa5URYiwT+kj6Pl1PBSfQq6uXkZTOf5OngpE4AffMWdD2K9nI7EuDPStUDrt7B7j4
         w/VIjK6xtzW1XznVZKWLmPm6aXoktKMp1zMehy0Gv6hDolnQN6qgo0RbW5lbfa+Kz9IA
         YK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5ySO5jr33f+wuxOAm3hrJnArCjyIYHNtdweCjfablk=;
        b=qEvUhXSp6Rw0UBOVJC4Ieke1GP52atUSxelgI7qfFqwCmWRV6B4c0sG0juA4nAggz1
         YtPxf5FDxS7nijYWzUwHQQ6rAQFut/tGgzSSxvRUVIcpPBLan2UgesRazK8FHQcd8o7X
         WmdA+zwKDe8kzKlpcQx7G9k6RQjdoZEsx0pvbMdFtvRnrtQd0sjMgqSFRHaKPpYqTBjt
         Bm1Viqk5j4OV7rfbisVQGa+rDML2Y8xqaziLbFLtzxdyVfmOCr3VAIFqek/7lNurfgm7
         j9KeJC/aj8mrXmJ6bjCS1Cvt0OKweHnVNAVuT4Xxzzc3mhJxKZxJsxQj0fOMW8dC0Ewj
         RXWQ==
X-Gm-Message-State: ACrzQf3z9RTH5G3FkWt7cr8tIxRbTyzPHTnRRswgQAgLifbhzL3AX4AM
        /K2SM0sHKFp2+O3lXDeDcfmO+g==
X-Google-Smtp-Source: AMsMyM4VDfoDl8XWeHXhYy+00sQu7+eNrcTC+oZj6lFbRqe0pNS0DbwrcCxOuQP7iIXGvLpQAHpZ1w==
X-Received: by 2002:ac8:764b:0:b0:3a5:49b8:20e8 with SMTP id i11-20020ac8764b000000b003a549b820e8mr10563085qtr.504.1667567836673;
        Fri, 04 Nov 2022 06:17:16 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a288800b006fa4cac54a4sm2895236qkp.133.2022.11.04.06.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:17:16 -0700 (PDT)
Message-ID: <394fe30e-3077-d749-b6b1-29a1aba32109@linaro.org>
Date:   Fri, 4 Nov 2022 09:17:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Content-Language: en-US
To:     lee <lee@arducam.com>, linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org
References: <20221104152601.000035fd@arducam.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104152601.000035fd@arducam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/11/2022 03:26, lee wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Lee Jackson <lee@arducam.com>
> ---
>  .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   9 ++
>  2 files changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> new file mode 100644
> index 000000000000..9b6cda96f613
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx519.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Lee Jackson <lee@arducam.com>
> +
> +description: |-
> +  The Sony IMX519 is a 1/2.5-inch CMOS active pixel digital image sensor
> +  with an active array size of 4656H x 3496V. It is programmable through
> +  I2C interface. The I2C address is fixed to 0x1A as per sensor data sheet.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx519
> +
> +  reg:
> +    description: I2C device address

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

