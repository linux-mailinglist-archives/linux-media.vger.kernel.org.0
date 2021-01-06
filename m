Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399632EBFA0
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbhAFOcP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 09:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbhAFOcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:32:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1A1C06134D
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:31:35 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9qX-0007h1-Vp; Wed, 06 Jan 2021 15:31:33 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9qX-0002xI-EQ; Wed, 06 Jan 2021 15:31:33 +0100
Message-ID: <07bcbc76aba489a12979365caf999d9175baa908.camel@pengutronix.de>
Subject: Re: [PATCH 15/75] media: imx: capture: Initialize video_device
 programmatically
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Wed, 06 Jan 2021 15:31:33 +0100
In-Reply-To: <20210105152852.5733-16-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-16-laurent.pinchart@ideasonboard.com>
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
> Overwriting the whole video_device isn't future-proof as it would
> overwrite any field initialized by video_device_alloc(). Furthermore,
> the current implementation modifies the global template video_device as
> if it were a per-instance structure, which is bad practice. To fix all
> this, initialize the video device programmatically in
> imx_media_capture_device_init().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 23 ++++++++-----------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index d7cc1423b71e..e22d98ce5d1e 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -672,16 +672,6 @@ static const struct v4l2_file_operations capture_fops = {
>  	.mmap		= vb2_fop_mmap,
>  };
>  
> -static struct video_device capture_videodev = {
> -	.fops		= &capture_fops,
> -	.ioctl_ops	= &capture_ioctl_ops,
> -	.minor		= -1,
> -	.release	= video_device_release,
> -	.vfl_dir	= VFL_DIR_RX,
> -	.tvnorms	= V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
> -	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING,
> -};
> -
>  struct imx_media_buffer *
>  imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev)
>  {
> @@ -815,17 +805,22 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
>  	spin_lock_init(&priv->q_lock);
>  
>  	/* Allocate and initialize the video device. */
> -	snprintf(capture_videodev.name, sizeof(capture_videodev.name),
> -		 "%s capture", src_sd->name);
> -
>  	vfd = video_device_alloc();
>  	if (!vfd)
>  		return ERR_PTR(-ENOMEM);
>  
> -	*vfd = capture_videodev;
> +	vfd->fops = &capture_fops;
> +	vfd->ioctl_ops = &capture_ioctl_ops;
> +	vfd->minor = -1;
> +	vfd->release = video_device_release;
> +	vfd->vfl_dir = VFL_DIR_RX;
> +	vfd->tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
> +	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>  	vfd->lock = &priv->mutex;
>  	vfd->queue = &priv->q;
>  
> +	snprintf(vfd->name, sizeof(vfd->name), "%s capture", src_sd->name);
> +
>  	video_set_drvdata(vfd, priv);
>  	priv->vdev.vfd = vfd;
>  	INIT_LIST_HEAD(&priv->vdev.list);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
