Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395B03A708D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 22:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbhFNUjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 16:39:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44524 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbhFNUjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 16:39:07 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25232436;
        Mon, 14 Jun 2021 22:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623703023;
        bh=KxH3ByUHhL2DdzNL7v4tz5ZRp33E7niHCJwPGptshy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D386VE7cvJKMcjtSCzrw4XQ9spKfVc4kfo5byTpFy1YO9ZpZB30tSuzt5LEPwv0yz
         JzJwpvCCk9ok0lbCE3b0VdzQBtmYs2iodcdsmS948VdekXQ3b9IcbtVHDQ2B9kI/f9
         LROR5mLOt4E0XzraUiKIWxmAgdqRl7ZHQjR863cY=
Date:   Mon, 14 Jun 2021 23:36:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v4 21/35] media: ti-vpe: cal: handle
 cal_ctx_v4l2_register error
Message-ID: <YMe92+tTn76AVCHT@pendragon.ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
 <20210614112345.2032435-22-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614112345.2032435-22-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Jun 14, 2021 at 02:23:31PM +0300, Tomi Valkeinen wrote:
> cal_async_notifier_complete() doesn't handle errors returned from
> cal_ctx_v4l2_register(). Add the error handling.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 2d05fb3993d8..3a836813eda8 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -740,15 +740,33 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct cal_dev *cal = container_of(notifier, struct cal_dev, notifier);
>  	unsigned int i;
> -	int ret = 0;
> +	int ret;
>  
>  	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> -		if (cal->ctx[i])
> -			cal_ctx_v4l2_register(cal->ctx[i]);
> +		if (!cal->ctx[i])
> +			continue;
> +
> +		ret = cal_ctx_v4l2_register(cal->ctx[i]);
> +		if (ret)
> +			goto err_ctx_unreg;
>  	}
>  
> -	if (cal_mc_api)
> -		ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
> +	if (!cal_mc_api)
> +		return 0;
> +
> +	ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
> +	if (ret)
> +		goto err_ctx_unreg;
> +
> +	return 0;
> +
> +err_ctx_unreg:
> +	for (; i > 0; --i) {
> +		if (!cal->ctx[i - 1])
> +			continue;
> +
> +		cal_ctx_v4l2_unregister(cal->ctx[i - 1]);
> +	}
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
