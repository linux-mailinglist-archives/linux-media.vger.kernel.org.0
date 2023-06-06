Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2D8723CAB
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 11:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbjFFJMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 05:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbjFFJMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 05:12:31 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DCDE4C
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 02:12:23 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977d02931d1so374799466b.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686042742; x=1688634742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4AmdVwg4gjTsAxfk42+ya/xr1mTSRxxbVKQ3XrFUpQ=;
        b=PnGKM47mpj3Ddc0oSOEllxLh+oOxYtyvpANv4U3kMcbOr/jE0l0k2q4H0SonOqThMB
         1bWpcUnZ2cJQns1go/rFdSkU6JyA5wm0uZzXtAS65t/BrkvGuymnrxqB9y7RbQwwzrwB
         RtGRMJSHvh4A7hK5EjmNlOApop0WmF30BooHT/TlzYGVLJqPYAriWOIiw4OVNtFRGYGf
         u8qbcP8YNWTx5oSLaswmdNiyc8inJh6ERiE7Oi03fWtjan0YPRaPagyBzA0iyBuTdnDc
         evOfD8rjLngWo+AlXOWO/2pRrjiBsgfO/IIWdJfQJ68k5qVKOpXGdaeiuhn/7VVlwWZC
         L2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042742; x=1688634742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4AmdVwg4gjTsAxfk42+ya/xr1mTSRxxbVKQ3XrFUpQ=;
        b=f2TuK5+FM2lPdaT0Ijg2TuKjWEHOJI9N4eoB5EIZ0fH0Ptqv802rdaT5TnQBQAxrSU
         GgPsTIPmTIF4/jzWrLKu14RN8MX36AQZgAQFNr8SsDy0245MOJ1nGjDgmtaXWFpGFLuW
         16bbwP2d9B+gX1L9xTMGXM8dAz7YR2DxYv4U7vJZVi4DbqGwKQ3A8KCEQ2Q9F8jFIUMj
         CKQV2dC5yU2+Z27eb1Z9VKihZldSoyXP3zN+xDwNeuRXyTP0iJ7G6k8GMqiPeMFzqUFK
         20BbEyEXwx3mW8dDRbFZE1Djz/AiyxsYHOcE9VCjoRfZ5S1IegHlDbcN/Ygze1jJ4+H3
         75ug==
X-Gm-Message-State: AC+VfDzxeP4MV0qgqzt+nQ+SDcxDZ9TnFtTI5ez4RZD/r4fw56c4gIvo
        3qMu8g5T7OuKZykvYdgeZ7Xzsg==
X-Google-Smtp-Source: ACHHUZ4ICG/LiMH48iJ6ITReWMZhhxEFrAzzKgQao53xyViRDfBvZqW8oHYQ9GVk/zBWdm4mgBP5YA==
X-Received: by 2002:a17:907:94d4:b0:971:2eaf:556 with SMTP id dn20-20020a17090794d400b009712eaf0556mr1942718ejc.18.1686042741710;
        Tue, 06 Jun 2023 02:12:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d12-20020a1709063ecc00b0096f03770be2sm5289135ejj.52.2023.06.06.02.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:12:21 -0700 (PDT)
Message-ID: <b9ad3b42-8d56-a9ce-bdde-df4ac65a1b49@linaro.org>
Date:   Tue, 6 Jun 2023 11:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/6] media: dt-bindings: mediatek,vcodec: Allow single
 clock for mt8183
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-2-nfraprado@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605162030.274395-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/06/2023 18:20, Nícolas F. R. A. Prado wrote:
> MT8173 and MT8183 have different clocks, and consequently clock-names.
> Relax the number of clocks and set clock-names based on compatible.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  .../media/mediatek,vcodec-decoder.yaml        | 29 +++++++++++++------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> index fad59b486d5d..57d5ca776df0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -27,18 +27,12 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 1
>      maxItems: 8
>  
>    clock-names:
> -    items:
> -      - const: vcodecpll
> -      - const: univpll_d2
> -      - const: clk_cci400_sel
> -      - const: vdec_sel
> -      - const: vdecpll
> -      - const: vencpll
> -      - const: venc_lt_sel
> -      - const: vdec_bus_clk_src
> +    minItems: 1
> +    maxItems: 8
>  
>    assigned-clocks: true
>  
> @@ -88,6 +82,11 @@ allOf:
>        required:
>          - mediatek,scp
>  
> +      properties:
> +        clock-names:
> +          items:
> +            - const: vdec

You should constrain also clocks as they must be in sync with names.

> +
>    - if:
>        properties:
>          compatible:
> @@ -99,6 +98,18 @@ allOf:
>        required:
>          - mediatek,vpu
>  
> +      properties:
> +        clock-names:
> +          items:
> +            - const: vcodecpll
> +            - const: univpll_d2
> +            - const: clk_cci400_sel
> +            - const: vdec_sel
> +            - const: vdecpll
> +            - const: vencpll
> +            - const: venc_lt_sel
> +            - const: vdec_bus_clk_src

Ditto.


Best regards,
Krzysztof

