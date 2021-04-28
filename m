Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B69936DDFB
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 19:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241523AbhD1RPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 13:15:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48116 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241519AbhD1RPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 13:15:41 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8F6591F42B79
Message-ID: <bf45f7c8031ce2320a4425475982aba51c1e4b48.camel@collabora.com>
Subject: Re: [PATCH v4 78/79] media: hantro: use pm_runtime_resume_and_get()
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Wed, 28 Apr 2021 14:14:45 -0300
In-Reply-To: <803c39fafdd62efc6f9e4d99a372af2c6955143b.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
         <803c39fafdd62efc6f9e4d99a372af2c6955143b.1619621413.git.mchehab+huawei@kernel.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-04-28 at 16:52 +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> While there's nothing wrong with the current usage on this driver,
> as we're getting rid of the pm_runtime_get_sync() call all over
> the media subsystem, let's remove the last occurrence on this
> driver.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Looks good.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_drv.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 595e82a82728..25fa36e7e773 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -56,14 +56,12 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
>         return hantro_get_dec_buf_addr(ctx, buf);
>  }
>  
> -static void hantro_job_finish(struct hantro_dev *vpu,
> -                             struct hantro_ctx *ctx,
> -                             enum vb2_buffer_state result)
> +static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
> +                                   struct hantro_ctx *ctx,
> +                                   enum vb2_buffer_state result)
>  {
>         struct vb2_v4l2_buffer *src, *dst;
>  
> -       pm_runtime_mark_last_busy(vpu->dev);
> -       pm_runtime_put_autosuspend(vpu->dev);
>         clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
>  
>         src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> @@ -81,6 +79,16 @@ static void hantro_job_finish(struct hantro_dev *vpu,
>                                          result);
>  }
>  
> +static void hantro_job_finish(struct hantro_dev *vpu,
> +                             struct hantro_ctx *ctx,
> +                             enum vb2_buffer_state result)
> +{
> +       pm_runtime_mark_last_busy(vpu->dev);
> +       pm_runtime_put_autosuspend(vpu->dev);
> +
> +       hantro_job_finish_no_pm(vpu, ctx, result);
> +}
> +
>  void hantro_irq_done(struct hantro_dev *vpu,
>                      enum vb2_buffer_state result)
>  {
> @@ -155,7 +163,8 @@ static void device_run(void *priv)
>         ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
>         if (ret)
>                 goto err_cancel_job;
> -       ret = pm_runtime_get_sync(ctx->dev->dev);
> +
> +       ret = pm_runtime_resume_and_get(ctx->dev->dev);
>         if (ret < 0)
>                 goto err_cancel_job;
>  
> @@ -165,7 +174,7 @@ static void device_run(void *priv)
>         return;
>  
>  err_cancel_job:
> -       hantro_job_finish(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> +       hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
>  }
>  
>  static struct v4l2_m2m_ops vpu_m2m_ops = {


