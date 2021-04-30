Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09EE2370022
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 20:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhD3SFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 14:05:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2979 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3SFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 14:05:37 -0400
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FX0Nr2gr7z70gHM;
        Sat,  1 May 2021 01:54:04 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 20:04:46 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 19:04:45 +0100
Date:   Fri, 30 Apr 2021 19:03:11 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 75/79] media: ti-vpe: use pm_runtime_resume_and_get()
Message-ID: <20210430190311.000039eb@Huawei.com>
In-Reply-To: <bd62e8ed8b70a68a9173af82c26896d153657f9a.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <bd62e8ed8b70a68a9173af82c26896d153657f9a.1619621413.git.mchehab+huawei@kernel.org>
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

On Wed, 28 Apr 2021 16:52:36 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/ti-vpe/cal-video.c | 4 +++-
>  drivers/media/platform/ti-vpe/cal.c       | 8 +++++---
>  drivers/media/platform/ti-vpe/vpe.c       | 4 +---
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 7b7436a355ee..15fb5360cf13 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -700,7 +700,9 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>  
> -	pm_runtime_get_sync(ctx->cal->dev);
> +	ret = pm_runtime_resume_and_get(ctx->cal->dev);
> +	if (ret < 0)
> +		goto error_pipeline;
>  
>  	cal_ctx_set_dma_addr(ctx, addr);
>  	cal_ctx_start(ctx);
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 2e2bef91b2b0..76fe7a8b33f6 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -1024,7 +1024,7 @@ static int cal_probe(struct platform_device *pdev)
>  
>  	/* Read the revision and hardware info to verify hardware access. */
>  	pm_runtime_enable(&pdev->dev);
> -	ret = pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret)
>  		goto error_pm_runtime;
>  
> @@ -1098,10 +1098,11 @@ static int cal_remove(struct platform_device *pdev)
>  {
>  	struct cal_dev *cal = platform_get_drvdata(pdev);
>  	unsigned int i;
> +	int ret;
>  
>  	cal_dbg(1, cal, "Removing %s\n", CAL_MODULE_NAME);
>  
> -	pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>  
>  	cal_media_unregister(cal);
>  
> @@ -1115,7 +1116,8 @@ static int cal_remove(struct platform_device *pdev)
>  	for (i = 0; i < cal->data->num_csi2_phy; i++)
>  		cal_camerarx_destroy(cal->phy[i]);
>  
> -	pm_runtime_put_sync(&pdev->dev);
> +	if (ret >= 0)
> +		pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
>  	return 0;
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> index 10251b787674..07cb2c140295 100644
> --- a/drivers/media/platform/ti-vpe/vpe.c
> +++ b/drivers/media/platform/ti-vpe/vpe.c
> @@ -2471,10 +2471,8 @@ static int vpe_runtime_get(struct platform_device *pdev)
>  
>  	dev_dbg(&pdev->dev, "vpe_runtime_get\n");
>  
> -	r = pm_runtime_get_sync(&pdev->dev);
> +	r = pm_runtime_resume_and_get(&pdev->dev);
>  	WARN_ON(r < 0);
> -	if (r)
> -		pm_runtime_put_noidle(&pdev->dev);
>  	return r < 0 ? r : 0;
r is <= 0 to zero so this isn't doing anything useful.

>  }
>  

