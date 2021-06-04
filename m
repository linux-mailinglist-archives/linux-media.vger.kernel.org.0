Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64EC739B8D4
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 14:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFDMOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 08:14:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34250 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbhFDMOu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 08:14:50 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2E4C9E5;
        Fri,  4 Jun 2021 14:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622808783;
        bh=e3Svrer5IwJJQfHb+ke8bzsq1KWTrBHilOrHADIbyuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uL3az4rCrE9tOasmeobm1+oByuStK0/qPnaOm5yrcyIAYpen1NMmZAzVeyMpjpEV1
         3oShm6PZ4B4JfbsKCvqp5y0vC+NBir4f/NVs5jI55XG1ysR8GPnuo3GJf3mtryNuhZ
         TcCxRm/PNwHV+HRsV0RVzr6qxKjeI1T4KZMbatpY=
Date:   Fri, 4 Jun 2021 15:12:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 02/38] media: ti-vpe: cal: fix error handling in
 cal_camerarx_create
Message-ID: <YLoYwiS2PeZ8PhYL@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-3-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:08:33PM +0300, Tomi Valkeinen wrote:
> cal_camerarx_create() doesn't handle error returned from
> cal_camerarx_sd_init_cfg(). Fix this.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 124a4e2bdefe..e2e384a887ac 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -845,7 +845,9 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	if (ret)
>  		goto error;
>  
> -	cal_camerarx_sd_init_cfg(sd, NULL);
> +	ret = cal_camerarx_sd_init_cfg(sd, NULL);
> +	if (ret)
> +		goto error;
>  
>  	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
>  	if (ret)

-- 
Regards,

Laurent Pinchart
