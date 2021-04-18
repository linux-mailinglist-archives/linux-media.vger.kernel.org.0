Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A9B363561
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhDRNFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRNFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:05:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A66FC06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 06:04:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91BE7499;
        Sun, 18 Apr 2021 15:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618751079;
        bh=TxHrxsLM+DxMk9LXfAxwLD7/doiaqyUetevEPPbf3g4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KFTxMgDYk4ppYYng3ZINJcqFkBzr6re0XdcgkDxW8TmFUKXD4YC72UB7dHmGj37tH
         QZpsF4TRYYhvMMgq5MXgM2hr7g8R4JbQhXAwL/aUY+K5/BR3tFHnRM3FPYF+6XT3eV
         Xeob6ERx7JacGZ9tVr3SqNq//GpW9kJTAh7KPKkQ=
Date:   Sun, 18 Apr 2021 16:04:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 19/28] media: ti-vpe: cal: add cal_ctx_wr_dma_enable and
 fix a race
Message-ID: <YHwuZJJR6sbKcNsT@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-20-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-20-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:48PM +0300, Tomi Valkeinen wrote:
> I have not noticed any errors due to this, but the DMA configuration
> looks racy. Setting the DMA mode bitfield in CAL_WR_DMA_CTRL supposedly
> enables the DMA. However, the driver currently a) continues configuring
> the DMA after setting the mode, and b) enables the DMA interrupts only
> after setting the mode.
> 
> This probably doesn't cause any issues as there should be no data coming
> in to the DMA yet, but it's still better to fix this.
> 
> Add a new function, cal_ctx_wr_dma_enable(), to set the DMA mode field,
> and call that function only after the DMA config and the irq enabling
> has been done.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index a1d173bd4613..0fef892854ef 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -409,8 +409,6 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
>  		      CAL_WR_DMA_CTRL_YSIZE_MASK);
>  	cal_set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
>  		      CAL_WR_DMA_CTRL_DTAG_MASK);
> -	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
> -		      CAL_WR_DMA_CTRL_MODE_MASK);
>  	cal_set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
>  		      CAL_WR_DMA_CTRL_PATTERN_MASK);
>  	cal_set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
> @@ -442,6 +440,15 @@ void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
>  	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->dma_ctx), addr);
>  }
>  
> +static void cal_ctx_wr_dma_enable(struct cal_ctx *ctx)
> +{
> +	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx));
> +
> +	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
> +		      CAL_WR_DMA_CTRL_MODE_MASK);
> +	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx), val);
> +}
> +
>  static void cal_ctx_wr_dma_disable(struct cal_ctx *ctx)
>  {
>  	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx));
> @@ -500,6 +507,8 @@ void cal_ctx_start(struct cal_ctx *ctx)
>  		  CAL_HL_IRQ_WDMA_END_MASK(ctx->dma_ctx));
>  	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
>  		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
> +
> +	cal_ctx_wr_dma_enable(ctx);
>  }

You could also move the IRQ enabling before the call to
cal_ctx_wr_dma_config(), and reorder the configuration in
cal_ctx_wr_dma_config() to write CAL_WR_DMA_CTRL last. That would save a
read-modify-write cycle.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  void cal_ctx_stop(struct cal_ctx *ctx)

-- 
Regards,

Laurent Pinchart
