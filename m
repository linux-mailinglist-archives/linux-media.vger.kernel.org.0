Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A793363550
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 14:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhDRMrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 08:47:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59238 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRMrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 08:47:09 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AEF351E;
        Sun, 18 Apr 2021 14:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618750000;
        bh=cRRBmoOFeBXal9EE80Irta3uSY0qeK4wD0uVK7h18Vw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SqBZmrYdLNvpwTM07z1SSsxnYkCWsTCh9LomxT3pteZiFN5Bb5rp6OR+AEihG4scR
         diVYQaIHxA+VB0UZNxmQFjDmJj0KOpzqa0Z4cADAYVsRy19xhsvneAQ8AqTuF3zFAW
         8Iy9V/vN+xwydU499gbU2PbV3hFKpm1/B9LIEuDo=
Date:   Sun, 18 Apr 2021 15:46:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 15/28] media: ti-vpe: cal: remove wait when stopping
 camerarx
Message-ID: <YHwqLSgwYmt9ZAOU@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-16-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-16-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:44PM +0300, Tomi Valkeinen wrote:
> Asserting ComplexIO reset seems to affect the HW (ie. asserting reset
> will break an active capture), but the RESET_DONE bit never changes to
> "reset is ongoing" state. Thus we always get a timeout.
> 
> Drop the wait, as it seems to achieve nothing.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 0354f311c5d2..245c601b992c 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -405,7 +405,6 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>  
>  static void cal_camerarx_stop(struct cal_camerarx *phy)
>  {
> -	unsigned int i;
>  	int ret;
>  
>  	cal_camerarx_ppi_disable(phy);
> @@ -419,19 +418,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
>  			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
>  			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
>  
> -	/* Wait for power down completion */
> -	for (i = 0; i < 10; i++) {
> -		if (cal_read_field(phy->cal,
> -				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
> -				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
> -		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)

Isn't this the wrong condition ? I would have expected
CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED, not
CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING. That could explain why
you always get a timeout.

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
