Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCFC527DDE
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 08:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240485AbiEPGwX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 02:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240522AbiEPGwT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 02:52:19 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F368F36696
        for <linux-media@vger.kernel.org>; Sun, 15 May 2022 23:52:17 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u23so24097601lfc.1
        for <linux-media@vger.kernel.org>; Sun, 15 May 2022 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rPRsmp2S+ox3NW4Nkz7Uxi/+FDpcfG15/yUhK2SgzDs=;
        b=v3uSv7bLh4yGdVxQsxnYEOO7Rllfhq8KHA1D+glz3RazBea57ykwaglnrFSyi5iTSF
         XyLY31+OYTMfBZ49WJ5JC/jI88TBuYsFtYGIcsTFwxjAYrLaLg7ILS4MLTZfy9ghIGAg
         38iTW4nYTYkyEhpaEXprXCi0r2Zc6XvZHTU82vOplY5agLMuz4/t7UsiQDed0jLVJafE
         rrua7pEu/i+ysYr011+/Zlc7KXwFQ6/2p2AORe647DoMft/bCtfUhErcf/nMTB7LYpmG
         M5vbxeNlB85KpeqCn/XSWaI36H/i34UY8GT6VMznIW6AmnI6manCUXnvfXO8U4rF9NwP
         TASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rPRsmp2S+ox3NW4Nkz7Uxi/+FDpcfG15/yUhK2SgzDs=;
        b=sRjoOdPWVBOD8R09QHFiMjCClICiI0xv5Qqag8OiDgwZoc6lA564Rir0K42+3Mrv6G
         VsOOlreRXMT9JES1yOUG971zF9X9Ha2mpd53gAAudrnPst1TmJh+z5ReTyJCir1MgNhF
         VMG27T0UFnosyYtw9iTMh8GudkBqxsx10922PrgFFeG5n7D58Izfd1Q5RI78ArglP94p
         49t4AjG+y/oFKsMQNSdDjVxU9paRSSpTjOvCjJBNYFh1JT2PbIKlhAtzf7tKCAuI9eA7
         f4ARIhAx/YD8wY7s0QswlSEagGMKRpImf+EWtC6gGbz4QA89MdPIfy+TBUhZI8bOCQib
         lRSA==
X-Gm-Message-State: AOAM532U+O51OMAVGzao1T4hPCkgDDooj9kPd0Y7ZZ1YuiVcjUOLevQo
        o24ngSvpU1Uz3Tt5LlEFsFsvlw==
X-Google-Smtp-Source: ABdhPJyLBneiXy67uswRTUL7av+Bk0KSkuTjjG050elMDmAnw8LyiYFwX7oD0zZb++fjEqzWTIjGPw==
X-Received: by 2002:a05:6512:3c8f:b0:473:9d3b:84 with SMTP id h15-20020a0565123c8f00b004739d3b0084mr12156259lfv.334.1652683936420;
        Sun, 15 May 2022 23:52:16 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a1-20020a056512390100b0047255d21142sm1218412lfu.113.2022.05.15.23.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 May 2022 23:52:15 -0700 (PDT)
Message-ID: <f263f61b-48bd-efcb-1f1f-1fb264dc05c6@linaro.org>
Date:   Mon, 16 May 2022 08:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] media: s5c73m3: Switch to GPIO descriptors
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20220515220703.347380-1-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220515220703.347380-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/05/2022 00:07, Linus Walleij wrote:
> The driver has an option to pass in GPIO numbers from platform
> data but this is not used in the kernel so delete this. Get
> GPIO descriptors using the standard API and simplify the code,
> gpiolib will handle any inversions.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
