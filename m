Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F3336D95D
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 16:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240202AbhD1OPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239223AbhD1OPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:15:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B39C061573;
        Wed, 28 Apr 2021 07:14:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B54DD1F42AFA
Message-ID: <b92eb32b84dd7a69a47bf78b17f49d4ba500739c.camel@collabora.com>
Subject: Re: [PATCH v3 79/79] media: hantro: document the usage of
 pm_runtime_get_sync()
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, linuxarm@huawei.com,
        mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Wed, 28 Apr 2021 11:14:44 -0300
In-Reply-To: <20210428084431.0c2d505b@coco.lan>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
         <230f22170db7fa57b49cff4570cef15bf11b2ad5.1619519080.git.mchehab+huawei@kernel.org>
         <02948673-9572-a570-d28e-03a7208f39e1@arm.com>
         <95ea572e201545b27ff9f48313f7aaea157d4764.camel@collabora.com>
         <20210428082742.20d54db1@coco.lan> <20210428084431.0c2d505b@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, 2021-04-28 at 08:44 +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 28 Apr 2021 08:27:42 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Em Tue, 27 Apr 2021 12:18:32 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > 
> > > On Tue, 2021-04-27 at 16:08 +0100, Robin Murphy wrote:  
> > > > On 2021-04-27 11:27, Mauro Carvalho Chehab wrote:    
> > > > > Despite other *_get()/*_put() functions, where usage count is
> > > > > incremented only if not errors, the pm_runtime_get_sync() has
> > > > > a different behavior, incrementing the counter *even* on
> > > > > errors.
> > > > > 
> > > > > That's an error prone behavior, as people often forget to
> > > > > decrement the usage counter.
> > > > > 
> > > > > However, the hantro driver depends on this behavior, as it
> > > > > will decrement the usage_count unconditionally at the m2m
> > > > > job finish time, which makes sense.
> > > > > 
> > > > > So, intead of using the pm_runtime_resume_and_get() that
> > > > > would decrement the counter on error, keep the current
> > > > > API, but add a documentation explaining the rationale for
> > > > > keep using pm_runtime_get_sync().
> > > > > 
> > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > > ---
> > > > >   drivers/staging/media/hantro/hantro_drv.c | 7 +++++++
> > > > >   1 file changed, 7 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > > > > index 595e82a82728..96f940c1c85c 100644
> > > > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > > > @@ -155,6 +155,13 @@ static void device_run(void *priv)
> > > > >         ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> > > > >         if (ret)
> > > > >                 goto err_cancel_job;    
> > > > 
> > > > ..except this can also cause the same pm_runtime_put_autosuspend() call 
> > > > without even reaching the "matching" get below, so rather than some kind 
> > > > of cleverness it seems more like it's just broken :/
> > > >     
> > > 
> > > Indeed, I was trying to find time to cook a quick patch, but kept
> > > getting preempted.
> > > 
> > > Feel free to submit a fix for this, otherwise, I'll try to find
> > > time later this week.  
> > 
> > What about doing this instead:
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index 595e82a82728..67de6b15236d 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -56,14 +56,12 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
> >         return hantro_get_dec_buf_addr(ctx, buf);
> >  }
> >  
> > -static void hantro_job_finish(struct hantro_dev *vpu,
> > -                             struct hantro_ctx *ctx,
> > -                             enum vb2_buffer_state result)
> > +static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
> > +                                   struct hantro_ctx *ctx,
> > +                                   enum vb2_buffer_state result)
> >  {
> >         struct vb2_v4l2_buffer *src, *dst;
> >  
> > -       pm_runtime_mark_last_busy(vpu->dev);
> > -       pm_runtime_put_autosuspend(vpu->dev);
> >         clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> >  
> >         src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > @@ -81,6 +79,16 @@ static void hantro_job_finish(struct hantro_dev *vpu,
> >                                          result);
> >  }
> >  
> > +static void hantro_job_finish(struct hantro_dev *vpu,
> > +                             struct hantro_ctx *ctx,
> > +                             enum vb2_buffer_state result)
> > +{
> > +       pm_runtime_mark_last_busy(vpu->dev);
> > +       pm_runtime_put_autosuspend(vpu->dev);
> > +
> > +       hantro_job_finish_no_pm(vpu, ctx, result);
> > +}
> > +
> >  void hantro_irq_done(struct hantro_dev *vpu,
> >                      enum vb2_buffer_state result)
> >  {
> > @@ -152,12 +160,13 @@ static void device_run(void *priv)
> >         src = hantro_get_src_buf(ctx);
> >         dst = hantro_get_dst_buf(ctx);
> >  
> > +       ret = pm_runtime_resume_and_get(ctx->dev->dev);
> > +       if (ret < 0)
> > +               goto err_cancel_job;
> > +
> >         ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> >         if (ret)
> >                 goto err_cancel_job;
> > -       ret = pm_runtime_get_sync(ctx->dev->dev);
> > -       if (ret < 0)
> > -               goto err_cancel_job;
> >  
> >         v4l2_m2m_buf_copy_metadata(src, dst, true);
> >  
> > @@ -165,7 +174,7 @@ static void device_run(void *priv)
> >         return;
> >  
> >  err_cancel_job:
> > -       hantro_job_finish(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> > +       hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> >  }
> >  
> >  static struct v4l2_m2m_ops vpu_m2m_ops = {
> > 
> > Thanks,
> > Mauro
> 
> Actually, the order at the finish logic should change as well.
> Maybe like this:
> 

This one looks good.

Thanks!
Ezequiel

> <snip>
> static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
>                                     struct hantro_ctx *ctx,
>                                     enum vb2_buffer_state result)
> {
>         struct vb2_v4l2_buffer *src, *dst;
> 
>         src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>         dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> 
>         if (WARN_ON(!src))
>                 return;
>         if (WARN_ON(!dst))
>                 return;
> 
>         src->sequence = ctx->sequence_out++;
>         dst->sequence = ctx->sequence_cap++;
> 
>         v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
>                                          result);
> }
> 
> static void hantro_job_finish(struct hantro_dev *vpu,
>                               struct hantro_ctx *ctx,
>                               enum vb2_buffer_state result)
> {
> 
>         hantro_job_finish_no_pm(vpu, ctx, result);
> 
>         clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> 
>         pm_runtime_mark_last_busy(vpu->dev);
>         pm_runtime_put_autosuspend(vpu->dev);
> }
> 
> static void device_run(void *priv)
> {
>         struct hantro_ctx *ctx = priv;
>         struct vb2_v4l2_buffer *src, *dst;
>         int ret;
> 
>         src = hantro_get_src_buf(ctx);
>         dst = hantro_get_dst_buf(ctx);
> 
>         ret = pm_runtime_resume_and_get(ctx->dev->dev);
>         if (ret < 0)
>                 goto err_cancel_job;
> 
>         ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
>         if (ret)
>                 goto err_cancel_job;
> 
>         v4l2_m2m_buf_copy_metadata(src, dst, true);
> 
>         ctx->codec_ops->run(ctx);
>         return;
> 
> err_cancel_job:
>         hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> }
> </snip>
> 
> 
> Thanks,
> Mauro


