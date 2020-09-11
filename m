Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720B7265D70
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 12:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgIKKLI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 06:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgIKKLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 06:11:01 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46188C061756
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 03:11:01 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id i1so9384345edv.2
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 03:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=34lVXXsxtskqjri1vjJe9bVZAHnv49AB0SP0UfxscAE=;
        b=Ep6Ra3o7gNv7Sft87tKmodUvRTKK+yEtXMzzNto1Yt1KesamA6xMs/S8zhwDMqRqsy
         cj3Xa5rWmXFkJEe7xzlnmIgOsD7z66jKkNHSMokMcCKrVVp9+1zmIDltdzx6TwFgDYrq
         LU+HqA9msWRajaHgwLojKB8QzqVvOB8SEUGs6NiU6ZLnDPpDt6pExPXBwtY15fQilO0P
         HcvPgWWEQQPtnWxXe2sGuxjoDQI4zzcdIoTfMUlBVsawGUYH41ceY9cjxfJdBeJypwbg
         8M8O8Kr+y5byUjtX2u5dU92/znvOXk9SWOBv842iUW6A3ys6nEz0JhaKnJ+Bilt7QaOc
         AaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=34lVXXsxtskqjri1vjJe9bVZAHnv49AB0SP0UfxscAE=;
        b=mT/rE5HQ/LSRYzoJToeh/zSpFdjf4pYVLUpok/MX101epViUvr+gTahocnXdWlnnf/
         TLid8mBP2UEKU3GRsa78ZuzL6chqalgFWfj+l2bB7W7Hf3oDys9OjjSryVwNMlZ/AC8b
         zojOgbd70h62fdOFo4SZloOI/iyP4rXqHH3f2w6QmP/3ndQLJMk5xoPFzJEMI6rjFOdh
         feg8pVn2oMOdqsPbYOUGYYUZsvINHVXr+Ulw8hpD9TQ7eFnGX04Vku00hoDYtEKzflQ0
         SX95nxrOpCaAOe52EeIKNP104+o2nXaTCeng63bNM9tg+FGWkfkTjUkIGl/zsNXGsGYz
         oEUg==
X-Gm-Message-State: AOAM530xqWjzTFH0f7WeB8CnMRtPShjMKhcFHa7LSqdYfEafrCh+nFoC
        5yBq2xemksvr7EhW4PJtMOhiaA==
X-Google-Smtp-Source: ABdhPJwUlDEUap6H+NlyZak20h496rC1EI12mA9SUu9rpIVPvh2Z9ra+5EHTo2BjIraFgIG9zA+t2Q==
X-Received: by 2002:a05:6402:1109:: with SMTP id u9mr1212483edv.74.1599819059554;
        Fri, 11 Sep 2020 03:10:59 -0700 (PDT)
Received: from [192.168.1.8] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id v2sm1227241ejh.57.2020.09.11.03.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 03:10:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] venus: core: handle race condititon for core ops
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
 <1599741856-16239-2-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <313cf565-f69f-df84-6bff-8c9a77b9f642@linaro.org>
Date:   Fri, 11 Sep 2020 13:10:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1599741856-16239-2-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/10/20 3:44 PM, Mansur Alisha Shaik wrote:
> For core ops we are having only write protect but there
> is no read protect, because of this in multthreading
> and concurrency, one CPU core is reading without wait
> which is causing the NULL pointer dereferece crash.
> 
> one such scenario is as show below, where in one CPU
> core, core->ops becoming NULL and in another CPU core
> calling core->ops->session_init().
> 
> CPU: core-7:
> Call trace:
>  hfi_session_init+0x180/0x1dc [venus_core]
>  vdec_queue_setup+0x9c/0x364 [venus_dec]
>  vb2_core_reqbufs+0x1e4/0x368 [videobuf2_common]
>  vb2_reqbufs+0x4c/0x64 [videobuf2_v4l2]
>  v4l2_m2m_reqbufs+0x50/0x84 [v4l2_mem2mem]
>  v4l2_m2m_ioctl_reqbufs+0x2c/0x38 [v4l2_mem2mem]
>  v4l_reqbufs+0x4c/0x5c
> __video_do_ioctl+0x2b0/0x39c
> 
> CPU: core-0:
> Call trace:
>  venus_shutdown+0x98/0xfc [venus_core]
>  venus_sys_error_handler+0x64/0x148 [venus_core]
>  process_one_work+0x210/0x3d0
>  worker_thread+0x248/0x3f4
>  kthread+0x11c/0x12c
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
> Changes in V2:
> - Addressed review comments by stan by validating on top
> - of https://lore.kernel.org/patchwork/project/lkml/list/?series=455962
> 
>  drivers/media/platform/qcom/venus/hfi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index a59022a..3137071 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -195,7 +195,7 @@ EXPORT_SYMBOL_GPL(hfi_session_create);
>  int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>  {
>  	struct venus_core *core = inst->core;
> -	const struct hfi_ops *ops = core->ops;
> +	const struct hfi_ops *ops;
>  	int ret;
>  

If we are in system error recovery the session_init cannot pass
successfully, so we exit early in the function.

I'd suggest to make it:

	/* If core shutdown is in progress or we are in system error 	recovery,
return an error */
	mutex_lock(&core->lock);
	if (!core->ops || core->sys_error) {
		mutex_unclock(&core->lock);
		return -EIO;
	}
	mutex_unclock(&core->lock);
		
>  	if (inst->state != INST_UNINIT)
> @@ -204,10 +204,13 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>  	inst->hfi_codec = to_codec_type(pixfmt);
>  	reinit_completion(&inst->done);
>  
> +	mutex_lock(&core->lock);
> +	ops = core->ops;
>  	ret = ops->session_init(inst, inst->session_type, inst->hfi_codec);
>  	if (ret)
>  		return ret;
>  
> +	mutex_unlock(&core->lock);
>  	ret = wait_session_msg(inst);
>  	if (ret)
>  		return ret;
> 

-- 
regards,
Stan
