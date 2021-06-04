Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D76039BA1A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhFDNph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:45:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35050 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhFDNph (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:45:37 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64A729E5;
        Fri,  4 Jun 2021 15:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622814229;
        bh=+GxewdjIaJGt/fr1T/PJMmlT0G3bD+laYAoH0hM+9V8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iQNOgSK9q5levMmDRRcmOrpmR0cQ4xDOB9vp/VaQ7kvQJCagizi7Xq1/1YMwwqgXy
         HcU8vQ4iEvsyHgYpXH62yVX5B56XbznO+uRFSI7/eU2h3fa/mh42sy6+tMO2nPeyVk
         iTydGGveK/cjjz8P8P1pNMHiI+DXcVRdkE6kxVuk=
Date:   Fri, 4 Jun 2021 16:43:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 15/38] media: ti-vpe: cal: remove wait when stopping
 camerarx
Message-ID: <YLouCV6oO6WfIABc@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-16-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-16-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:08:46PM +0300, Tomi Valkeinen wrote:
> Asserting ComplexIO reset seems to affect the HW (ie. asserting reset
> will break an active capture), but the RESET_DONE bit never changes to
> "reset is ongoing" state. Thus we always get a timeout.
> 
> Drop the wait, as it seems to achieve nothing.

I would be nice if this could get double-check by someone at TI with
more information than we have regarding the hardware implementation.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index b36e55b63718..a8cca30f3f51 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -407,7 +407,6 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>  
>  static void cal_camerarx_stop(struct cal_camerarx *phy)
>  {
> -	unsigned int i;
>  	int ret;
>  
>  	cal_camerarx_ppi_disable(phy);
> @@ -421,19 +420,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
>  			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
>  			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
>  
> -	/* Wait for power down completion */
> -	for (i = 0; i < 10; i++) {
> -		if (cal_read_field(phy->cal,
> -				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
> -				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
> -		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
> -			break;
> -		usleep_range(1000, 1100);
> -	}
> -	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
> +	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset\n",
>  		phy->instance,
> -		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)), i,
> -		(i >= 10) ? "(timeout)" : "");
> +		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)));
>  
>  	/* Disable the phy */
>  	cal_camerarx_disable(phy);

-- 
Regards,

Laurent Pinchart
