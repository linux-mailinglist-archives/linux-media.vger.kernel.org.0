Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20FC1186AEB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgCPMdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:33:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35752 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730956AbgCPMdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:33:06 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C331EA3B;
        Mon, 16 Mar 2020 13:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584361984;
        bh=9RCobvtVU/58kxCnOPAE+M5K8JxCw/zbgrXXkU1k3GA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f5G6P8w38KqVr3cBSeuus+HzLQCbmXB/vs/w1XVEaT7jQkt3fjGm3A5B4qoifbIRW
         62huYMUGwjm0Agt7Bf74cHQlsg85hBusAYA+De6dS/2V9kv/oUH9y/C4IC7g0QEyso
         W2/RERxS6KPziUHaPwPftUcTs0tvuagcALN50+ZY=
Date:   Mon, 16 Mar 2020 14:32:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 08/16] media: ti-vpe: cal: use reg_write_field
Message-ID: <20200316123259.GA4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-8-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-8-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:13PM +0200, Tomi Valkeinen wrote:
> Simplify the code by using reg_write_field() where trivially possible.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I wonder if it would make sense to use regmap.

> ---
>  drivers/media/platform/ti-vpe/cal.c | 34 ++++++++++++-----------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index cd788c6687cb..ebea5fa28691 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -759,10 +759,9 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  	camerarx_phy_enable(ctx);
>  
>  	/* 2. Reset complex IO - Do not wait for reset completion */
> -	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
> -	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
> -		  CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
> -	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
> +	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
> +			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
>  	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
>  		ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
> @@ -784,18 +783,16 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
>  
>  	/* 4. Force FORCERXMODE */
> -	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
> -	set_field(&val, 1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
> -	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
> +	reg_write_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
> +			1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
>  	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
>  		ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
>  
>  	/* E. Power up the PHY using the complex IO */
> -	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
> -	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON,
> -		  CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
> -	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
> +	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON,
> +			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
>  
>  	/* F. Wait for power up completion */
>  	for (i = 0; i < 10; i++) {
> @@ -867,13 +864,11 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  static void csi2_phy_deinit(struct cal_ctx *ctx)
>  {
>  	int i;
> -	u32 val;
>  
>  	/* Power down the PHY using the complex IO */
> -	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
> -	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF,
> -		  CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
> -	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
> +	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF,
> +			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
>  
>  	/* Wait for power down completion */
>  	for (i = 0; i < 10; i++) {
> @@ -890,10 +885,9 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
>  		(i >= 10) ? "(timeout)" : "");
>  
>  	/* Assert Comple IO Reset */
> -	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
> -	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
> -		  CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
> -	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
> +	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
> +			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
>  
>  	/* Wait for power down completion */
>  	for (i = 0; i < 10; i++) {

-- 
Regards,

Laurent Pinchart
