Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF01C277C34
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 01:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgIXXLQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 19:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgIXXLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 19:11:15 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE77C0613CE
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 16:11:15 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id w2so1063987wmi.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 16:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2W5GfROT2ywvdVHXg3kVe/f8IQ60BJx7ZZO+5tSrV0o=;
        b=xT0cYXCnnIQOO4dPaV6raNdKraovBxs6izlFewfphndLD9GXgYp2a9mk8I2U+z1vlp
         ZsJ3qFNTXi72PQyFz7i6Yuu8onhC9rohuhw1tS8DUNHhkefE9u0B3HnWXv1mZNif+aLv
         AkBt6fjkoErMGG9Fuly7/TOCB/JAtB2vh93MrfnvWzCwXlodmzYXf6W837Iz0j1fHwjy
         dUhce4/dOv4XrY6kbxPQreDzi4ylLqjLh44AmfIpaz9vxJpdTW8yfwUg3yfkLmsMnsfe
         t+nE3+aHL3N9KBR1dNcbDHajjNl0YHSktLluY2cm2ZvChkdWWy9/AoxkyITN64S3wsct
         gwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2W5GfROT2ywvdVHXg3kVe/f8IQ60BJx7ZZO+5tSrV0o=;
        b=CYIploIPjyy5j6jEZoTj2ews6/Fxzc8hcV3zpMYaY8fJPHguk3r78tIc89QtBPx2UX
         OkLs3qB1Kauyw7/ngJHdGNYzL1u+jmBoEEdgWkRik4X1owhQNV7FtkyF9VRmj29AGzkJ
         uLOx2sJ6NnoVcg+uqKW7YSuCRYjBaTXY+VTbOeDJFjqTW0nYw/MQjgNdC3M4f+fIa5UN
         RYe/EZD8hRtman3vJRKgg/C6dZeo+2EMlxBqfvo28z7m82HXk4tBcCI3Gr7VvcRAGpBg
         Kmu9y4cw0axE5D9errZvxaeGUKR+9EDzNuZeh0TZYFWr3Wppw6cqMduVQgqnFID9XNFW
         irRg==
X-Gm-Message-State: AOAM533UmZLn2BBNt1YP/EpeIEOEp0eMV8U65ugflt9mocWD6JJZaHAv
        bfWcTeVb8Jmuz2TjL27rdnQ81Q==
X-Google-Smtp-Source: ABdhPJzfbymChHh9GTOGEwo12Z0OSMWzK4gS2Gg9nF+35xC/ZV142dMkNHCtIUkP+SemxI2yLaNsTw==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr882333wmh.93.1600989074117;
        Thu, 24 Sep 2020 16:11:14 -0700 (PDT)
Received: from [192.168.1.7] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id g14sm676116wrv.25.2020.09.24.16.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 16:11:13 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] venus: core: change clk enable and disable order
 in resume and suspend
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1600930266-9668-1-git-send-email-mansur@codeaurora.org>
 <1600930266-9668-2-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <afd16a0e-30d9-ecf2-f40b-f85f7500efc6@linaro.org>
Date:   Fri, 25 Sep 2020 02:11:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600930266-9668-2-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mansur,

On 9/24/20 9:51 AM, Mansur Alisha Shaik wrote:
> Currently video driver is voting after clk enable and un voting
> before clk disable. This is incorrect, video driver should vote
> before clk enable and unvote after clk disable.
> 
> Corrected this by changing the order of clk enable and clk disable.
> 
> Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")

The Fixes tag is incorrect. It should be

07f8f22a33a9e ("media: venus: core: remove CNOC voting while device
suspend")

> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 6103aaf..52a3886 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -355,13 +355,16 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	if (pm_ops->core_power) {
> +		ret = pm_ops->core_power(dev, POWER_OFF);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = icc_set_bw(core->cpucfg_path, 0, 0);
>  	if (ret)
>  		return ret;
>  
> -	if (pm_ops->core_power)
> -		ret = pm_ops->core_power(dev, POWER_OFF);
> -
>  	return ret;
>  }
>  
> @@ -371,16 +374,16 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	const struct venus_pm_ops *pm_ops = core->pm_ops;
>  	int ret;
>  
> +	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> +	if (ret)
> +		return ret;
> +
>  	if (pm_ops->core_power) {
>  		ret = pm_ops->core_power(dev, POWER_ON);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> -	if (ret)
> -		return ret;
> -
>  	return hfi_core_resume(core, false);
>  }
>  
> 

-- 
regards,
Stan
