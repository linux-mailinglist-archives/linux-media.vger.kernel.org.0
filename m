Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172302B3FAE
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 10:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgKPJYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 04:24:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgKPJYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 04:24:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E31C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 01:23:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80A28A1B;
        Mon, 16 Nov 2020 10:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605518638;
        bh=uREGxm5znX9VTv3Z+F9irq1ezek1GadkUliGOOS1d/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CJGkgwPhU+uoB2Tdlzd6yvf9M3RpQhlToJ99Zd4zt4P56vPmhc4lUmQPgJ+lJ5eg1
         I2wftx/1PbFfstnMuImnYInFQZXmwzaCJdZ6VtDvxJkoZaQTbko45F1BUH/bAZFVPo
         6yV+uXEYG+nyjzb7asQSCZBpeVmkoKpOJgsgLMDU=
Date:   Mon, 16 Nov 2020 11:23:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-media@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH REPOST] media: omap3isp: Remove misleading comment
Message-ID: <20201116092354.GF6540@pendragon.ideasonboard.com>
References: <20201113142831.2215880-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201113142831.2215880-1-bigeasy@linutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

CC'ing Sakari.

Sakari, could you please pick this one up ?

On Fri, Nov 13, 2020 at 03:28:31PM +0100, Sebastian Andrzej Siewior wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> in_interrupt() covers hard and soft interrupt servicing and bottom half
> disabled contexts, which is semantically undefined and useless.
> 
> The comment for __ccdc_lsc_configure() "Context: in_interrupt()" is
> therefore as useful as "Context: unknown'. Remove it.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> ---
> Repost of https://lore.kernel.org/linux-media/20201013143731.704783731@linutronix.de/
> The other patches in this thread were applied.
> 
>  drivers/media/platform/omap3isp/ispccdc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/omap3isp/ispccdc.c b/drivers/media/platform/omap3isp/ispccdc.c
> index 0fbb2aa6dd2c0..4e8905ef362f2 100644
> --- a/drivers/media/platform/omap3isp/ispccdc.c
> +++ b/drivers/media/platform/omap3isp/ispccdc.c
> @@ -299,11 +299,10 @@ static int ccdc_lsc_busy(struct isp_ccdc_device *ccdc)
>  			     ISPCCDC_LSC_BUSY;
>  }
>  
> -/* __ccdc_lsc_configure - Apply a new configuration to the LSC engine
> +/*
> + * __ccdc_lsc_configure - Apply a new configuration to the LSC engine
>   * @ccdc: Pointer to ISP CCDC device
>   * @req: New configuration request
> - *
> - * context: in_interrupt()
>   */
>  static int __ccdc_lsc_configure(struct isp_ccdc_device *ccdc,
>  				struct ispccdc_lsc_config_req *req)

-- 
Regards,

Laurent Pinchart
