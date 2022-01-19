Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D36D493BE5
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 15:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241120AbiASOZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 09:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237718AbiASOZI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 09:25:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20276C061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 06:25:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3ABD464;
        Wed, 19 Jan 2022 15:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642602304;
        bh=zcKwhwV/DUaFC3rjDexZQFkdKLw3kbheONg1xWIIabk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OkwedjUs4Heam2Ud6rY1xdcQEN6WTpitGbLjhRZDB8Jt3EgqUzz6bAYR+uPQXNO09
         oJynvuxsFgsD1mmhr1EauG7Winj1W62A7lRHqyZTNMQQ+aPIaDWNdRj3fXaiIfgXgN
         MP96Gh7xJ9CAPiZ56rxdCi+ZQtrATa8mI1Sr/3yU=
Date:   Wed, 19 Jan 2022 16:24:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: imx: imx7-mipi-csic: Resume on debug
Message-ID: <YegfMf2UNxU8IjwZ@pendragon.ideasonboard.com>
References: <20220119112024.11339-1-jacopo@jmondi.org>
 <20220119112024.11339-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220119112024.11339-2-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Jan 19, 2022 at 12:20:23PM +0100, Jacopo Mondi wrote:
> The mipi_csis_dump_regs() function reads and printout the interface
> registers for debugging purposes.
> 
> Trying to access the registers without proper powering up the interface
> causes the chip to hang.
> 
> Fix that by increasing the pm runtime usage count which, if necessary,
> resumes the interface.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 2b73fa55c938..cb54bb7491d9 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -780,11 +780,15 @@ static int mipi_csis_dump_regs(struct csi_state *state)
>  
>  	dev_info(state->dev, "--- REGISTERS ---\n");
>  
> +	pm_runtime_resume_and_get(state->dev);

Should this have an error check ? With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	for (i = 0; i < ARRAY_SIZE(registers); i++) {
>  		cfg = mipi_csis_read(state, registers[i].offset);
>  		dev_info(state->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
>  	}
>  
> +	pm_runtime_put(state->dev);
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
