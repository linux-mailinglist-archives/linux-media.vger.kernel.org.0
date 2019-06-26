Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865C4565DC
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 11:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfFZJqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 05:46:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47694 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfFZJqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 05:46:49 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77067510;
        Wed, 26 Jun 2019 11:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561542407;
        bh=dgtFnGdJuziB2LTpvJiDwdxNYCiVTFCQN6PKXxJLsMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ko1gBn/MmVavTtZy5JrRg9eOJGlPpgjNws+6hOxJaOlSdNftGMoQS0gvmplcdYI/O
         meLPDDWAw34u1gu8K8kOvxos8Qv5OJqRdYBJECDP/CS6yjgmDAVtHsW74ztG81fI0r
         BymvwmxfZ35AiU7Pof7nIKAtFy51nKE6QdmCPsis=
Date:   Wed, 26 Jun 2019 12:44:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 11/16] xilinx: set device_caps in struct video_device
Message-ID: <20190626094418.GF4776@pendragon.ideasonboard.com>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
 <20190626074421.38739-12-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190626074421.38739-12-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Jun 26, 2019 at 09:44:16AM +0200, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please feel free to merge this patch along with the rest of the series.

> ---
>  drivers/media/platform/xilinx/xilinx-dma.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index c9d5fdb2d407..bcd783d9e5ae 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -491,15 +491,8 @@ xvip_dma_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  	struct v4l2_fh *vfh = file->private_data;
>  	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
>  
> -	cap->device_caps = V4L2_CAP_STREAMING;
> -
> -	if (dma->queue.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -		cap->device_caps |= V4L2_CAP_VIDEO_CAPTURE;
> -	else
> -		cap->device_caps |= V4L2_CAP_VIDEO_OUTPUT;
> -
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS
> -			  | dma->xdev->v4l2_caps;
> +	cap->capabilities = dma->xdev->v4l2_caps | V4L2_CAP_STREAMING |
> +			    V4L2_CAP_DEVICE_CAPS;
>  
>  	strscpy(cap->driver, "xilinx-vipp", sizeof(cap->driver));
>  	strscpy(cap->card, dma->video.name, sizeof(cap->card));
> @@ -700,6 +693,11 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>  	dma->video.release = video_device_release_empty;
>  	dma->video.ioctl_ops = &xvip_dma_ioctl_ops;
>  	dma->video.lock = &dma->lock;
> +	dma->video.device_caps = V4L2_CAP_STREAMING;
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		dma->video.device_caps |= V4L2_CAP_VIDEO_CAPTURE;
> +	else
> +		dma->video.device_caps |= V4L2_CAP_VIDEO_OUTPUT;
>  
>  	video_set_drvdata(&dma->video, dma);

-- 
Regards,

Laurent Pinchart
