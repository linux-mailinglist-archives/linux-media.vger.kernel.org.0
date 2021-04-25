Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6F536A950
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 22:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhDYU6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 16:58:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:59872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231308AbhDYU6K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 16:58:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 440BA6120D;
        Sun, 25 Apr 2021 20:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619384249;
        bh=VXB+kaoKKPnkHVhD93RIXi6gVZ4Pu+VPhNsKuzh1vOY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=U65otbUa2+SpFRxa+CdJtmbf3MbtOZgImGXIParpRQ3aRiuxF3AjoBtuNC8MsNUNg
         Uq2e76Woitl3gIiplcjhdElbkoiBM/P/2/c4swk08ft2UAnIxiXE6zxqrjThw2OigK
         OG/5Cjt7HGRLD6zMr/Dlzrg0SQ5lFnhH29iun/InyZmT2H7onUPOf9pBpPKphwLf84
         xHCSH8bkPTXZM/So8NmiPM25tbLe8oL0WNW/M+4V2FGqskH/Zy8hQk6zWiF/Bp/QGA
         WygpIS4mSeVV7qv9xaYFvmLRkS+Y5Bn9fNw1HLJVBA8wC1JNhx3SRMm+lT+8092j/m
         /2xdMtfIOAQ7w==
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
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <45068e81-8f9b-fea8-b7bc-bdd0443ba7e6@kernel.org>
Date:   Sun, 25 Apr 2021 22:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <091915bb1cbec13b566d129f85ae229fcb92e2e4.1619191723.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   drivers/media/platform/exynos4-is/fimc-capture.c   | 6 ++----
>   drivers/media/platform/exynos4-is/fimc-is.c        | 3 ++-
>   drivers/media/platform/exynos4-is/fimc-isp-video.c | 3 +--
>   drivers/media/platform/exynos4-is/fimc-isp.c       | 7 +++----
>   drivers/media/platform/exynos4-is/fimc-lite.c      | 5 +++--
>   drivers/media/platform/exynos4-is/fimc-m2m.c       | 2 +-
>   drivers/media/platform/exynos4-is/media-dev.c      | 8 +++-----
>   drivers/media/platform/exynos4-is/mipi-csis.c      | 5 ++---
>   8 files changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index 13c838d3f947..0da36443173c 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -478,11 +478,9 @@ static int fimc_capture_open(struct file *file)
>   		goto unlock;
>   
>   	set_bit(ST_CAPT_BUSY, &fimc->state);
> -	ret = pm_runtime_get_sync(&fimc->pdev->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_sync(&fimc->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&fimc->pdev->dev);
> +	if (ret < 0)
>   		goto unlock;
> -	}
>   
>   	ret = v4l2_fh_open(file);
>   	if (ret) {
> diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
> index 972d9601d236..bca35866cc74 100644
> --- a/drivers/media/platform/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/exynos4-is/fimc-is.c
> @@ -828,7 +828,7 @@ static int fimc_is_probe(struct platform_device *pdev)
>   			goto err_irq;
>   	}
>   
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>   	if (ret < 0)
>   		goto err_pm;

It seems you intended to use err_suspend label here. We don't need
a new label though, instead of err_pm we can jump to err_irq when
pm_runtime_resume_and_get() fails. Note that when runtime PM is
disabled pm_runtime_resume_and_get() always returns 0.

> @@ -862,6 +862,7 @@ static int fimc_is_probe(struct platform_device *pdev)
>   	fimc_is_unregister_subdevs(is);
>   err_pm:
>   	pm_runtime_put_noidle(dev);
> +err_suspend:
>   	if (!pm_runtime_enabled(dev))
>   		fimc_is_runtime_suspend(dev);
>   err_irq:


> diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
> index 1aac167abb17..a0218237d66b 100644
> --- a/drivers/media/platform/exynos4-is/mipi-csis.c
> +++ b/drivers/media/platform/exynos4-is/mipi-csis.c
> @@ -494,7 +494,7 @@ static int s5pcsis_s_power(struct v4l2_subdev *sd, int on)
>   	struct device *dev = &state->pdev->dev;
>   
>   	if (on)
> -		return pm_runtime_get_sync(dev);
> +		return pm_runtime_resume_and_get(dev);
>   
>   	return pm_runtime_put_sync(dev);
>   }
> @@ -509,9 +509,8 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
>   
>   	if (enable) {
>   		s5pcsis_clear_counters(state);
> -		ret = pm_runtime_get_sync(&state->pdev->dev);
> +		ret = pm_runtime_resume_and_get(&state->pdev->dev);
>   		if (ret && ret != 1) {
> -			pm_runtime_put_noidle(&state->pdev->dev);
>   			return ret;
>   		}

Braces could be dropped as well here.

>   	}


Thanks,
Sylwester

