Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5DBE583918
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 09:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbiG1HBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 03:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiG1HBG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 03:01:06 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2082851438
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 00:01:04 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id p22so966780lji.10
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 00:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nRhU8Xmo8NVx+3hPXhYpUbAwbYIpncAqKvgE1eanWM4=;
        b=Dw02yJpYL/KXSjq0VXkvvmLYDISAKKmLsOkwCxlia2u47URBEuv2/gJF0Epdd3B1LF
         m4Qcw7u/Ts6pp5tKpNC2+GnNveS8BcgpbEa2+MrBArNsmHF5utlF7aBPBjt14ujaO6+l
         XTMwYFByECCRfK2qs2bc6/gCS+3nFCEaDixtd1QWtMPJBvQiYsgZbAAVTIauXeUFLHra
         p3Btvbo+W8ykXDLznW3Po8AGs/sVunLSsYy5QRdxNzUeUiI/nsT7xodaJ+quAqE6TuVo
         IbTbnYsl2ZJOv6eEpbB7BPa00HYp8RmkpmCDAtFrgwVOInWXZu/YgQKnYA7/QzoQHWZ0
         Ax8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nRhU8Xmo8NVx+3hPXhYpUbAwbYIpncAqKvgE1eanWM4=;
        b=TbqwHrb7FVz9HHZluxmU4CGFL+rTtkHldTlJlcFScfrV4kOxdCz3CvJKGlPtgbVNib
         6+27gHVKJZdUWWAXZBFntfWNr65wZG7uzvWDSUxTeqZ3q8Pruqz+sBbHY87HuoK+Egsq
         6mewDztO59UQ4bpQcDIgHcZwbSaDszTN/q7uakMBZ2uOq6eGE5s0RQHSM2nIb5tA1voA
         L4Ia1xxrM1H7NUw4xwghy7AIizmANSnGzKbHR+I9amvYRmbnH6rJQ9sat27vISrBm5Ve
         2rm9e7l0xCLDpDMyS2cBIfDaYQDtWF08E/nfI5a9OCbZJ0XCeirdB/WNnuQhynAR+vE1
         aUCA==
X-Gm-Message-State: AJIora+ZfyRqFzkWF+VzbrbRJeCvCUtpqcFC66qiwX5ruR72kG7PFrjD
        EMbO8uf2SeDSfsUrEkUrlPZdwBlAdWdkpvaq
X-Google-Smtp-Source: AGRyM1vvAFefN8UxewXLvqrhGbBM4U+BhOGlbN6KRptT19q7Jk5gCZOufq2rYPIc2TkOPf+3bA4m+g==
X-Received: by 2002:a05:651c:b23:b0:25e:e2d:9e40 with SMTP id b35-20020a05651c0b2300b0025e0e2d9e40mr5406364ljr.38.1658991662420;
        Thu, 28 Jul 2022 00:01:02 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id r11-20020a2e8e2b000000b0025a70f7ea3asm4390878ljk.138.2022.07.28.00.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 00:01:01 -0700 (PDT)
Message-ID: <91e966c9-b398-1a3a-e4be-8e4e3a0f8d89@linaro.org>
Date:   Thu, 28 Jul 2022 09:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Content-Language: en-US
To:     Zhang Ning <zhangn1985@qq.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org, christianshewitt@gmail.com,
        linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
 <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
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

On 28/07/2022 01:48, Zhang Ning wrote:
> On Wed, Jul 27, 2022 at 05:27:25PM +0200, Krzysztof Kozlowski wrote:
>> On 26/07/2022 16:36, Zhang Ning wrote:
>>> Add manufactor bindings for Tmall
>>> Add the board bindings for Magicbox M16S Tv Box
>>>
>>> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
>>
>> Please send patches with correct subject PATCH.
> I got confused, and don't know how to update..
> 
> ad152daedc5c dt-bindings: arm: amlogic: add MagicBox M16S bindings
> 3f7dbd336f36 dt-bindings: arm: amlogic: add Vero 4K+ bindings
> 2ca889b12016 dt-bindings: arm: amlogic: add H96-Max bindings

git format-patch -v8

> 
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Christian Hewitt told me to split to 2 patches, 1st for manufactor, 2nd
> for device, how to handle your Acked-by?
>
If split is the only change, you can add ti both of them


Best regards,
Krzysztof
