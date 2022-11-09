Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054A062268D
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 10:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbiKIJPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 04:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiKIJOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 04:14:31 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1B81F2F2
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 01:13:16 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id d6so24731827lfs.10
        for <linux-media@vger.kernel.org>; Wed, 09 Nov 2022 01:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMMA/bjgoBoze1LBnX/Nw5JY8Hkox2bSDSTZbz1eJrE=;
        b=c08bfG0K6FV5WBXfA0i8dHqn3m/UvjcC4mcPpcCpuSlOQkpY/zZ1y8A41xUb2hW8oB
         7mVKjdcOXyUBBSHVbN5U4RdNXMFhuHdwt/oz4WTw0UiPgfd8LCpdK7INZDR6UpUPBt5u
         AELkTxjBF3QK32F2zhR2+XXQLGZ5hwJtCPYAlE7zAtXSOhKFQd7/Mo+Ydpu7llA1i7uc
         /x//WlN5Zp1ptbH3DT37ElmPIq9TCItaCa+XrMDdaEbLKAwqpXKbnMkwqd6wlI+0qVBf
         2DjE7w+E/qrftf65Ljr/GNtLYACbPggteksGEoP+rm5iuiuWjoEku942u7XwgdqBRGg5
         BbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMMA/bjgoBoze1LBnX/Nw5JY8Hkox2bSDSTZbz1eJrE=;
        b=Xu9vda9hfh3tAJ4dDOTuDO48FwYh6UMeaWXm2/gxbEi94WZis3yIMyJ+/rkm91X1Of
         BpR/0hOvCP0lf9hAzMnxD8uMDr9uAnzwqa114Upigpm7A1zAwnonSoIyl0KaEMHNjYlo
         L/VOncPDZVv+w8Pfi7bTHAcfuFuY/lIpmyb0ddkCe0xQRRe/d8xjHJ566qFkeJsHZnjs
         /9mEtXPrhcdlAyjW4W7/JjRp/NMYx7OntPpzDv+swuM7yuiLSe63qcmc0pweIy/GuXJW
         /ycUq9e96jjTDagbRuMVLG4/c/4g1RhJY8Kg4Tjh/JpHg31+iFRtweaxnJeug5d6SW1J
         NyzA==
X-Gm-Message-State: ANoB5pmIaLBmDuKGRaKXj+HR3qrM9iRpUYCPnmvGOf0QX/+aKpeyIuqo
        U4aFxvkz10gQZ2isFfU5utDglg==
X-Google-Smtp-Source: AA0mqf5vhuG4o/ejG+r4xLBj3u2AOMhVSoR0l36Az9u/3vDm1C4FRmFMs6/18+41BqI2RQPGcKo4Gg==
X-Received: by 2002:ac2:5f1c:0:b0:4b4:11bf:9067 with SMTP id 28-20020ac25f1c000000b004b411bf9067mr1846080lfq.175.1667985194965;
        Wed, 09 Nov 2022 01:13:14 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id v21-20020a2e9255000000b002776ce08326sm2064318ljg.29.2022.11.09.01.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 01:13:14 -0800 (PST)
Message-ID: <6707abae-39aa-0d1b-dc5e-cee1d87402ec@linaro.org>
Date:   Wed, 9 Nov 2022 10:13:13 +0100
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
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Beside my previous comment, please include changelog. This is v2, right?

You should consider joining something like:
https://www.linaro.org/events/member-training-upstream-kernel-development/

Best regards,
Krzysztof

