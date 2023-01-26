Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2480267CA4C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 12:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbjAZLwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 06:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236785AbjAZLwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 06:52:24 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D636227F
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 03:52:14 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so3080457wml.3
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 03:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7YMFq9j9BeWYM2JzjuLj6ws/4zpXtQWC1DMhJAYvplA=;
        b=QR6sDcpjyI+GOUWsFwkYXrtkHf9FTc0Pin2RG+eITKvc6f9ASuY6A5CulY0RRsqrIA
         LbwtbR9i4I1m1Qx52R/mmAQ9+6bXAmFHkpVa+kp1QraMql6sZisAXw/cD/a+fNypSx9t
         9h+W1pcI6Hgtl0lJnA1gUeod1rXRhU8zCcK/S4ivOnkMD7QbsyeXR2fv8PCsT+dOINqD
         RihuOekp2Ac9N6BglrCgaEqSsGEN6u5kkqkFDv6Yt4nX8ztfj1AYq7uXzRYFb2YyJWBR
         +QFUALUA9HlikuU+a2eSpVFLY+qbtZEy0RpnJ/xz/boB+aDDsqv5ImjcNDO6el9P4Nmr
         7DgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7YMFq9j9BeWYM2JzjuLj6ws/4zpXtQWC1DMhJAYvplA=;
        b=AH5p1O3RcZHjGXRvXN0zew6pcQY7evSYrB68J/2NpbRvsjJZ7lcg+4NPcCj61rwE/3
         4AdofIJifEtEuCe3+uRPOy0tUKKZhSQ73VE+0dhk946sEVAfb1QP2GNo3wndzsXmnW6g
         3otdkof+/zZs3LLF7YSO7yYYtjG8IBTHJIFTmOdN+L9V39GoLL6yJiM6pNZCtM8375Aa
         pQVgpZiLXr5r/Lowuinx+kWpYjQZ3VIMctAp/I2fDIG1+Q6i4w9X3dy5jrRm1nxN+xTW
         gbuDK1hvzu0aflvOJhH5xA8yN6w66ScrZ9hk9uBu82FF6oCBywf6/tAWDLYOhcPnFQ06
         nZqA==
X-Gm-Message-State: AFqh2kp6iBtm4mNQMxGITxxiXsJo/imDyaMassFZchbyxhU6ZCPvNj6j
        XwKbE7sogYA7FtPC5KlQ3mSHqw==
X-Google-Smtp-Source: AMrXdXv8mzvrfh3i6fz8UiEkQD9A+/eEdz0yRpTqv56+4CDFFJbRb9lSpj0EXSz7Uxt4XbfrsIbS9A==
X-Received: by 2002:a7b:cbcb:0:b0:3db:2ad:e330 with SMTP id n11-20020a7bcbcb000000b003db02ade330mr34757667wmi.5.1674733933458;
        Thu, 26 Jan 2023 03:52:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q4-20020adff944000000b002bfae3f6802sm1128197wrr.58.2023.01.26.03.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 03:52:13 -0800 (PST)
Message-ID: <d8c14910-a9cf-9a8d-156b-38d6af501d7e@linaro.org>
Date:   Thu, 26 Jan 2023 12:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add i.MX8 ISI DT bindings
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <20230126003320.10047-1-laurent.pinchart@ideasonboard.com>
 <20230126003320.10047-2-laurent.pinchart@ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126003320.10047-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/01/2023 01:33, Laurent Pinchart wrote:
> The Image Sensing Interface (ISI) combines image processing pipelines
> with DMA engines to process and capture frames originating from a
> variety of sources. The inputs to the ISI go through Pixel Link
> interfaces, and their number and nature is SoC-dependent. They cover
> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Describe the interrupts property
> - Set global minItems and maxItems for interrupts

Thank you for your patch. There is something to discuss/improve.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Ports represent the Pixel Link inputs to the ISI. Their number and
> +      assignment are model-dependent. Each port shall have a single endpoint.
> +
> +    patternProperties:
> +      "^port@[0-9]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false

You should not need this. The ports from graph.yaml already have it and
you do not bring here any additional information (like description or
how many ports are valid). I propose to just drop it or extend with some
of information.

> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - fsl,blk-ctrl
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mn-isi
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        ports:
> +          properties:
> +            port@0:
> +              description: MIPI CSI-2 RX
> +          required:
> +            - port@0


Best regards,
Krzysztof

