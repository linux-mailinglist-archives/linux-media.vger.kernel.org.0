Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E575A36E257
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 02:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhD2AFl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 20:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhD2AFl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 20:05:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0823C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 17:04:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 087FEDA8;
        Thu, 29 Apr 2021 02:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619654694;
        bh=bM8WbrmqOGVS6GpfWLEY6sIb9qyNZwIn5wf7MSlEUpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M69QGoqpV4acRcVZoRarmuDefLGtOzJH+U5O0uu8yBhnrnNd8ha6tAzluWaByCzKT
         WjRqqDw9JTqOFOo0GwFgcSfLWEPSBvC9dVzNX6iPaKZDpiuvkQ3B3FijlHwLiei25w
         IdRMhMimMa+OXt1xse3/UVUiESY/Baoa2tRmqCWQ=
Date:   Thu, 29 Apr 2021 03:04:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 17/28] media: ti-vpe: cal: allocate pix proc dynamically
Message-ID: <YIn4IBdepKdmG2kh@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-18-tomi.valkeinen@ideasonboard.com>
 <YHwtI+WIlHWCBEH5@pendragon.ideasonboard.com>
 <5e91c272-67a5-ed76-63c3-6c0972d42cf7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5e91c272-67a5-ed76-63c3-6c0972d42cf7@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Apr 19, 2021 at 02:45:53PM +0300, Tomi Valkeinen wrote:
> On 18/04/2021 15:59, Laurent Pinchart wrote:
> > On Mon, Apr 12, 2021 at 02:34:46PM +0300, Tomi Valkeinen wrote:
> >> CAL has 4 pixel processing units but the units are not needed e.g. for
> >> metadata. As we could be capturing 4 pixel streams and 4 metadata
> >> streams, i.e. using 8 DMA contexts, we cannot assign a pixel processing
> >> unit to every DMA context. Instead we need to reserve a pixel processing
> >> unit only when needed.
> >>
> >> Add functions to reserve and release a pix proc unit, and use them in
> >> cal_ctx_prepare/unprepare. Note that for the time being we still always
> >> reserve a pix proc unit.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/ti-vpe/cal.c | 44 +++++++++++++++++++++++++++--
> >>   drivers/media/platform/ti-vpe/cal.h |  2 ++
> >>   2 files changed, 44 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> >> index a6ca341c98bd..e397f59d3bbc 100644
> >> --- a/drivers/media/platform/ti-vpe/cal.c
> >> +++ b/drivers/media/platform/ti-vpe/cal.c
> >> @@ -290,6 +290,37 @@ void cal_quickdump_regs(struct cal_dev *cal)
> >>    * ------------------------------------------------------------------
> >>    */
> >>   
> >> +#define CAL_MAX_PIX_PROC 4
> >> +
> >> +static int cal_reserve_pix_proc(struct cal_dev *cal)
> >> +{
> >> +	unsigned long ret;
> >> +
> >> +	spin_lock(&cal->v4l2_dev.lock);
> >> +
> >> +	ret = find_first_zero_bit(&cal->reserve_pix_proc_mask, CAL_MAX_PIX_PROC);
> >> +
> >> +	if (ret == CAL_MAX_PIX_PROC) {
> >> +		spin_unlock(&cal->v4l2_dev.lock);
> >> +		return -ENOSPC;
> >> +	}
> >> +
> >> +	cal->reserve_pix_proc_mask |= BIT(ret);
> >> +
> >> +	spin_unlock(&cal->v4l2_dev.lock);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void cal_release_pix_proc(struct cal_dev *cal, unsigned int pix_proc_num)
> >> +{
> >> +	spin_lock(&cal->v4l2_dev.lock);
> >> +
> >> +	cal->reserve_pix_proc_mask &= ~BIT(pix_proc_num);
> >> +
> >> +	spin_unlock(&cal->v4l2_dev.lock);
> >> +}
> >> +
> >>   static void cal_ctx_csi2_config(struct cal_ctx *ctx)
> >>   {
> >>   	u32 val;
> >> @@ -433,12 +464,22 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
> >>   
> >>   int cal_ctx_prepare(struct cal_ctx *ctx)
> >>   {
> >> +	int ret;
> >> +
> >> +	ret = cal_reserve_pix_proc(ctx->cal);
> >> +	if (ret < 0) {
> >> +		ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	ctx->pix_proc = ret;
> > 
> > I wonder if this is the right place to allocate a context, it may be
> > better to reject invalid pipeline configurations earlier on. It's fine
> > for now, we can revisit this in subsequent patches, with the full
> > multiplexed streams implementation.
> 
> Earlier than what? Even before cal_start_streaming()? I guess we could 
> do this in cal_vb2_ioctl_reqbufs and cal_vb2_ioctl_create_bufs, but then 
> I'm not sure where to free the pix proc.

I'm trying to recall what I meant :-) There are only two options really,
at stream start (that's the latest point at which we need to guarantee a
valid pipeline), or when configuring routing (either through link setup,
or internal subdev routing). I'm not sure if the second option is even
possible. Buffer allocation isn't the right place.

> > Another option would be to allocate the context in cal_ctx_create() for
> > now, with a call to cal_reserve_pix_proc(), and move it later in the
> > context of the patch series that implements support for multiplexed
> > streams.
> 
> For now cal_reserve_pix_proc() will always succeed, as we have 4 pix 
> procs but only ever allocate 2 at the same time. If there is a better 
> place to do this for multiplexed streams, which is not available yet at 
> this patch, then I agree, we could just do this in cal_ctx_create until 
> we have that better place available.

Maybe that's what I meant :-) As I can't really recall, it probably
doesn't matter much.

> >> +
> >>   	return 0;
> >>   }
> >>   
> >>   void cal_ctx_unprepare(struct cal_ctx *ctx)
> >>   {
> >> -
> >> +	cal_release_pix_proc(ctx->cal, ctx->pix_proc);
> >>   }
> >>   
> >>   void cal_ctx_start(struct cal_ctx *ctx)
> >> @@ -872,7 +913,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
> >>   	ctx->dma_ctx = inst;
> >>   	ctx->ppi_ctx = inst;
> >>   	ctx->cport = inst;
> >> -	ctx->pix_proc = inst;
> >>   
> >>   	ret = cal_ctx_v4l2_init(ctx);
> >>   	if (ret)
> >> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> >> index c34b843d2019..01e05e46e48d 100644
> >> --- a/drivers/media/platform/ti-vpe/cal.h
> >> +++ b/drivers/media/platform/ti-vpe/cal.h
> >> @@ -188,6 +188,8 @@ struct cal_dev {
> >>   	struct media_device	mdev;
> >>   	struct v4l2_device	v4l2_dev;
> >>   	struct v4l2_async_notifier notifier;
> >> +
> >> +	unsigned long reserve_pix_proc_mask;
> > 
> > I would have named this used_pix_proc_mask.
> 
> The name has a typo, and should actually be 'reserved_pix_proc_mask'. 
> Doesn't 'used' mean that something was used, but may not be used 
> anymore? So... in_use_pix_proc_mask? 'active'? I don't know, I like 
> 'reserved' best here.

"reserved" is indeed better than "reserve". I may still like "used"
better, but I don't care much. Or you could flip it, and have
"free_pix_proc_mask". Up to you.

-- 
Regards,

Laurent Pinchart
