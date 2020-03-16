Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E9F186B60
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731070AbgCPMtP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:49:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35952 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730979AbgCPMtP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:49:15 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E9AAA3B;
        Mon, 16 Mar 2020 13:49:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584362953;
        bh=kcPZrE6HjDktfkX88ocFIvd8zLlfitSxIbjG2w56b5I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iw0PwozsrkEgPa+YzE4bVXRyBCZluIqpTAkfyvsNRrbYYS4BW7AeyFjZE2KzSDaLW
         ePzDky56P8onMaAR+iyhczYZ/iiWOODdFWygGIU68DXgMJyYGBRxTopV1rY52qHbhQ
         MaTmv5lfQXgNLwCPj3yC3D0WJclr53MkTj22f+6o=
Date:   Mon, 16 Mar 2020 14:49:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 16/16] media: ti-vpe: cal: fix stop state timeout
Message-ID: <20200316124908.GI4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-16-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-16-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:21PM +0200, Tomi Valkeinen wrote:
> The stop-state timeout needs to be over 100us as per CSI spec. With the
> CAL fclk of 266 MHZ on DRA76, with the current value the driver uses,
> the timeout is 24us. Too small timeout will cause failure to enable the
> streaming.
> 
> Also, the fclk can be different on other SoCs, as is the case with AM65x
> where the fclk is 250 MHz.
> 
> This patch fixes the timeout by calculating it correctly based on the
> fclk rate.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index df5a4281838b..e9dd405b8eb1 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -6,6 +6,7 @@
>   * Benoit Parrot, <bparrot@ti.com>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/ioctl.h>
> @@ -340,6 +341,7 @@ static const struct cal_data am654_cal_data = {
>   * all instances.
>   */
>  struct cal_dev {
> +	struct clk		*fclk;
>  	int			irq;
>  	void __iomem		*base;
>  	struct resource		*res;
> @@ -766,6 +768,7 @@ static void csi2_phy_config(struct cal_ctx *ctx);
>  static void csi2_phy_init(struct cal_ctx *ctx)
>  {
>  	u32 val;
> +	u32 sscounter;
>  
>  	/* Steps
>  	 *  1. Configure D-PHY mode and enable required lanes
> @@ -802,10 +805,13 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  	csi2_phy_config(ctx);
>  
>  	/* 3.B. Program Stop States */
> +	/* Must be more than 100us */

You may want to expand this comment to explain the calculation
(especially the * 16 * 4).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	sscounter = DIV_ROUND_UP(clk_get_rate(ctx->dev->fclk), 10000 *  16 * 4);
> +
>  	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
>  	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
> -	set_field(&val, 0, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
> -	set_field(&val, 407, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
> +	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
> +	set_field(&val, sscounter, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
>  	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
>  	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
>  		ctx->csi2_port,
> @@ -2263,6 +2269,12 @@ static int cal_probe(struct platform_device *pdev)
>  	/* save pdev pointer */
>  	dev->pdev = pdev;
>  
> +	dev->fclk = devm_clk_get(&pdev->dev, "fck");
> +	if (IS_ERR(dev->fclk)) {
> +		dev_err(&pdev->dev, "cannot get CAL fclk\n");
> +		return PTR_ERR(dev->fclk);
> +	}
> +
>  	syscon_camerrx = syscon_regmap_lookup_by_phandle(parent,
>  							 "ti,camerrx-control");
>  	ret = of_property_read_u32_index(parent, "ti,camerrx-control", 1,

-- 
Regards,

Laurent Pinchart
