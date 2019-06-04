Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68D2D346AC
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbfFDM2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:28:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47544 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbfFDM2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 08:28:16 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:2788:668:163:5bb7:9f6c:564c:d55e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3215C5D;
        Tue,  4 Jun 2019 14:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559651294;
        bh=J7NkxVf07lu0PHbMf37oWXWdQ4DdmhVdEY9cdEV/+kk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UJKHGB0TZO3bNrR55gKa6CQ+YVWju2hYhl4PtiP/QsvWIAtoLoQgdsGAPz3KqUCCO
         gHbhOSzb/YcH4utjiC/ia12YNmweo2qrS93OlC8hA6nAacY5Pk1WpB1M38PMEeGjdf
         DvOFSzsfXCPYHdOWyqIT5CJSiXnQcc2xc8oYaah8=
Date:   Tue, 4 Jun 2019 15:28:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 7/7] staging/media: set device_caps in struct video_device
Message-ID: <20190604122801.GC7812@pendragon.ideasonboard.com>
References: <d6832f03-915a-91fc-b678-b2daf68d66d9@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d6832f03-915a-91fc-b678-b2daf68d66d9@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jun 04, 2019 at 01:22:26PM +0200, Hans Verkuil wrote:
> From 5e271dce24e2a0e3bad026fff4f8d7485d97aa71 Mon Sep 17 00:00:00 2001
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date: Tue, 4 Jun 2019 11:39:41 +0200
> Subject: [PATCH 7/7] staging/media: set device_caps in struct video_device
> 
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> But this only really works if all drivers use this, so convert
> all staging/media drivers in this patch.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>
> ---
>  drivers/staging/media/bcm2048/radio-bcm2048.c   |  7 ++-----
>  drivers/staging/media/davinci_vpfe/vpfe_video.c |  9 +++++----
>  drivers/staging/media/omap4iss/iss_video.c      | 11 +++++------
>  3 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/bcm2048/radio-bcm2048.c b/drivers/staging/media/bcm2048/radio-bcm2048.c
> index 09903ffb13ba..2c60a1fb6350 100644
> --- a/drivers/staging/media/bcm2048/radio-bcm2048.c
> +++ b/drivers/staging/media/bcm2048/radio-bcm2048.c
> @@ -2310,11 +2310,6 @@ static int bcm2048_vidioc_querycap(struct file *file, void *priv,
>  	strscpy(capability->card, BCM2048_DRIVER_CARD,
>  		sizeof(capability->card));
>  	snprintf(capability->bus_info, 32, "I2C: 0x%X", bdev->client->addr);
> -	capability->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
> -					V4L2_CAP_HW_FREQ_SEEK;
> -	capability->capabilities = capability->device_caps |
> -		V4L2_CAP_DEVICE_CAPS;
> -
>  	return 0;
>  }
> 
> @@ -2570,6 +2565,8 @@ static const struct video_device bcm2048_viddev_template = {
>  	.name			= BCM2048_DRIVER_NAME,
>  	.release		= video_device_release_empty,
>  	.ioctl_ops		= &bcm2048_ioctl_ops,
> +	.device_caps		= V4L2_CAP_TUNER | V4L2_CAP_RADIO |
> +				  V4L2_CAP_HW_FREQ_SEEK,
>  };
> 
>  /*
> diff --git a/drivers/staging/media/davinci_vpfe/vpfe_video.c b/drivers/staging/media/davinci_vpfe/vpfe_video.c
> index 84cca18e3e9d..ab6bc452d9f6 100644
> --- a/drivers/staging/media/davinci_vpfe/vpfe_video.c
> +++ b/drivers/staging/media/davinci_vpfe/vpfe_video.c
> @@ -612,10 +612,6 @@ static int vpfe_querycap(struct file *file, void  *priv,
> 
>  	v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_querycap\n");
> 
> -	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -		cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> -	else
> -		cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>  	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT |
>  			    V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
>  	strscpy(cap->driver, CAPTURE_DRV_NAME, sizeof(cap->driver));
> @@ -1628,6 +1624,11 @@ int vpfe_video_register(struct vpfe_video_device *video,
> 
>  	video->video_dev.v4l2_dev = vdev;
> 
> +	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		video->video_dev.device_caps = V4L2_CAP_VIDEO_CAPTURE;
> +	else
> +		video->video_dev.device_caps = V4L2_CAP_VIDEO_OUTPUT;
> +	video->video_dev.device_caps |= V4L2_CAP_STREAMING;
>  	ret = video_register_device(&video->video_dev, VFL_TYPE_GRABBER, -1);
>  	if (ret < 0)
>  		pr_err("%s: could not register video device (%d)\n",
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index c2c5a9cd8642..c307707480f7 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -533,12 +533,6 @@ iss_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  	strscpy(cap->driver, ISS_VIDEO_DRIVER_NAME, sizeof(cap->driver));
>  	strscpy(cap->card, video->video.name, sizeof(cap->card));
>  	strscpy(cap->bus_info, "media", sizeof(cap->bus_info));
> -
> -	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -		cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> -	else
> -		cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> -
>  	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
>  			  | V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT;
> 
> @@ -1272,6 +1266,11 @@ int omap4iss_video_register(struct iss_video *video, struct v4l2_device *vdev)
>  	int ret;
> 
>  	video->video.v4l2_dev = vdev;
> +	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE;
> +	else
> +		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT;
> +	video->video.device_caps |= V4L2_CAP_STREAMING;

I would write this

	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE
					 | V4L2_CAP_STREAMING;
	else
		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT
					 | V4L2_CAP_STREAMING;

as an optimisation. Apart from that, for the omap4iss driver,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
>  	ret = video_register_device(&video->video, VFL_TYPE_GRABBER, -1);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
