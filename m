Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897C56C4426
	for <lists+linux-media@lfdr.de>; Wed, 22 Mar 2023 08:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjCVHfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Mar 2023 03:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjCVHe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Mar 2023 03:34:58 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFD859E63
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 00:34:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id h8so69045533ede.8
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679470495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mX/OJUI6k++mjzdJLOuYIAeSKz4fTUVIG0L7LSrrWd0=;
        b=yiR9tBZHrQpX65hzCmxigJuf332W/pFOtWGCfnfzecoANt+GwdXqk6yCgn1Fhju+H2
         8kr6DbwMcg1yep4GVhecq/Ea22nPoSKdc3JGqpkJ4iBKOB6vVeeseIRyi2rk1tfcDPI1
         zh2v4wrj/zdQveqq6DC9VBkUjFX7AVB9Xm56TxHbeKqQRqagbB9oagb10jNTq4KADhMq
         tWlsJQfM7OAqFY2R/nuCU2Usdmz8wBuah999UCfXVvxfmGsCMwP1kPJjznySGTbnJ6yb
         rbUz6cJr50xA0t5slGhWq/arEbQf3acCdQkBFAoXfZ8qzc3qvDslE16bX9vWGcvrxRt/
         Zp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679470495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mX/OJUI6k++mjzdJLOuYIAeSKz4fTUVIG0L7LSrrWd0=;
        b=K/j3IEGWgxSkQm09ib1TcgWXJSDdWtGRcDNAj1YP2nABLy53EzgCmKVKDoup501RaP
         uUMIqDTyl40tX5uFeJ9/8RZbdTsT50UMram/KBOC1RbFyF+EAhLRXkgMmy0eg3k5p7ha
         a3vTH4AQr7+RQn4MARdRcyYJhbifoi/bKBJva07wDFrmjfBNcQY4GwC2YTaspRvdyhGF
         EBotTtjfkShxM5ebLnoH7y0EtddzPdk4jqF+pCiOz30x1dwVtoYL23MAqDtjWSDDO5Va
         PM+qci74rHFaA9eNCCRyojq2/d+2dT4fhUY+QQNVCRThluEyrYa0o8wiOuFXQ7oRtFiP
         KvoA==
X-Gm-Message-State: AO0yUKW63nM3NMKcGck2CJ/mjvrVWM6xpJViNHsq1BxRIui6rQiWGjeJ
        4MKAUoM8geOD3DTSPF8l8JDyJ7rRUdiG4uuak/Q=
X-Google-Smtp-Source: AK7set9a4NlbiVbRtUcqFNmy+foRhrBn/Jy4Pnq9f3CTRQ2lw47y54alAs0DSvCz6szoLqicgJV8Cg==
X-Received: by 2002:a17:906:3b19:b0:8b0:f58d:2da9 with SMTP id g25-20020a1709063b1900b008b0f58d2da9mr6548648ejf.64.1679470495066;
        Wed, 22 Mar 2023 00:34:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id ha8-20020a170906a88800b0093a6c591743sm1377582ejb.69.2023.03.22.00.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 00:34:54 -0700 (PDT)
Message-ID: <a55b88f5-3ddb-fc27-cb59-282861084e85@linaro.org>
Date:   Wed, 22 Mar 2023 08:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] media: dt-bindings: media: rkisp1: complete ov2685
 example
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230129-ov2685-improvements-v3-0-d9737d0707f6@z3ntu.xyz>
 <20230129-ov2685-improvements-v3-1-d9737d0707f6@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230129-ov2685-improvements-v3-1-d9737d0707f6@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/03/2023 19:03, Luca Weiss wrote:
> With the upcoming conversion of ov2685 to dt-schema let's complete the
> example so validation succeeds. At the same time fix the indentation of
> the port node in this example.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../devicetree/bindings/media/rockchip-isp1.yaml      | 19 +++++++++++++------


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

