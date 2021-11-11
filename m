Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584F044D90A
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 16:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhKKPUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 10:20:09 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:56180 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbhKKPUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 10:20:08 -0500
Received: from [192.168.1.18] ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id lBpEmqrj0S9NTlBpEm0wOw; Thu, 11 Nov 2021 16:17:18 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 11 Nov 2021 16:17:18 +0100
X-ME-IP: 86.243.171.122
Subject: Re: [PATCH] media: venus: core: Fix a resource leak in the error
 handling path of 'venus_probe()'
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, acourbot@chromium.org
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <ea6bddd4da925fcd3016cdb3fc8d40d2311c55a4.1629403336.git.christophe.jaillet@wanadoo.fr>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <b7b1dbd7-9578-d34f-e8a3-0ce045485de0@wanadoo.fr>
Date:   Thu, 11 Nov 2021 16:17:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ea6bddd4da925fcd3016cdb3fc8d40d2311c55a4.1629403336.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 19/08/2021 à 22:05, Christophe JAILLET a écrit :
> A successful 'of_platform_populate()' call should be balanced by a
> corresponding 'of_platform_depopulate()' call in the error handling path
> of the probe, as already done in the remove function.
> 
> A successful 'venus_firmware_init()' call should be balanced by a
> corresponding 'venus_firmware_deinit()' call in the error handling path
> of the probe, as already done in the remove function.
> 
> Update the error handling path accordingly.
> 
> Fixes: f9799fcce4bb ("media: venus: firmware: register separate platform_device for firmware loader")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/media/platform/qcom/venus/core.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 91b15842c555..9cb0ab7d1677 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -349,11 +349,11 @@ static int venus_probe(struct platform_device *pdev)
>   
>   	ret = venus_firmware_init(core);
>   	if (ret)
> -		goto err_runtime_disable;
> +		goto err_of_depopulate;
>   
>   	ret = venus_boot(core);
>   	if (ret)
> -		goto err_runtime_disable;
> +		goto err_firmware_deinit;
>   
>   	ret = hfi_core_resume(core, true);
>   	if (ret)
> @@ -385,6 +385,10 @@ static int venus_probe(struct platform_device *pdev)
>   	v4l2_device_unregister(&core->v4l2_dev);
>   err_venus_shutdown:
>   	venus_shutdown(core);
> +err_firmware_deinit:
> +	venus_firmware_deinit(core);
> +err_of_depopulate:
> +	of_platform_depopulate(dev);
>   err_runtime_disable:
>   	pm_runtime_put_noidle(dev);
>   	pm_runtime_set_suspended(dev);
> 
Hi,

this was sent duing the summer holidays. Since then, a few other patches 
have been merged in linux-next for this file.

So, this is a polite reminder.

CJ
