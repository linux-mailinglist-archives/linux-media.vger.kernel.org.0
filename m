Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD05F454AD3
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 17:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238940AbhKQQW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 11:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbhKQQWz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 11:22:55 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44785C061570;
        Wed, 17 Nov 2021 08:19:56 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bu18so11337375lfb.0;
        Wed, 17 Nov 2021 08:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=slbKKxQ/rurVnSEI57eisp+SX8JJlPjNvxx5V40UNkE=;
        b=LPsSelLRXOQ7hXG/tGo1OT5PsrkKtigvlerFF01UNiGw0JbdtWtE7K/cRew90F6eIX
         6dgo8N8lCplnzkxHPN8XOh3nzbfLlAlsucENgGpvIu4f5tOCEZ2CwdJj91kOTRiYFmT+
         4hkT/UqDSayWKkllMAjcfAhQqCdMdVQItwOdIXOSZcrUYAFIQ4NYJyDr2Mw8dQamhJVJ
         51S3H5wZT7aAP2mpukvg2mtyHnSc+cPvVZzdFYXzRwpXeDxGOvB0xGVWlRCHls1e6FgT
         CIiLVIkBvpw4Nvvjfqa1IexQaqXU3RChbVEV+Z3nGjCm+u3nlYHqo3Rl+pNkoKzS8BWB
         22tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=slbKKxQ/rurVnSEI57eisp+SX8JJlPjNvxx5V40UNkE=;
        b=tgXtcmvEryEGukIS4Fq6PhKRajlkOlsTLYZ3PuClDLOmeaEPIbf1cwcc2b1sNbmF9U
         i6xEFyemuIiaM6UWNHUEJe5igN0Zvi2cGmRO9gfWdHDs+Qs5wJwXhsuci/ez1C4W2Ney
         GiuagJpnGD/AkT3l9quTNFNIe2VpGJpGGTE8Gs6wdCOUGabgHX7F24aF27/dKMAprKw1
         CxvAThXTKdTLLoPsNOko+Qn2RXvl4hfZWwj3Oyzzd1KCcAMEJ+97B+9XfY1G4JyKArTl
         xYCJngWpXXsSgGykC0xvZ8ssyGQ3J9xwFEG36B4ozmtD1dT0iXFuc9wvr3BbyJCIE+Cu
         H7xw==
X-Gm-Message-State: AOAM531516sYc9oqh+eaVP1OFluXEoyY1n2d3XEkURYJoWTk/ZtNmeCr
        Kg4MxtE6soc3YeGQ2ZYDA0u+NAE1lEM=
X-Google-Smtp-Source: ABdhPJyfq1oyCehVK/MehD7wcDla30T+6xOUXDqwqeTSENy6xeLdvMcR4ZoYf1tizTWRd8K1lJ7mmw==
X-Received: by 2002:a2e:7216:: with SMTP id n22mr8926810ljc.44.1637165994488;
        Wed, 17 Nov 2021 08:19:54 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id m11sm32535ljc.108.2021.11.17.08.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 08:19:54 -0800 (PST)
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
 <20211115154858.GG27562@kadam>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
Date:   Wed, 17 Nov 2021 19:19:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115154858.GG27562@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

15.11.2021 18:48, Dan Carpenter пишет:
> On Mon, Nov 15, 2021 at 05:34:47PM +0300, Dmitry Osipenko wrote:
>> 15.11.2021 15:44, Dan Carpenter пишет:
>>> On Mon, Nov 15, 2021 at 01:34:18AM +0300, Dmitry Osipenko wrote:
>>>> 15.11.2021 01:23, Dmitry Osipenko пишет:
>>>>> +	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
>>>>> +	if (!vde->secure_bo) {
>>>>> +		dev_err(dev, "Failed to allocate secure BO\n");
>>>>> +		goto err_pm_runtime;
>>>>> +	}
>>>>
>>>> My eye just caught that by accident err variable isn't assigned to
>>>> -ENOMEM here. I'll make v2 shortly.
>>>
>>> Smatch has a check for this so we would have caught it.  :)
>>
>> Whish smatch was built-in into kernel and I could simply run "make
>> smatch". On the other hand, I know that you're periodically checking
>> upstream with smatch and patching the found bugs, so maybe it's fine
>> as-is.
> 
> I run it every day, and it's integrated into the zero day bot and Mauro
> runs it.  So someone would have caught it.

Very nice, I haven't noticed that 0-day runs smatch. I assume the smatch
reports from the bots are private to you and Mauro since I never saw
them in my inbox and on LKML, correct?
