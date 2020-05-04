Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0C31C3552
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgEDJMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726467AbgEDJMJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:12:09 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCCCC061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 02:12:07 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id d17so19956325wrg.11
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IEvbgqjoHzUJ7UEGcW/qZw1FP4h3vOOxK82p1p52Q10=;
        b=iBvLfYS/84RxOJcZwy0klSTkwe0dfU6PuDdjk+kGrhlN5HNitqc1uHytcUqG36R1I2
         doWKvLHMKKUB8HlzrqGIC1DYvFV05x5UW5JO0/E4PPDdPEvl9zAfAzrP8xWCvPQsmI2n
         y8pWVio9dSwUxYZX5+d8MRUpCYsKr1I1+EuXWgo9B38SrA8SLxWDqroHGRQ+xXoMH91K
         UqIz07tBxoj2kj4N/RqnqNbvrpQ2jiPw7A54hV9FdYoViSFgVN6NM2cN2r17gkjBlbPa
         Fd/8F6apmtmroQ/tXQ+q7V5pZ3ehkhYRhG7PrSGTkpVGLf0kYpILdG0fNPRjAPUehtlH
         LSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IEvbgqjoHzUJ7UEGcW/qZw1FP4h3vOOxK82p1p52Q10=;
        b=OPFVbwpKsGZ2KhmaWkrxsOhDv17t1y4lraEe4WmkUJ9WRjrFweyN+kqX5Pzkd/p0Wd
         F5fCjwlbsk+b7mtZHz6mV10erUWmVvZOn7n0Y0sIyFoDOWpQeH1tsnBlRTbxmNv1wqTb
         Dg16Dnz5QX7rFuj95FV3W95Yf4rHzvneTEsJPNfkP4S6X9hWxBBlNfeFpdb/TwO+7Mgl
         ptVmEB21S/Y6CN/ChhE4D3TdtOwJvNyeMMdUquuMwEgOKBo4JOmFXOjzuMjvCx1+Pa8H
         MLWLFbclJry5HWqstkyT8bs4xqNvPS2fRTKRMDjrMy41LRzz9lRghgUOHSeoRstnH7Wi
         B7+A==
X-Gm-Message-State: AGi0PuaYjIx2XKGPIm18wlGl7wy1zJvfnnovvK5XzgLq02vVai6/DmKv
        sCj74c89YKUfrB1FQ+qgu9o=
X-Google-Smtp-Source: APiQypLcHMhhRxMxe2VAOUduVCl0NxxnjT0WF/2bFbt2b8EOeAoOyXtGJxtwcEiJP2EritKU92fQ1g==
X-Received: by 2002:adf:e702:: with SMTP id c2mr18565903wrm.252.1588583525268;
        Mon, 04 May 2020 02:12:05 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id n131sm12595816wmf.35.2020.05.04.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:12:04 -0700 (PDT)
Date:   Mon, 4 May 2020 10:12:02 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 18/22] media: imx5/6/7: csi: Mark a bound video mux as
 a CSI mux
Message-ID: <20200504091202.yd3wtnkyemalogte@arch-thunder.localdomain>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
 <20200501171556.14731-19-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501171556.14731-19-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Fri, May 01, 2020 at 10:15:52AM -0700, Steve Longerbeam wrote:
> For i.MX5/6, if the bound subdev is a video mux, it must be one of the
> CSI muxes, and for i.MX7, the bound subdev must always be a CSI mux.
> 
> So if the bound subdev is a video mux, mark it as a CSI mux with a new
> group id IMX_MEDIA_GRP_ID_CSI_MUX.
> 
> In the process use the new group id in csi_get_upstream_endpoint(), and
> do some cleanup in that function for better readability.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

for the imx7 check and change, LGTM.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> ---
>  drivers/staging/media/imx/imx-media-csi.c  | 45 +++++++++++++---------
>  drivers/staging/media/imx/imx-media.h      |  1 +
>  drivers/staging/media/imx/imx7-media-csi.c |  7 ++++
>  3 files changed, 35 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index a051a063a2db..6cfbe67c43d1 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -165,7 +165,6 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
>  				     struct v4l2_fwnode_endpoint *ep)
>  {
>  	struct device_node *endpoint, *port;
> -	struct media_entity *src;
>  	struct v4l2_subdev *sd;
>  	struct media_pad *pad;
>  
> @@ -176,30 +175,33 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
>  		return -EPIPE;
>  
>  	sd = priv->src_sd;
> -	src = &sd->entity;
>  
> -	if (src->function == MEDIA_ENT_F_VID_MUX) {
> +	switch (sd->grp_id) {
> +	case IMX_MEDIA_GRP_ID_CSI_MUX:
>  		/*
> -		 * CSI is connected directly to video mux, skip up to
> +		 * CSI is connected directly to CSI mux, skip up to
>  		 * CSI-2 receiver if it is in the path, otherwise stay
> -		 * with video mux.
> +		 * with the CSI mux.
>  		 */
> -		sd = imx_media_pipeline_subdev(src, IMX_MEDIA_GRP_ID_CSI2,
> +		sd = imx_media_pipeline_subdev(&sd->entity,
> +					       IMX_MEDIA_GRP_ID_CSI2,
>  					       true);
> -		if (!IS_ERR(sd))
> -			src = &sd->entity;
> +		if (IS_ERR(sd))
> +			sd = priv->src_sd;
> +		break;
> +	case IMX_MEDIA_GRP_ID_CSI2:
> +		break;
> +	default:
> +		/*
> +		 * the source is neither the CSI mux nor the CSI-2 receiver,
> +		 * get the source pad directly upstream from CSI itself.
> +		 */
> +		sd = &priv->sd;
> +		break;
>  	}
>  
> -	/*
> -	 * If the source is neither the video mux nor the CSI-2 receiver,
> -	 * get the source pad directly upstream from CSI itself.
> -	 */
> -	if (src->function != MEDIA_ENT_F_VID_MUX &&
> -	    sd->grp_id != IMX_MEDIA_GRP_ID_CSI2)
> -		src = &priv->sd.entity;
> -
> -	/* get source pad of entity directly upstream from src */
> -	pad = imx_media_pipeline_pad(src, 0, 0, true);
> +	/* get source pad of entity directly upstream from sd */
> +	pad = imx_media_pipeline_pad(&sd->entity, 0, 0, true);
>  	if (!pad)
>  		return -ENODEV;
>  
> @@ -1906,6 +1908,13 @@ static int imx_csi_notify_bound(struct v4l2_async_notifier *notifier,
>  	struct csi_priv *priv = notifier_to_dev(notifier);
>  	struct media_pad *sink = &priv->sd.entity.pads[CSI_SINK_PAD];
>  
> +	/*
> +	 * If the subdev is a video mux, it must be one of the CSI
> +	 * muxes. Mark it as such via its group id.
> +	 */
> +	if (sd->entity.function == MEDIA_ENT_F_VID_MUX)
> +		sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
> +
>  	return v4l2_create_fwnode_links_to_pad(sd, sink);
>  }
>  
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index ca36beca16de..b5b7d3245727 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -311,5 +311,6 @@ void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev);
>  #define IMX_MEDIA_GRP_ID_IPU_IC_PRP    BIT(13)
>  #define IMX_MEDIA_GRP_ID_IPU_IC_PRPENC BIT(14)
>  #define IMX_MEDIA_GRP_ID_IPU_IC_PRPVF  BIT(15)
> +#define IMX_MEDIA_GRP_ID_CSI_MUX       BIT(16)
>  
>  #endif
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 69f7abb32ae1..a3f3df901704 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1164,6 +1164,13 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
>  	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
>  	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
>  
> +	/* The bound subdev must always be the CSI mux */
> +	if (WARN_ON(sd->entity.function != MEDIA_ENT_F_VID_MUX))
> +		return -ENXIO;
> +
> +	/* Mark it as such via its group id */
> +	sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
> +
>  	return v4l2_create_fwnode_links_to_pad(sd, sink);
>  }
>  
> -- 
> 2.17.1
> 
