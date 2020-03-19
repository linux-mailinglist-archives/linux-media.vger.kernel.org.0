Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6524E18C310
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgCSWkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:40:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52826 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbgCSWkG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:40:06 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMe3qW114472;
        Thu, 19 Mar 2020 17:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657603;
        bh=e0yvki9CoxSW2f/a7I73pitk+TGIQ3SNv9f1q8tSaHA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eirhyz4rp+qLDO2bpCqlBUZEdFQ3uYZksuzz40du+cRZmUHTB3c0+JxEb4xcpeT9n
         2fcVaxJ3HSCfTl9yD+i20/hMrY9zCO8mWKpxEDD9izPfmztSN7wFMiO7RmBH3iGwGG
         ptT6cobUMVzQlm6j7nvDH9w9+MzF6g2mkAEGZEb0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMe28I111432
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:40:02 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:40:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:40:02 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMe13S047598;
        Thu, 19 Mar 2020 17:40:01 -0500
Subject: Re: [PATCH v2 09/19] media: ti-vpe: cal: remove useless CAL_GEN_*
 macros
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-10-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <6296b144-1e30-43d1-1bf2-3bfe0fdd5569@ti.com>
Date:   Thu, 19 Mar 2020 17:40:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-10-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi,

Thanks for the patch.

On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
> These macros only obfuscate the code, so drop them.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c      | 20 ++++++++------------
>  drivers/media/platform/ti-vpe/cal_regs.h |  9 ---------
>  2 files changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index ba82f0887875..53072afbaf4e 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -777,10 +777,8 @@ static void csi2_phy_init(struct cal_ctx *ctx)
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
> @@ -789,8 +787,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  
>  	/* 4. Force FORCERXMODE */
>  	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
> -	set_field(&val, CAL_GEN_ENABLE,
> -		  CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
> +	set_field(&val, 1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
>  	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
>  	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
>  		ctx->csi2_port,
> @@ -853,8 +850,7 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  	for (i = 0; i < 10; i++) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_TIMING(ctx->csi2_port),
> -				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) ==
> -		    CAL_GEN_DISABLE)
> +				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
>  			break;
>  		usleep_range(1000, 1100);
>  	}
> @@ -951,13 +947,13 @@ static void csi2_ppi_enable(struct cal_ctx *ctx)
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
> @@ -1032,7 +1028,7 @@ static void pix_proc_config(struct cal_ctx *ctx)
>  	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
>  	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
>  	set_field(&val, ctx->csi2_port, CAL_PIX_PROC_CPORT_MASK);
> -	set_field(&val, CAL_GEN_ENABLE, CAL_PIX_PROC_EN_MASK);
> +	set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
>  	reg_write(ctx->dev, CAL_PIX_PROC(ctx->csi2_port), val);
>  	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_PIX_PROC(ctx->csi2_port)));
> @@ -1052,7 +1048,7 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
>  		  CAL_WR_DMA_CTRL_MODE_MASK);
>  	set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
>  		  CAL_WR_DMA_CTRL_PATTERN_MASK);
> -	set_field(&val, CAL_GEN_ENABLE, CAL_WR_DMA_CTRL_STALL_RD_MASK);
> +	set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
>  	reg_write(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port), val);
>  	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port)));
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index 2d71f1e86e2a..3b3150aaf343 100644
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
> 
