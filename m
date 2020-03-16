Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFC6186ACE
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730954AbgCPMZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:25:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35676 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbgCPMZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:25:16 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52010A3B;
        Mon, 16 Mar 2020 13:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584361514;
        bh=EcMmrk8Ii9LCPuWWPn5As6qXIWFB+iNRBDBwKYWuiO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CHp0nDjgZYGHi3rGKaKW/EplHJEeFxVLVoYOWqILoMb6K6TAJOL8nKDdkV3i+0RC/
         z7T6jeZzOHJXGSDY6Xe9u/0ZgIoVxXYXjS+ookaBKJ+wg1Y2zDTkckDlqL8gziWa6E
         cx9NL5tdJjOQ7ApZvH/ZLKVNwJDmDK37m8NJZXWQ=
Date:   Mon, 16 Mar 2020 14:24:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 06/16] media: ti-vpe: cal: remove useless CAL_GEN_* macros
Message-ID: <20200316122405.GW4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-6-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-6-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:11PM +0200, Tomi Valkeinen wrote:
> These macros only obfuscate the code, so drop them.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c      | 20 ++++++++------------
>  drivers/media/platform/ti-vpe/cal_regs.h |  9 ---------
>  2 files changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 0888d6aac3f4..cd788c6687cb 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -775,10 +775,8 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  
>  	/* 3.B. Program Stop States */
>  	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
> -	set_field(&val, CAL_GEN_ENABLE,
> -		  CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
> -	set_field(&val, CAL_GEN_DISABLE,
> -		  CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
> +	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
> +	set_field(&val, 0, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
>  	set_field(&val, 407, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
>  	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
>  	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
> @@ -787,8 +785,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  
>  	/* 4. Force FORCERXMODE */
>  	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
> -	set_field(&val, CAL_GEN_ENABLE,
> -		  CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
> +	set_field(&val, 1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
>  	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
>  	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
>  		ctx->csi2_port,
> @@ -851,8 +848,7 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  	for (i = 0; i < 10; i++) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_TIMING(ctx->csi2_port),
> -				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) ==
> -		    CAL_GEN_DISABLE)
> +				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
>  			break;
>  		usleep_range(1000, 1100);
>  	}
> @@ -949,13 +945,13 @@ static void csi2_ppi_enable(struct cal_ctx *ctx)
>  {
>  	reg_write(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port), BIT(3));
>  	reg_write_field(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
> -			CAL_GEN_ENABLE, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
> +			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
>  }
>  
>  static void csi2_ppi_disable(struct cal_ctx *ctx)
>  {
>  	reg_write_field(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
> -			CAL_GEN_DISABLE, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
> +			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
>  }
>  
>  static void csi2_ctx_config(struct cal_ctx *ctx)
> @@ -1030,7 +1026,7 @@ static void pix_proc_config(struct cal_ctx *ctx)
>  	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
>  	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
>  	set_field(&val, ctx->csi2_port, CAL_PIX_PROC_CPORT_MASK);
> -	set_field(&val, CAL_GEN_ENABLE, CAL_PIX_PROC_EN_MASK);
> +	set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
>  	reg_write(ctx->dev, CAL_PIX_PROC(ctx->csi2_port), val);
>  	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_PIX_PROC(ctx->csi2_port)));
> @@ -1050,7 +1046,7 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
>  		  CAL_WR_DMA_CTRL_MODE_MASK);
>  	set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
>  		  CAL_WR_DMA_CTRL_PATTERN_MASK);
> -	set_field(&val, CAL_GEN_ENABLE, CAL_WR_DMA_CTRL_STALL_RD_MASK);
> +	set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
>  	reg_write(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port), val);
>  	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port)));
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index a29198cc3efe..532d4a95740a 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -100,15 +100,6 @@
>  /* CAL Control Module Core Camerrx Control register offsets */
>  #define CM_CTRL_CORE_CAMERRX_CONTROL	0x000
>  
> -/*********************************************************************
> -* Generic value used in various field below
> -*********************************************************************/
> -
> -#define CAL_GEN_DISABLE			0
> -#define CAL_GEN_ENABLE			1
> -#define CAL_GEN_FALSE			0
> -#define CAL_GEN_TRUE			1
> -
>  /*********************************************************************
>  * Field Definition Macros
>  *********************************************************************/

-- 
Regards,

Laurent Pinchart
