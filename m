Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5397A36A90C
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 21:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhDYTha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 15:37:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:57652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230494AbhDYTh3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 15:37:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DE6D6115C;
        Sun, 25 Apr 2021 19:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619379408;
        bh=ZTvkB5rpoSHuROmi1/t8X2IfN8+PT9jVHAjIgyd+yvc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=K/TPQ+pu5oKIiPLhY7i0PgolmO+F20176UyTTTpuMtYIAqV6UnK+uhasctEMkbFA2
         hIW/g0s7Fp0q24TldhlylRL0Q79OpNwbkm1ZlmslLQ8bG+EEUAFieGuMWIOWJQ5ufq
         AXBUX4AUxOK1+anKCXnh1jZLYQdNHJknVNR58pvQktWd4Mt+U19D009mZjh+k2C9da
         GwjiF+fgOp7OtIzqJW/wBYzdpXVWd8bv0BotUTjcF2AoTdBOVdn5ssYZklaMWTMOLN
         2vqNW26Fc0URvqCUqqwIAPu+RWcvg50LMLg+U+gn44WvDAhDwZZiBpSt50XIVDhRZJ
         N/MUkYQ17brcw==
Subject: Re: [PATCH 72/78] media: s3c-camif: use pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <3cfe70dad65dc078a656458cb55087a5269e9cc3.1619191723.git.mchehab+huawei@kernel.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <dfb7f44b-5848-b968-6479-a088e72f1a47@kernel.org>
Date:   Sun, 25 Apr 2021 21:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3cfe70dad65dc078a656458cb55087a5269e9cc3.1619191723.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   drivers/media/platform/s3c-camif/camif-capture.c | 5 ++---
>   drivers/media/platform/s3c-camif/camif-core.c    | 5 +++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
> index 9ca49af29542..01fa08065ebc 100644
> --- a/drivers/media/platform/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
> @@ -547,16 +547,15 @@ static int s3c_camif_open(struct file *file)
>   	if (ret < 0)
>   		goto unlock;
>   
> -	ret = pm_runtime_get_sync(camif->dev);
> +	ret = pm_runtime_resume_and_get(camif->dev);
>   	if (ret < 0)

> -		goto err_pm;
> +		goto unlock;

I think we don't need that label change, fh still needs to be released
in case of an error.

>   	ret = sensor_set_power(camif, 1);
>   	if (!ret)
>   		goto unlock;
>   
>   	pm_runtime_put(camif->dev);
> -err_pm:
>   	v4l2_fh_release(file);
>   unlock:
>   	mutex_unlock(&camif->lock);

--
Regards,
Sylwester
