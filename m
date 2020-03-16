Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6870B186B4D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730987AbgCPMn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:43:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbgCPMn0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:43:26 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4381BA3B;
        Mon, 16 Mar 2020 13:43:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584362604;
        bh=ffCEONUXOe/a5olgQaQBdGyOay8ECOTmPPAAbvGal9k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SkOTbnKiZ94VFcVt02OVMjUS6Am87DrexY5zCDMZt7kND6L1YQ110YOnSBsH+wzk7
         HVdPpYFD/H7BVJxxefdyMvrLlTeem+O/H9uq4Zrd7xsofxPn2DKjtaO4lEH0CGp/0E
         /XDBa7MItc9/8T4w8Ib9+j9KQEE3zklXH5UymlWI=
Date:   Mon, 16 Mar 2020 14:43:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 14/16] media: ti-vpe: cal: improve wait for CIO resetdone
Message-ID: <20200316124319.GG4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-14-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-14-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:19PM +0200, Tomi Valkeinen wrote:
> Sometimes waiting for ComplexIO resetdone timeouts. Testing shows that
> sometimes we need to wait more than what the current code does. It is
> not clear how long this wait can be, but it is based on how quickly the
> sensor provides a valid clock, and how quickly CAL syncs to it.
> 
> Change the code to make it more obvious how long we'll wait, and set a
> wider range for usleep_range. Increase the timeout to 750ms.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 319312770eea..929f9b3ca4f9 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -824,20 +824,21 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  
>  static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>  {
> -	int i;
> +	unsigned long timeout;
>  
> -	for (i = 0; i < 250; i++) {
> +	timeout = jiffies + msecs_to_jiffies(750);
> +	while (time_before(jiffies, timeout)) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
>  				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
>  		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
>  			break;
> -		usleep_range(1000, 1100);
> +		usleep_range(500, 5000);
>  	}

How about using readx_poll_timeout() ?

> -	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done (%d) %s\n",
> +
> +	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done\n",
>  		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
> -		(i >= 250) ? "(timeout)" : "");
> +		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
>  
>  	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
>  			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=

-- 
Regards,

Laurent Pinchart
