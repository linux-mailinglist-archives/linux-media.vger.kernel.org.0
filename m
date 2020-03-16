Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45FED186B4F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbgCPMpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:45:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35916 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730970AbgCPMpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:45:15 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2078A3B;
        Mon, 16 Mar 2020 13:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584362713;
        bh=Oqj74XhRMFDpmMsINduuBAeTxeEZ78NWD6ITCjIM+H4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jODpM2VlCT9q+Rzhe7maIfkG4FiXs6Hr41WS7d7rPKB0vbdCeud4xkt7Ffi20Rapq
         emSmbuXHjMeaM7MUVYhWc6zM/dJJwlehdM+kCcHRKuicyBaCZIRGG4/CDiVggIdEK2
         hZTZPD7/rs0HLjIF1VjLQJQjNt3uuWMriAY7QVKg=
Date:   Mon, 16 Mar 2020 14:45:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 15/16] media: ti-vpe: cal: improve wait for stop-state
Message-ID: <20200316124507.GH4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-15-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-15-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:20PM +0200, Tomi Valkeinen wrote:
> Sometimes waiting for stop-state timeouts. Testing shows that sometimes
> we need to wait more than what the current code does. It is not clear
> how long this wait can be, but it is based on how quickly the sensor
> provides a valid clock, and how quickly CAL syncs to it.
> 
> Change the code to make it more obvious how long we'll wait, and set a
> wider range for usleep_range. Increase the timeout to 750ms.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 929f9b3ca4f9..df5a4281838b 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -849,19 +849,19 @@ static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>  
>  static void csi2_wait_stop_state(struct cal_ctx *ctx)
>  {
> -	int i;
> +	unsigned long timeout;
>  
> -	for (i = 0; i < 10; i++) {
> +	timeout = jiffies + msecs_to_jiffies(750);
> +	while (time_before(jiffies, timeout)) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_TIMING(ctx->csi2_port),
>  				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
>  			break;
> -		usleep_range(1000, 1100);
> +		usleep_range(500, 5000);
>  	}

Same here, readx_poll_timeout() ?

> -	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop State Reached %s\n",
> +	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop State Reached\n",
>  		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
> -		(i >= 10) ? "(timeout)" : "");
> +		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));

That's not correct anymore, if the condition is false then the stop
state hasn't been reached.

Is this debug statement really useful ?

>  
>  	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
>  			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)

-- 
Regards,

Laurent Pinchart
