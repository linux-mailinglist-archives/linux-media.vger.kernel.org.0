Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7A539BA36
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhFDNux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:50:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35150 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbhFDNuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:50:52 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23ED29E5;
        Fri,  4 Jun 2021 15:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622814545;
        bh=J7kNVuVP/YcmA2Sit/QfOWAoaDF6mM7hQ6Y+vCwDCbY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kFuS0Z907LtLMagXNN67X+GWZ2hZQI8CEhISpnNecqH2HGhClLLLX5BLUQJbU5NFU
         gr+syxaieW3NDbaAfimCTWqA2ZFS0JJr71qkzomu1dQ0AqDck+MbxwRs7oMOdx5Ssj
         laQOg//KApOL0n28sxnZnpRT7NRSQGorATdnXsvA=
Date:   Fri, 4 Jun 2021 16:48:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 22/38] media: ti-vpe: cal: set field always to
 V4L2_FIELD_NONE
Message-ID: <YLovRHasft8FXxXc@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-23-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-23-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:08:53PM +0300, Tomi Valkeinen wrote:
> cal_camerarx_sd_set_fmt() accepts any value for the format field, but
> there should be no reason to have any other value accepted than
> V4L2_FIELD_NONE. So set the field always to V4L2_FIELD_NONE.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index a8cca30f3f51..f2ea2bdb9ea3 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -705,10 +705,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  	if (!fmtinfo)
>  		fmtinfo = &cal_formats[0];
>  
> -	/*
> -	 * Clamp the size, update the code. The field and colorspace are
> -	 * accepted as-is.
> -	 */
> +	/* Clamp the size, update the code. The colorspace is accepted as-is. */
>  	bpp = ALIGN(fmtinfo->bpp, 8);
>  
>  	format->format.width = clamp_t(unsigned int, format->format.width,
> @@ -718,6 +715,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  					CAL_MIN_HEIGHT_LINES,
>  					CAL_MAX_HEIGHT_LINES);
>  	format->format.code = fmtinfo->code;
> +	format->format.field = V4L2_FIELD_NONE;
>  
>  	/* Store the format and propagate it to the source pad. */
>  	fmt = cal_camerarx_get_pad_format(phy, sd_state,

-- 
Regards,

Laurent Pinchart
