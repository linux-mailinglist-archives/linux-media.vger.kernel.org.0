Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8FB1186B49
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731055AbgCPMls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:41:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35882 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730987AbgCPMls (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:41:48 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71AB6A3B;
        Mon, 16 Mar 2020 13:41:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584362506;
        bh=ESXbT02cqCKYeaps719w3dZaP3BHXDJl8htlMhyCtmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sf1bOLZV7l7ELWWKeLLxFtFkID11pyXespoAHa2NomgwAlAEuqA8ZvQHgtK4D8RAV
         DU0tMKJ82BLhS8nVsnnWsTns/ANw1x/wdpSaEf6lrAQoxthjxrn3TKDtQT293X8LwK
         I2EAWO0NgC2QzBWs7gdkLtw2J3s+SyziOsdCSbf0=
Date:   Mon, 16 Mar 2020 14:41:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 13/16] media: ti-vpe: cal: move code to separate functions
Message-ID: <20200316124141.GF4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-13-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-13-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:18PM +0200, Tomi Valkeinen wrote:
> To make csi2_wait_for_phy() more readable, move code to separate
> functions.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 38 ++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 64ea92dbfac5..319312770eea 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -822,20 +822,10 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  	csi2_cio_pwr(ctx, true);
>  }
>  
> -static void csi2_wait_for_phy(struct cal_ctx *ctx)
> +static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>  {
>  	int i;

unsigned int ?

>  
> -	/* Steps
> -	 *  2. Wait for completion of reset
> -	 *          Note if the external sensor is not sending byte clock,
> -	 *          the reset will timeout
> -	 *  4.Force FORCERXMODE
> -	 *      G. Wait for all enabled lane to reach stop state
> -	 *      H. Disable pull down using pad control
> -	 */
> -
> -	/* 2. Wait for reset completion */
>  	for (i = 0; i < 250; i++) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> @@ -854,7 +844,12 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
>  		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
>  
> -	/* 4. G. Wait for all enabled lane to reach stop state */
> +}
> +
> +static void csi2_wait_stop_state(struct cal_ctx *ctx)
> +{
> +	int i;

Ditto.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	for (i = 0; i < 10; i++) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_TIMING(ctx->csi2_port),
> @@ -866,9 +861,28 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  		ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
>  		(i >= 10) ? "(timeout)" : "");
> +
>  	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
>  			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
>  		ctx_err(ctx, "Timeout waiting for stop state\n");
> +}
> +
> +static void csi2_wait_for_phy(struct cal_ctx *ctx)
> +{
> +	/* Steps
> +	 *  2. Wait for completion of reset
> +	 *          Note if the external sensor is not sending byte clock,
> +	 *          the reset will timeout
> +	 *  4.Force FORCERXMODE
> +	 *      G. Wait for all enabled lane to reach stop state
> +	 *      H. Disable pull down using pad control
> +	 */
> +
> +	/* 2. Wait for reset completion */
> +	csi2_wait_complexio_reset(ctx);
> +
> +	/* 4. G. Wait for all enabled lane to reach stop state */
> +	csi2_wait_stop_state(ctx);
>  
>  	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
>  		(ctx->csi2_port - 1), reg_read(ctx->cc, CAL_CSI2_PHY_REG1));

-- 
Regards,

Laurent Pinchart
