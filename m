Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1032F39BAC7
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 16:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFDOSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 10:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhFDOSa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 10:18:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1411C061766
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 07:16:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A1D12A3;
        Fri,  4 Jun 2021 16:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622816203;
        bh=oikrsi2NxAPeecDvTe43MlkvUx8WbFSY6AjPhh+aM1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c1CvDoKtlRfniuD5rHS813wHb4R2WCS7PtlnCo8zz13YsWukxeoV35nOcylmQNTza
         8xBl/P9o6p1DJ8RbhJBR8wsP7b0K0ZzYk3QZR+IUZ+5fLMWm78AqFvJjhuBvFltUqx
         jFh/tHq8/5YSNDjnKngGF0vXuueKC+FWhUyDVWRc=
Date:   Fri, 4 Jun 2021 17:16:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 34/38] media: ti-vpe: cal: add camerarx enable/disable
 refcounting
Message-ID: <YLo1vhg4F0RoMWSQ@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-35-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-35-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:09:05PM +0300, Tomi Valkeinen wrote:
> The following patches add multistream support and we will have multiple
> video devices using the same camerarx instances. Thus we need
> enable/disable refcounting for the camerarx.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 10 ++++++++++
>  drivers/media/platform/ti-vpe/cal.h          |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index b87ffc52feb6..803d53753e87 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -285,6 +285,11 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>  	u32 val;
>  	int ret;
>  
> +	if (phy->enable_count > 0) {
> +		phy->enable_count++;
> +		return 0;
> +	}
> +
>  	link_freq = cal_camerarx_get_ext_link_freq(phy);
>  	if (link_freq < 0)
>  		return link_freq;
> @@ -409,6 +414,8 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>  	/* Finally, enable the PHY Protocol Interface (PPI). */
>  	cal_camerarx_ppi_enable(phy);
>  
> +	phy->enable_count++;
> +
>  	return 0;
>  }
>  
> @@ -416,6 +423,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
>  {
>  	int ret;
>  
> +	if (--phy->enable_count > 0)
> +		return;
> +
>  	cal_camerarx_ppi_disable(phy);
>  
>  	cal_camerarx_disable_irqs(phy);
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 78bd2e041d9a..8608a2c6c01a 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -166,6 +166,8 @@ struct cal_camerarx {
>  
>  	/* mutex for camerarx ops */
>  	struct mutex		mutex;
> +
> +	unsigned int enable_count;

Can you align this as the other fields ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };
>  
>  struct cal_dev {

-- 
Regards,

Laurent Pinchart
