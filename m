Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F6B363589
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhDRNah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRNag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:30:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC42C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 06:30:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58FD849B;
        Sun, 18 Apr 2021 15:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618752607;
        bh=6l+zgEsuEQkUROaTpdZyHD9IwwJNceukYFR+j2DORxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZdEH0VG+kCInJKLh1FbrxDDlxgTReP9l/lGsEOjTK0C/0KQ9f05MDh6WvcgoU5s4Q
         1k+K7zpZ9W/l7cg1NEBVLhVYHmUpOfYXrKwTX9Me7Qb91yMtrdHWOVQTG8s/uZOqrV
         pNwIHxR2Zig8efJQBpSg1ecDy3wm1PvoLdVPiVh8=
Date:   Sun, 18 Apr 2021 16:30:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 07/28] media: ti-vpe: cal: add cal_ctx_prepare/unprepare
Message-ID: <YHw0XH8XvWo3wnF0@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-8-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-8-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:36PM +0300, Tomi Valkeinen wrote:
> In the following patches we need to do context configuration which might
> fail. Add new functions, cal_ctx_prepare and cal_ctx_unprepare, to
> handle such configuration.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal-video.c |  9 +++++++++
>  drivers/media/platform/ti-vpe/cal.c       | 10 ++++++++++
>  drivers/media/platform/ti-vpe/cal.h       |  2 ++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index cf603cc9114c..8e9bbe6beb23 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -708,6 +708,12 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>  		goto error_pipeline;
>  	}
>  
> +	ret = cal_ctx_prepare(ctx);
> +	if (ret) {
> +		ctx_err(ctx, "Failed to prepare context: %d\n", ret);
> +		goto error_pipeline;
> +	}
> +
>  	spin_lock_irq(&ctx->dma.lock);
>  	buf = list_first_entry(&ctx->dma.queue, struct cal_buffer, list);
>  	ctx->dma.pending = buf;
> @@ -733,6 +739,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>  error_stop:
>  	cal_ctx_stop(ctx);
>  	pm_runtime_put_sync(ctx->cal->dev);
> +	cal_ctx_unprepare(ctx);
>  
>  error_pipeline:
>  	media_pipeline_stop(&ctx->vdev.entity);
> @@ -752,6 +759,8 @@ static void cal_stop_streaming(struct vb2_queue *vq)
>  
>  	pm_runtime_put_sync(ctx->cal->dev);
>  
> +	cal_ctx_unprepare(ctx);
> +
>  	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
>  
>  	media_pipeline_stop(&ctx->vdev.entity);
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index b539a9afb3f5..3d57aedbee0a 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -430,6 +430,16 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
>  	return stopped;
>  }
>  
> +int cal_ctx_prepare(struct cal_ctx *ctx)
> +{
> +	return 0;
> +}
> +
> +void cal_ctx_unprepare(struct cal_ctx *ctx)
> +{
> +
> +}
> +
>  void cal_ctx_start(struct cal_ctx *ctx)
>  {
>  	ctx->sequence = 0;
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index af46084580bd..09ad20faa9e1 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -296,6 +296,8 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  					 unsigned int instance);
>  void cal_camerarx_destroy(struct cal_camerarx *phy);
>  
> +int cal_ctx_prepare(struct cal_ctx *ctx);
> +void cal_ctx_unprepare(struct cal_ctx *ctx);
>  void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr);
>  void cal_ctx_start(struct cal_ctx *ctx);
>  void cal_ctx_stop(struct cal_ctx *ctx);

-- 
Regards,

Laurent Pinchart
