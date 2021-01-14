Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137B22F5878
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 04:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbhANCa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 21:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbhANCa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 21:30:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2702AC061794
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 18:29:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2EE5279;
        Thu, 14 Jan 2021 03:29:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610591386;
        bh=uvP/NVjQlTNbMKV6e4DsMBbSMWHSJLCga0xRaTMZHUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OqHQdVap2cVnHrFqs8WzCzO4e0F6IiqLU+Sm0C5jXTXavW4xtZcHPrQ99G+c0V8WZ
         P5JR9sxeOf8P+dlHFFte6ODJEMJ0bOrZxw08/FN+8fbeKp4o7RMfGA4GYcC6N1Yn+3
         nl7In58k2WKScUX6QJjLG/B5HjgXpKk9//5mSmIg=
Date:   Thu, 14 Jan 2021 04:29:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ti-vpe: cal: fix write to unallocated memory
Message-ID: <X/+siRZST6uLaP9p@pendragon.ideasonboard.com>
References: <20210113090027.234403-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210113090027.234403-1-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Jan 13, 2021 at 11:00:27AM +0200, Tomi Valkeinen wrote:
> The asd allocated with v4l2_async_notifier_add_fwnode_subdev() must be
> of size cal_v4l2_async_subdev, otherwise access to
> cal_v4l2_async_subdev->phy will go to unallocated memory.
> 
> Fixes: 8fcb7576ad19 ("media: ti-vpe: cal: Allow multiple contexts per subdev notifier")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 59a0266b1f39..2eef245c31a1 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -406,7 +406,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>   */
>  
>  struct cal_v4l2_async_subdev {
> -	struct v4l2_async_subdev asd;
> +	struct v4l2_async_subdev asd; /* Must be first */
>  	struct cal_camerarx *phy;
>  };
>  
> @@ -472,7 +472,7 @@ static int cal_async_notifier_register(struct cal_dev *cal)
>  		fwnode = of_fwnode_handle(phy->sensor_node);
>  		asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
>  							    fwnode,
> -							    sizeof(*asd));
> +							    sizeof(*casd));

Ouch :-S

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		if (IS_ERR(asd)) {
>  			phy_err(phy, "Failed to add subdev to notifier\n");
>  			ret = PTR_ERR(asd);

-- 
Regards,

Laurent Pinchart
