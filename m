Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F446A5687
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 11:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjB1KXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 05:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjB1KXk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 05:23:40 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904861F5C3
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 02:23:39 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id g3so263387wri.6
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 02:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677579818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TyGBvzl5hbWKjdgHBG4sNlcppPeDqqtNrSWML8B16Q=;
        b=XCo5PJ71NbfmDFBsx0JLDSBKBp7e48VtxEpGakCuA5x4+M/TY4p0eLuwBID8zk1uXW
         Jn5yMvFPGV9IulBEt2/RtOZnu1U7eTER4nAdLGhAPyql/ZvNO1EtpufccA1z0unVpIN1
         F4OPlvSpD9KwDzYuPZmfKb4QeRHygxOqzSqBBEdK+bfU1HTv7h5Kj/teYszLmVjTL8oH
         xejdo5/viVRdpoYnaqiKPUJeaZHSSm1QgUvRR78M/LV44NkmK21d60xtuPD4NhT+k+hM
         nKHfPuu81D+8zdFmChX0XdstkkORG2oEs5mL+8Kn8qFN3b8MtbGjxHD8jEax+5H4Z9K/
         oexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677579818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TyGBvzl5hbWKjdgHBG4sNlcppPeDqqtNrSWML8B16Q=;
        b=Iugey94HR/q+bKlOOi6yefCH3TCXHO0RGHknolGAlihs2uBBWjUrAXMHh9TG3raXi3
         KrXLkRwx8NGJjzKeSxcSYS7v+F2ByyKgIx1I2eItxV1WxK+8JJbLU1hL8IzgvKHNSaMg
         +Fi4Asm+dJP7gIweQoD01id2GOYB0f29OWMJubi7VzA8AS+QzetoM6C0234yM1ebDIdX
         pxUeYdLWoYHdzz2UISdCLZaYyajtoFt/WFlwwlk6iM/SOS32x0VsNi0bwn6HIzWUEZgZ
         sHygjh4LVbQ9zD/4fmw2h/5ivOmV/p0hm0m3lBcU9oDGCwR0kfs6MjYSA3NzqpPznvqH
         MDGA==
X-Gm-Message-State: AO0yUKXeryv+n31KeDhkfNrJaR1N6yMYLz27RMWRRRTNdf+3EZUImJMC
        8lxWK5poR9Z+m3j9w5L4+RWFmw==
X-Google-Smtp-Source: AK7set/QvfEyPlbRIsm7TDv/QmKHj1bOOoAWeOijXNBKlPoL5ay0CfXWVkYOQGnTj6D5cKgty+pvVg==
X-Received: by 2002:a5d:6802:0:b0:2c7:194a:15cf with SMTP id w2-20020a5d6802000000b002c7194a15cfmr1722945wru.22.1677579818025;
        Tue, 28 Feb 2023 02:23:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s2-20020adff802000000b002c706c754fesm9463560wrp.32.2023.02.28.02.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:23:37 -0800 (PST)
Message-ID: <2c8c3e57-16b4-43cc-941a-61f251bfe1f9@linaro.org>
Date:   Tue, 28 Feb 2023 11:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Patch v5] dt-bindings: media: s5p-mfc: convert bindings to
 json-schema
Content-Language: en-US
To:     Aakarsh Jain <aakarsh.jain@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, krzysztof.kozlowski+dt@linaro.org,
        stanimir.varbanov@linaro.org, dillon.minfei@gmail.com,
        david.plowman@raspberrypi.com, mark.rutland@arm.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, andi@etezian.org,
        alim.akhtar@samsung.com, aswani.reddy@samsung.com,
        pankaj.dubey@samsung.com
References: <CGME20230227084748epcas5p2602a39017d3366bdfb5af95088ed89dc@epcas5p2.samsung.com>
 <20230227084736.89361-1-aakarsh.jain@samsung.com>
 <ef93fea2-e4db-7c28-b911-13b046352214@linaro.org>
 <021c01d94aa0$03714d00$0a53e700$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <021c01d94aa0$03714d00$0a53e700$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/02/2023 12:38, Aakarsh Jain wrote:
>>> +          - samsung,mfc-v5              # Exynos4
>>> +          - samsung,mfc-v6              # Exynos5
>>> +      - items:
>>> +          - enum:
>>> +              - samsung,exynos3250-mfc  # Exynos3250
>>> +          - const: samsung,mfc-v7       # Fall back for Exynos3250
>>> +      - enum:
>>> +          - samsung,mfc-v7              # Exynos5420
>>> +          - samsung,mfc-v8              # Exynos5800
>>> +          - samsung,exynos5433-mfc      # Exynos5433
>>> +          - samsung,mfc-v10             # Exynos7880
>>
>> Why this and first enum are separate?  I didn't notice it before...
>> Usually we have only one enum for one-compatible variants. Also, sort them
>> by compatible.
>>
> okay.
> I will keep it in this way
> properties:
>   compatible:
>     oneOf:
>       - const: samsung,mfc-v5              # Exynos4
>       - const: samsung,mfc-v6              # Exynos5
>       - const: samsung,mfc-v7              # Exynos5420
>       - const: samsung,mfc-v8              # Exynos5800
>       - const: samsung,exynos5433-mfc      # Exynos5433
>       - const: samsung,mfc-v10             # Exynos7880

These should still be an enum (and sorted by compatible).

>       - items:
>           - const: samsung,exynos3250-mfc  # Exynos3250
>           - const: samsung,mfc-v7          # Fall back for Exynos3250
> 
> Will this be fine?



Best regards,
Krzysztof

