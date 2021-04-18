Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A7A36356F
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhDRNPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:15:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59382 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhDRNPE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:15:04 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 577CA499;
        Sun, 18 Apr 2021 15:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618751669;
        bh=ESH8l+/XB27XpQaKwToYrknjEhnrQSUlLd2tT0o/6nw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M9f4UsVtLJQ3fFLpcMzv1HkKVsJvNGYiPv4JcVUVdlbnhT1zyeh5DGW+Z+q7nnl1G
         UjzO4WvWUWAxyLHGBU4BlYfG9beqcYOgQ0J0DMo3DnKTT7txkymZQ79iwGz7htzzHj
         zwsJoWxTXEJeWvY5z4BrhNEihmk3VhXtslJRWcvg=
Date:   Sun, 18 Apr 2021 16:14:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 22/28] media: ti-vpe: cal: set field always to
 V4L2_FIELD_NONE
Message-ID: <YHwwsknGY0aC6iet@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-23-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-23-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:51PM +0300, Tomi Valkeinen wrote:
> cal_camerarx_sd_set_fmt() accepts any value for the format field, but
> there should be no reason to have any other value accepted than
> V4L2_FIELD_NONE. So set the field always to V4L2_FIELD_NONE.

What if the source produces V4L2_FIELD_INTERLACED_(TB|BT) ? Shouldn't we
accept that and propagate it ? Same for V4L2_FIELD_TOP and
V4L2_FIELD_BOTTOM I suppose. V4L2_FIELD_SEQ_(TB|BT) is likely not needed
as I doubt sources will send that. V4L2_FIELD_ALTERNATE is a bit more
tricky, as the driver has to report which field a particular buffer
contains, and I'm not sure we could do so (maybe based on the CSI-2
frame number ?).

I'm fine dropping support for interlaced formats until someone wants to
support them though, it's up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 245c601b992c..880261d53a1d 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -702,10 +702,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
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
> @@ -715,6 +712,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  					CAL_MIN_HEIGHT_LINES,
>  					CAL_MAX_HEIGHT_LINES);
>  	format->format.code = fmtinfo->code;
> +	format->format.field = V4L2_FIELD_NONE;
>  
>  	/* Store the format and propagate it to the source pad. */
>  	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SINK,

-- 
Regards,

Laurent Pinchart
