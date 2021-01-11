Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210372F0F48
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 10:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbhAKJkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 04:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbhAKJkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 04:40:07 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2975BC061795
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 01:39:26 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c124so13198787wma.5
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 01:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3IRDPsq0y2hUI2b4y+gf4GzfigwEDjYHt8BXFZgJOrQ=;
        b=aGXj2XfV71khtBZ101kx//f3ZB7+lMm3HP9i9sqTOAJDXY3oniXbOw4BaqBjeMfr/Q
         gY9jrx6rC53+3pwvOPKKqvwLQ2dbzcWZi5Nq+cocsX85ACP2XIIapza1dFEswe1V18AM
         2jSGTvA+0+sZJmLmmqOnDmlkMedLIQQ8wBCtWkwNfABMIHGZvKsYM9ZX93CueLr6Pcfq
         oROKjfiPtwlP5srPligWOtoZ1bF98tPKlQY5cma3sfyV/ljmG75corOj6ozEfaMHwZJj
         f01qX8667A0pTe2vje0eC39dZlWOZuCY6PTudtDbvmzZ+rVylZXAGN7YXghdzv34XOBj
         4l2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3IRDPsq0y2hUI2b4y+gf4GzfigwEDjYHt8BXFZgJOrQ=;
        b=smLitrImPjZUfmZdaW4dkttTDeNYWsEDW5OjsdhWUUM/Rejy0t4vv3gEilojLYWRIL
         FzZ1pLH33mpQr0yrKkG8X0LbukuRAzvZR2eilay6lttFR5Sh91PFG2zTMIm8kszGPZvu
         0qWl2EjaYm++JYVuL4itFJlTbs33SnKJ4pPY45Bn3niLHq4UXj3sRg4xvMr36P49ezLv
         aMtRC25CWtxThVP1Zkd8Zutw//8M3brOxzTQcDRVDADZrzF0/CSuqp4jg0Tlf083CKxs
         eMAI6m23+IG2GgRzTAi664Z3Lr/U5eljFmMPCTLxy4vqN+Sv4RFDvV3VKStJnhrb1oFI
         NZSg==
X-Gm-Message-State: AOAM531FtpxOYDm1e4UA5FOQyy7+7pnfRiEg+8KXVGIR82qhN5wOTDf9
        1pd6iDCI8OBfzIZoRgtQnG0=
X-Google-Smtp-Source: ABdhPJzn7KCJou/gxuEySyilAvUB0Y07ZKsYVKkoHjQDrvJ4EnT139wvG5aDbBkp1l0nXmx+qu5BYQ==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr13412390wme.183.1610357964883;
        Mon, 11 Jan 2021 01:39:24 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id 138sm23352299wma.41.2021.01.11.01.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 01:39:24 -0800 (PST)
Date:   Mon, 11 Jan 2021 09:39:22 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 68/75] media: imx: imx7_mipi_csis: Calculate Ths_settle
 from source pixel rate
Message-ID: <20210111093922.iabnw6gqegykqbs4@arch-thunder.localdomain>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-69-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105152852.5733-69-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 05, 2021 at 05:28:45PM +0200, Laurent Pinchart wrote:
> The Ths_settle timing parameter depends solely on the pixel rate of the
> source. Calculate it at runtime instead of requiring it to be specified
> in the device tree.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 65 ++++++++++++++++++----
>  1 file changed, 53 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 3c68ee8b2a59..c83450ac37fa 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -24,6 +24,7 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
>  
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-mc.h>
> @@ -233,7 +234,11 @@ struct csi_state {
>  	struct media_pad pads[CSIS_PADS_NUM];
>  	struct v4l2_subdev mipi_sd;
>  	struct v4l2_async_notifier notifier;
> -	struct v4l2_subdev *src_sd;
> +
> +	struct {
> +		struct v4l2_subdev *sd;
> +		struct v4l2_ctrl *pixel_rate;
> +	} src;
>  
>  	u8 index;
>  	struct platform_device *pdev;
> @@ -482,6 +487,31 @@ static void __mipi_csis_set_format(struct csi_state *state)
>  	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH0, val);
>  }
>  
> +static int mipi_csis_calculate_params(struct csi_state *state)
> +{
> +	u64 pixel_rate;
> +	u32 lane_rate;
> +
> +	/* Calculate the line rate from the pixel rate. */
> +	pixel_rate = v4l2_ctrl_g_ctrl_int64(state->src.pixel_rate);
> +	lane_rate = div_u64(pixel_rate, state->bus.num_data_lanes)
> +		  * state->csis_fmt->width;
> +	if (lane_rate < 80000000 || lane_rate > 1500000000) {
> +		dev_dbg(state->dev, "Out-of-bound lane rate %u\n", lane_rate);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * The HSSETTLE counter value is document in a table, but can also
> +	 * easily be calculated.
> +	 */
> +	state->hs_settle = (lane_rate - 5000000) / 45000000;
> +	dev_dbg(state->dev, "pixel rate %llu, lane rate %u, Ths_settle %u\n",
> +		pixel_rate, lane_rate, state->hs_settle);
> +
> +	return 0;
> +}
> +
>  static void mipi_csis_set_params(struct csi_state *state)
>  {
>  	int lanes = state->bus.num_data_lanes;
> @@ -608,16 +638,20 @@ static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
>  static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  {
>  	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
> -	int ret = 0;
> +	int ret;
>  
>  	if (enable) {
> +		ret = mipi_csis_calculate_params(state);
> +		if (ret < 0)
> +			return ret;
> +
>  		mipi_csis_clear_counters(state);
>  		ret = pm_runtime_get_sync(&state->pdev->dev);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(&state->pdev->dev);
>  			return ret;
>  		}
> -		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
> +		ret = v4l2_subdev_call(state->src.sd, core, s_power, 1);
>  		if (ret < 0 && ret != -ENOIOCTLCMD)
>  			return ret;
>  	}
> @@ -630,7 +664,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  		}
>  
>  		mipi_csis_start_stream(state);
> -		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
> +		ret = v4l2_subdev_call(state->src.sd, video, s_stream, 1);
>  		if (ret < 0)
>  			goto unlock;
>  
> @@ -638,8 +672,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  
>  		state->flags |= ST_STREAMING;
>  	} else {
> -		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
> -		ret = v4l2_subdev_call(state->src_sd, core, s_power, 0);
> +		v4l2_subdev_call(state->src.sd, video, s_stream, 0);
> +		ret = v4l2_subdev_call(state->src.sd, core, s_power, 0);
>  		if (ret == -ENOIOCTLCMD)
>  			ret = 0;
>  		mipi_csis_stop_stream(state);
> @@ -677,14 +711,24 @@ static int mipi_csis_link_setup(struct media_entity *entity,
>  	mutex_lock(&state->lock);
>  
>  	if (flags & MEDIA_LNK_FL_ENABLED) {
> -		if (state->src_sd) {
> +		if (state->src.sd) {
>  			ret = -EBUSY;
>  			goto out;
>  		}
>  
> -		state->src_sd = remote_sd;
> +		state->src.pixel_rate = v4l2_ctrl_find(remote_sd->ctrl_handler,
> +						       V4L2_CID_PIXEL_RATE);
> +		if (!state->src.pixel_rate) {
> +			dev_err(state->dev,
> +				"source %s has no pixel rate control\n",
> +				remote_sd->name);
> +			return -EINVAL;

This needs to goto out to release lock.

------
Cheers,
     Rui
> +		}
> +
> +		state->src.sd = remote_sd;
>  	} else {
> -		state->src_sd = NULL;
> +		state->src.pixel_rate = NULL;
> +		state->src.sd = NULL;
>  	}
>  
>  out:
> @@ -943,9 +987,6 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
>  	if (IS_ERR(state->mrst))
>  		return PTR_ERR(state->mrst);
>  
> -	/* Get MIPI CSI-2 bus configuration from the endpoint node. */
> -	of_property_read_u32(node, "fsl,csis-hs-settle", &state->hs_settle);
> -
>  	return 0;
>  }
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
