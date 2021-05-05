Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F7F373B69
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbhEEMgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:36:52 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3030 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhEEMgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:36:52 -0400
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwrn4Z44z70gJ2;
        Wed,  5 May 2021 20:24:57 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 5 May 2021 14:35:54 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:35:54 +0100
Date:   Wed, 5 May 2021 13:34:15 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 22/25] media: sti/bdisp: fix pm_runtime_get_sync() usage
 count
Message-ID: <20210505133415.00006a2f@Huawei.com>
In-Reply-To: <dbab81a4521f26538a9ac0c8af838c1ba987ab5a.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <dbab81a4521f26538a9ac0c8af838c1ba987ab5a.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed, 5 May 2021 11:42:12 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> 
> The bdisp_start_streaming() doesn't take it into account, which
> would unbalance PM usage counter at bdisp_stop_streaming().
> 
> The logic at bdisp_probe() is correct, but the best is to use
> the same call along the driver.
> 
> So, replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter, avoiding
> a potential PM usage counter leak.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> index 060ca85f64d5..85288da9d2ae 100644
> --- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> +++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> @@ -499,7 +499,7 @@ static int bdisp_start_streaming(struct vb2_queue *q, unsigned int count)
>  {
>  	struct bdisp_ctx *ctx = q->drv_priv;
>  	struct vb2_v4l2_buffer *buf;
> -	int ret = pm_runtime_get_sync(ctx->bdisp_dev->dev);
> +	int ret = pm_runtime_resume_and_get(ctx->bdisp_dev->dev);
>  
>  	if (ret < 0) {
>  		dev_err(ctx->bdisp_dev->dev, "failed to set runtime PM\n");
> @@ -1364,10 +1364,10 @@ static int bdisp_probe(struct platform_device *pdev)
>  
>  	/* Power management */
>  	pm_runtime_enable(dev);
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to set PM\n");
> -		goto err_pm;
> +		goto err_remove;
>  	}
>  
>  	/* Filters */
> @@ -1395,6 +1395,7 @@ static int bdisp_probe(struct platform_device *pdev)
>  	bdisp_hw_free_filters(bdisp->dev);
>  err_pm:
>  	pm_runtime_put(dev);
> +err_remove:
>  	bdisp_debugfs_remove(bdisp);
>  	v4l2_device_unregister(&bdisp->v4l2_dev);
>  err_clk:

