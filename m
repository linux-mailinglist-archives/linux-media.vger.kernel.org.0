Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2489D186AFC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731082AbgCPMf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:35:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35792 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731060AbgCPMfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:35:53 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 179FEA3B;
        Mon, 16 Mar 2020 13:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584362151;
        bh=VQkwkB9UzTeWvv93tQRzWXfoB9JuGOOT6f0e5k0q4Ik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uc9daRYQDpN/cYhL9+nZJxnGlgySYr2Z4fVyI6ZbbIBo2Tw/TlX52RDAGZ+nCmxbQ
         FJ9W5NEtM9PyvuUr87TLEdHIBrOq1gUxlKOGgsuHn3JHMUYfLuPistrJjCU4pfsg5S
         Pa629KHdebS3S+CQYyouuSB4tQuaOlYwJzDaoysc=
Date:   Mon, 16 Mar 2020 14:35:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 09/16] media: ti-vpe: cal: cleanup CIO power
 enable/disable
Message-ID: <20200316123544.GB4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-9-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-9-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:14PM +0200, Tomi Valkeinen wrote:
> Move the code to enable and disable ComplexIO power to its own function.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 68 ++++++++++++++---------------
>  1 file changed, 32 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index ebea5fa28691..771ad7c14c96 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -731,11 +731,40 @@ static void disable_irqs(struct cal_ctx *ctx)
>  	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0);
>  }
>  
> +static void csi2_cio_pwr(struct cal_ctx *ctx, bool enable)

I think you can spell it out fully to csi2_cio_power.

> +{
> +	u32 target_state;
> +	int i;

i is never negative, it can be an unsued int.

> +
> +	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
> +		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
> +
> +	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +			target_state,
> +			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);

These two liens would hold on a single line.

> +
> +	for (i = 0; i < 10; i++) {
> +		u32 current_state;
> +
> +		current_state = reg_read_field(ctx->dev,
> +					       CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
> +
> +		if (current_state == target_state)
> +			break;
> +
> +		usleep_range(1000, 1100);
> +	}
> +
> +	if (i == 10)
> +		ctx_err(ctx, "Failed to power %s complexio\n",
> +			enable ? "up" : "down");
> +}
> +
>  static void csi2_phy_config(struct cal_ctx *ctx);
>  
>  static void csi2_phy_init(struct cal_ctx *ctx)
>  {
> -	int i;
>  	u32 val;
>  
>  	/* Steps
> @@ -790,23 +819,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
>  
>  	/* E. Power up the PHY using the complex IO */
> -	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> -			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON,
> -			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
> -
> -	/* F. Wait for power up completion */
> -	for (i = 0; i < 10; i++) {
> -		if (reg_read_field(ctx->dev,
> -				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> -				   CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK) ==
> -		    CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_STATE_ON)
> -			break;
> -		usleep_range(1000, 1100);
> -	}
> -	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Powered UP %s\n",
> -		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)),
> -		(i >= 10) ? "(timeout)" : "");
> +	csi2_cio_pwr(ctx, true);
>  }
>  
>  static void csi2_wait_for_phy(struct cal_ctx *ctx)
> @@ -865,24 +878,7 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
>  {
>  	int i;
>  
> -	/* Power down the PHY using the complex IO */
> -	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> -			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF,
> -			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
> -
> -	/* Wait for power down completion */
> -	for (i = 0; i < 10; i++) {
> -		if (reg_read_field(ctx->dev,
> -				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> -				   CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK) ==
> -		    CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_STATE_OFF)
> -			break;
> -		usleep_range(1000, 1100);
> -	}
> -	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Powered Down %s\n",
> -		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)),
> -		(i >= 10) ? "(timeout)" : "");
> +	csi2_cio_pwr(ctx, false);
>  
>  	/* Assert Comple IO Reset */
>  	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),

-- 
Regards,

Laurent Pinchart
