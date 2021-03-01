Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69F5327AD6
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233973AbhCAJcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233892AbhCAJcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 04:32:15 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF722C06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 01:31:34 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id u11so7594395wmq.5
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 01:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5eXLE8YmmWqVcAQ25/8CtrGHZrAdsaRl84AJbo62qGY=;
        b=XBXjog8lDQwfsqZDNUWMErZOnWqsNZK4OWKw6YMHQc3Soq5MIE8KUMZK8tPV3oHNA1
         fu2WVI6z7Axw0ZrQJjhD3jWfdbojXtfSbX3t6oWKa8xfZWXjXR832tX/44fcwxYYfPSD
         g/aeKZaykntlF5WvVjQJSqn3SR2HdNTzSiR3ilEmTMNmwExo+dD67lQMvn8MbU/+VoOJ
         u2L0Gv2rQANbFdsnKFHRxl8TR+LxE9sdQ8+fBO3JjzypBQng+ExdS3sFyxPQqDyNW75q
         KI4SOBgRb1Y0/3mXjvL5gP96w678MdwlfPQrG5bcOEKbGipFCcl4Yl5R0TBNn24HER5n
         z7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5eXLE8YmmWqVcAQ25/8CtrGHZrAdsaRl84AJbo62qGY=;
        b=QNIhcLpc47mb9WuDVs4cEXn5c2XF7gpW31tA5NNscX+gguwbAOJhk0qrOGvMOV9IeT
         fVCadYpyamV0dxaXG60kN1s8doOj1lDcgAnNfJESj8G+mtmKIrTq+vgzra3Gjt4apZIF
         LyXBCS/pN5uKWIoPqSrZMgGmpwBAydTeuBZquahGeJHXRIyY2DiOGoOUQcxOw+g7Fqc2
         HhILxg2ZIsfietnEi7xOPp/3KmItG9WmW5Vbc9EbCe1U9BSm4/7Bjcb6q4eZ+dcwZYhq
         zOlgy3B+jDIGPidpp9hWuVh0E2yEryCj/UmGaWO8RzPaq9ulkpHCbWfGMOwxy7UaMX2U
         GGJw==
X-Gm-Message-State: AOAM531ZW34bFLFEiZ9fYwZ3bUnQPaDq0feeCdum0JTsi6ABPWZV1FL8
        om4HHKvgP6QCIUH4SFmCjng=
X-Google-Smtp-Source: ABdhPJwOIAe6uokLnvDk11zV/fTM3s/8QIgVUvG8IRWXFtdnffFBUlZJLkX/lT0VXWgMHHveAi1XYg==
X-Received: by 2002:a1c:2049:: with SMTP id g70mr13095885wmg.7.1614591093686;
        Mon, 01 Mar 2021 01:31:33 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id t14sm25459319wru.64.2021.03.01.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 01:31:33 -0800 (PST)
Date:   Mon, 1 Mar 2021 09:31:31 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 39/77] media: imx: imx7-media-csi: Don't lock access
 to is_csi2
Message-ID: <20210301093131.xyxpu4lxconbogrw@arch-thunder.localdomain>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-40-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-40-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Mon, Feb 15, 2021 at 06:27:03AM +0200, Laurent Pinchart wrote:
> The is_csi2 field can't be accessed concurrently by
> imx7_csi_pad_link_validate() and imx7_csi_configure(), as the latter is
> called from imx7_csi_s_stream(), which is called after link validation.
> Drop the lock.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

LGTM.
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 2a4b69cc0178..dc25b593eaeb 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1001,7 +1001,6 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  	struct imx_media_video_dev *vdev = csi->vdev;
>  	const struct v4l2_pix_format *out_pix = &vdev->fmt;
>  	struct media_pad *pad;
> -	bool is_csi2;
>  	int ret;
>  
>  	if (!csi->src_sd)
> @@ -1018,7 +1017,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  	switch (csi->src_sd->entity.function) {
>  	case MEDIA_ENT_F_VID_IF_BRIDGE:
>  		/* The input is the CSI-2 receiver. */
> -		is_csi2 = true;
> +		csi->is_csi2 = true;
>  		break;
>  
>  	case MEDIA_ENT_F_VID_MUX:
> @@ -1027,7 +1026,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  		if (!pad)
>  			return -ENODEV;
>  
> -		is_csi2 = pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE;
> +		csi->is_csi2 = pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE;
>  		break;
>  
>  	default:
> @@ -1035,14 +1034,10 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  		 * The input is an external entity, it must use the parallel
>  		 * bus.
>  		 */
> -		is_csi2 = false;
> +		csi->is_csi2 = false;
>  		break;
>  	}
>  
> -	mutex_lock(&csi->lock);
> -	csi->is_csi2 = is_csi2;
> -	mutex_unlock(&csi->lock);
> -
>  	/* Validate the sink link, ensure the pixel format is supported. */
>  	switch (out_pix->pixelformat) {
>  	case V4L2_PIX_FMT_UYVY:
> -- 
> Regards,
> 
> Laurent Pinchart
> 
