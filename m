Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29522363558
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 14:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhDRM7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 08:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRM7s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 08:59:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9D3C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 05:59:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0AD3499;
        Sun, 18 Apr 2021 14:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618750759;
        bh=o5QHeJNZZLpWFfFcp3SPCsIfCz3DBjOV7D9sShjbAWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UiTlOp6QfLaFE6avtujxnQzUHtPaiwv3ae1H+gl/2V3H7Nu/eCXCiDHc0apWxCQyw
         82i1zPDWDRj30JYABNUWWhi8EzINqAodnzxwGxajnx3n1hGBxSGf6F2FZyGRAD2224
         SYUGTb5625JcfT006+WAQSmMpi+p6wqcjLVkobtU=
Date:   Sun, 18 Apr 2021 15:59:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 17/28] media: ti-vpe: cal: allocate pix proc dynamically
Message-ID: <YHwtI+WIlHWCBEH5@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-18-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-18-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:46PM +0300, Tomi Valkeinen wrote:
> CAL has 4 pixel processing units but the units are not needed e.g. for
> metadata. As we could be capturing 4 pixel streams and 4 metadata
> streams, i.e. using 8 DMA contexts, we cannot assign a pixel processing
> unit to every DMA context. Instead we need to reserve a pixel processing
> unit only when needed.
> 
> Add functions to reserve and release a pix proc unit, and use them in
> cal_ctx_prepare/unprepare. Note that for the time being we still always
> reserve a pix proc unit.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 44 +++++++++++++++++++++++++++--
>  drivers/media/platform/ti-vpe/cal.h |  2 ++
>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index a6ca341c98bd..e397f59d3bbc 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -290,6 +290,37 @@ void cal_quickdump_regs(struct cal_dev *cal)
>   * ------------------------------------------------------------------
>   */
>  
> +#define CAL_MAX_PIX_PROC 4
> +
> +static int cal_reserve_pix_proc(struct cal_dev *cal)
> +{
> +	unsigned long ret;
> +
> +	spin_lock(&cal->v4l2_dev.lock);
> +
> +	ret = find_first_zero_bit(&cal->reserve_pix_proc_mask, CAL_MAX_PIX_PROC);
> +
> +	if (ret == CAL_MAX_PIX_PROC) {
> +		spin_unlock(&cal->v4l2_dev.lock);
> +		return -ENOSPC;
> +	}
> +
> +	cal->reserve_pix_proc_mask |= BIT(ret);
> +
> +	spin_unlock(&cal->v4l2_dev.lock);
> +
> +	return ret;
> +}
> +
> +static void cal_release_pix_proc(struct cal_dev *cal, unsigned int pix_proc_num)
> +{
> +	spin_lock(&cal->v4l2_dev.lock);
> +
> +	cal->reserve_pix_proc_mask &= ~BIT(pix_proc_num);
> +
> +	spin_unlock(&cal->v4l2_dev.lock);
> +}
> +
>  static void cal_ctx_csi2_config(struct cal_ctx *ctx)
>  {
>  	u32 val;
> @@ -433,12 +464,22 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
>  
>  int cal_ctx_prepare(struct cal_ctx *ctx)
>  {
> +	int ret;
> +
> +	ret = cal_reserve_pix_proc(ctx->cal);
> +	if (ret < 0) {
> +		ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->pix_proc = ret;

I wonder if this is the right place to allocate a context, it may be
better to reject invalid pipeline configurations earlier on. It's fine
for now, we can revisit this in subsequent patches, with the full
multiplexed streams implementation.

Another option would be to allocate the context in cal_ctx_create() for
now, with a call to cal_reserve_pix_proc(), and move it later in the
context of the patch series that implements support for multiplexed
streams.

> +
>  	return 0;
>  }
>  
>  void cal_ctx_unprepare(struct cal_ctx *ctx)
>  {
> -
> +	cal_release_pix_proc(ctx->cal, ctx->pix_proc);
>  }
>  
>  void cal_ctx_start(struct cal_ctx *ctx)
> @@ -872,7 +913,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>  	ctx->dma_ctx = inst;
>  	ctx->ppi_ctx = inst;
>  	ctx->cport = inst;
> -	ctx->pix_proc = inst;
>  
>  	ret = cal_ctx_v4l2_init(ctx);
>  	if (ret)
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index c34b843d2019..01e05e46e48d 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -188,6 +188,8 @@ struct cal_dev {
>  	struct media_device	mdev;
>  	struct v4l2_device	v4l2_dev;
>  	struct v4l2_async_notifier notifier;
> +
> +	unsigned long reserve_pix_proc_mask;

I would have named this used_pix_proc_mask.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };
>  
>  /*

-- 
Regards,

Laurent Pinchart
