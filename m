Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E2E327ACE
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbhCAJbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233898AbhCAJbR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 04:31:17 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C66C06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 01:30:37 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o16so13742254wmh.0
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SrxsOqJnY+pxyAX8ZVT7zpGQu4ZGYWTIXrU/YfpjH5I=;
        b=Mtpt5Zf1ELzy3WlNEgtleMxZj9sTpcJAP80CDIX9f5KP02sP9BujR692bXJsqwcsij
         DeBI2vir6UjwBlEYqq09cpBGInF+SDzedeKoYBNyWl394BNSdlAj5t1Dt8pcB/0lPUGp
         nI7YvV9MX9qxRGnan16trVQpcOHrOF+lHpw4xeSAhMWW9nOBjZeAUMFPkBCM4yzM6XE9
         RwZ5+FPsK0yfQ4dJBy14oh6nO4I0sGOU614jgNtV1jgfTZExIp8344yNasfFnr/Kjdw1
         ueKrPOGYnT3Norz+dGBTGzN7HyH2ERXxM06NZF8oSnU3R06vei09zPbn/1v9L23vIEI8
         WSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SrxsOqJnY+pxyAX8ZVT7zpGQu4ZGYWTIXrU/YfpjH5I=;
        b=qDPzsGO4MfTquWC9jp9iHCv1f/uK10thxUldYR2LA+mOdyPMae6dfhkjASdx8DzdNY
         kux1gLhVR7Q/PECeqdYbvlCFDg2S3mt2Q2O3uOjk0PKBCw4t1yTLpbHKlWRl9GrmYhcd
         juqKq7CaZiM/ma/stVfyDDIgorBiugqK9p1NN+4P1K73rNDyG1IbsZ4GJLs9g7ahotcy
         aNgFQN1uJ8ptSHqVagi0cMV8nUDz5fCoOWiIfqK8H9vVas95ZhzZFQ5cdCLqtDUCA8YL
         +/DVNCyXPEeUK4yFYwWqmSgTFiph78vMVdoCm+s4/vc4g4UZtiePt/MkHg1jNNDKLUFQ
         RmtQ==
X-Gm-Message-State: AOAM530SxPsz5zM+/W5cijB1BZdt13XJE4IPEEqOcShzAPiV6C7N3OEJ
        nYuc99gaPM8eFWe4nPcotPfb0HRMh20=
X-Google-Smtp-Source: ABdhPJzZjUpcqFZut8sruqidD/Ebjp7PiHPF/huFua7/vFR+B2CvfZcvLQ+q3jOnt4MgmkqGfDmahQ==
X-Received: by 2002:a05:600c:4f86:: with SMTP id n6mr14847845wmq.22.1614591036066;
        Mon, 01 Mar 2021 01:30:36 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id b131sm13284195wmb.34.2021.03.01.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 01:30:35 -0800 (PST)
Date:   Mon, 1 Mar 2021 09:30:33 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 38/77] media: imx: imx7-media-csi: Fix source type
 identification
Message-ID: <20210301093033.uety3dg5jiw5pjpw@arch-thunder.localdomain>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-39-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-39-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Thanks for the patch.

On Mon, Feb 15, 2021 at 06:27:02AM +0200, Laurent Pinchart wrote:
> The code in imx7_csi_pad_link_validate() that checks the type of the
> source incorrectly handles devices that have no parallel input. In that
> case, the source entity of the CSI is the CSI-2 receiver, not the video
> mux, and the driver will proceed to check the type of the source of the
> CSI-2 receiver.
> 
> Make the code more explicit to fix this, by handling the three cases
> (parallel input only, CSI-2 receiver only, and video mux) separately.
> 
> Note that the driver will not correctly handle the case where only a
> parallel input is present, and the external entity connected to the
> parallel input reports a MEDIA_ENT_F_VID_IF_BRIDGE or
> MEDIA_ENT_F_VID_MUX function. This was broken already, and should be
> fixed separately.
> 
> Fixes: f168e796bf40 ("media: imx7: csi: Fix pad link validation")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 52 +++++++++++++---------
>  1 file changed, 30 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index de7b93317a47..2a4b69cc0178 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1000,39 +1000,47 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
>  	struct imx_media_video_dev *vdev = csi->vdev;
>  	const struct v4l2_pix_format *out_pix = &vdev->fmt;
> -	struct media_entity *src;
>  	struct media_pad *pad;
> +	bool is_csi2;
>  	int ret;
>  
> -	/*
> -	 * Validate the source link, and record whether the CSI mux selects the
> -	 * parallel input or the CSI-2 receiver.
> -	 */
> -	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
> -	if (ret)
> -		return ret;
> -
>  	if (!csi->src_sd)
>  		return -EPIPE;
>  
> -	src = &csi->src_sd->entity;
> -
>  	/*
> -	 * if the source is neither a CSI MUX or CSI-2 get the one directly
> -	 * upstream from this CSI
> +	 * Validate the source link, and record whether the source uses the
> +	 * parallel input or the CSI-2 receiver.
>  	 */
> -	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
> -	    src->function != MEDIA_ENT_F_VID_MUX)
> -		src = &csi->sd.entity;
> +	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
> +	if (ret)
> +		return ret;
>  
> -	pad = imx_media_pipeline_pad(src, 0, 0, true);
> -	if (!pad)
> -		return -ENODEV;
> +	switch (csi->src_sd->entity.function) {
> +	case MEDIA_ENT_F_VID_IF_BRIDGE:
> +		/* The input is the CSI-2 receiver. */
> +		is_csi2 = true;
> +		break;
> +
> +	case MEDIA_ENT_F_VID_MUX:
> +		/* The input is the mux, check its input. */
> +		pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
> +		if (!pad)
> +			return -ENODEV;
> +
> +		is_csi2 = pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE;
> +		break;
> +
> +	default:
> +		/*
> +		 * The input is an external entity, it must use the parallel
> +		 * bus.
> +		 */
> +		is_csi2 = false;
> +		break;
> +	}
>  
>  	mutex_lock(&csi->lock);
> -
> -	csi->is_csi2 = (pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE);
> -
> +	csi->is_csi2 = is_csi2;
>  	mutex_unlock(&csi->lock);
>  
>  	/* Validate the sink link, ensure the pixel format is supported. */
> -- 
> Regards,
> 
> Laurent Pinchart
> 
