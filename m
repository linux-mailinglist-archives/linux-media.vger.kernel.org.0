Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9E14D9A73
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 12:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347949AbiCOLfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 07:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347948AbiCOLfo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 07:35:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A79D403D5
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 04:34:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42CE8BC0;
        Tue, 15 Mar 2022 12:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647344070;
        bh=GLd5uXk5M8yhhKVCAJNuo48REFuFr3BUVPvyPowzczs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ryTsinl0pFvk28t0ov3LUI6xqsyNb04FdusveSbBiALiXjKv67KHl3lhpzFTLnPzS
         kiiJIU9FgE2S3JKOVer4rw1QcFgpLMYhOzQISWEqvsMc+d7urs8avsiALDoP53iThx
         2rkLoMftjzbNzg6W5g7ejtxdGOEidmdubgmnc0DA=
Date:   Tue, 15 Mar 2022 13:34:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 5/5] media: imx: imx-mipi-csis: Protect
 mipi_csis_dump_regs()
Message-ID: <YjB5tZhIyvqdp5Ho@pendragon.ideasonboard.com>
References: <20220314103941.46021-1-jacopo@jmondi.org>
 <20220314103941.46021-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220314103941.46021-6-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 14, 2022 at 11:39:41AM +0100, Jacopo Mondi wrote:
> The mipi_csis_dump_regs() function accesses the interface registers
> in order to printout their values for debug purposes.
> 
> As the function access the registers, it requires the interface to be
> powered up. Currently this is only enforced in one of the function's
> callers (mipi_csis_log_status)() but not when the function is called by

s/)()/())/

> the debugfs attribute handler.
> 
> Make sure to access registers only if the interface is powered up and
> remove the same check from the caller.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

But I think we can squash this with 2/5.

> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 4bb469fcb6b3..3437455b9c82 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -857,6 +857,9 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
>  	unsigned int i;
>  	u32 cfg;
>  
> +	if (!pm_runtime_get_if_in_use(csis->dev))
> +		return 0;
> +
>  	dev_info(csis->dev, "--- REGISTERS ---\n");
>  
>  	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> @@ -864,6 +867,8 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
>  		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
>  	}
>  
> +	pm_runtime_put(csis->dev);
> +
>  	return 0;
>  }
>  
> @@ -1160,10 +1165,8 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
>  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
>  
>  	mipi_csis_log_counters(csis, true);
> -	if (csis->debug.enable && pm_runtime_get_if_in_use(csis->dev)) {
> +	if (csis->debug.enable)
>  		mipi_csis_dump_regs(csis);
> -		pm_runtime_put(csis->dev);
> -	}
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
