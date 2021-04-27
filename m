Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA9A36C086
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 10:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbhD0IHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 04:07:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230348AbhD0IHS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 04:07:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A56B261289;
        Tue, 27 Apr 2021 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619510795;
        bh=uDqPXc72hL4aKi2U6+mtvOcmn5lhmGyP0bhksbuvE9Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ayD8QkQDQGRBR36w01ROgZE2eWW1yO3dh7mBaWtwJnt+PFf1oheG6EwMvqdxdbOhT
         cJ3g8Ok6jFCFhHJidRZmX3PuF/k/ZR5unL1eJ2ILyL/96nWqq7yh3VQaOu3Q0ek1Rt
         WGJx2vOpRQQ1iZL6/iIpKcFj5onx4WtX+4ngNLu+GFqxMRz1AW/Dyo9bnSxBainHa+
         2rErKGsFVd44GwLCxAHSVCly+83Vd/3iSxUXVkQhmQV70yyPPOVaLCcGMR44AbGHja
         /LEMlMhJdQDXbMkE9NPg8XG4tQoaYqiTmKqYFroVSre3NaQyo6562hL/ynCIpruE3p
         8PVbUMJ5oeMnA==
Subject: Re: [PATCH 57/78] media: exynos4-is: use pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <091915bb1cbec13b566d129f85ae229fcb92e2e4.1619191723.git.mchehab+huawei@kernel.org>
 <45068e81-8f9b-fea8-b7bc-bdd0443ba7e6@kernel.org>
 <20210426151224.2b677d1b@coco.lan>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <1a98b4b7-78c2-810d-a4ba-762c1a9576b3@kernel.org>
Date:   Tue, 27 Apr 2021 10:06:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210426151224.2b677d1b@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.04.2021 15:12, Mauro Carvalho Chehab wrote:
> Em Sun, 25 Apr 2021 22:57:25 +0200
> Sylwester Nawrocki <snawrocki@kernel.org> escreveu:
> 
>> On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:
>>> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
>>> added pm_runtime_resume_and_get() in order to automatically handle
>>> dev->power.usage_count decrement on errors.
>>>
>>> Use the new API, in order to cleanup the error check logic.
>>>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

>>> diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
>>> index 972d9601d236..bca35866cc74 100644
>>> --- a/drivers/media/platform/exynos4-is/fimc-is.c
>>> +++ b/drivers/media/platform/exynos4-is/fimc-is.c
>>> @@ -828,7 +828,7 @@ static int fimc_is_probe(struct platform_device *pdev)
>>>    			goto err_irq;
>>>    	}
>>>    
>>> -	ret = pm_runtime_get_sync(dev);
>>> +	ret = pm_runtime_resume_and_get(dev);
>>>    	if (ret < 0)
>>>    		goto err_pm;
>>
>> It seems you intended to use err_suspend label here. We don't need
>> a new label though, instead of err_pm we can jump to err_irq when
>> pm_runtime_resume_and_get() fails.
> 
> Thanks! Will fix at the next version.
> 
>> Note that when runtime PM is
>> disabled pm_runtime_resume_and_get() always returns 0.
> 
> Ok, but there are a couple of conditions at rpm_resume() function
> at drivers/base/power/runtime.c (which is the code that actually
> handles those PM macros) that could make it to return errors,
> which are independent on the PM callbacks, like those:
> 
>          if (dev->power.runtime_error)
>                  retval = -EINVAL;
>          else if (dev->power.disable_depth > 0)
>                  retval = -EACCES;
> 
> and more might be added as the PM core changes.

Right, I looked only at !CONFIG_PM case, this is what the "if (!pm_runtime_enabled(dev))"
test and explicit fimc_is_runtime_{resume,suspend} calls were originally for.
Agreed, better not to rely too much on internal implementation as there is
no specific guarantees about return value at the API documentation.

Regards,
Sylwester

>>> @@ -862,6 +862,7 @@ static int fimc_is_probe(struct platform_device *pdev)
>>>    	fimc_is_unregister_subdevs(is);
>>>    err_pm:
>>>    	pm_runtime_put_noidle(dev);
>>> +err_suspend:
>>>    	if (!pm_runtime_enabled(dev))
>>>    		fimc_is_runtime_suspend(dev);
>>>    err_irq:
>>
