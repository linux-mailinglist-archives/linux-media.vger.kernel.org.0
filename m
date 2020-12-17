Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22BD42DDA7C
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 22:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731667AbgLQU7N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 15:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729655AbgLQU7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 15:59:12 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B81C061794;
        Thu, 17 Dec 2020 12:58:31 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m25so61160843lfc.11;
        Thu, 17 Dec 2020 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2zaYEPU3Dc5zFOFGXsYjz12iYiWYHN8N3O6lakukl/s=;
        b=qgHdy+aVZrcGxyULYw4C/dnhEhXcHqnIi3WOZ6PUyWeJ1T2KuwB4MyFcAMVcIxtEkN
         P0wC9L1L3/OzQP2N4oOFkRUNhuvP6BbgtM9veJ1+/75E6Miy7hj7Bf2nEtboXPbzthOR
         kxxro9rjbhD5efC41F1HFL2RxEsBF22ZTFXdF10FlYyRqWRrEuRkkxNHvNJAyiBiyHb5
         xCx3hJCcAYykCnF/aKI0AxMDTkj4x39+lQJUW1SrSIqcsl3UFk3eY07U8IrPb8AhV1uo
         MAvO3Efc7ekB1pIAMLvXK67v6Yhq5T7IZPOk04vo8zGuFhsht5N49PaRJoPc7WLTbass
         MfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2zaYEPU3Dc5zFOFGXsYjz12iYiWYHN8N3O6lakukl/s=;
        b=mk6ECNMHIfaJnfdVJza6zr3sQqMHNSUgYAr5ydti1HnQ46TwMYNrMnbwcfUw3Asi+C
         b2yLSIDIROzMJ4LukAW2nI6g0WCFx2Rgp+mq9uJog4e5eFieaS5jShXCayMwSEf11HGI
         X7T6jbjuu9QqNTxS95tA8I7QTHbfhwKEw7O527CzXhBDqmwJB2aYLR5Vft2Ixka435tP
         sKi/5FxDUB5UY0wKD7LEMy2xHnmF6UqG0UXampjezxvUVSZ0coNYem4z9WPl2kLL7U+2
         bq2afagXnH6yG2+yTpWrD+kO3pjf0QaM+NxG/+yqMZulq4kQBMVz/5debAdh5xrh1HEk
         1smw==
X-Gm-Message-State: AOAM531DD07vwJRGTuaLZMKW502LLUivI2AlWRZnvbbClbo+msHB3e2f
        ilcxzGuwW0eCPCm8RSbXdQ77KmaKBMA=
X-Google-Smtp-Source: ABdhPJybT54BUMIzcynXITACTqPF/IcLrcExqUZ6d4e77IqO+C219fiwEYcS2lWHXSvWZh2/2hrkeQ==
X-Received: by 2002:a05:6512:3089:: with SMTP id z9mr233591lfd.433.1608238709941;
        Thu, 17 Dec 2020 12:58:29 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z26sm789139ljn.98.2020.12.17.12.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 12:58:29 -0800 (PST)
Subject: Re: [PATCH v2 34/48] gpu: host1x: Support power management
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-35-digetx@gmail.com>
 <cb8dca7c-6ef2-5116-6c04-816a63525e2e@kapsi.fi>
 <b106c4c0-bd93-bbc9-9357-45fe8fb1cf0f@gmail.com>
Message-ID: <5523b804-f5de-a529-fd4e-751c39ab663b@gmail.com>
Date:   Thu, 17 Dec 2020 23:58:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <b106c4c0-bd93-bbc9-9357-45fe8fb1cf0f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

17.12.2020 21:45, Dmitry Osipenko пишет:
> 17.12.2020 21:21, Mikko Perttunen пишет:
>> On 12/17/20 8:06 PM, Dmitry Osipenko wrote:
>>> Add suspend/resume and generic power domain support to the Host1x driver.
>>> This is required for enabling system-wide DVFS and supporting dynamic
>>> power management using a generic power domain.
>>>
>>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>   drivers/gpu/host1x/dev.c | 102 ++++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 91 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>>> index d0ebb70e2fdd..c1525cffe7b1 100644
>>> --- a/drivers/gpu/host1x/dev.c
>>> +++ b/drivers/gpu/host1x/dev.c
>>> @@ -12,6 +12,7 @@
>>>   #include <linux/module.h>
>>>   #include <linux/of_device.h>
>>>   #include <linux/of.h>
>>> +#include <linux/pm_runtime.h>
>>>   #include <linux/slab.h>
>>>     #define CREATE_TRACE_POINTS
>>> @@ -417,7 +418,7 @@ static int host1x_probe(struct platform_device *pdev)
>>>           return err;
>>>       }
>>>   -    host->rst = devm_reset_control_get(&pdev->dev, "host1x");
>>> +    host->rst = devm_reset_control_get_exclusive_released(&pdev->dev,
>>> "host1x");
>>>       if (IS_ERR(host->rst)) {
>>>           err = PTR_ERR(host->rst);
>>>           dev_err(&pdev->dev, "failed to get reset: %d\n", err);
>>> @@ -437,16 +438,15 @@ static int host1x_probe(struct platform_device
>>> *pdev)
>>>           goto iommu_exit;
>>>       }
>>>   -    err = clk_prepare_enable(host->clk);
>>> -    if (err < 0) {
>>> -        dev_err(&pdev->dev, "failed to enable clock\n");
>>> -        goto free_channels;
>>> -    }
>>> +    pm_runtime_enable(&pdev->dev);
>>> +    err = pm_runtime_get_sync(&pdev->dev);
>>> +    if (err < 0)
>>> +        goto rpm_disable;
>>>         err = reset_control_deassert(host->rst);
>>>       if (err < 0) {
>>>           dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
>>> -        goto unprepare_disable;
>>> +        goto rpm_disable;
>>>       }
>>>         err = host1x_syncpt_init(host);
>>> @@ -485,9 +485,10 @@ static int host1x_probe(struct platform_device
>>> *pdev)
>>>       host1x_syncpt_deinit(host);
>>>   reset_assert:
>>>       reset_control_assert(host->rst);
>>> -unprepare_disable:
>>> -    clk_disable_unprepare(host->clk);
>>> -free_channels:
>>> +rpm_disable:
>>> +    pm_runtime_put(&pdev->dev);
>>> +    pm_runtime_disable(&pdev->dev);
>>> +
>>>       host1x_channel_list_free(&host->channel_list);
>>>   iommu_exit:
>>>       host1x_iommu_exit(host);
>>> @@ -504,16 +505,95 @@ static int host1x_remove(struct platform_device
>>> *pdev)
>>>       host1x_intr_deinit(host);
>>>       host1x_syncpt_deinit(host);
>>>       reset_control_assert(host->rst);
>>> -    clk_disable_unprepare(host->clk);
>>> +    pm_runtime_put(&pdev->dev);
>>> +    pm_runtime_disable(&pdev->dev);
>>>       host1x_iommu_exit(host);
>>>         return 0;
>>>   }
>>>   +static int __maybe_unused host1x_runtime_suspend(struct device *dev)
>>> +{
>>> +    struct host1x *host = dev_get_drvdata(dev);
>>> +
>>> +    clk_disable_unprepare(host->clk);
>>> +    reset_control_release(host->rst);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __maybe_unused host1x_runtime_resume(struct device *dev)
>>> +{
>>> +    struct host1x *host = dev_get_drvdata(dev);
>>> +    int err;
>>> +
>>> +    err = reset_control_acquire(host->rst);
>>> +    if (err) {
>>> +        dev_err(dev, "failed to acquire reset: %d\n", err);
>>> +        return err;
>>> +    }
>>> +
>>> +    err = clk_prepare_enable(host->clk);
>>> +    if (err) {
>>> +        dev_err(dev, "failed to enable clock: %d\n", err);
>>> +        goto release_reset;
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +release_reset:
>>> +    reset_control_release(host->rst);
>>> +
>>> +    return err;
>>> +}
>>> +
>>> +static __maybe_unused int host1x_suspend(struct device *dev)
>>> +{
>>> +    struct host1x *host = dev_get_drvdata(dev);
>>> +    int err;
>>> +
>>> +    host1x_syncpt_save(host);
>>> +
>>> +    err = pm_runtime_force_suspend(dev);
>>> +    if (err < 0)
>>> +        return err;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static __maybe_unused int host1x_resume(struct device *dev)
>>> +{
>>> +    struct host1x *host = dev_get_drvdata(dev);
>>> +    struct host1x_channel *channel;
>>> +    unsigned int index;
>>> +    int err;
>>> +
>>> +    err = pm_runtime_force_resume(dev);
>>> +    if (err < 0)
>>> +        return err;
>>> +
>>> +    host1x_syncpt_restore(host);
>>
>> We also need to execute 'host1x_setup_sid_table' upon resume.
> 
> Indeed, thanks. I'll correct it in the next revision.
> 
> Perhaps the actual save/restore needs to be moved to the runtime
> callbacks. At least I can't remember right now why this wasn't done in
> the first place.
> 

I looked at the save/restore once again and recalled why it's done so.
The reason is that the host1x touches hardware during the driver probe,
and thus, RPM needs to be resumed first. It will be a bigger change to
properly decouple the hardware initialization so that it all could be
put it into the RPM callback. I'll try to do it in v3.
