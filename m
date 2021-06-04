Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEED39B9FC
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhFDNm4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhFDNmy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:42:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A45AC061766
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 06:41:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7754F9E5;
        Fri,  4 Jun 2021 15:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622814065;
        bh=/bTUlmEC01nfpFrowr4WCwtCBsNlXRjf940LnnRH3zM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qhrTwFk/oRujaiLF6ZiDTaCHOEj2pYFxdi2HXtDngQ+hW5ZnPPtXhxAT/1rtR7IQN
         IhYIJ5NiIqgD6Gh778vpfSUhmSX3SL9IIhkJJPHDcScKPeKSEFNf1Q3XvkkTgHBeCm
         Lz85wFIIiJ5DSPAyneqlwsVGudsKzP26TXDKGhsM=
Date:   Fri, 4 Jun 2021 16:40:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 09/38] media: ti-vpe: cal: Add CSI2 context
Message-ID: <YLotZZv6jmdRYMvE@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-10-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-10-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:08:40PM +0300, Tomi Valkeinen wrote:
> CAL has 8 CSI2 contexts per PHY, which are used to tag the incoming
> data.  The current driver only uses the first context, but we need to
> support all of them to implement multi-stream support.
> 
> Add a csi2_ctx field to cal_ctx, which indicates which of the 8 CSI2
> contexts is used for the particular cal_ctx. Also clean up the context
> register macros to take the CSI2 context number as a parameter.
> 
> Note that before this patch the CSI2 context used for both PHYs was
> always 0. This patch always uses cal_ctx index number as the CSI2
> context. There is no functional difference, but this approach will work
> also in the future when we use more than 1 CSI2 context per PHY.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c      | 10 ++++++----
>  drivers/media/platform/ti-vpe/cal.h      |  1 +
>  drivers/media/platform/ti-vpe/cal_regs.h | 18 ++----------------
>  3 files changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 6d6dce8001b2..98739f9200ff 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -294,7 +294,7 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
>  {
>  	u32 val;
>  
> -	val = cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index));
> +	val = cal_read(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->csi2_ctx));
>  	cal_set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
>  	/*
>  	 * DT type: MIPI CSI-2 Specs
> @@ -310,9 +310,10 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
>  	cal_set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
>  	cal_set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
>  		      CAL_CSI2_CTX_PACK_MODE_MASK);
> -	cal_write(ctx->cal, CAL_CSI2_CTX0(ctx->index), val);
> -	ctx_dbg(3, ctx, "CAL_CSI2_CTX0(%d) = 0x%08x\n", ctx->index,
> -		cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index)));
> +	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->csi2_ctx), val);
> +	ctx_dbg(3, ctx, "CAL_CSI2_CTX(%u, %u) = 0x%08x\n",
> +		ctx->phy->instance, ctx->csi2_ctx,
> +		cal_read(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->csi2_ctx)));
>  }
>  
>  static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
> @@ -854,6 +855,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>  	ctx->cal = cal;
>  	ctx->phy = cal->phy[inst];
>  	ctx->index = inst;
> +	ctx->csi2_ctx = inst;
>  	ctx->cport = inst;
>  
>  	ret = cal_ctx_v4l2_init(ctx);
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 251bb0ba7b3b..bcc3378b6b41 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -219,6 +219,7 @@ struct cal_ctx {
>  	struct vb2_queue	vb_vidq;
>  	u8			index;
>  	u8			cport;
> +	u8			csi2_ctx;
>  };
>  
>  extern unsigned int cal_debug;
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index f752096dcf7f..bf937919a1e9 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -72,22 +72,8 @@
>  #define CAL_CSI2_TIMING(m)		(0x314U + (m) * 0x80U)
>  #define CAL_CSI2_VC_IRQENABLE(m)	(0x318U + (m) * 0x80U)
>  #define CAL_CSI2_VC_IRQSTATUS(m)	(0x328U + (m) * 0x80U)
> -#define CAL_CSI2_CTX0(m)		(0x330U + (m) * 0x80U)
> -#define CAL_CSI2_CTX1(m)		(0x334U + (m) * 0x80U)
> -#define CAL_CSI2_CTX2(m)		(0x338U + (m) * 0x80U)
> -#define CAL_CSI2_CTX3(m)		(0x33cU + (m) * 0x80U)
> -#define CAL_CSI2_CTX4(m)		(0x340U + (m) * 0x80U)
> -#define CAL_CSI2_CTX5(m)		(0x344U + (m) * 0x80U)
> -#define CAL_CSI2_CTX6(m)		(0x348U + (m) * 0x80U)
> -#define CAL_CSI2_CTX7(m)		(0x34cU + (m) * 0x80U)
> -#define CAL_CSI2_STATUS0(m)		(0x350U + (m) * 0x80U)
> -#define CAL_CSI2_STATUS1(m)		(0x354U + (m) * 0x80U)
> -#define CAL_CSI2_STATUS2(m)		(0x358U + (m) * 0x80U)
> -#define CAL_CSI2_STATUS3(m)		(0x35cU + (m) * 0x80U)
> -#define CAL_CSI2_STATUS4(m)		(0x360U + (m) * 0x80U)
> -#define CAL_CSI2_STATUS5(m)		(0x364U + (m) * 0x80U)
> -#define CAL_CSI2_STATUS6(m)		(0x368U + (m) * 0x80U)
> -#define CAL_CSI2_STATUS7(m)		(0x36cU + (m) * 0x80U)
> +#define CAL_CSI2_CTX(phy, csi2_ctx)	(0x330U + (phy) * 0x80U + (csi2_ctx) * 4)
> +#define CAL_CSI2_STATUS(phy, csi2_ctx)	(0x350U + (phy) * 0x80U + (csi2_ctx) * 4)
>  
>  /* CAL CSI2 PHY register offsets */
>  #define CAL_CSI2_PHY_REG0		0x000

-- 
Regards,

Laurent Pinchart
