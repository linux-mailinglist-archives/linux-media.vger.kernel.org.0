Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01724669665
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 13:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbjAMMHg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 07:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240935AbjAMMGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 07:06:37 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBB85B172
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 03:56:20 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id i9so30896923edj.4
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 03:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDwPPUmS6ku5XiF9sg2o4h2Tsw4fKvsiGo/tgjTFluw=;
        b=TIsYDzWXLQTiUTuDnRMj2qd1TPWxYoyFw8r6gF7MSErFF37EnG0LimKaWMRit5Wb43
         /4MLOOZD22T7qzQoo5lw6ga3eyLToMp5o2tu94+nFvgVFUGw1NuzmNt1Xl9tPMLVXTF8
         g4c6gT8ZlOGslkzAfol/zcMSfJlLBbeXo+7WdPglDIgIpOwOGRkY0M1M2j2vEMiyuT7N
         QhNLby9FY4WUOYUCzzYgWqENQWjh73UQYFK4PBF38NKj3Jmvnjqlx90upIIPFaYm9e5b
         XhPsROyYLSU+HzjB5mXO50vOovA3Rup2Hc0w+RR9Q7v3nzXI4DFf/5H4RVielEzPLwHO
         SWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDwPPUmS6ku5XiF9sg2o4h2Tsw4fKvsiGo/tgjTFluw=;
        b=IFLisA3FriuJW6ObY6llOf0k3t/kXN5e6lGd0r1Ht6Vni9l/tFqsPQBdBceFhMmiFd
         yqonJTX+c397aMj9l2NZsS6bNwQx1dxG6J47DG7daujipnHeXT+SuLcRbukdED+SJM7A
         6UvN+MEeI9ZUltfXGipy4FsriuYhBk6UiNxPttYVzRFxFvqPv6gLNw4DwVOmGRBe8VQA
         v5Ds7IMT3s3DGgFGkT4s85sL4UUZKVVFPsVn6hS1nglaYokPLUWGO1GloL7wG9K4kcmX
         wY61k73otlgOiFP0LLFr8Fvao1jnuPQedFQRF0gXCEVhv5ygwuLUNyZ2mMumj2O0Trfa
         IeIw==
X-Gm-Message-State: AFqh2kqLUrXhvo5nU7xcKiAOt8l2leK3APo927T19MsMeFvU0v0lUxCk
        vS0oUNwqYPTnMane35+uZHPUPA==
X-Google-Smtp-Source: AMrXdXthRZsZQpg+QrTZC4qRM9j4hh46xIbK3HK6z7cQ+RGbpNCGXHwcV7g8HGkbK5fu5hksyeus6Q==
X-Received: by 2002:aa7:c418:0:b0:492:609a:f148 with SMTP id j24-20020aa7c418000000b00492609af148mr22127754edq.3.1673610974564;
        Fri, 13 Jan 2023 03:56:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id eo9-20020a056402530900b00463bc1ddc76sm392342edb.28.2023.01.13.03.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:56:14 -0800 (PST)
Message-ID: <bba093d0-e648-61b3-f4d7-b48d43e35920@linaro.org>
Date:   Fri, 13 Jan 2023 12:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/16] dt-bindings: media: fsl-pxp: convert to yaml
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
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

On 13/01/2023 10:54, Michael Tretter wrote:
> Convert the bindings of the Freescale Pixel Pipeline to YAML.
> 
> The conversion drops the previously listed compatibles for several SoCs.
> It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> on the existing SoCs and would allow to reuse the already defined
> compatibles. The missing compatibles should be brought back when the
> support for the PXP on these SoCs is added.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> 
> - add fsl,imx6sll-pxp and fsl,imx6sx-pxp compatibles
> - restrict number of interrupts per variant
> - cleanup syntax
> ---
>  .../devicetree/bindings/media/fsl,imx6ull-pxp.yaml | 82 ++++++++++++++++++++++
>  .../devicetree/bindings/media/fsl-pxp.txt          | 26 -------
>  2 files changed, 82 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> new file mode 100644
> index 000000000000..c1232689a261
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Pixel Pipeline
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Michael Tretter <m.tretter@pengutronix.de>
> +
> +description:
> +  The Pixel Pipeline (PXP) is a memory-to-memory graphics processing engine
> +  that supports scaling, colorspace conversion, alpha blending, rotation, and
> +  pixel conversion via lookup table. Different versions are present on various
> +  i.MX SoCs from i.MX23 to i.MX7.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx6ul-pxp
> +      - const: fsl,imx6ull-pxp
> +      - const: fsl,imx7d-pxp

These three are an enum.

> +      - items:
> +          - enum:
> +              - fsl,imx6sll-pxp
> +              - fsl,imx6sx-pxp
> +          - const: fsl,imx6ull-pxp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: axi
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx6sx-pxp
> +    then:
> +      properties:
> +        interrupts:
> +          numItems: 1

That's not correct syntax... I am surprised that it works. Did you test
the bindings?


Best regards,
Krzysztof

