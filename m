Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314F35BF9F0
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 10:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiIUI7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 04:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiIUI7I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 04:59:08 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BAC7B1FC
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:59:07 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q17so6112905lji.11
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uDqPTxLBXSRPNpIBt+p1kHd5kdS0XI/15zFCLNOcbyk=;
        b=T4gjUPXC4hkGq24IAc+95lbu4B9/zQ8sbasdUzvPNjk5u/9xQ0nVBbdZvTA6TXdVzX
         pHTbwjfb46WfGDT4lL+YB/AYi8SdohbjAUzbQDqk5pPtRbzaY2VzdaAk/ybKCMXdTPi7
         v2Y9U3pAIJk/rywTXYBXGfZcExP5dSlSypizaX2/ThMnWK51lcRb81fWcdFc1o1ZTTCa
         8PJ5N5UHbB4/B+je9BExgXobGUhKFTRavsPmcKYoek7EC3QErH4n+gRMS86Ys7QLgRz6
         VKP+YzvHYytHvq4xQ37Ev5hTgyrRXgYcZpRY+M4/g+wrVbnFqtArEsmflhbHJZToVpjn
         LYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uDqPTxLBXSRPNpIBt+p1kHd5kdS0XI/15zFCLNOcbyk=;
        b=gwCbDsMBq7SVM77ROT1Mod87SBcn5b5scBsyCht7T7jH+s38rrcezMKYlbOexJBs35
         OeinW3UVsI/4ZnP0vjvRk2kzYKAN2a5nvgdYSwLcg2SPdN18Q5J58E8gKj9LlEW8aoB2
         f1OeIPTYQYxiSiRRCjiI0hIqlVmaHirWyIPaPkiUe2QHVWQxmy+mXKTCz+KorzbbZ1D9
         D2QNnYAwtig3qpslnAmpId4RHKGLC4QrCZmbAl9cgMVG0b49ns7gMzRwb/SL3oLbeSYQ
         LyGc0/zgnKy7mWuJeLvsY4Z4f5IQxDceAYITpfvjcnuxDuZ63tluIH5SfJhRYTcD2iwi
         OiXg==
X-Gm-Message-State: ACrzQf335KQPJjghINF9rhrRgCpQKDH6A3ee9WKyL6/cGAxid3pGTDq5
        tO5Wb/35TV2Ye7T+UNhUOwpH3A==
X-Google-Smtp-Source: AMsMyM5OOy6mon1BB2JB7c0BlzMjfL6xLY1KY6NTfwT8OU5ZSjLFaoAwEb+6DD+5oB8xwh4muCYk2A==
X-Received: by 2002:a2e:9e43:0:b0:25d:d8e9:7b15 with SMTP id g3-20020a2e9e43000000b0025dd8e97b15mr8664523ljk.234.1663750746079;
        Wed, 21 Sep 2022 01:59:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c4-20020ac25304000000b004996fbfd75esm347887lfh.71.2022.09.21.01.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 01:59:05 -0700 (PDT)
Message-ID: <8e54e03e-105a-cf3e-242f-796bef77bfe1@linaro.org>
Date:   Wed, 21 Sep 2022 10:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 3/4] media: dt-bindings: add bindings for Toshiba
 TC358746
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, jacopo@jmondi.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kieran.bingham+renesas@ideasonboard.com,
        linux-kernel@vger.kernel.org, kishon@ti.com, hverkuil@xs4all.nl,
        vkoul@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
        mchehab@kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20220916134535.128131-1-m.felsch@pengutronix.de>
 <20220916134535.128131-4-m.felsch@pengutronix.de>
 <YyZTCsflWtUbo2ld@pendragon.ideasonboard.com>
 <20220919100844.bb7tzbql2vpk76xz@pengutronix.de>
 <YyhDO4ohv47uIij2@paasikivi.fi.intel.com>
 <YyhKoDxFoobY9vBd@pendragon.ideasonboard.com>
 <20220920152632.mjpgpmelvx4ya4k7@pengutronix.de>
 <Yyn5MqqKYH7VpFhw@pendragon.ideasonboard.com>
 <74b6b670-747a-f326-44ea-7588c3989b0e@linaro.org>
 <20220921083513.drt4rggqj7tpaygr@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921083513.drt4rggqj7tpaygr@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2022 10:35, Marco Felsch wrote:
> On 22-09-21, Krzysztof Kozlowski wrote:
>> On 20/09/2022 19:32, Laurent Pinchart wrote:
>>>>>
>>>>> Explicit bus types in DT indeed makes it easier for drivers, so if a
>>>>> device can support multiple bus types (even if not implemented yet in
>>>>> the corresponding drivers), the property should be there.
>>>>
>>>> Okay, I will make it required.
>>>>
>>>>>> Why do you have hsync-active and vsync-active if both are always zero? Can
>>>>>> the hardware not support other configuration?
>>>>
>>>> Sure the device supports toggling the logic but it is not implemented.
>>>> So the bindings needs to enforce it to 0 right now. As soon as it is
>>>> implemented & tested, we can say that both is supported :)
>>>
>>> Bindings are not supposed to be limited by the existing driver
>>> implementation, so you can already allow both polarities, and just
>>> reject the unsupported options in the driver at probe time. Future
>>> updates to the driver won't require a binding change.
>>>
>>
>> +1
> 
> I don't wanna do that because this let the binding user assume that
> this mode is already supported. 

What do you mean by "not supported"? By which system? By which firmware
element? Bindings are used by several operating systems and several
projects.

That's not the argument.

Bindings should be complete. Lack of knowledge and datasheets is a good
exception from this rule. Looking at Linux driver is not good exception.

> Adapting a binding is just 1 commit and
> since the property is already existing, there is no breaking change.
Best regards,
Krzysztof

