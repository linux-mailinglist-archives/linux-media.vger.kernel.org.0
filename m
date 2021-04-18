Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4E0363519
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 14:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhDRMVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 08:21:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59110 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhDRMVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 08:21:01 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECCB651E;
        Sun, 18 Apr 2021 14:20:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618748431;
        bh=/4adP4/FUDE96y6JFTlNvqBPk8+KDFbvQkY/+56sKLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=erfUl90JBmDSn36NJYquS2Sd/UhlqJZap5J+hDAXA0tlw6L0lHRk4G0s2OguHjulq
         R5B6Qu1e0SS5ZLxohDJD1f/bS8aRcJfJZJj6c67xyDXoJM0dS83pqiVLuUhT614zes
         qdZT/xfVQU/acmYyexbtMbpsIGzElYsexYUBbHDc=
Date:   Sun, 18 Apr 2021 15:20:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 10/28] media: ti-vpe: cal: Add pixel processing context
Message-ID: <YHwkCwIEWiWrq3ca@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-11-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-11-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:39PM +0300, Tomi Valkeinen wrote:
> CAL has 4 pixel processing contexts (PIX PROC) of which the driver
> currently uses pix proc 0 for PHY0, and pix proc 1 for PHY1 (as the
> driver supports only a single source per PHY).
> 
> Add a pix_proc field to cal_ctx to allow us to use different pix proc
> contexts in the future
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 9 +++++----
>  drivers/media/platform/ti-vpe/cal.h | 1 +
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index c550eeb27e79..3dc83c66fd96 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -355,16 +355,16 @@ static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
>  		break;
>  	}
>  
> -	val = cal_read(ctx->cal, CAL_PIX_PROC(ctx->index));
> +	val = cal_read(ctx->cal, CAL_PIX_PROC(ctx->pix_proc));
>  	cal_set_field(&val, extract, CAL_PIX_PROC_EXTRACT_MASK);
>  	cal_set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
>  	cal_set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
>  	cal_set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
>  	cal_set_field(&val, ctx->cport, CAL_PIX_PROC_CPORT_MASK);
>  	cal_set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
> -	cal_write(ctx->cal, CAL_PIX_PROC(ctx->index), val);
> -	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->index,
> -		cal_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
> +	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), val);
> +	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->pix_proc,

While at it, you could s/%d/%u/

> +		cal_read(ctx->cal, CAL_PIX_PROC(ctx->pix_proc)));

And should we use val here instead of reading the value back ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
>  static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
> @@ -857,6 +857,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>  	ctx->index = inst;
>  	ctx->ppi_ctx = inst;
>  	ctx->cport = inst;
> +	ctx->pix_proc = inst;
>  
>  	ret = cal_ctx_v4l2_init(ctx);
>  	if (ret)
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 6eb63268f916..03c71763f1a5 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -220,6 +220,7 @@ struct cal_ctx {
>  	u8			index;
>  	u8			cport;
>  	u8			ppi_ctx;
> +	u8			pix_proc;
>  };
>  
>  extern unsigned int cal_debug;

-- 
Regards,

Laurent Pinchart
