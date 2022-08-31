Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62CEF5A7FF5
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiHaOTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiHaOTH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:19:07 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1174EB1D
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:19:06 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p16so2157266lfd.6
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=pW74akDtCZp9SGm7xQta0Vh6TyOV61KC1OwdSLDSCGA=;
        b=GiedZMbZW8oamW0i5Le/otogUjvM9PZZMUmPA7wX6gcaLBEUsYJFOB1ZXNcOhE3bxH
         22/NpjKD+jKpHK4JjyXrkRwbrPjrK3OcYxgor2w0IOMKCElqhKaBY8K0lwjbH/sk4olH
         PMqlGfQ4/aEmgRVracw6Qs0W9ahEkK7a1lqVyG8jYnlGGbtj7I49bHfCAHB2hiG/pRdX
         UXqr3kB5sAdX8sKRfb1bSng4Q37ZCg6oLh0m9XWof51PjxhfQWfL2Yy2/LQjV2XZP0he
         OY7ULPeNXU0H6SFCjVfuYAREBxk3msaegP/E8qvWEe6C5qQanXXeWDZFoB1/OvjFMYgF
         jNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=pW74akDtCZp9SGm7xQta0Vh6TyOV61KC1OwdSLDSCGA=;
        b=WQXFpJKmtRiF5Bv7n5cGGpMd5/Z+DDzORYjKXEF/D6a0aVPkWICvlZs4yVyJ7Dlv/e
         Rts4qK1A0Q+fEXhkD2DXsK/tUaXbO415HFff+0IXfKSi3cnCyYCOrnjpL+Y3Ydg2tZkd
         JOkEp6ev6ZdH+HAi4q63fjjyjCKt+xSo27iOZbbe98Lo9J7VlwtaMhwtP47S5nKx9pHL
         2G5Eu6LDnAesBA0m/eMnOw1Pd01yvA+lZq2kPPZsNvS1HnIBQQWX1AqQqDZxheK6HtZO
         5xqPxrknwZbbnYF3q3pOCgEh3FSx9kXBMSY44Xh0De4krTk147Gf2zOergAAPcwWkddL
         xh+Q==
X-Gm-Message-State: ACgBeo1pnNE9Z4Q/wvfbEwkY6IcEvWW0q2D0PxuP61frbUketvsQPy0f
        zOs72vDHxW6SRwMTvfpDLWWk6X9XOz6aoaf3
X-Google-Smtp-Source: AA6agR4lHr7Y2VuLmCXR3lejDEbECMAW4tHNgxl5czMy7+3fz2XgYcMOqridR/2sh4TNSOM3n5Pisw==
X-Received: by 2002:a05:6512:2252:b0:494:7a42:6ba9 with SMTP id i18-20020a056512225200b004947a426ba9mr2360174lfu.273.1661955544342;
        Wed, 31 Aug 2022 07:19:04 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id a27-20020a2ebe9b000000b00263c3c940d9sm1445818ljr.27.2022.08.31.07.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 07:19:03 -0700 (PDT)
Message-ID: <7fdb1701-e6ab-cad2-2523-f4f06db5cce7@linaro.org>
Date:   Wed, 31 Aug 2022 17:19:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Content-Language: en-US
To:     "Tuma, Martin (Digiteq Automotive)" 
        <Martin.Tuma@digiteqautomotive.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
 <22204e2d-e0cc-b4bf-7501-9e4c2bf32ff8@linaro.org>
 <AM8PR05MB7235B6CBA34C981D456F74EAFB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
 <1b7c6c4d-7f26-de21-df51-0428bc0af715@linaro.org>
 <AM8PR05MB72350548F27F413298FF032AFB789@AM8PR05MB7235.eurprd05.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM8PR05MB72350548F27F413298FF032AFB789@AM8PR05MB7235.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/08/2022 17:12, Tuma, Martin (Digiteq Automotive) wrote:
> 
> 
>>> The Xilinx XDMA IP core is a complex device that is bound to PCIe and
>>> also handles stuff like MSI/MSI-X interrupts of the PCIe card/FPGA.
>>> The FPGA IP core is different from those that already have drivers in
>>> dma/xilinx so a new dma device would be required anyway.
>>
>> Just because it is different does not mean it requires a new driver...
> 
> Just because the HW is from Xilinx and has DMA in it's name does not mean
> it can be merged with some other Xilinx DMA driver... 

In many cases it means because submitters are not willing to integrate
but prefer to duplicate...

> I suggest we stop this kind
> of argumentation as it is pointless and we look at the facts. 

I was waiting for the facts - for the actual differences.

> The XDMA IP core
> really is very different from the other three Xilinx DMA engines which already have
> a driver in linux. Additionally as you can see, there are three supported Xilinx
> DMA engines and each of them has its own driver, so I see no reason for
> breaking this "rule" and try to violently merge the XDMA driver with one of
> the existing drivers (their maintainers would IMHO not be very happy...)

There is no rule that you need new driver for every new IP block. It
depends.

Anyway, I raised the concerns. You will get them probably again from
other people when you Cc proper addresses...

> 
>> I don't understand your quoting style. You typed here my message instead
>> of quoting. I recommend to use some standard mail clients so that emails
>> are properly formatted.
> 
> The story behind the weird  quoting style is, I only have a web Outlook accesible
> through Citrix, where even copy&paste does not work... This is how things are if
> you work for the Volkswagen/Škoda corporate (Digiteq is a subsidiary of Škoda)
> like I do. The official mail addresses and their infrastructure is simply unusable for
> "serious" work. I even had to set up my own SMTP server in the Internet to actually
> send the patches... I will switch to different email address the next time I send
> the reworked patches and use some sane email client. There were two reasons for
> using the broken mail infrastructure:

Sorry to hear that. Usually the only viable solution is to keep
discussions and submits with other (e.g. private and working)
accounts/setups. Git works fine with it, only authorship of emails is
different. Of course company might prohibit such approach...

> 
> 1) By using the "official" company mail address I wanted to make clear that the driver
> is developed by the company producing the HW.

Author of email does not have to be the same as author of commit.

> 2) I didn't know that the web Outlook is that bad and only designed for the "corporate"
> style of replyies where you post your response on top of the previous message.
> 
> TLDR - sorry for the "style", it will get better the next time I send the patches.


Best regards,
Krzysztof
