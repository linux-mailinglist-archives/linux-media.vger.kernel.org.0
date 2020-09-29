Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7577F27CA33
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 14:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732085AbgI2MRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 08:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731862AbgI2MRA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 08:17:00 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFE6C0613D1
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 05:16:59 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id n13so6065173edo.10
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 05:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WmQ4HXFZOiQNgwplnNphS1aF43ZxufpXoarc3usGdEM=;
        b=qpKdWznEoF0VXNEXTayLjtsb2T+jAgRhbs/Zn/wYm6lpxIzMUgO8OS1OwVkbrPgcjq
         C64VyNgFzie4RdTaGZ5U03PUJ2/kRUJTZ/OI2HJi+dC8TWHvKyHQwBxig86wTzJsQntR
         OGaWIeqcGWN7uiIhW4KY9EIF1VzVVFgTOeQLtVADHY+PkGNt69YEYEI7rif8U42S02Rt
         i86vmYCPL3srS5mRbmElsm3INvC4TsXuCxmrqsJ6mM7TCAkJmIx52uSTmUZOl9lgAdcK
         dwKHaRWJMXJ1pnq6hKGzJWm+apPp/zaAmZI31iGgF55sAAHqOWYJWAysdSABbAdLTsaQ
         ic5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WmQ4HXFZOiQNgwplnNphS1aF43ZxufpXoarc3usGdEM=;
        b=PavF+PtbQbQVq8DqAnYkpywcI+PJB8kimejI2ThqPuZI7H8+WI+jg8fetXpQRUsMdt
         ovtJoESyauy9tuJ96xXWh0lBo1m1IjTFsagdetr3Q5WMTSLN46VDGVntBOJXYFa8EB07
         MpH+UBCDLy2d/c04HVZL9fID3cDED/KY9E57oj8u2f/AT2gDaSQcHLcu7CGVowzO3366
         opIaFPWORwrhDsr96fwyK5Iv44bh+2ej+grDQO+vS7vO5fIeHBxYEklpuEXhzQHXzQa0
         hj4wPvl3MM7Sok5GdAAhx++SI3OmuzOCx54lAAZkjocFvh12uRD0dcnB8aakINOSxkyW
         RpKg==
X-Gm-Message-State: AOAM5337dDYzpyh8XZ6ocZwLhwlELiPdhJuC9Ne10K0RmSLOmI12dbwL
        zBRJjY4o6q7SR0hpWttaj8hUbXxpnWc/bxor
X-Google-Smtp-Source: ABdhPJzQa153E1Rkgt87UDJf1vE8rz6Hpi0RQZdQQDSXy+J5iH/wwvNOr9/UrScWq8FHFcEgYstltA==
X-Received: by 2002:a05:6402:6c1:: with SMTP id n1mr2958666edy.215.1601381818107;
        Tue, 29 Sep 2020 05:16:58 -0700 (PDT)
Received: from [192.168.1.7] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id r16sm5120171ejb.110.2020.09.29.05.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 05:16:57 -0700 (PDT)
Subject: Re: [RESEND v3 2/4] venus: core: vote for video-mem path
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, swboyd@chromium.org
References: <1601262496-27026-1-git-send-email-mansur@codeaurora.org>
 <1601262496-27026-3-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <339d0c7e-a5ba-400d-e733-3ede8d20dc7f@linaro.org>
Date:   Tue, 29 Sep 2020 15:16:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1601262496-27026-3-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mansur,

On 9/28/20 6:08 AM, Mansur Alisha Shaik wrote:
> Currently video driver is voting for venus0-ebi path during buffer
> processing with an average bandwidth of all the instances and
> unvoting during session release.
> 
> While video streaming when we try to do XO-SD using the command
> "echo mem > /sys/power/state command" , device is not entering
> to suspend state and from interconnect summary seeing votes for venus0-ebi
> 
> Corrected this by voting for venus0-ebi path in venus_runtime_resume()
> and unvote during venus_runtime_suspend().
> 
> Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")

In fact all changes in this series are related to interconnect. The
interconnect calls are moved to venus_runtime_suspend/resume by commit
[1], that's why I think the Fixes: tag for all patches in this series
should be [1].

[1] 07f8f22a33a9e ("media: venus: core: remove CNOC voting while device
suspend")

> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 52a3886..fa363b8 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -363,7 +363,18 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  
>  	ret = icc_set_bw(core->cpucfg_path, 0, 0);
>  	if (ret)
> -		return ret;
> +		goto err_cpucfg_path;
> +
> +	ret = icc_set_bw(core->video_path, 0, 0);
> +	if (ret)
> +		goto err_video_path;
> +
> +	return ret;
> +
> +err_video_path:
> +	icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
> +err_cpucfg_path:
> +	pm_ops->core_power(dev, POWER_ON);
>  
>  	return ret;
>  }
> @@ -374,6 +385,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	const struct venus_pm_ops *pm_ops = core->pm_ops;
>  	int ret;
>  
> +	ret = icc_set_bw(core->video_path, 0, kbps_to_icc(1000));
> +	if (ret)
> +		return ret;
> +
>  	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
>  	if (ret)
>  		return ret;
> 

-- 
regards,
Stan
