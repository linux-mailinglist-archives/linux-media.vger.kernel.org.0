Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EDD6423AE
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 08:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbiLEHjO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 02:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbiLEHjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 02:39:12 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D39710072
        for <linux-media@vger.kernel.org>; Sun,  4 Dec 2022 23:39:11 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j4so17248681lfk.0
        for <linux-media@vger.kernel.org>; Sun, 04 Dec 2022 23:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFVu/s6wou6RS8pkEGuw13TeI6YH2MA2/9IDrBsPwO8=;
        b=vDAQXpeWoe5nKYkiyHY4n+nsZ1IKL23vVbnLVrBJOOwz5oS+v4VpID7nXOCFa/bgcd
         2Y5EVPOFLites6n4pWg9uZWV3AX2+yTqcaJQ3ySbqa3NF4ext1IjCXGPdFpAQab0apJk
         kNUDWR10k3aCxJXcAyspvz/oyx7NZkDWrenkKsZVZpjbRCOdWfrXIA4ERCTLUClckoNl
         Vb/KLmDYGETtGVLnLofGBUJfkz+7nI6niNICf8kzM33/WhFO//69hjS8Mqj+1MWxj43+
         0mxUyuC/H2U0oNB+I/HsFg8VwRCMqX8NL9F03Xk9OZr/Yq3b82s5YN1GWWC0YsYvwYjQ
         h/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFVu/s6wou6RS8pkEGuw13TeI6YH2MA2/9IDrBsPwO8=;
        b=ZGkF6YEq6J/Cu/fZ3TVl+nREfhnJjiihe0/G4imZZYPqHFTEwIbZxNG5zE4NC/ujWF
         INllpTEq2/22tNjoCvwgg+B4FSLkjcP50dCMWaLPLQ+IiZ7HUUaOXzCJJyUR2A9queOo
         bP1Xd7UnhlJxRq6LCSAyBLx4T0obODvvRvQeVhqwAkJ2BdGhS4ZGexSYXkzba+4JaiWl
         Puw2Qp33y3nb9n5qBD+pkzY7NWeeL+HShgMxD5qq5H+ldNDn55PDUZcKWk79bvy3gc7v
         rP34G+qnngJ4JMbOpPaCv7/mbS9e584iqD2SNpc8DkqR6uzBx8Dq/pvANVTPq5EjgS9/
         YDiA==
X-Gm-Message-State: ANoB5pnx/DfwJ2IFep7rGH9DFSJcSyrxA0BMm0PF/TGrZJe1uU+qg4WD
        n5fSyKzHhPLZMo/1Q+RKvj09+g==
X-Google-Smtp-Source: AA0mqf4ghBWrfThgMD3Ik8hT/EQtNG7S5tr1usIg1bG5NjEEZyxgMgqNhSfxb9Ns7bIVGIYNLgbbNg==
X-Received: by 2002:a05:6512:1687:b0:4b5:4637:3715 with SMTP id bu7-20020a056512168700b004b546373715mr5211868lfb.308.1670225949583;
        Sun, 04 Dec 2022 23:39:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm2024587lfr.4.2022.12.04.23.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 23:39:09 -0800 (PST)
Message-ID: <4f668c2e-3fc5-efa7-eeda-ba40bf0ac23f@linaro.org>
Date:   Mon, 5 Dec 2022 08:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Content-Language: en-US
To:     "lee.jackson" <lee.jackson@arducam.com>,
        linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org
References: <638d5999.170a0220.52a4e.4965SMTPIN_ADDED_BROKEN@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <638d5999.170a0220.52a4e.4965SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/12/2022 03:38, lee.jackson wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: lee.jackson <lee.jackson@arducam.com >

That's still not correct entry. Except trailing space, are you sure that
in your documents (national ID, passport) the Latin transliteration of
your name is with a dot between names? Since it is a third try, it's
getting more and more confusing.

> ---
>  .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> new file mode 100644
> index 000000000000..d7ca16cfbacc
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
> +  - lee.jackson <lee.jackson@arducam.com>

Same question.

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
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  vdig-supply:
> +    description:
> +      Digital I/O voltage supply, 1.05 volts
> +
> +  vana-supply:
> +    description:
> +      Analog voltage supply, 2.8 volts
> +
> +  vddl-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:

maxItems: 1

> +    description: |-

No need for |-

> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies and INCK are applied.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
Best regards,
Krzysztof

