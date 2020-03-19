Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88F8918C35B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCSWxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:53:47 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36758 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbgCSWxr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:53:47 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMrhiw115084;
        Thu, 19 Mar 2020 17:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584658423;
        bh=7pUpF6HndpNXoUcNjqnrDfxY4f6Qahw16RwBbnTKvLo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hFjuQnjPu5lJ7//SRapN+ZJkYRvsLAt+wqI8JZ27XWVeRtsAIHGPWfrd6OcjzSgfC
         TyMfKmnQFmMKfQYPuT7NeaJ55xOwiLl431x5XEkTGL8vEKQ3w/a7dU2+Vxcx6ijcOq
         3MNZD5ZAxXO0vswkV38/r6gtUf8b4uTQA13nltnY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMrhQM044265
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:53:43 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:53:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:53:43 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMrgYl071136;
        Thu, 19 Mar 2020 17:53:42 -0500
Subject: Re: [PATCH v2 19/19] media: ti-vpe: cal: fix stop state timeout
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-20-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <cf253130-7e3b-7f19-0001-08d27d25dcc1@ti.com>
Date:   Thu, 19 Mar 2020 17:53:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-20-tomi.valkeinen@ti.com>
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

Isn't this in relation to the clock sourcing the PHY module which is fixed
at 96Mhz (LVDSRX_96M_GFCLK)?

Benoit

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 0f90078ee8c2..d935c628597b 100644
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
> @@ -767,6 +769,7 @@ static void csi2_phy_config(struct cal_ctx *ctx);
>  static void csi2_phy_init(struct cal_ctx *ctx)
>  {
>  	u32 val;
> +	u32 sscounter;
>  
>  	/* Steps
>  	 *  1. Configure D-PHY mode and enable required lanes
> @@ -803,10 +806,20 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  	csi2_phy_config(ctx);
>  
>  	/* 3.B. Program Stop States */
> +	/*
> +	 * The stop-state-counter is based on fclk cycles, and we always use
> +	 * the x16 and x4 settings, so stop-state-timeout =
> +	 * fclk-cycle * 16 * 4 * counter.
> +	 *
> +	 * Stop-state-timeout must be more than 100us as per CSI2 spec, so we
> +	 * calculate a timeout that's 100us (rounding up).
> +	 */
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
> @@ -2257,6 +2270,12 @@ static int cal_probe(struct platform_device *pdev)
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
> 
