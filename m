Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BC624D364
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgHUK7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbgHUK7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:59:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB827C061387
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:59:19 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d16so1519219wrq.9
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DWzJKlBqj+ETWply20oeGR0JgeiRlkCiLTUFUHWKjwM=;
        b=t0xTV4U5Td+eNmIlxf/eYJMwt6PF+n8ubRnrhCalOEdOmfkSGplkjY6rk7G7YMJp9M
         ttb+fHztHJU8Njmagfi4u0RwDggXF+idcAqS8fFX59ngKxvaHR9ui3rkh2PeC+qsYTe7
         zOqpqeYUu3K/+5IfwW8Wqy2BmCucDDFNid4wNi2cjW0cNu2b0wmmLcxpVKxkajvmt8SS
         1DBWF+oGtOV22bFuUjQul4vMlE87WMCDq678RNgjOCS0bmM51QlBijlTDx4h2+8CNS+C
         2lf8BzGi/iAZG/oU2+rsbDHZtaVmM8bBLwgTIUdhTSR4puGmlQ0kF/7oTJILCylrtLlb
         PCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DWzJKlBqj+ETWply20oeGR0JgeiRlkCiLTUFUHWKjwM=;
        b=YILLmGHaJLcuWpca6u40tRqy94ZYQvoIql//Oj7Ev+4x9oSj+kAMkc0CRiebq7J4Dh
         v/R+mmi24guY99TMjxyGtto+bEa+vYjYbE7t3csQVJ3pfk+5dVtYHxIUWwxPdG4Gva93
         FhL9Iah6ucosDidatzIXPj+edMzQySBFxSFmaYwrA444dEIioCjJbiGxB69yAVAbAzUF
         lbzcOnDYtKhoFUildhTPg4zzURXQHlIsmLPrKeafj739jSzHaPjvFwXmrQWb5Zi3KmpY
         iTJZk0z6lavDYxtGLe7uynSkUXCb9zS0YpXy2IbQDnij9i4kxrqdf87UcdoTDQozN/JM
         mpXA==
X-Gm-Message-State: AOAM531DM8fKf/SdHu9h3DxxRwYxIPkxUhR8j84sz7/qJkQMRWoADFk4
        E9bnX50WR2un2yi7sl23R1DoQQ==
X-Google-Smtp-Source: ABdhPJyY91m5m50oqY/49f1quJLC58SElhlHSiO5ugma7tofFe6F3B2uD1UvxWhhzS5KOCn3NxNLsg==
X-Received: by 2002:adf:c7ca:: with SMTP id y10mr2332284wrg.255.1598007558028;
        Fri, 21 Aug 2020 03:59:18 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id z207sm4976739wmc.2.2020.08.21.03.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 03:59:17 -0700 (PDT)
Subject: Re: [RESEND 1/3] venus: core: handle race condititon for core ops
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
 <1596781478-12216-2-git-send-email-mansur@codeaurora.org>
 <dc1f37ed-3786-5bb2-3763-368b0165478b@linaro.org>
Message-ID: <ef0d6eb2-1834-f4de-7eb2-aad665fc69e4@linaro.org>
Date:   Fri, 21 Aug 2020 13:59:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc1f37ed-3786-5bb2-3763-368b0165478b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mansur,

On 8/10/20 12:50 PM, Stanimir Varbanov wrote:
> Hi Mansur,
> 
> Thanks for the patches!
> 
> On 8/7/20 9:24 AM, Mansur Alisha Shaik wrote:
>> For core ops we are having only write protect but there
>> is no read protect, because of this in multthreading
>> and concurrency, one CPU core is reading without wait
>> which is causing the NULL pointer dereferece crash.
>>
>> one such scenario is as show below, where in one
>> core core->ops becoming NULL and in another core
>> calling core->ops->session_init().
>>
>> CPU: core-7:
>> Call trace:
>>  hfi_session_init+0x180/0x1dc [venus_core]
>>  vdec_queue_setup+0x9c/0x364 [venus_dec]
>>  vb2_core_reqbufs+0x1e4/0x368 [videobuf2_common]
>>  vb2_reqbufs+0x4c/0x64 [videobuf2_v4l2]
>>  v4l2_m2m_reqbufs+0x50/0x84 [v4l2_mem2mem]
>>  v4l2_m2m_ioctl_reqbufs+0x2c/0x38 [v4l2_mem2mem]
>>  v4l_reqbufs+0x4c/0x5c
>> __video_do_ioctl+0x2b0/0x39c
>>
>> CPU: core-0:
>> Call trace:
>>  venus_shutdown+0x98/0xfc [venus_core]
>>  venus_sys_error_handler+0x64/0x148 [venus_core]
>>  process_one_work+0x210/0x3d0
>>  worker_thread+0x248/0x3f4
>>  kthread+0x11c/0x12c
>>
>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 2 +-
>>  drivers/media/platform/qcom/venus/hfi.c  | 5 ++++-
>>  2 files changed, 5 insertions(+), 2 deletions(-)

See below comment, otherwise:

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 203c653..fe99c83 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -64,8 +64,8 @@ static void venus_sys_error_handler(struct work_struct *work)
>>  	pm_runtime_get_sync(core->dev);
>>  
>>  	hfi_core_deinit(core, true);
>> -	hfi_destroy(core);
>>  	mutex_lock(&core->lock);
>> +	hfi_destroy(core);
> 
> As my recovery fixes [1] touches this part also, could you please apply
> them on top of yours and re-test?

I'll drop above chunk from the patch because it is already taken into
account in my recovery fixes series and queue up the patch for v5.10.

> 
> Otherwise this patch looks good to me.
> 
> [1] https://www.spinics.net/lists/linux-arm-msm/msg70092.html
> 
>>  	venus_shutdown(core);
>>  
>>  	pm_runtime_put_sync(core->dev);
>> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
>> index a211eb9..2eeb31f 100644
>> --- a/drivers/media/platform/qcom/venus/hfi.c
>> +++ b/drivers/media/platform/qcom/venus/hfi.c
>> @@ -195,7 +195,7 @@ EXPORT_SYMBOL_GPL(hfi_session_create);
>>  int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>>  {
>>  	struct venus_core *core = inst->core;
>> -	const struct hfi_ops *ops = core->ops;
>> +	const struct hfi_ops *ops;
>>  	int ret;
>>  
>>  	if (inst->state != INST_UNINIT)
>> @@ -204,10 +204,13 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>>  	inst->hfi_codec = to_codec_type(pixfmt);
>>  	reinit_completion(&inst->done);
>>  
>> +	mutex_lock(&core->lock);
>> +	ops = core->ops;
>>  	ret = ops->session_init(inst, inst->session_type, inst->hfi_codec);
>>  	if (ret)
>>  		return ret;
>>  
>> +	mutex_unlock(&core->lock);
>>  	ret = wait_session_msg(inst);
>>  	if (ret)
>>  		return ret;
>>
> 

-- 
regards,
Stan
