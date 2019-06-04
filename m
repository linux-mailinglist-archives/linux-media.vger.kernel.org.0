Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFDB346DC
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfFDMdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:33:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47682 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfFDMdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 08:33:17 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:2788:668:163:5bb7:9f6c:564c:d55e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39E0F2D1;
        Tue,  4 Jun 2019 14:33:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559651595;
        bh=KePE/LF7ZMq1h6gigRGME8e3gJFlNcR6ItAl1g26Q5Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VyrwlvLKWpNz2tSNrn9aJH3kzMaJjNHMP1npmI+l8QjOSnh7N7XUtKeGLxUlysfDu
         jIpRrwaWodQXyfGA7fqd9yFSU1+vRnqn1e+rxLKwfsDVR4+zYGFOO6m7owKBK/tsFI
         RPFg4n4o3WwrTdTIziEaZ9mzZgw3GDD/YS/kitA8=
Date:   Tue, 4 Jun 2019 15:33:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v6 1/2] media: v4l2: Make sure all drivers set _MPLANE
 caps in vdev->device_caps
Message-ID: <20190604123302.GE7812@pendragon.ideasonboard.com>
References: <20190604070625.7664-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190604070625.7664-1-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Tue, Jun 04, 2019 at 09:06:24AM +0200, Boris Brezillon wrote:
> This is needed if we want the core to be able to check _MPLANE support
> without having to call the ->vdioc_querycap() hook.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v6:
> - None
> 
> Changes in v5:
> - Drop the fimc-lite and fimc-isp-video hack
> 
> Changes in v4:
> - Add a hack in fimc-lite and fimc-isp-video ->querycap()
>   implementation to avoid reporting _MPLANE caps as userspace is not
>   ready for that
> - Actually set CAP flags in vdev->device_caps instead of just reporting
>   caps at the ->vidioc_querycap() level
> 
> Changes in v3:
> - New patch
> ---
>  drivers/media/platform/exynos-gsc/gsc-m2m.c        | 4 ++--
>  drivers/media/platform/exynos4-is/common.c         | 5 +----
>  drivers/media/platform/exynos4-is/common.h         | 3 +--
>  drivers/media/platform/exynos4-is/fimc-capture.c   | 4 ++--
>  drivers/media/platform/exynos4-is/fimc-isp-video.c | 3 ++-
>  drivers/media/platform/exynos4-is/fimc-lite.c      | 4 +---
>  drivers/media/platform/exynos4-is/fimc-m2m.c       | 4 ++--
>  drivers/media/platform/rcar_jpu.c                  | 6 ++++--

For the rcar-jpu driver,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  drivers/media/platform/s5p-mfc/s5p_mfc.c           | 2 ++
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 7 -------
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c       | 7 -------
>  drivers/media/platform/ti-vpe/vpe.c                | 3 +--
>  12 files changed, 18 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
> index c757f5d98bcc..cd02e3c233fc 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
> @@ -298,8 +298,6 @@ static int gsc_m2m_querycap(struct file *file, void *fh,
>  	strscpy(cap->card, GSC_MODULE_NAME " gscaler", sizeof(cap->card));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>  		 dev_name(&gsc->pdev->dev));
> -	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> @@ -763,6 +761,8 @@ int gsc_register_m2m_device(struct gsc_dev *gsc)
>  	gsc->vdev.lock		= &gsc->lock;
>  	gsc->vdev.vfl_dir	= VFL_DIR_M2M;
>  	gsc->vdev.v4l2_dev	= &gsc->v4l2_dev;
> +	gsc->vdev.device_caps	= V4L2_CAP_STREAMING |
> +				  V4L2_CAP_VIDEO_M2M_MPLANE;
>  	snprintf(gsc->vdev.name, sizeof(gsc->vdev.name), "%s.%d:m2m",
>  					GSC_MODULE_NAME, gsc->id);
>  
> diff --git a/drivers/media/platform/exynos4-is/common.c b/drivers/media/platform/exynos4-is/common.c
> index 76f557548dfc..d47a77c8d4d6 100644
> --- a/drivers/media/platform/exynos4-is/common.c
> +++ b/drivers/media/platform/exynos4-is/common.c
> @@ -37,15 +37,12 @@ struct v4l2_subdev *fimc_find_remote_sensor(struct media_entity *entity)
>  }
>  EXPORT_SYMBOL(fimc_find_remote_sensor);
>  
> -void __fimc_vidioc_querycap(struct device *dev, struct v4l2_capability *cap,
> -						unsigned int caps)
> +void __fimc_vidioc_querycap(struct device *dev, struct v4l2_capability *cap)
>  {
>  	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
>  	strscpy(cap->card, dev->driver->name, sizeof(cap->card));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info),
>  				"platform:%s", dev_name(dev));
> -	cap->device_caps = caps;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  }
>  EXPORT_SYMBOL(__fimc_vidioc_querycap);
>  
> diff --git a/drivers/media/platform/exynos4-is/common.h b/drivers/media/platform/exynos4-is/common.h
> index 75b9c71d9419..58da94e7910c 100644
> --- a/drivers/media/platform/exynos4-is/common.h
> +++ b/drivers/media/platform/exynos4-is/common.h
> @@ -12,5 +12,4 @@
>  #include <media/v4l2-subdev.h>
>  
>  struct v4l2_subdev *fimc_find_remote_sensor(struct media_entity *entity);
> -void __fimc_vidioc_querycap(struct device *dev, struct v4l2_capability *cap,
> -			    unsigned int caps);
> +void __fimc_vidioc_querycap(struct device *dev, struct v4l2_capability *cap);
> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index de4af0357a3c..ecfa6ab4a19d 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -728,8 +728,7 @@ static int fimc_cap_querycap(struct file *file, void *priv,
>  {
>  	struct fimc_dev *fimc = video_drvdata(file);
>  
> -	__fimc_vidioc_querycap(&fimc->pdev->dev, cap, V4L2_CAP_STREAMING |
> -					V4L2_CAP_VIDEO_CAPTURE_MPLANE);
> +	__fimc_vidioc_querycap(&fimc->pdev->dev, cap);
>  	return 0;
>  }
>  
> @@ -1765,6 +1764,7 @@ static int fimc_register_capture_device(struct fimc_dev *fimc,
>  	vfd->release	= video_device_release_empty;
>  	vfd->queue	= q;
>  	vfd->lock	= &fimc->lock;
> +	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE_MPLANE;
>  
>  	video_set_drvdata(vfd, fimc);
>  	vid_cap = &fimc->vid_cap;
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> index bb35a2017f21..ad8dd672d4a7 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> @@ -349,7 +349,7 @@ static int isp_video_querycap(struct file *file, void *priv,
>  {
>  	struct fimc_isp *isp = video_drvdata(file);
>  
> -	__fimc_vidioc_querycap(&isp->pdev->dev, cap, V4L2_CAP_STREAMING);
> +	__fimc_vidioc_querycap(&isp->pdev->dev, cap);
>  	return 0;
>  }
>  
> @@ -614,6 +614,7 @@ int fimc_isp_video_device_register(struct fimc_isp *isp,
>  	vdev->minor = -1;
>  	vdev->release = video_device_release_empty;
>  	vdev->lock = &isp->video_lock;
> +	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE_MPLANE;
>  
>  	iv->pad.flags = MEDIA_PAD_FL_SINK;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &iv->pad);
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index 96f0a8a0dcae..a16b5bed59bb 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -658,9 +658,6 @@ static int fimc_lite_querycap(struct file *file, void *priv,
>  	strscpy(cap->card, FIMC_LITE_DRV_NAME, sizeof(cap->card));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>  					dev_name(&fimc->pdev->dev));
> -
> -	cap->device_caps = V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> @@ -1282,6 +1279,7 @@ static int fimc_lite_subdev_registered(struct v4l2_subdev *sd)
>  	vfd->minor = -1;
>  	vfd->release = video_device_release_empty;
>  	vfd->queue = q;
> +	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING;
>  	fimc->reqbufs_count = 0;
>  
>  	INIT_LIST_HEAD(&fimc->pending_buf_q);
> diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
> index 1bea1ce4091e..17e5bf4810f4 100644
> --- a/drivers/media/platform/exynos4-is/fimc-m2m.c
> +++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
> @@ -236,9 +236,8 @@ static int fimc_m2m_querycap(struct file *file, void *fh,
>  				     struct v4l2_capability *cap)
>  {
>  	struct fimc_dev *fimc = video_drvdata(file);
> -	unsigned int caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
>  
> -	__fimc_vidioc_querycap(&fimc->pdev->dev, cap, caps);
> +	__fimc_vidioc_querycap(&fimc->pdev->dev, cap);
>  	return 0;
>  }
>  
> @@ -736,6 +735,7 @@ int fimc_register_m2m_device(struct fimc_dev *fimc,
>  	vfd->release = video_device_release_empty;
>  	vfd->lock = &fimc->lock;
>  	vfd->vfl_dir = VFL_DIR_M2M;
> +	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
>  	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);
>  
>  	snprintf(vfd->name, sizeof(vfd->name), "fimc.%d.m2m", fimc->id);
> diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
> index 1dfd2eb65920..9b6eadef6858 100644
> --- a/drivers/media/platform/rcar_jpu.c
> +++ b/drivers/media/platform/rcar_jpu.c
> @@ -671,8 +671,6 @@ static int jpu_querycap(struct file *file, void *priv,
>  	strscpy(cap->driver, DRV_NAME, sizeof(cap->driver));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>  		 dev_name(ctx->jpu->dev));
> -	cap->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
> -	cap->capabilities = V4L2_CAP_DEVICE_CAPS | cap->device_caps;
>  	memset(cap->reserved, 0, sizeof(cap->reserved));
>  
>  	return 0;
> @@ -1662,6 +1660,8 @@ static int jpu_probe(struct platform_device *pdev)
>  	jpu->vfd_encoder.lock		= &jpu->mutex;
>  	jpu->vfd_encoder.v4l2_dev	= &jpu->v4l2_dev;
>  	jpu->vfd_encoder.vfl_dir	= VFL_DIR_M2M;
> +	jpu->vfd_encoder.device_caps	= V4L2_CAP_STREAMING |
> +					  V4L2_CAP_VIDEO_M2M_MPLANE;
>  
>  	ret = video_register_device(&jpu->vfd_encoder, VFL_TYPE_GRABBER, -1);
>  	if (ret) {
> @@ -1679,6 +1679,8 @@ static int jpu_probe(struct platform_device *pdev)
>  	jpu->vfd_decoder.lock		= &jpu->mutex;
>  	jpu->vfd_decoder.v4l2_dev	= &jpu->v4l2_dev;
>  	jpu->vfd_decoder.vfl_dir	= VFL_DIR_M2M;
> +	jpu->vfd_decoder.device_caps	= V4L2_CAP_STREAMING |
> +					  V4L2_CAP_VIDEO_M2M_MPLANE;
>  
>  	ret = video_register_device(&jpu->vfd_decoder, VFL_TYPE_GRABBER, -1);
>  	if (ret) {
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> index 9a53d3908b52..6ff57018a353 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> @@ -1348,6 +1348,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  	vfd->lock	= &dev->mfc_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;
> +	vfd->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>  	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);
>  	snprintf(vfd->name, sizeof(vfd->name), "%s", S5P_MFC_DEC_NAME);
>  	dev->vfd_dec	= vfd;
> @@ -1366,6 +1367,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  	vfd->lock	= &dev->mfc_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;
> +	vfd->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>  	snprintf(vfd->name, sizeof(vfd->name), "%s", S5P_MFC_ENC_NAME);
>  	dev->vfd_enc	= vfd;
>  	video_set_drvdata(vfd, dev);
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> index e111f9c47179..d29e5bc73651 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> @@ -275,13 +275,6 @@ static int vidioc_querycap(struct file *file, void *priv,
>  	strscpy(cap->card, dev->vfd_dec->name, sizeof(cap->card));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>  		 dev_name(&dev->plat_dev->dev));
> -	/*
> -	 * This is only a mem-to-mem video device. The capture and output
> -	 * device capability flags are left only for backward compatibility
> -	 * and are scheduled for removal.
> -	 */
> -	cap->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> index 5505e4fc2090..5ab1231b4189 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> @@ -1317,13 +1317,6 @@ static int vidioc_querycap(struct file *file, void *priv,
>  	strscpy(cap->card, dev->vfd_enc->name, sizeof(cap->card));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>  		 dev_name(&dev->plat_dev->dev));
> -	/*
> -	 * This is only a mem-to-mem video device. The capture and output
> -	 * device capability flags are left only for backward compatibility
> -	 * and are scheduled for removal.
> -	 */
> -	cap->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> index 1e40eafec284..a61ac426853a 100644
> --- a/drivers/media/platform/ti-vpe/vpe.c
> +++ b/drivers/media/platform/ti-vpe/vpe.c
> @@ -1495,8 +1495,6 @@ static int vpe_querycap(struct file *file, void *priv,
>  	strscpy(cap->card, VPE_MODULE_NAME, sizeof(cap->card));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>  		VPE_MODULE_NAME);
> -	cap->device_caps  = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> @@ -2411,6 +2409,7 @@ static const struct video_device vpe_videodev = {
>  	.minor		= -1,
>  	.release	= video_device_release_empty,
>  	.vfl_dir	= VFL_DIR_M2M,
> +	.device_caps	= V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
>  };
>  
>  static const struct v4l2_m2m_ops m2m_ops = {
> -- 
> 2.20.1
> 

-- 
Regards,

Laurent Pinchart
