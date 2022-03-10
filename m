Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93CBB4D4F5F
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 17:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239934AbiCJQfK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 10 Mar 2022 11:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239304AbiCJQfJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 11:35:09 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B40D192E0C
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 08:34:08 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nSLjq-0007u3-00; Thu, 10 Mar 2022 17:34:06 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nSLjp-003uun-4X; Thu, 10 Mar 2022 17:34:04 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nSLjn-000BDj-Dr; Thu, 10 Mar 2022 17:34:03 +0100
Message-ID: <5321c864355578750d814024a1902ce2362e1f9a.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] media: vsp1: Add support to deassert/assert
 reset line
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date:   Thu, 10 Mar 2022 17:34:03 +0100
In-Reply-To: <20220310162814.22234-3-biju.das.jz@bp.renesas.com>
References: <20220310162814.22234-1-biju.das.jz@bp.renesas.com>
         <20220310162814.22234-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Do, 2022-03-10 at 16:28 +0000, Biju Das wrote:
> As the resets DT property is mandatory, and is present in all .dtsi
> in mainline, add support to perform deassert/assert using reference
> counted reset handle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Used reference counted reset handle to perform deassert/assert
> RFC->v1:
>  * Added reset support as separate patch
>  * Moved rstc just after the bus_master field in struct vsp1_device
> RFC:
>  * 
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
> ---
>  drivers/media/platform/vsp1/vsp1.h     |  1 +
>  drivers/media/platform/vsp1/vsp1_drv.c | 21 ++++++++++++++++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1.h
> b/drivers/media/platform/vsp1/vsp1.h
> index 37cf33c7e6ca..c5da829c79b5 100644
> --- a/drivers/media/platform/vsp1/vsp1.h
> +++ b/drivers/media/platform/vsp1/vsp1.h
> @@ -79,6 +79,7 @@ struct vsp1_device {
>         void __iomem *mmio;
>         struct rcar_fcp_device *fcp;
>         struct device *bus_master;
> +       struct reset_control *rstc;
>  
>         struct vsp1_brx *brs;
>         struct vsp1_brx *bru;
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c
> b/drivers/media/platform/vsp1/vsp1_drv.c
> index 502c7d9d6890..dbe90ceec327 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/rcar-fcp.h>
> @@ -569,7 +570,19 @@ static void vsp1_mask_all_interrupts(struct
> vsp1_device *vsp1)
>   */
>  int vsp1_device_get(struct vsp1_device *vsp1)
>  {
> -       return pm_runtime_resume_and_get(vsp1->dev);
> +       int ret = reset_control_deassert(vsp1->rstc);
> +
> +       if (ret < 0)
> +               goto err;

If reset_control_deassert() failed, return ret directly, do not jump to
err: to call reset_control_assert().

> +
> +       ret = pm_runtime_resume_and_get(vsp1->dev);
> +       if (ret < 0)
> +               goto err;
> +
> +       return 0;
> +err:
> +       reset_control_assert(vsp1->rstc);
> +       return ret;
>  }

With that fixed,
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
