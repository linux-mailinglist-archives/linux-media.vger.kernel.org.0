Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BC7307CDE
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 18:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbhA1RoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 12:44:12 -0500
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:52565 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbhA1Rnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 12:43:51 -0500
Received: from [192.168.1.41] ([92.131.99.25])
        by mwinf5d58 with ME
        id NHi22400V0Ys01Y03Hi4sp; Thu, 28 Jan 2021 18:42:09 +0100
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 28 Jan 2021 18:42:09 +0100
X-ME-IP: 92.131.99.25
Subject: Re: [PATCH] media: venus: core: Fix some resource leaks in the error
 path of 'venus_probe()'
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210127201732.743938-1-christophe.jaillet@wanadoo.fr>
 <309678ef-c3b9-0269-0715-05a469c04345@linaro.org>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <bb2aa9f2-3e1b-7af0-8009-f543adec3c2a@wanadoo.fr>
Date:   Thu, 28 Jan 2021 18:42:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <309678ef-c3b9-0269-0715-05a469c04345@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 28/01/2021 à 11:49, Georgi Djakov a écrit :
> Hi Christophe,
>
> Thanks for the fix!
>
> On 1/27/21 22:17, Christophe JAILLET wrote:
>> If an error occurs after a successful 'of_icc_get()' call, it must be
>> undone by a corresponding 'icc_put()' call.
>
> This works, but why not switch to devm_of_icc_get() instead?
>
Because I was not aware of devm_of_icc_get :)

I'll send a V2.

Thanks for the review and the feedback.

CJ


> Thanks,
> Georgi
>
>>
>> Add it in the error handling path of the probe function as already 
>> done in
>> the remove function.
>>
>> Fixes: 32f0a6ddc8c9 ("media: venus: Use on-chip interconnect API")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/media/platform/qcom/venus/core.c | 31 +++++++++++++++++-------
>>   1 file changed, 22 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>> b/drivers/media/platform/qcom/venus/core.c
>> index 0bde19edac86..8fd5da941067 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -200,27 +200,35 @@ static int venus_probe(struct platform_device 
>> *pdev)
>>           return PTR_ERR(core->video_path);
>>         core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
>> -    if (IS_ERR(core->cpucfg_path))
>> -        return PTR_ERR(core->cpucfg_path);
>> +    if (IS_ERR(core->cpucfg_path)) {
>> +        ret = PTR_ERR(core->cpucfg_path);
>> +        goto err_video_path_put;
>> +    }
>>         core->irq = platform_get_irq(pdev, 0);
>> -    if (core->irq < 0)
>> -        return core->irq;
>> +    if (core->irq < 0) {
>> +        ret = core->irq;
>> +        goto err_cpucfg_path_put;
>> +    }
>>         core->res = of_device_get_match_data(dev);
>> -    if (!core->res)
>> -        return -ENODEV;
>> +    if (!core->res) {
>> +        ret = -ENODEV;
>> +        goto err_cpucfg_path_put;
>> +    }
>>         mutex_init(&core->pm_lock);
>>         core->pm_ops = venus_pm_get(core->res->hfi_version);
>> -    if (!core->pm_ops)
>> -        return -ENODEV;
>> +    if (!core->pm_ops) {
>> +        ret = -ENODEV;
>> +        goto err_cpucfg_path_put;
>> +    }
>>         if (core->pm_ops->core_get) {
>>           ret = core->pm_ops->core_get(dev);
>>           if (ret)
>> -            return ret;
>> +            goto err_cpucfg_path_put;
>>       }
>>         ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
>> @@ -305,6 +313,11 @@ static int venus_probe(struct platform_device 
>> *pdev)
>>   err_core_put:
>>       if (core->pm_ops->core_put)
>>           core->pm_ops->core_put(dev);
>> +err_cpucfg_path_put:
>> +    icc_put(core->cpucfg_path);
>> +err_video_path_put:
>> +    icc_put(core->video_path);
>> +
>>       return ret;
>>   }
>>
