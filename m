Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32281363554
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 14:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhDRMto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 08:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRMtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 08:49:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8435CC06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 05:49:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A76251E;
        Sun, 18 Apr 2021 14:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618750150;
        bh=nsEwiUyELvL2epMnhPfPQ9c8cpHzFyDu6PhqxLGdlWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZPEtERbWLnTTB1lwGSoigUtzO6SMDkfbfON1PVgdm86uoNIcJshEXYwGgsovZ4qhx
         zP1pFakdM8+6/YN8xilaRLbpbOuvZUjTBLpbloBuq9kcZg/eHQI7sZ/iaTU5aqIh1Z
         a9OT4t4p7O4Jf+W5G7f1TuRkSN4Svt7jkRRwuks8=
Date:   Sun, 18 Apr 2021 15:49:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 16/28] media: ti-vpe: cal: disable ppi and pix proc at
 ctx_stop
Message-ID: <YHwqwj2kw1td9VIZ@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-17-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-17-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:45PM +0300, Tomi Valkeinen wrote:
> Disable PPI and pix proc in cal_ctx_stop() to ensure they are not used
> if the same context is used later on a different PHY or without pix
> proc.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 092041ddbcfb..a6ca341c98bd 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -484,6 +484,12 @@ void cal_ctx_stop(struct cal_ctx *ctx)
>  		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
>  
>  	ctx->dma.state = CAL_DMA_STOPPED;
> +
> +	/* Disable PPI context */
> +	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx), 0);
> +
> +	/* Disable pix proc */
> +	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
>  }
>  
>  /* ------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
