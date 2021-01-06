Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28012EBF9D
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbhAFOas convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 09:30:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbhAFOas (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:30:48 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22864C061357
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:30:08 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9p8-0007PA-PX; Wed, 06 Jan 2021 15:30:06 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9p8-0002W0-HJ; Wed, 06 Jan 2021 15:30:06 +0100
Message-ID: <2d91fcb78d4943020c9c8c3fd3e48e2a017b0ccc.camel@pengutronix.de>
Subject: Re: [PATCH 14/75] media: imx: capture: Move queue and ctrl handler
 init to init function
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Wed, 06 Jan 2021 15:30:06 +0100
In-Reply-To: <20210105152852.5733-15-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-15-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-01-05 at 17:27 +0200, Laurent Pinchart wrote:
> Move the initialization of the vb2 queue and the control handler to the
> imx_media_capture_device_init() function. There's no need to delay them
> until the registration time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 51 ++++++++++---------
>  1 file changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 4f9cff62eb1f..d7cc1423b71e 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -725,7 +725,6 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  	struct v4l2_subdev *sd = priv->src_sd;
>  	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
>  	struct video_device *vfd = vdev->vfd;
> -	struct vb2_queue *vq = &priv->q;
>  	struct v4l2_subdev_format fmt_src;
>  	int ret;
>  
> @@ -740,25 +739,6 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  		return ret;
>  	}
>  
> -	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -	vq->io_modes = VB2_MMAP | VB2_DMABUF;
> -	vq->drv_priv = priv;
> -	vq->buf_struct_size = sizeof(struct imx_media_buffer);
> -	vq->ops = &capture_qops;
> -	vq->mem_ops = &vb2_dma_contig_memops;
> -	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	vq->lock = &priv->mutex;
> -	vq->min_buffers_needed = 2;
> -	vq->dev = priv->dev;
> -
> -	ret = vb2_queue_init(vq);
> -	if (ret) {
> -		dev_err(priv->dev, "vb2_queue_init failed\n");
> -		goto unreg;
> -	}
> -
> -	INIT_LIST_HEAD(&priv->ready_q);
> -
>  	/* create the link from the src_sd devnode pad to device node */
>  	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
>  				    &vfd->entity, 0, 0);
> @@ -787,8 +767,6 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  	dev_info(priv->dev, "Registered %s as /dev/%s\n", vfd->name,
>  		 video_device_node_name(vfd));
>  
> -	vfd->ctrl_handler = &priv->ctrl_hdlr;
> -
>  	/* add vdev to the video device list */
>  	imx_media_add_video_device(priv->md, vdev);
>  
> @@ -821,6 +799,7 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
>  {
>  	struct capture_priv *priv;
>  	struct video_device *vfd;
> +	struct vb2_queue *vq;
>  	int ret;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -832,8 +811,10 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
>  	priv->dev = dev;
>  
>  	mutex_init(&priv->mutex);
> +	INIT_LIST_HEAD(&priv->ready_q);
>  	spin_lock_init(&priv->q_lock);
>  
> +	/* Allocate and initialize the video device. */
>  	snprintf(capture_videodev.name, sizeof(capture_videodev.name),
>  		 "%s capture", src_sd->name);
>  
> @@ -844,8 +825,12 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
>  	*vfd = capture_videodev;
>  	vfd->lock = &priv->mutex;
>  	vfd->queue = &priv->q;
> +
> +	video_set_drvdata(vfd, priv);
>  	priv->vdev.vfd = vfd;
> +	INIT_LIST_HEAD(&priv->vdev.list);
>  
> +	/* Initialize the video device pad. */
>  	priv->vdev_pad.flags = MEDIA_PAD_FL_SINK;
>  	ret = media_entity_pads_init(&vfd->entity, 1, &priv->vdev_pad);
>  	if (ret) {
> @@ -853,11 +838,29 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
>  		return ERR_PTR(ret);
>  	}
>  
> -	INIT_LIST_HEAD(&priv->vdev.list);
> +	/* Initialize the vb2 queue. */
> +	vq = &priv->q;
> +	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	vq->drv_priv = priv;
> +	vq->buf_struct_size = sizeof(struct imx_media_buffer);
> +	vq->ops = &capture_qops;
> +	vq->mem_ops = &vb2_dma_contig_memops;
> +	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	vq->lock = &priv->mutex;
> +	vq->min_buffers_needed = 2;
> +	vq->dev = priv->dev;
>  
> -	video_set_drvdata(vfd, priv);
> +	ret = vb2_queue_init(vq);
> +	if (ret) {
> +		dev_err(priv->dev, "vb2_queue_init failed\n");
> +		video_device_release(vfd);
> +		return ERR_PTR(ret);
> +	}
>  
> +	/* Initialize the control handler. */
>  	v4l2_ctrl_handler_init(&priv->ctrl_hdlr, 0);
> +	vfd->ctrl_handler = &priv->ctrl_hdlr;
>  
>  	return &priv->vdev;
>  }

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
