Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44C4370034
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 20:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhD3SL1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 14:11:27 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2981 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3SL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 14:11:26 -0400
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FX0Zs18T3z689Nt;
        Sat,  1 May 2021 02:02:45 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 20:10:36 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 19:10:35 +0100
Date:   Fri, 30 Apr 2021 19:09:00 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v4 78/79] media: hantro: use pm_runtime_resume_and_get()
Message-ID: <20210430190900.00004dd3@Huawei.com>
In-Reply-To: <803c39fafdd62efc6f9e4d99a372af2c6955143b.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <803c39fafdd62efc6f9e4d99a372af2c6955143b.1619621413.git.mchehab+huawei@kernel.org>
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

On Wed, 28 Apr 2021 16:52:39 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> While there's nothing wrong with the current usage on this driver,
> as we're getting rid of the pm_runtime_get_sync() call all over
> the media subsystem, let's remove the last occurrence on this
> driver.

Not sure there is nothing wrong in here before your patch...


> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 595e82a82728..25fa36e7e773 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -56,14 +56,12 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
>  	return hantro_get_dec_buf_addr(ctx, buf);
>  }
>  
> -static void hantro_job_finish(struct hantro_dev *vpu,
> -			      struct hantro_ctx *ctx,
> -			      enum vb2_buffer_state result)
> +static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
> +				    struct hantro_ctx *ctx,
> +				    enum vb2_buffer_state result)
>  {
>  	struct vb2_v4l2_buffer *src, *dst;
>  
> -	pm_runtime_mark_last_busy(vpu->dev);
> -	pm_runtime_put_autosuspend(vpu->dev);
>  	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
>  
>  	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> @@ -81,6 +79,16 @@ static void hantro_job_finish(struct hantro_dev *vpu,
>  					 result);
>  }
>  
> +static void hantro_job_finish(struct hantro_dev *vpu,
> +			      struct hantro_ctx *ctx,
> +			      enum vb2_buffer_state result)
> +{
> +	pm_runtime_mark_last_busy(vpu->dev);
> +	pm_runtime_put_autosuspend(vpu->dev);
> +
> +	hantro_job_finish_no_pm(vpu, ctx, result);
> +}
> +
>  void hantro_irq_done(struct hantro_dev *vpu,
>  		     enum vb2_buffer_state result)
>  {
> @@ -155,7 +163,8 @@ static void device_run(void *priv)
>  	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
>  	if (ret)
>  		goto err_cancel_job;

Before your patch, if this error condition happened, we'd call runtime_put
before the related runtime_get...  You fixed that, but the patch description
doesn't call it out.


> -	ret = pm_runtime_get_sync(ctx->dev->dev);
> +
> +	ret = pm_runtime_resume_and_get(ctx->dev->dev);
>  	if (ret < 0)
>  		goto err_cancel_job;
>  
> @@ -165,7 +174,7 @@ static void device_run(void *priv)
>  	return;
>  
>  err_cancel_job:
> -	hantro_job_finish(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> +	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
>  }
>  
>  static struct v4l2_m2m_ops vpu_m2m_ops = {

