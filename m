Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5598836E372
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 05:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhD2DEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 23:04:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42130 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhD2DEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 23:04:48 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0DE6BC0;
        Thu, 29 Apr 2021 05:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619665441;
        bh=KBUgInLi+SfpeDs6RhVfRb4UOeNDApHU5w4GlbC0xyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FZphi2+nRp3CQOcUC8+WKZFaUO1Bg46q4pbHVBLRqVMQVEESId5gs8c6LNTsQqP/p
         2Y1V9EhqGi3twJwNvfSeSwND1uW9qJuZISx8YZfOaO5ClZ9/UbZvCd1S0HfiMy9ecZ
         9RR+/xBlzFa7U+yHnb/vYtccRe5GrnLtu5LkSejs=
Date:   Thu, 29 Apr 2021 06:03:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH 1/4] media: ti-vpe: cal: add embedded data support
Message-ID: <YIoiG0dupBZZxAoZ@pendragon.ideasonboard.com>
References: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
 <20210427132028.1005757-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427132028.1005757-2-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Apr 27, 2021 at 04:20:25PM +0300, Tomi Valkeinen wrote:
> Add support for capturing embedded data from the sensor. The only
> difference with capturing pixel data and embedded data is that we need
> to ensure the PIX PROC is disabled for embedded data so that CAL doesn't
> repack the data.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 17 ++++++++++-------
>  drivers/media/platform/ti-vpe/cal.h |  1 +
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 62c45add4efe..fcc81024ae18 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -473,14 +473,17 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
>  {
>  	int ret;
>  
> -	ret = cal_reserve_pix_proc(ctx->cal);
> -	if (ret < 0) {
> -		ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
> -		return ret;
> -	}
> +	ctx->use_pix_proc = !ctx->fmtinfo->meta;
> +
> +	if (ctx->use_pix_proc) {
> +		ret = cal_reserve_pix_proc(ctx->cal);
> +		if (ret < 0) {
> +			ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
> +			return ret;
> +		}
>  
> -	ctx->pix_proc = ret;
> -	ctx->use_pix_proc = true;
> +		ctx->pix_proc = ret;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 42a3f8004077..29b865d1a238 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -88,6 +88,7 @@ struct cal_format_info {
>  	u32	code;
>  	/* Bits per pixel */
>  	u8	bpp;
> +	bool	meta;
>  };
>  
>  /* buffer for one video frame */

-- 
Regards,

Laurent Pinchart
