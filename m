Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA43622619
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 10:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbiKIJBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 04:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiKIJBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 04:01:33 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716791DA76
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 01:01:31 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id b9so24749221ljr.5
        for <linux-media@vger.kernel.org>; Wed, 09 Nov 2022 01:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=koi87UBrY+4VbIvBhOaMl54U0jWmVKM7mhP4eLxgcCM=;
        b=pYyHtrWUHIUnG+wcIiuyl8Eb4xpHSKWAbbm2UUGW+KAXP1NEZ5VG6w+KCCeVZDMvA6
         xG0Afks2KDaRV8ZceEPEFN2cR6hlLiyqaBnfwVmfNfAm0mqPCqTf16Bui1CL0AzeI/jl
         UJrBkDY3mWGCs41//YNt9kXSV1nlSqVf/qU/d1xdI3CDV5Ysz6Ns/LQ2zTF+LAm4cAD3
         /Kt6hF2qRXx8UuklDBKOVfGgBSUX5aTqm6iE338qmimwzVn3HSyK4MyERUePThBrL95T
         RSBHm+AvgOeYlCqvCQSudofFWbQfRZ71UE4pZnExgvX9GUlfeqJeBP/uT6sz1rRTtfKh
         iMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koi87UBrY+4VbIvBhOaMl54U0jWmVKM7mhP4eLxgcCM=;
        b=vKe6noI1PW30Lk/UQQFhBgg1XeFIu5+WJdg0BaLcxVuag3dUWVknWeYBVINN5CCGZt
         Sbuwi+lPuRXflQKfcjCDZf3rXaAV8QnB5/2/CKtKU8lS5hiG+cjDCIskb3sSH1EnwDyQ
         sye/KHG0jAXoO2+qLkFcjERBpTRswigy8hVGom6RK/arqhquc8337hGsqNHIQ3YYHjot
         aPAURCMoZAG17X75PoUKOkTIWRGK3ez1nJ4T+OO9WMgmQ1joHMKmXFk1PqrMxWLwcRxG
         W/usrhrmNIyCPN329FivHFj3LeLrmd6z//aEnRMaMk5L/iFnkcaZa02aMIypVB/fvQPi
         HMvg==
X-Gm-Message-State: ACrzQf1FPu4X0ZmRPWAiACNupfiXJ6FxGtWQLecnvIcyovYhnN3ZwKIK
        lwI2DsWNU6yUWDeqTdceSvE5viTuaDuZow==
X-Google-Smtp-Source: AMsMyM68gD6nF6Ys++aTB+8/odStmcWWdBR+jCLTj5ELwjEBJoftvdDjO2Ka2/JTTfzis+5UjDtBQg==
X-Received: by 2002:a2e:9a88:0:b0:26f:c489:883e with SMTP id p8-20020a2e9a88000000b0026fc489883emr7498644lji.281.1667984489818;
        Wed, 09 Nov 2022 01:01:29 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id b2-20020a05651c032200b0026bf43a4d72sm2062535ljp.115.2022.11.09.01.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 01:01:29 -0800 (PST)
Message-ID: <5741e444-00b3-16f6-d012-f2b77cf8b0b2@linaro.org>
Date:   Wed, 9 Nov 2022 10:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Patch v2 1/3] arm: exynos: Add new compatible string for
 Exynos3250 SoC.
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
        pankaj.dubey@samsung.com, smitha.t@samsung.com
References: <CGME20221109034803epcas5p26644fa402ff1837754b61c1a307b2bb8@epcas5p2.samsung.com>
 <20221109035507.69086-1-aakarsh.jain@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109035507.69086-1-aakarsh.jain@samsung.com>
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

On 09/11/2022 04:55, Aakarsh Jain wrote:
> Since,MFC v7 support was added for Exynos5420 and Exynos
> 3250 SoC with same compatible string "samsung,mfc-v7".As
> both SoCs having different hardware properties and having
> same compatible string for both SoCs doesn't seems to be correct.
> New compatible is added for Exynos3250 SOC which will
> differentiate the node properties for both SoCs which
> support MFC v7.
> 
> Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  Documentation/devicetree/bindings/media/s5p-mfc.txt | 9 +++++----

Use subject prefixes matching the subsystem (git log --oneline -- ...).

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

