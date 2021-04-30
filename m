Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3C036FFF9
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 19:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhD3Rvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 13:51:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2975 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhD3Rvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 13:51:37 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FX0BT5wC1z6wkfx;
        Sat,  1 May 2021 01:45:05 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 19:50:47 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 18:50:46 +0100
Date:   Fri, 30 Apr 2021 18:49:11 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v4 62/79] media: exynos4-is: use
 pm_runtime_resume_and_get()
Message-ID: <20210430184911.000075e1@Huawei.com>
In-Reply-To: <31eadd61972541bf1e27706f9ff7be66a21e23e6.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <31eadd61972541bf1e27706f9ff7be66a21e23e6.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.96]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Apr 2021 16:52:23 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/exynos4-is/fimc-capture.c   | 6 ++----
>  drivers/media/platform/exynos4-is/fimc-is.c        | 4 ++--
>  drivers/media/platform/exynos4-is/fimc-isp-video.c | 3 +--
>  drivers/media/platform/exynos4-is/fimc-isp.c       | 7 +++----
>  drivers/media/platform/exynos4-is/fimc-lite.c      | 5 +++--
>  drivers/media/platform/exynos4-is/fimc-m2m.c       | 2 +-
>  drivers/media/platform/exynos4-is/media-dev.c      | 8 +++-----
>  drivers/media/platform/exynos4-is/mipi-csis.c      | 8 +++-----
>  8 files changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index 13c838d3f947..0da36443173c 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -478,11 +478,9 @@ static int fimc_capture_open(struct file *file)
>  		goto unlock;
>  
>  	set_bit(ST_CAPT_BUSY, &fimc->state);
> -	ret = pm_runtime_get_sync(&fimc->pdev->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_sync(&fimc->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&fimc->pdev->dev);
> +	if (ret < 0)
>  		goto unlock;
> -	}
>  
>  	ret = v4l2_fh_open(file);
>  	if (ret) {
> diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
> index 972d9601d236..1b24f5bfc4af 100644
> --- a/drivers/media/platform/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/exynos4-is/fimc-is.c
> @@ -828,9 +828,9 @@ static int fimc_is_probe(struct platform_device *pdev)
>  			goto err_irq;
>  	}
>  
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
> -		goto err_pm;
> +		goto err_irq;
>  

I think the pm_runtime_put_noidle() below err_pm: should become
a pm_runtime_put() because otherwise we won't call fimc_is_runtime_suspend()
if runtime pm is enabled (either directly or via runtime pm count becoming zero.

(not I'm not 100% sure of my argument here...)

>  	vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
>  
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> index 612b9872afc8..8d9dc597deaa 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> @@ -275,7 +275,7 @@ static int isp_video_open(struct file *file)
>  	if (ret < 0)
>  		goto unlock;
>  
> -	ret = pm_runtime_get_sync(&isp->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&isp->pdev->dev);
>  	if (ret < 0)
>  		goto rel_fh;
>  
> @@ -293,7 +293,6 @@ static int isp_video_open(struct file *file)
>  	if (!ret)
>  		goto unlock;

So the good path is to jump over the block.  I'd just unlock and return here
to make it more readable but unrelated to this patch.

>  rel_fh:
> -	pm_runtime_put_noidle(&isp->pdev->dev);

Logic flow here isn't very standard, but with this change, you'll not
call anything to unwind a successful call to pm_runtime_resume_and_get if
fmic_pipeline_call() returns and error.
My guess is pm_runtime_put_sync() is needed before rel_fh; to balance this.
 
>  	v4l2_fh_release(file);
>  unlock:
>  	mutex_unlock(&isp->video_lock);
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
> index a77c49b18511..74b49d30901e 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp.c
> @@ -304,11 +304,10 @@ static int fimc_isp_subdev_s_power(struct v4l2_subdev *sd, int on)
>  	pr_debug("on: %d\n", on);
>  
>  	if (on) {
> -		ret = pm_runtime_get_sync(&is->pdev->dev);
> -		if (ret < 0) {
> -			pm_runtime_put(&is->pdev->dev);
> +		ret = pm_runtime_resume_and_get(&is->pdev->dev);
> +		if (ret < 0)
>  			return ret;
> -		}
> +
>  		set_bit(IS_ST_PWR_ON, &is->state);
>  
>  		ret = fimc_is_start_firmware(is);
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index fe20af3a7178..4d8b18078ff3 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -469,9 +469,9 @@ static int fimc_lite_open(struct file *file)
>  	}
>  
>  	set_bit(ST_FLITE_IN_USE, &fimc->state);
> -	ret = pm_runtime_get_sync(&fimc->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&fimc->pdev->dev);
>  	if (ret < 0)
> -		goto err_pm;
> +		goto err_in_use;
>  
>  	ret = v4l2_fh_open(file);
>  	if (ret < 0)
> @@ -499,6 +499,7 @@ static int fimc_lite_open(struct file *file)
>  	v4l2_fh_release(file);
>  err_pm:
>  	pm_runtime_put_sync(&fimc->pdev->dev);
> +err_in_use:
>  	clear_bit(ST_FLITE_IN_USE, &fimc->state);
>  unlock:
>  	mutex_unlock(&fimc->lock);
> diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
> index c9704a147e5c..7c1eb05c508f 100644
> --- a/drivers/media/platform/exynos4-is/fimc-m2m.c
> +++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
> @@ -75,7 +75,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
>  	struct fimc_ctx *ctx = q->drv_priv;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(&ctx->fimc_dev->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&ctx->fimc_dev->pdev->dev);
Use the fact pm_runtime_resume_and_get only returns 0 or < 0 to
make this
return pm_runtime_resume_and_get()

>  	return ret > 0 ? 0 : ret;
>  }
>  
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index 13d192ba4aa6..9346d44a06c2 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -512,11 +512,9 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
>  	if (!fmd->pmf)
>  		return -ENXIO;
>  
> -	ret = pm_runtime_get_sync(fmd->pmf);
> -	if (ret < 0) {
> -		pm_runtime_put(fmd->pmf);
> +	ret = pm_runtime_resume_and_get(fmd->pmf);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	fmd->num_sensors = 0;
>  
> @@ -1291,7 +1289,7 @@ static int cam_clk_prepare(struct clk_hw *hw)
>  	if (camclk->fmd->pmf == NULL)
>  		return -ENODEV;
>  
> -	ret = pm_runtime_get_sync(camclk->fmd->pmf);
> +	ret = pm_runtime_resume_and_get(camclk->fmd->pmf);
return pm_...

>  	return ret < 0 ? ret : 0;
>  }
>  
> diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
> index 1aac167abb17..2a6afb78a049 100644
> --- a/drivers/media/platform/exynos4-is/mipi-csis.c
> +++ b/drivers/media/platform/exynos4-is/mipi-csis.c
> @@ -494,7 +494,7 @@ static int s5pcsis_s_power(struct v4l2_subdev *sd, int on)
>  	struct device *dev = &state->pdev->dev;
>  
>  	if (on)
> -		return pm_runtime_get_sync(dev);
> +		return pm_runtime_resume_and_get(dev);
>  
>  	return pm_runtime_put_sync(dev);
>  }
> @@ -509,11 +509,9 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	if (enable) {
>  		s5pcsis_clear_counters(state);
> -		ret = pm_runtime_get_sync(&state->pdev->dev);
> -		if (ret && ret != 1) {
> -			pm_runtime_put_noidle(&state->pdev->dev);
> +		ret = pm_runtime_resume_and_get(&state->pdev->dev);
> +		if (ret && ret != 1)

It won't be equal to 1 as pm_runtime_resume_and_get only returns <= 0

>  			return ret;
> -		}
>  	}
>  
>  	mutex_lock(&state->lock);

