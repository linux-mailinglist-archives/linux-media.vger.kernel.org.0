Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38CD448BB8A
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 00:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243719AbiAKXjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 18:39:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60986 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243308AbiAKXjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 18:39:48 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9A2793;
        Wed, 12 Jan 2022 00:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641944386;
        bh=2DxS72P96FLKGp7Ar+o8vAUmCMvkuvBoOt6cYnG/7HQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PpN3tEfLXLUDSpgNIpt6hGPCBCB63vQqeTDT7ty2XfP3Fqcwntc5TiLGsZelzjwWq
         CvYmIMdbtOywws6mSTyu2Cmg/Oh9wFCzdiDMQuUC32dLWYAsdnhxjOsCNwbfefef2t
         YiCmeZSSyrHWFjwP34G+jabFE4YqDQLo3moqXgw4=
Date:   Wed, 12 Jan 2022 01:39:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 13/38] media: entity: Use pad as the starting point
 for a pipeline
Message-ID: <Yd4VOOf5HwRtVXwm@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-14-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130141536.891878-14-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

On Tue, Nov 30, 2021 at 04:15:11PM +0200, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> The pipeline has been moved from the entity to the pads; reflect this in
> the media pipeline function API.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/driver-api/media/mc-core.rst    |  9 +++--
>  drivers/media/mc/mc-entity.c                  | 24 ++++++-------
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  6 ++--
>  .../media/platform/exynos4-is/fimc-capture.c  |  8 ++---
>  .../platform/exynos4-is/fimc-isp-video.c      |  8 ++---
>  drivers/media/platform/exynos4-is/fimc-lite.c |  8 ++---
>  drivers/media/platform/omap3isp/ispvideo.c    |  6 ++--
>  .../media/platform/qcom/camss/camss-video.c   |  6 ++--
>  drivers/media/platform/rcar-vin/rcar-dma.c    |  6 ++--
>  .../platform/rockchip/rkisp1/rkisp1-capture.c |  6 ++--
>  .../media/platform/s3c-camif/camif-capture.c  |  6 ++--
>  drivers/media/platform/stm32/stm32-dcmi.c     |  6 ++--
>  .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 ++--
>  .../platform/sunxi/sun6i-csi/sun6i_video.c    |  6 ++--
>  drivers/media/platform/ti-vpe/cal-video.c     |  6 ++--
>  drivers/media/platform/vsp1/vsp1_video.c      |  6 ++--
>  drivers/media/platform/xilinx/xilinx-dma.c    |  6 ++--
>  .../media/test-drivers/vimc/vimc-capture.c    |  6 ++--
>  drivers/media/usb/au0828/au0828-core.c        |  8 ++---
>  drivers/staging/media/imx/imx-media-utils.c   |  6 ++--
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |  6 ++--
>  drivers/staging/media/omap4iss/iss_video.c    |  6 ++--
>  drivers/staging/media/tegra-video/tegra210.c  |  6 ++--
>  include/media/media-entity.h                  | 34 +++++++++----------
>  24 files changed, 99 insertions(+), 102 deletions(-)

[snip]

> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
> index 140854ab4dd8..0189b8a33032 100644
> --- a/drivers/media/platform/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
> @@ -848,13 +848,13 @@ static int s3c_camif_streamon(struct file *file, void *priv,
>  	if (s3c_vp_active(vp))
>  		return 0;
>  
> -	ret = media_pipeline_start(sensor, camif->m_pipeline);
> +	ret = media_pipeline_start(sensor->pads, camif->m_pipeline);

This isn't an issue intruced by this patch, but shouldn't this use
camif->vdev.entity.pads instead of sensor->pads ? Most drivers start the
pipeline from the video node (with a couple of exceptions, see below).

>  	if (ret < 0)
>  		return ret;
>  
>  	ret = camif_pipeline_validate(camif);
>  	if (ret < 0) {
> -		media_pipeline_stop(sensor);
> +		media_pipeline_stop(sensor->pads);
>  		return ret;
>  	}
>  
> @@ -878,7 +878,7 @@ static int s3c_camif_streamoff(struct file *file, void *priv,
>  
>  	ret = vb2_streamoff(&vp->vb_queue, type);
>  	if (ret == 0)
> -		media_pipeline_stop(&camif->sensor.sd->entity);
> +		media_pipeline_stop(camif->sensor.sd->entity.pads);
>  	return ret;
>  }
>  

[snip]

> diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
> index caefac07af92..877e85a451cb 100644
> --- a/drivers/media/usb/au0828/au0828-core.c
> +++ b/drivers/media/usb/au0828/au0828-core.c
> @@ -410,7 +410,7 @@ static int au0828_enable_source(struct media_entity *entity,
>  		goto end;
>  	}
>  
> -	ret = __media_pipeline_start(entity, pipe);
> +	ret = __media_pipeline_start(entity->pads, pipe);

This I'd be happy to just ignore.

>  	if (ret) {
>  		pr_err("Start Pipeline: %s->%s Error %d\n",
>  			source->name, entity->name, ret);
> @@ -501,12 +501,12 @@ static void au0828_disable_source(struct media_entity *entity)
>  				return;
>  
>  			/* stop pipeline */
> -			__media_pipeline_stop(dev->active_link_owner);
> +			__media_pipeline_stop(dev->active_link_owner->pads);
>  			pr_debug("Pipeline stop for %s\n",
>  				dev->active_link_owner->name);
>  
>  			ret = __media_pipeline_start(
> -					dev->active_link_user,
> +					dev->active_link_user->pads,
>  					dev->active_link_user_pipe);
>  			if (ret) {
>  				pr_err("Start Pipeline: %s->%s %d\n",
> @@ -532,7 +532,7 @@ static void au0828_disable_source(struct media_entity *entity)
>  			return;
>  
>  		/* stop pipeline */
> -		__media_pipeline_stop(dev->active_link_owner);
> +		__media_pipeline_stop(dev->active_link_owner->pads);
>  		pr_debug("Pipeline stop for %s\n",
>  			dev->active_link_owner->name);
>  
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 535da4dda3c6..74218af45551 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -905,16 +905,16 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
>  	mutex_lock(&imxmd->md.graph_mutex);
>  
>  	if (on) {
> -		ret = __media_pipeline_start(entity, &imxmd->pipe);
> +		ret = __media_pipeline_start(entity->pads, &imxmd->pipe);

And this should be easy to switch to using the video device pad.

>  		if (ret)
>  			goto out;
>  		ret = v4l2_subdev_call(sd, video, s_stream, 1);
>  		if (ret)
> -			__media_pipeline_stop(entity);
> +			__media_pipeline_stop(entity->pads);
>  	} else {
>  		v4l2_subdev_call(sd, video, s_stream, 0);
>  		if (entity->pads->pipe)
> -			__media_pipeline_stop(entity);
> +			__media_pipeline_stop(entity->pads);
>  	}
>  
>  out:

[snip]

-- 
Regards,

Laurent Pinchart
