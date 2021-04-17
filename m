Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E923632A5
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 01:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhDQX1j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 19:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhDQX1j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 19:27:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43B3C06174A
        for <linux-media@vger.kernel.org>; Sat, 17 Apr 2021 16:27:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27B8149B;
        Sun, 18 Apr 2021 01:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618702029;
        bh=9u1M3yH8lCyMf1mVMKP48FPBVjJqXi5uinn4QOLLN+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dy3xpHs+Zthl4dt7a4cusF2uMNTEqst5/1Er9kcEhOgG54Ob6NFFOly8y2rLgOfCI
         ZuV+3dKhPBkuIwoSYLOfdQ6xs6toz1/zsbHfD9Shp39RCzb6F0On0o1Wmgi7lP5qEZ
         tDgBKFRQo3/1/XIpql1BurVA6ahb7jcB6Drk307c=
Date:   Sun, 18 Apr 2021 02:27:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/28] media: ti-vpe: cal: move global config from
 cal_ctx_wr_dma_config to runtime resume
Message-ID: <YHtuywJ81zS6ICEd@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-6-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:34PM +0300, Tomi Valkeinen wrote:
> For some reason CAL_CTRL is written at the end of cal_ctx_wr_dma_config.
> CAL_CTRL is a global (for CAL) register, so it should be independent of
> contexts.
> 
> Move the code to cal_runtime_resume().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index a5340b583592..b539a9afb3f5 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -403,17 +403,6 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
>  	cal_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index), val);
>  	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->index,
>  		cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index)));
> -
> -	val = cal_read(ctx->cal, CAL_CTRL);
> -	cal_set_field(&val, CAL_CTRL_BURSTSIZE_BURST128,
> -		      CAL_CTRL_BURSTSIZE_MASK);
> -	cal_set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
> -	cal_set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
> -		      CAL_CTRL_POSTED_WRITES_MASK);
> -	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
> -	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
> -	cal_write(ctx->cal, CAL_CTRL, val);
> -	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", cal_read(ctx->cal, CAL_CTRL));
>  }
>  
>  void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
> @@ -1125,6 +1114,7 @@ static int cal_runtime_resume(struct device *dev)
>  {
>  	struct cal_dev *cal = dev_get_drvdata(dev);
>  	unsigned int i;
> +	u32 val;
>  
>  	if (cal->data->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
>  		/*
> @@ -1141,6 +1131,17 @@ static int cal_runtime_resume(struct device *dev)
>  	 */
>  	cal_write(cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
>  
> +	val = cal_read(cal, CAL_CTRL);
> +	cal_set_field(&val, CAL_CTRL_BURSTSIZE_BURST128,
> +		      CAL_CTRL_BURSTSIZE_MASK);
> +	cal_set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
> +	cal_set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
> +		      CAL_CTRL_POSTED_WRITES_MASK);
> +	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
> +	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
> +	cal_write(cal, CAL_CTRL, val);
> +	cal_dbg(3, cal, "CAL_CTRL = 0x%08x\n", cal_read(cal, CAL_CTRL));

While at it, could you turn the hex values to lower case ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
