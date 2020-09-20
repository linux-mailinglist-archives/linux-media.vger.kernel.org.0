Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DE9271827
	for <lists+linux-media@lfdr.de>; Sun, 20 Sep 2020 23:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgITVPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Sep 2020 17:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgITVPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Sep 2020 17:15:10 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6320DC0613CE
        for <linux-media@vger.kernel.org>; Sun, 20 Sep 2020 14:15:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a17so10701393wrn.6
        for <linux-media@vger.kernel.org>; Sun, 20 Sep 2020 14:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9CU2EjTUwLMcNn8A3UL/NL0gruPnYu0oOPGVbodx7bE=;
        b=qz+a8nl9QSn6DWAo8OZpA0pFZpoSxBrezeQ7eRxCkgaS1rfIyrjJajeaLJdpgmXHU7
         j8iRtqJ2YCjUTKzOzKQYrcZ8lAi+AA2v9dDu36QrnYh8B5haMM5WmDcDUHpyl9xGpFSh
         7dhNN6seu+lCoZNyxjBxzL/P7WSSb92mEqLXC5cnsfTwpdYCd5SsZzd5eQSwNdcYgYCE
         29Zas4tv9mjJiVKDTM0qIpROAVnD+o2ejGROazpeOSfPWdUiCXQ1SibrZmS9vdffHtZ+
         YxAXY9oTbH+/NhjwzjwKJEzFN/lD/d4t3YdjxpM7X10b5OYutV5pxWlVAZFpCiBpAsdm
         kmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9CU2EjTUwLMcNn8A3UL/NL0gruPnYu0oOPGVbodx7bE=;
        b=SorMepTP3pYyigAdaejnihf9P+/66V4BnTk3/fTfXEPhhDDcOtUnAFGC6ITDejMCF4
         lYKy/mLbCAyh5IPMbkW/MIY/z/gTFa7fbTgIRKds+S4g86V7vmZApXGc0szJMSSXdp7m
         /5Ban7tluuf7M1GJvhv0Y1fTByrXTjLhw1dYO2j1on5lNrnJ2DNZARNYuAPh4qCSBp0R
         lzyITZMPIU5NTnFQ8DhTt1ehhofsBdeqZNTznWWmOVSSZKmsrVQi1iEgxCjdg225R6h2
         WMgUuwyjwaginrTD2YP16GypVMukPQYl0yJpFWeG/iQ3uMHEsETciEN5igqYKe8lqoGf
         ISog==
X-Gm-Message-State: AOAM533DEcNFvanoyxBBEwMs2+st6JbvDBaNj1ajyVPK3IdWwQqjY42i
        NJI7ItAwodntidGDjL9A4lhKyfms4jBvAr5e
X-Google-Smtp-Source: ABdhPJyCzrkAdv/OZHBBpMfWB9nvuq9pXcdy3H3bhtB1S+iRTg7OUg5I9rSlXqRaWB9xgT56UzWU6g==
X-Received: by 2002:adf:8162:: with SMTP id 89mr50836116wrm.237.1600636509020;
        Sun, 20 Sep 2020 14:15:09 -0700 (PDT)
Received: from [192.168.1.8] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id d2sm17087730wro.34.2020.09.20.14.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 14:15:08 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] venus: core: handle race condititon for core ops
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1600246174-31802-1-git-send-email-mansur@codeaurora.org>
 <1600246174-31802-2-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <322d36e9-b79d-7388-3f0d-ac5b5b4bf222@linaro.org>
Date:   Mon, 21 Sep 2020 00:15:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600246174-31802-2-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/16/20 11:49 AM, Mansur Alisha Shaik wrote:
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
> Changes in V4:
> - Addressed review comments by Stan in patch series 
>   https://lore.kernel.org/patchwork/patch/1303678/
>   and combining this change along with shutdown callback
>   as we are facing race conditions with shutdown callback
> 
>  drivers/media/platform/qcom/venus/hfi.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index a59022a..58d4c06 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -195,19 +195,34 @@ EXPORT_SYMBOL_GPL(hfi_session_create);
>  int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>  {
>  	struct venus_core *core = inst->core;
> -	const struct hfi_ops *ops = core->ops;
> +	const struct hfi_ops *ops;
>  	int ret;
>  
> +	/*
> +	 * If core shutdown is in progress or if we are in system
> +	 * recovery, return an error as during system error recovery
> +	 * session_init() can't pass successfully
> +	 */
> +	mutex_lock(&core->lock);
> +	if (!core->ops || core->sys_error) {
> +		mutex_unlock(&core->lock);
> +		return -EIO;
> +	}
> +	mutex_unlock(&core->lock);
> +
>  	if (inst->state != INST_UNINIT)
>  		return -EINVAL;
>  
>  	inst->hfi_codec = to_codec_type(pixfmt);
>  	reinit_completion(&inst->done);
>  
> +	mutex_lock(&core->lock);
> +	ops = core->ops;

This is not needed because we check core->ops for NULL under mutex held
at the beginning of the function. Just keep ops initialization as it is
in the original code.

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
