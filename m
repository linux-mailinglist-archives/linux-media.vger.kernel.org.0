Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A972DCB86
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 04:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgLQD5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 22:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbgLQD5u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 22:57:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E807DC0617A7;
        Wed, 16 Dec 2020 19:57:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AEFA2C2;
        Thu, 17 Dec 2020 04:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608177426;
        bh=CeiKeoDJuFXUx0AHENcynkDr6bZJyQ4HAeC/obSpibU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RJZX2LfELR0TstaN5POWm7Al4x8ORmkoALPckEai0xH+I6J1Xnw7V+hZOlrRoN5qg
         pFQ7Sxkv++3blKSkKWGM33OpaeQsXpLDa0NDBfp+p4HRHXtrH+1oy43Hqs/hHnEYR2
         DDqkNi8C8oy0VqhuHIwzyVpWcuE4c40+HipxLVww=
Date:   Thu, 17 Dec 2020 05:56:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     kieran.bingham+renesas@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Fix an error handling path in the probe
 function
Message-ID: <X9rXC3rKWfEJNP6z@pendragon.ideasonboard.com>
References: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On Sat, Dec 12, 2020 at 06:41:19PM +0100, Christophe JAILLET wrote:
> A previous 'rcar_fcp_get()' call must be undone in the error handling path,
> as already done in the remove function.
> 
> Fixes: 94fcdf829793 ("[media] v4l: vsp1: Add FCP support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and queued in my tree for v5.12.

> ---
>  drivers/media/platform/vsp1/vsp1_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index dc62533cf32c..aa66e4f5f3f3 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -882,8 +882,10 @@ static int vsp1_probe(struct platform_device *pdev)
>  	}
>  
>  done:
> -	if (ret)
> +	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
> +		rcar_fcp_put(vsp1->fcp);
> +	}
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
