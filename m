Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A8344D905
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 16:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbhKKPT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 10:19:58 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:50845 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233903AbhKKPTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 10:19:54 -0500
Received: from [192.168.1.18] ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id lBp1mqreTS9NTlBp1m0wNx; Thu, 11 Nov 2021 16:17:04 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 11 Nov 2021 16:17:04 +0100
X-ME-IP: 86.243.171.122
Subject: Re: [PATCH] media: venus: core: Fix a potential NULL pointer
 dereference in an error handling path
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        mansur@codeaurora.org, swboyd@chromium.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <e8017bbe72a9cd7f663fb42ada5eb1e174b807bd.1628716867.git.christophe.jaillet@wanadoo.fr>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <d32de013-786c-cc43-4793-6753de16a160@wanadoo.fr>
Date:   Thu, 11 Nov 2021 16:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e8017bbe72a9cd7f663fb42ada5eb1e174b807bd.1628716867.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 12/08/2021 à 07:14, Christophe JAILLET a écrit :
> The normal path of the function makes the assumption that
> 'pm_ops->core_power' may be NULL.
> We should make the same assumption in the error handling path or a NULL
> pointer dereference may occur.
> 
> Add the missing test before calling 'pm_ops->core_power'
> 
> Fixes: 9e8efdb57879 ("media: venus: core: vote for video-mem path")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/media/platform/qcom/venus/core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 91b15842c555..84cd92628cfd 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -472,7 +472,8 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>   err_video_path:
>   	icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
>   err_cpucfg_path:
> -	pm_ops->core_power(core, POWER_ON);
> +	if (pm_ops->core_power)
> +		pm_ops->core_power(core, POWER_ON);
>   
>   	return ret;
>   }
> 
Hi,

this was sent duing the summer holidays. Since then, a few other patches 
have been merged in linux-next for this file.

So, this is a polite reminder.

CJ
