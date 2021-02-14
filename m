Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDE731B34C
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 00:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhBNXYx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 18:24:53 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhBNXYx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 18:24:53 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D6D8743;
        Mon, 15 Feb 2021 00:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613345051;
        bh=JDLrkTu1L1+rW8otbzUpdcvM5r3viSj9Yx0PGMlOIZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hegXgnLedCFoHkBrkZ0hkUkfkFsyzAuceMY8y3n+Qhv3yk1GEL/xYCQ0YAvblSpkd
         LIUhPWjZUokzamgPCpIOT22jMy3wb3tDC4UEkJKp+IBPP4J2XCQA0I7vO2VSfUhTQ7
         /HKj9WvVUXYRgjXZELl49x5exbn6J29qYR/KEgg4=
Date:   Mon, 15 Feb 2021 01:23:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     sakari.ailus@linux.intel.com, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 2/2] media: imx7: csi: Fix pad link validation
Message-ID: <YCmxAuVrJL9oM7+D@pendragon.ideasonboard.com>
References: <20210107104726.1294538-1-rmfrfs@gmail.com>
 <20210107104726.1294538-3-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210107104726.1294538-3-rmfrfs@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

Thank you for the patch.

On Thu, Jan 07, 2021 at 10:47:26AM +0000, Rui Miguel Silva wrote:
> We can not make the assumption that the bound subdev is always a CSI
> mux, in i.MX6UL/i.MX6ULL that is not the case. So, just get the entity
> selected by source directly upstream from the CSI.
> 
> Fixes: 86e02d07871c ("media: imx5/6/7: csi: Mark a bound video mux as a CSI mux")
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Tested-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 31e36168f9d0..ac52b1daf991 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -499,6 +499,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_format *sink_fmt)
>  {
>  	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
> +	struct media_entity *src;
>  	struct media_pad *pad;
>  	int ret;
>  
> @@ -509,11 +510,21 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  	if (!csi->src_sd)
>  		return -EPIPE;
>  
> +	src = &csi->src_sd->entity;
> +
> +	/*
> +	 * if the source is neither a CSI MUX or CSI-2 get the one directly
> +	 * upstream from this CSI
> +	 */
> +	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
> +	    src->function != MEDIA_ENT_F_VID_MUX)
> +		src = &csi->sd.entity;
> +
>  	/*
> -	 * find the entity that is selected by the CSI mux. This is needed
> +	 * find the entity that is selected by the source. This is needed
>  	 * to distinguish between a parallel or CSI-2 pipeline.
>  	 */
> -	pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
> +	pad = imx_media_pipeline_pad(src, 0, 0, true);
>  	if (!pad)
>  		return -ENODEV;

This is a bit over-complicated. If the source entity isn't a mux or
bridge, then the input is always parallel. I'll send a follow up patch
to simplify this, as this one has been merged already.

By the way, it would be entirely possible for an external entity,
connected through a parallel interface, to have a function set to
MEDIA_ENT_F_VID_IF_BRIDGE or MEDIA_ENT_F_VID_MUX. This code is thus not
very robust, and will need to be fixed.


-- 
Regards,

Laurent Pinchart
