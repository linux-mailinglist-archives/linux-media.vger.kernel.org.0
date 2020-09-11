Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91420265DAF
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 12:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgIKKWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 06:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgIKKWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 06:22:16 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2DFC061756
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 03:22:15 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id i26so13050732ejb.12
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q5TuOzWPBGiSsyb4o4mJQioDjYLBJEgj58DZR6YxrG4=;
        b=CwKuo4Nv/8JyY5hUXKIT//4rGAkOyaglLunRPd9cqkiDIQSvN4Hn7YH++P7b07mW+e
         4Uhvd4RCFIipFKanq5M7yMvVWxILaVydW/rM7ITtdJK66/t6yQKvyRL/IzB3NVFS29L9
         o8b2xmy+weCNV8swpXbeGyhfJQNVb+jbrdtQfFkdTkRy+QAOVrJ9NEh3ucXMtR+ErQIk
         7Gjfb8J081ZGU2/yo0hc0YEcrymXmkARcYnFl+1uELqwAo7IUB4aptDqM94X6KkSUnm3
         E7K1/8oWcTgnlZg3hRIvkoa6GouECCG8Hx6eWBTx2iyy05PvbgB7YBKUectCXmJqBhZ8
         tenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q5TuOzWPBGiSsyb4o4mJQioDjYLBJEgj58DZR6YxrG4=;
        b=Yl3mnZjXpzlcoH9HrVVvB6U1rAlkfA/j0+MA0zauY1udcJUVcPny+mPfI77dEpjz/n
         WwjoGe6/ve4+WXsoDIaQyiTV7QJoxmC3JIwQj398tc21wlDHKQPsqTD0cT5zioGc78D7
         j92emzSyuVNVjhnBHDc2wTg3nj8e9m7RA6rClJELF/RdKVCQ2FfYDDvpJUuGsY8OOg3g
         lgSww9KaFUhrVBmg2636YB+hq/pzA1M40jq8z7Kz7JurRvMi5t+ryrBMTOZ3IDiLai0B
         JpjF065bVQ7mQB2kRngUc/YdW/SCzr3ExSFhgIpqIB6Tyf43z35YY0QP1sSx9hVJJRgi
         xS0Q==
X-Gm-Message-State: AOAM533EBjPWWFz8xK5MRcYomrZpsb6bmabcCbPyvMSmVFfXwAKmHwp+
        y1FP4DPuctqH839xe7urgSg89A==
X-Google-Smtp-Source: ABdhPJxtE2iaRZJ8Rh3wP2kRpbArRAcEM9cx7JbseHSgnktjoKleNKIgHjpLBpcv3pl9XDO1+tFCOw==
X-Received: by 2002:a17:906:250a:: with SMTP id i10mr1332513ejb.202.1599819734215;
        Fri, 11 Sep 2020 03:22:14 -0700 (PDT)
Received: from [192.168.1.8] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id w8sm1289197ejo.117.2020.09.11.03.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 03:22:13 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] venus: core: cancel pending work items in
 workqueue
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
 <1599741856-16239-3-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <a96d7cce-2781-e3d6-6238-8fec411511a1@linaro.org>
Date:   Fri, 11 Sep 2020 13:22:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1599741856-16239-3-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/10/20 3:44 PM, Mansur Alisha Shaik wrote:
> In concurrency usecase and reboot scenario we are
> observing race condition and seeing NULL pointer
> dereference crash. In shutdown path and system
> recovery path we are destroying the same mutex
> hence seeing crash.
> 
> This case is handled by mutex protection and
> cancel delayed work items in work queue.
> 
> Below is the call trace for the crash
> Call trace:
>  venus_remove+0xdc/0xec [venus_core]
>  venus_core_shutdown+0x1c/0x34 [venus_core]
>  platform_drv_shutdown+0x28/0x34
>  device_shutdown+0x154/0x1fc
>  kernel_restart_prepare+0x40/0x4c
>  kernel_restart+0x1c/0x64
> 
> Call trace:
>  mutex_lock+0x34/0x60
>  venus_hfi_destroy+0x28/0x98 [venus_core]
>  hfi_destroy+0x1c/0x28 [venus_core]

I queued up [1] and after it this cannot happen anymore because
hfi_destroy() is not called by venus_sys_error_handler().

So I guess this patch is not needed anymore.

[1] https://www.spinics.net/lists/linux-arm-msm/msg70092.html

>  venus_sys_error_handler+0x60/0x14c [venus_core]
>  process_one_work+0x210/0x3d0
>  worker_thread+0x248/0x3f4
>  kthread+0x11c/0x12c
>  ret_from_fork+0x10/0x18
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index c5af428..69aa199 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -323,6 +323,8 @@ static int venus_remove(struct platform_device *pdev)
>  	struct device *dev = core->dev;
>  	int ret;
>  
> +	cancel_delayed_work_sync(&core->work);
> +
>  	ret = pm_runtime_get_sync(dev);
>  	WARN_ON(ret < 0);
>  
> @@ -340,7 +342,9 @@ static int venus_remove(struct platform_device *pdev)
>  	if (pm_ops->core_put)
>  		pm_ops->core_put(dev);
>  
> +	mutex_lock(&core->lock);
>  	hfi_destroy(core);
> +	mutex_unlock(&core->lock);
>  
>  	icc_put(core->video_path);
>  	icc_put(core->cpucfg_path);
> 

-- 
regards,
Stan
