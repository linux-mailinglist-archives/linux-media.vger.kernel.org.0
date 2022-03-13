Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607234D7584
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 14:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233146AbiCMNjk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 09:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbiCMNjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 09:39:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C65427EE;
        Sun, 13 Mar 2022 06:38:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AE4030B;
        Sun, 13 Mar 2022 14:38:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647178709;
        bh=EXJnCiCRqy+g/2TuttL9AaFJXRbKev9zoShQU+wjxnw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYlwWVi3uKK0qrHrknOsH4FDqIgEFNssJx3KIzPo+bRExQK8IYu5uWBUfhLXMxb1m
         W2aC4jDrrzqCJWKtCc17WswQMrvi0Byhfjuk60RHd7NBuiT/xt1kBvs0oeCAuCZCzx
         g2KsUiP3sekPzUm1EkOibFZeSHX1kxXqh8jM0Ino=
Date:   Sun, 13 Mar 2022 15:38:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 2/3] media: vsp1: Add support to deassert/assert reset
 line
Message-ID: <Yi3zxKdAZTTEhLXw@pendragon.ideasonboard.com>
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220312084205.31462-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Sat, Mar 12, 2022 at 08:42:04AM +0000, Biju Das wrote:
> As the resets DT property is mandatory, and is present in all .dtsi
> in mainline, add support to perform deassert/assert using reference
> counted reset handle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4->v5:
>  * Added Rb tag from Geert
> v3->v4:
>  * Restored error check for pm_runtime_resume_and_get and calls
>    assert() in case of failure.
> v2->v3:
>  * Added Rb tag from Philipp
>  * If reset_control_deassert() failed, return ret directly. 
> v1->v2:
>  * Used reference counted reset handle to perform deassert/assert
> RFC->v1:
>  * Added reset support as separate patch
>  * Moved rstc just after the bus_master field in struct vsp1_device
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
> ---
>  drivers/media/platform/vsp1/vsp1.h     |  1 +
>  drivers/media/platform/vsp1/vsp1_drv.c | 18 +++++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
> index 37cf33c7e6ca..c5da829c79b5 100644
> --- a/drivers/media/platform/vsp1/vsp1.h
> +++ b/drivers/media/platform/vsp1/vsp1.h
> @@ -79,6 +79,7 @@ struct vsp1_device {
>  	void __iomem *mmio;
>  	struct rcar_fcp_device *fcp;
>  	struct device *bus_master;
> +	struct reset_control *rstc;

This is missing a forward declaration for struct reset_control.

>  	struct vsp1_brx *brs;
>  	struct vsp1_brx *bru;
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index 502c7d9d6890..699d7d985df4 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/rcar-fcp.h>
> @@ -569,7 +570,16 @@ static void vsp1_mask_all_interrupts(struct vsp1_device *vsp1)
>   */
>  int vsp1_device_get(struct vsp1_device *vsp1)
>  {
> -	return pm_runtime_resume_and_get(vsp1->dev);
> +	int ret = reset_control_deassert(vsp1->rstc);
> +
> +	if (ret < 0)
> +		return ret;

I you don't mind, I'd prefer

	int ret;

	ret = reset_control_deassert(vsp1->rstc);
	if (ret < 0)
		return ret;

> +
> +	ret = pm_runtime_resume_and_get(vsp1->dev);
> +	if (ret < 0)
> +		reset_control_assert(vsp1->rstc);
> +
> +	return ret;
>  }
>  
>  /*
> @@ -581,6 +591,7 @@ int vsp1_device_get(struct vsp1_device *vsp1)
>  void vsp1_device_put(struct vsp1_device *vsp1)
>  {
>  	pm_runtime_put_sync(vsp1->dev);
> +	reset_control_assert(vsp1->rstc);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -827,6 +838,11 @@ static int vsp1_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> +	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
> +	if (IS_ERR(vsp1->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> +				     "failed to get reset ctrl\n");

s/ctrl/control/

With these small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	/* FCP (optional). */
>  	fcp_node = of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
>  	if (fcp_node) {

-- 
Regards,

Laurent Pinchart
