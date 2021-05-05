Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C442373B47
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhEEMdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:33:54 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3024 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhEEMdx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:33:53 -0400
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwnL147Bz70gJ2;
        Wed,  5 May 2021 20:21:58 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:32:55 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:32:54 +0100
Date:   Wed, 5 May 2021 13:31:15 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 13/25] media: rcar_fdp1: fix pm_runtime_get_sync() usage
 count
Message-ID: <20210505133115.00007bd1@Huawei.com>
In-Reply-To: <372d88637707ececab77fffaae49d455d90cf24f.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <372d88637707ececab77fffaae49d455d90cf24f.1620207353.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 May 2021 11:42:03 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter, avoiding
> a potential PM usage counter leak.
> 
> Also, right now, the driver is ignoring any troubles when
> trying to do PM resume. So, add the proper error handling
> for the code.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/media/platform/rcar_fdp1.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index d26413fa5205..89aac60066d9 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -2135,7 +2135,9 @@ static int fdp1_open(struct file *file)
>  	}
>  
>  	/* Perform any power management required */
> -	pm_runtime_get_sync(fdp1->dev);
> +	ret = pm_runtime_resume_and_get(fdp1->dev);
> +	if (ret < 0)
> +		goto error_pm;
>  
>  	v4l2_fh_add(&ctx->fh);
>  
> @@ -2145,6 +2147,8 @@ static int fdp1_open(struct file *file)
>  	mutex_unlock(&fdp1->dev_mutex);
>  	return 0;
>  
> +error_pm:
> +       v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  error_ctx:
>  	v4l2_ctrl_handler_free(&ctx->hdl);
>  	kfree(ctx);
> @@ -2352,7 +2356,9 @@ static int fdp1_probe(struct platform_device *pdev)
>  
>  	/* Power up the cells to read HW */
>  	pm_runtime_enable(&pdev->dev);
> -	pm_runtime_get_sync(fdp1->dev);
> +	ret = pm_runtime_resume_and_get(fdp1->dev);
> +	if (ret < 0)
> +		goto disable_pm;
>  
>  	hw_version = fdp1_read(fdp1, FD1_IP_INTDATA);
>  	switch (hw_version) {
> @@ -2381,6 +2387,9 @@ static int fdp1_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +disable_pm:
> +	pm_runtime_disable(fdp1->dev);
> +
>  release_m2m:
>  	v4l2_m2m_release(fdp1->m2m_dev);
>  

