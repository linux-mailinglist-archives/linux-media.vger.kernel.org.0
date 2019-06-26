Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8F7565A6
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 11:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfFZJ2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 05:28:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47534 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfFZJ2C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 05:28:02 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD11B510;
        Wed, 26 Jun 2019 11:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561541281;
        bh=Y6PNq3cjVdmq/C0QvCye7CsbNlDq/GpGx+wRZ6qpVJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fvXRAFly7HX9I466OnKO3Mf3s6PuWnvjRXQKL2vMAeLc2/FhRqGJ7T4/zMEqkgdrT
         AakLQxp+dKCdCBRaaEjnqkant6XyrbpZN/tAN4QG45zI4Fr1SEBgyOJ4PgwlNks44F
         hEdakwXqLjMcqhG0xDYTUex6r4d2hLGaCWGZ+H+k=
Date:   Wed, 26 Jun 2019 12:25:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 16/16] omap3isp: set device_caps in struct video_device
Message-ID: <20190626092532.GE4776@pendragon.ideasonboard.com>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
 <20190626074421.38739-17-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190626074421.38739-17-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Jun 26, 2019 at 09:44:21AM +0200, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/omap3isp/ispvideo.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
> index 175bbed9a235..d98b8c3ec0b2 100644
> --- a/drivers/media/platform/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/omap3isp/ispvideo.c
> @@ -660,12 +660,6 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  
>  	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT
>  		| V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
> -
> -	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -		cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> -	else
> -		cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> -

Could you please keep this blank line ?

>  	return 0;
>  }
>  
> @@ -1463,6 +1457,13 @@ int omap3isp_video_init(struct isp_video *video, const char *name)
>  	video->video.vfl_type = VFL_TYPE_GRABBER;
>  	video->video.release = video_device_release_empty;
>  	video->video.ioctl_ops = &isp_video_ioctl_ops;
> +	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		video->video.device_caps =
> +			V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	else
> +		video->video.device_caps =
> +			V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;

Based on the coding style of the driver, this should be

	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE
					 | V4L2_CAP_STREAMING;
	else
		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT
					 | V4L2_CAP_STREAMING;

With those minor issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please feel free to merge this patch as part of the whole series.

>  	video->pipe.stream_state = ISP_PIPELINE_STREAM_STOPPED;
>  
>  	video_set_drvdata(&video->video, video);

-- 
Regards,

Laurent Pinchart
