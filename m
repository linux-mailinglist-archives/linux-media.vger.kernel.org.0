Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85191696011
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 11:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbjBNKAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 05:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbjBNJ7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 04:59:35 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762EF233C6
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 01:59:00 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id m14so14991468wrg.13
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 01:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YigLVN232d2vsfHIJ26LQHhC5RhgoKV67mcKgoE/0Tg=;
        b=Lgr+NZlmPJrB0+lMM0N6BMTZMMdFS1M0LlvQbZTmoCCJ+XDWFlO11xG2TfAbxMRfsr
         xhoexczwRzeLZTFYbH4E1x7lxCxZZaU1vksAyPZzNH8Mn1OK2bMdGKp1dfXWPd85LXCw
         mNMlyCsliv0YykzbR8m7THYVA3oPJRPVo4HUp540kYZCz0ZUo/HOSh8KXaFqm78k1wBV
         R8BCl0M2UWauDKPbDUSfk4R8fLZ0IrquTqfWTgbBG1mTK9aAi/wxKDtADwZfFq3o3Ajw
         aj3TH0Fbm9Eoc0kTgAmUToQ64QgVCGoHBmhwSau1tfYM6WYTGrFJ4vgb3lkMQNOS5Qv6
         XhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YigLVN232d2vsfHIJ26LQHhC5RhgoKV67mcKgoE/0Tg=;
        b=IeszvF/vd5f2k/D+IoxGO1IBwdHjuNyXvi3OV+9jwPyEgHi+Z0/ITmqDzTtYFFmaf/
         +R2kiiZXExlcAnxS4NEmpUJKjmOcWP0V0GDI4npi1abNjGxzwPnAu7gA4SBUf1G408ZG
         WYkKDdP9J4lIj+p5ephGqlJEf33LRVYhiaPU+//gwFrSpT0PIgBPEOyneZCyROx/6BCc
         MxEw8sBF7FtE8/wyvGlV3Xu9xUDlAVSFT6suHoOFaKp6ByNnrT0DMGNOVfdXyW9NLFuF
         wGm7cRpLHYtYSC5AwMcx3hBRc6KhaxuP6KEyGBaTYdqpH3Ti1v83VMUokykr7Zc0q0Kj
         Im9w==
X-Gm-Message-State: AO0yUKXJFS7g63FKBYuVzF5z9ZeWvJEgNec09FrPq/Zfx6IIF66ryvDo
        ZOq3bRvc54rJBpkg0QyvKUaaJA==
X-Google-Smtp-Source: AK7set/siP0mTRrExraFbFYMqjIdU9FDVpbw8X8TUHwWT+RaseP1odGp2QbV1Q7w7d7Vfc4ReqTENg==
X-Received: by 2002:a5d:5704:0:b0:2bf:b68a:e122 with SMTP id a4-20020a5d5704000000b002bfb68ae122mr1542895wrv.33.1676368739088;
        Tue, 14 Feb 2023 01:58:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r3-20020a5d6943000000b002c551ae8cc1sm7505795wrw.67.2023.02.14.01.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:58:58 -0800 (PST)
Message-ID: <765c9ce0-65e3-8681-7343-c57ba70da9df@linaro.org>
Date:   Tue, 14 Feb 2023 10:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] media: dt-bindings: samsung,exynos4212-is: convert to
 dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20230212190222.44977-1-krzysztof.kozlowski@linaro.org>
 <20230212190222.44977-3-krzysztof.kozlowski@linaro.org>
 <167630051330.6283.15554895477756313707.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167630051330.6283.15554895477756313707.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/02/2023 16:09, Rob Herring wrote:
> 
> On Sun, 12 Feb 2023 20:02:21 +0100, Krzysztof Kozlowski wrote:
>> Convert the Samsung Exynos4212/4412 SoC Imaging Subsystem (FIMC-IS)
>> bindings to DT schema.  Changes during conversion - adjust to existing
>> DTS and Linux driver: add iommus and power-domains.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/media/exynos4-fimc-is.txt        |  50 ----
>>  .../media/samsung,exynos4212-fimc-is.yaml     | 221 ++++++++++++++++++
>>  MAINTAINERS                                   |   1 +
>>  3 files changed, 222 insertions(+), 50 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/media/exynos4-fimc-is.txt
>>  create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: /example-0/fimc-is@12000000/i2c-isp@12140000/image-sensor@10: failed to match any schema with compatible: ['samsung,s5k6a3']
> 

Eh, I missed the fact that this depends on my other (earlier) patch for
samsung,s5k6a3. I will resend all of them in one patchset.

Best regards,
Krzysztof

