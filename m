Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9662EBF91
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbhAFO0m convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 09:26:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbhAFO0l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:26:41 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87170C061357
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:26:01 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9lA-0006wn-6u; Wed, 06 Jan 2021 15:26:00 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9l9-0002R8-Tr; Wed, 06 Jan 2021 15:25:59 +0100
Message-ID: <4ffecc72870e59dab7f4c19c7b43a88642a56372.camel@pengutronix.de>
Subject: Re: [PATCH 08/75] media: imx: capture: Use dev_* instead of v4l2_*
 to log messages
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Wed, 06 Jan 2021 15:25:59 +0100
In-Reply-To: <20210105152852.5733-9-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-9-laurent.pinchart@ideasonboard.com>
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
> The imx-media-capture helpers operate a video device node, but abuse the
> v4l2_* subdev print functions to log messages. We have a struct device
> pointer available, use it instead with the dev_* functions. This reduces
> dependencies from imx-media-capture to the connected subdev.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index eb1453ade571..21f01ec56bd5 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -163,7 +163,7 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
>  	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
>  	if (ret) {
> -		v4l2_err(priv->src_sd, "failed to get src_sd format\n");
> +		dev_err(priv->dev, "failed to get src_sd format\n");
>  		return ret;
>  	}
>  
> @@ -289,7 +289,7 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
>  	int ret;
>  
>  	if (vb2_is_busy(&priv->q)) {
> -		v4l2_err(priv->src_sd, "%s queue busy\n", __func__);
> +		dev_err(priv->dev, "%s queue busy\n", __func__);
>  		return -EBUSY;
>  	}
>  
> @@ -510,9 +510,9 @@ static int capture_buf_prepare(struct vb2_buffer *vb)
>  	struct v4l2_pix_format *pix = &priv->vdev.fmt.fmt.pix;
>  
>  	if (vb2_plane_size(vb, 0) < pix->sizeimage) {
> -		v4l2_err(priv->src_sd,
> -			 "data will not fit into plane (%lu < %lu)\n",
> -			 vb2_plane_size(vb, 0), (long)pix->sizeimage);
> +		dev_err(priv->dev,
> +			"data will not fit into plane (%lu < %lu)\n",
> +			vb2_plane_size(vb, 0), (long)pix->sizeimage);
>  		return -EINVAL;
>  	}
>  
> @@ -570,14 +570,14 @@ static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  	ret = capture_validate_fmt(priv);
>  	if (ret) {
> -		v4l2_err(priv->src_sd, "capture format not valid\n");
> +		dev_err(priv->dev, "capture format not valid\n");
>  		goto return_bufs;
>  	}
>  
>  	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
>  					    true);
>  	if (ret) {
> -		v4l2_err(priv->src_sd, "pipeline start failed with %d\n", ret);
> +		dev_err(priv->dev, "pipeline start failed with %d\n", ret);
>  		goto return_bufs;
>  	}
>  
> @@ -610,7 +610,7 @@ static void capture_stop_streaming(struct vb2_queue *vq)
>  	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
>  					    false);
>  	if (ret)
> -		v4l2_warn(priv->src_sd, "pipeline stop failed with %d\n", ret);
> +		dev_warn(priv->dev, "pipeline stop failed with %d\n", ret);
>  
>  	/* release all active buffers */
>  	spin_lock_irqsave(&priv->q_lock, flags);
> @@ -646,7 +646,7 @@ static int capture_open(struct file *file)
>  
>  	ret = v4l2_fh_open(file);
>  	if (ret)
> -		v4l2_err(priv->src_sd, "v4l2_fh_open failed\n");
> +		dev_err(priv->dev, "v4l2_fh_open failed\n");
>  
>  	ret = v4l2_pipeline_pm_get(&vfd->entity);
>  	if (ret)
> @@ -749,7 +749,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  
>  	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
> -		v4l2_err(sd, "Failed to register video device\n");
> +		dev_err(priv->dev, "Failed to register video device\n");
>  		return ret;
>  	}
>  
> @@ -766,7 +766,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  
>  	ret = vb2_queue_init(vq);
>  	if (ret) {
> -		v4l2_err(sd, "vb2_queue_init failed\n");
> +		dev_err(priv->dev, "vb2_queue_init failed\n");
>  		goto unreg;
>  	}
>  
> @@ -776,7 +776,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
>  				    &vfd->entity, 0, 0);
>  	if (ret) {
> -		v4l2_err(sd, "failed to create link to device node\n");
> +		dev_err(priv->dev, "failed to create link to device node\n");
>  		goto unreg;
>  	}
>  
> @@ -785,7 +785,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
>  	if (ret) {
> -		v4l2_err(sd, "failed to get src_sd format\n");
> +		dev_err(priv->dev, "failed to get src_sd format\n");
>  		goto unreg;
>  	}
>  
> @@ -797,8 +797,8 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  	vdev->cc = imx_media_find_pixel_format(vdev->fmt.fmt.pix.pixelformat,
>  					       PIXFMT_SEL_ANY);
>  
> -	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
> -		  video_device_node_name(vfd));
> +	dev_info(priv->dev, "Registered %s as /dev/%s\n", vfd->name,
> +		 video_device_node_name(vfd));
>  
>  	vfd->ctrl_handler = &priv->ctrl_hdlr;
>  

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
