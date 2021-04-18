Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10553363563
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhDRNHB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhDRNHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:07:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F70C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 06:06:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1512499;
        Sun, 18 Apr 2021 15:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618751190;
        bh=1zU9OdK9hG5LXmgBGdwier22DNL/jPo/2VWw58wwa6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JnuGbUVQ3szUvmZe+T1/ubV/STrl4YGiSBBQWms5r9TGnkdcigtUk3uoLvz8EvWZg
         n2SexmgF2b0Sq+3jSuCD8xUr1RGAHr7dU36b8IUYMlJO0yFOmYQjuH3INXIS4ruY4y
         TeB77NQhKqZUKeHsXtN0+hxd1Q4ZcHZKHD1Thngc=
Date:   Sun, 18 Apr 2021 16:06:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 20/28] media: ti-vpe: cal: add vc and datatype fields to
 cal_ctx
Message-ID: <YHwu06i2OZsJAa4a@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-21-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-21-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:49PM +0300, Tomi Valkeinen wrote:
> In preparation for supporting multiple virtual channels and datatypes,
> add vc and datatype fields to cal_ctx, initialize them to the currently
> used values, and use those fields when writing to the register.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 6 ++++--
>  drivers/media/platform/ti-vpe/cal.h | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 0fef892854ef..91d2139adc9b 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -335,8 +335,8 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
>  	 *  0x2A: RAW8   1 pixel  = 1 byte
>  	 *  0x1E: YUV422 2 pixels = 4 bytes
>  	 */
> -	cal_set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
> -	cal_set_field(&val, 0, CAL_CSI2_CTX_VC_MASK);
> +	cal_set_field(&val, ctx->datatype, CAL_CSI2_CTX_DT_MASK);
> +	cal_set_field(&val, ctx->vc, CAL_CSI2_CTX_VC_MASK);
>  	cal_set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
>  	cal_set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
>  	cal_set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
> @@ -926,6 +926,8 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>  	ctx->dma_ctx = inst;
>  	ctx->ppi_ctx = inst;
>  	ctx->cport = inst;
> +	ctx->vc = 0;
> +	ctx->datatype = 1;	/* datatype filter disabled */

Could you define a macro in cal_regs.h for this ? You can then drop the
comment.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	ret = cal_ctx_v4l2_init(ctx);
>  	if (ret)
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 409b7276a1fa..8aa93c92193a 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -223,6 +223,8 @@ struct cal_ctx {
>  	u8			cport;
>  	u8			ppi_ctx;
>  	u8			pix_proc;
> +	u8			vc;
> +	u8			datatype;
>  
>  	bool use_pix_proc;
>  };

-- 
Regards,

Laurent Pinchart
