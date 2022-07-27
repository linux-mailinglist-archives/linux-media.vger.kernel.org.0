Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9A7C5820AC
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 09:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiG0HGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 03:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiG0HGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 03:06:12 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D3C1B78A
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 00:06:11 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w15so17776927lft.11
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 00:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=4sf9T+KkmX+oKbYf44r0dMaCsbRx2OJI0DY04Ho/KW0=;
        b=XhyVVxoBGYlOH7LOualKl0oesVqPAiTF79SgVH4tPivvYz8h+2BXVbzizOooH6BLQl
         FWiqJXmDXCLYdH2E2kT76qMS3UoW9tK7OVQRxRbxOaNpU0lCXf3alqGXxbG5j1TyXD0c
         FAUBvF5ECKgbAPm0koN6pqUOiF8ot7wdOgMH6OYrJgVTIySsG4ufoSWVNQGcI9ZFXJYs
         EjnBc+a1tAK7O3OClre3Fibp4IehsiAyrRcq1uVZ5ADrd21dvTXrLwBeHJcXnBDialZI
         0VS4qsGlkY9mliBR25kyEmFLLlek7aoRrW2UT+Eb85v/uQ1WFbplMYgAhPJHBMJ+0iHG
         RuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4sf9T+KkmX+oKbYf44r0dMaCsbRx2OJI0DY04Ho/KW0=;
        b=jrAK3CAgWF7/8nOaUDcdpYPTnA+9sCs6uZtUNCNqSGwt/550A6L8PoorI+2iYwHFik
         BrxssoW90dQV6XESvb5hVWMFox1vLbcAjBu8jkFNjMhmmcQ22iHBjrc2wYMmAAexPUZh
         YqJAgiGsFvAnBNA2BB0Sr/5gaH5zSLPRpGjcNeu6TqFljxfm0MUN+P6UaTbDnTWGUPO+
         EZei6KRRn9qaihsM83n4NNN7Pj6GEYhWl3rWPaGK7YiGugbKMvp5oQ4lUx8eFWLkct6T
         Dd+d1AniNTKgSz86RxFcDXX6C3+bdCGmV7UsexXQA8uDfTGscSGYR/g+JGU4BUfrUQBv
         ykTQ==
X-Gm-Message-State: AJIora900zTsL/nY94p00GOCOWntI1Dut/Vo4J4a2NOknkPc83+t+Cna
        tiiDkO2m/x8srmcZms33DUQX6Q==
X-Google-Smtp-Source: AGRyM1smLYBVDCToR7HgdYuRNy05cPwfZUcF2DERzTh5zJoAqiJt5xc2kcI5NHi2mD6/B2qbs17SLw==
X-Received: by 2002:ac2:54a1:0:b0:48a:6908:1d54 with SMTP id w1-20020ac254a1000000b0048a69081d54mr7981941lfk.295.1658905569296;
        Wed, 27 Jul 2022 00:06:09 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id f2-20020a056512228200b0047f7b641951sm774404lfu.272.2022.07.27.00.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:06:08 -0700 (PDT)
Message-ID: <20725cba-220c-5664-5766-14d89d24b93c@linaro.org>
Date:   Wed, 27 Jul 2022 09:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Content-Language: en-US
To:     Zhang Ning <zhangn1985@qq.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, narmstrong@baylibre.com,
        martin.blumenstingl@googlemail.com, sean@mess.org,
        christianshewitt@gmail.com, linux-amlogic@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/07/2022 16:36, Zhang Ning wrote:
> Add manufactor bindings for Tmall
> Add the board bindings for Magicbox M16S Tv Box
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>

All your subjects are still partially wrong. I pointed this out in v5
and you still send v6 and v7 without proper patch prefix.

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml     | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 61a6cabb375b..a67af2adf6a5 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -125,6 +125,7 @@ properties:
>                - libretech,aml-s912-pc
>                - minix,neo-u9h
>                - nexbox,a1
> +              - tmall,magicbox-m16s

Previously the vendor was magicbox... now it is tmall. But you write
also Alibaba. It's a bit confusing.

Best regards,
Krzysztof
