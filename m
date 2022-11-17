Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFE162DC62
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 14:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239267AbiKQNNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 08:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239716AbiKQNNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 08:13:05 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201DA686AE
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 05:13:04 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b3so2725369lfv.2
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 05:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvNNhN9Y8CERDACcTQTBMLAUA43DbdubBtZBLlWg5yg=;
        b=NSII2LFzYkrCXROZWs8qd5ufIxgYuk7sjyYdelVazxg6QrxRFntmhvWP7W2MC9V892
         K4IZwBSdtcSdikc4XJlyp7OKyaXokTeH/VvNzTrMLVXTKkbrT8OOSEHRUK8ZyW2L5aVc
         3GMPYtknPagI0xAweCAaDVvo0YdYgc5XVtJuYCnCTtUIUxTieewBxHYDENCXpWPial6z
         q3/40Ifwi3EoZyMpZxsshg2KHoUrbkSPbzKtl1W/+xaB6fa21vItuP71PM4WvSGFWADW
         1u1KK7+qlHUaJTDrK0poRBMo8tzKpPxp943JaCCUClEJVWxPByl0tzBMaTfFmwIc72ai
         qefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvNNhN9Y8CERDACcTQTBMLAUA43DbdubBtZBLlWg5yg=;
        b=GQqOZrBgbqiOugg6mT9JFq4p0u+QWjGt74LhMsFfRckqxTEVSvw4qRKo+S+IYO9lU+
         Vy6Rc6ZYD4GEcm4eHhMZbeIc4PmzQgo7Vwae0oR5e7enhbqiBR09QO+KuFkI3vZWXDR6
         aXIbaaXjra5PT1vKF+TycJnbERNPT4iv0AGOA0kd65L4LQbw3Yyqp+mweSEcyUDCHvQ1
         lC9JVGK+9ytro0yU21YnPRQfDtyv7db8/tt+5zQtkzW1c6Z5pvgAF1x9rInTWp7zG0Mc
         YkUU/bgdI5Vwbtt0rWxJziXH70rANup7ehkKkzZ6fsMn561zvsIhleSi74hvAWp4X+KG
         F2mw==
X-Gm-Message-State: ANoB5pmKZQF2gYbj3FgAF341VnvI+6d9rhyLWdzcEfYMmDm/Si61ezcG
        PKHeN+/XAm/q/5UZQwVDnr3/9w==
X-Google-Smtp-Source: AA0mqf6dXCtAnwcI18KHJ+hSEK62P7P1YpzMiwZxE1aZLBVxTFepM9qnMh8+tlCk0GT4+V3CThxoww==
X-Received: by 2002:a05:6512:a93:b0:4a2:6337:872d with SMTP id m19-20020a0565120a9300b004a26337872dmr876100lfu.35.1668690782504;
        Thu, 17 Nov 2022 05:13:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n4-20020a195504000000b00492ce573726sm147123lfe.47.2022.11.17.05.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:13:01 -0800 (PST)
Message-ID: <b0125ad2-426c-d908-0839-2021bc59d59f@linaro.org>
Date:   Thu, 17 Nov 2022 14:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] media: dt-bindings: allwinner: video-engine: Fix
 number of IOMMU channels
Content-Language: en-US
To:     Jernej Skrabec <jernej.skrabec@gmail.com>, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wens@csie.org, samuel@sholland.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20221117060704.367945-1-jernej.skrabec@gmail.com>
 <20221117060704.367945-2-jernej.skrabec@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117060704.367945-2-jernej.skrabec@gmail.com>
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

On 17/11/2022 07:07, Jernej Skrabec wrote:
> Cedrus (video engine) on Allwinner H6 actually uses two IOMMU channel,
> not just one. However, Cedrus on SoCs like D1 only uses one channel.
> 
> Allow up to 2 IOMMU channels.
> 
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> index 541325f900a1..6446004d59d9 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> @@ -55,7 +55,8 @@ properties:
>      description: Phandle to the device SRAM
>  
>    iommus:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

You have several compatibles in the file, so usually this is further
constrained per each variant in allOf:if:then:.

Best regards,
Krzysztof

