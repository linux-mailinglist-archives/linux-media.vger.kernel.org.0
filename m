Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06BF363520
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 14:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhDRM3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 08:29:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59166 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbhDRM3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 08:29:35 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAFF351E;
        Sun, 18 Apr 2021 14:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618748947;
        bh=Xmn04XHS+uQ9FiqlYWp2u2o65YeDY0pPEunyA1aU5IQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lQP2Nam/I9FK0rO+IdKgoelIfn3KI7EIKPd22amRG2L9i9fo4CdORU4eLU44Uzp1m
         +mdiEobwyhqS6SS+iL3tzalHYX1pzZrC0KucsVUV4CYP8pKaqMJG3WE5KqRBNyFYSA
         30ZyL+E0E53iJOJiWrWuq8r9JghiJJVD2utG5KCw=
Date:   Sun, 18 Apr 2021 15:29:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 12/28] media: ti-vpe: cal: rename CAL_HL_IRQ_MASK
Message-ID: <YHwmD+oK9l4vsDJc@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-13-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-13-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:41PM +0300, Tomi Valkeinen wrote:
> CAL_HL_IRQ_MASK macro is used for both WDMA start and end status bits.
> For clarity, rename CAL_HL_IRQ_MASK macro to CAL_HL_IRQ_WDMA_END_MASK
> and CAL_HL_IRQ_WDMA_START_MASK.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c      | 12 ++++++------
>  drivers/media/platform/ti-vpe/cal_regs.h |  3 ++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index daa0c1ab94e7..0abcc83841c6 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -453,9 +453,9 @@ void cal_ctx_start(struct cal_ctx *ctx)
>  
>  	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
>  	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(1),
> -		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
> +		  CAL_HL_IRQ_WDMA_END_MASK(ctx->dma_ctx));
>  	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
> -		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
> +		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
>  }
>  
>  void cal_ctx_stop(struct cal_ctx *ctx)
> @@ -479,9 +479,9 @@ void cal_ctx_stop(struct cal_ctx *ctx)
>  
>  	/* Disable IRQ_WDMA_END and IRQ_WDMA_START. */
>  	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(1),
> -		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
> +		  CAL_HL_IRQ_WDMA_END_MASK(ctx->dma_ctx));
>  	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(2),
> -		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
> +		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
>  
>  	ctx->dma.state = CAL_DMA_STOPPED;
>  }
> @@ -589,7 +589,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>  		cal_write(cal, CAL_HL_IRQSTATUS(1), status);
>  
>  		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> -			if (status & CAL_HL_IRQ_MASK(i))
> +			if (status & CAL_HL_IRQ_WDMA_END_MASK(i))
>  				cal_irq_wdma_end(cal->ctx[i]);
>  		}
>  	}
> @@ -603,7 +603,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>  		cal_write(cal, CAL_HL_IRQSTATUS(2), status);
>  
>  		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> -			if (status & CAL_HL_IRQ_MASK(i))
> +			if (status & CAL_HL_IRQ_WDMA_START_MASK(i))
>  				cal_irq_wdma_start(cal->ctx[i]);
>  		}
>  	}
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index 5c4f9e642185..93d9bf1f3c00 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -125,7 +125,8 @@
>  #define CAL_HL_IRQ_EOI_LINE_NUMBER_READ0		0
>  #define CAL_HL_IRQ_EOI_LINE_NUMBER_EOI0			0
>  
> -#define CAL_HL_IRQ_MASK(m)			BIT(m)
> +#define CAL_HL_IRQ_WDMA_END_MASK(m)		BIT(m)
> +#define CAL_HL_IRQ_WDMA_START_MASK(m)		BIT(m)

I foresee a risk of mixing the two macros, using
CAL_HL_IRQ_WDMA_START_MASK with IRQ(1) or CAL_HL_IRQ_WDMA_END_MASK with
IRQ(2). Not sure how we could prevent that though, and it won't make any
functional difference (but could lead to other bugs), so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  #define CAL_HL_IRQ_OCPO_ERR_MASK		BIT(6)
>  

-- 
Regards,

Laurent Pinchart
