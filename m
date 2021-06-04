Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64DB39BB10
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 16:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhFDOqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 10:46:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35798 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhFDOqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 10:46:23 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4295B2A3;
        Fri,  4 Jun 2021 16:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622817876;
        bh=Rx6Nm8ibUiFAZtO9ppFDXhcsM2/hl99L/yZjWTDjCEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCDXsWU1JIhxKxl7Do/pnzHFjHlp9Khbc8Zh7ZcAoNK81IMbJNromvg4rU0mYVEYJ
         LKvBrQYw5ZvPioVS+S0uWXvqLBIwP3pSh2tnjy1bQXEjsQZUw4UUmkyGyhCVJPjZTJ
         by53pVcsoZZj+4DplJLWgE7aZsDgkdXCZHVHQwyg=
Date:   Fri, 4 Jun 2021 17:44:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: vivid: use vb2_queue_change_type
Message-ID: <YLo8R3HUBgQnwpwF@pendragon.ideasonboard.com>
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
 <20210412110211.275791-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412110211.275791-4-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:02:11PM +0300, Tomi Valkeinen wrote:
> Use the new vb2_queue_change_type() function in .vidioc_reqbufs and
> .vidioc_create_bufs instead of changing the queue type manually in
> vidioc_s_fmt_vbi_cap() and vidioc_s_fmt_sliced_vbi_cap().
> 
> This allows for a more consistent behavior, as .vidioc_reqbufs and
> .vidioc_create_bufs are when the queue will become "busy".
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/test-drivers/vivid/vivid-core.c | 44 ++++++++++++++++++-
>  .../media/test-drivers/vivid/vivid-vbi-cap.c  |  2 -
>  2 files changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index 0dc65ef3aa14..70676f1ac268 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -656,6 +656,46 @@ static const struct v4l2_file_operations vivid_radio_fops = {
>  	.unlocked_ioctl = video_ioctl2,
>  };
>  
> +static int vidioc_reqbufs(struct file *file, void *priv,
> +				 struct v4l2_requestbuffers *p)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	int r;

s/r/ret/ to match the driver's coding style.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	/*
> +	 * Sliced and raw VBI capture share the same queue so we must
> +	 * change the type.
> +	 */
> +	if (p->type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ||
> +	    p->type == V4L2_BUF_TYPE_VBI_CAPTURE) {
> +		r = vb2_queue_change_type(vdev->queue, p->type);
> +		if (r)
> +			return r;
> +	}
> +
> +	return vb2_ioctl_reqbufs(file, priv, p);
> +}
> +
> +static int vidioc_create_bufs(struct file *file, void *priv,
> +				     struct v4l2_create_buffers *p)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	int r;
> +
> +	/*
> +	 * Sliced and raw VBI capture share the same queue so we must
> +	 * change the type.
> +	 */
> +	if (p->format.type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ||
> +	    p->format.type == V4L2_BUF_TYPE_VBI_CAPTURE) {
> +		r = vb2_queue_change_type(vdev->queue, p->format.type);
> +		if (r)
> +			return r;
> +	}
> +
> +	return vb2_ioctl_create_bufs(file, priv, p);
> +}
> +
>  static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
>  	.vidioc_querycap		= vidioc_querycap,
>  
> @@ -717,8 +757,8 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
>  	.vidioc_g_fbuf			= vidioc_g_fbuf,
>  	.vidioc_s_fbuf			= vidioc_s_fbuf,
>  
> -	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
> -	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
> +	.vidioc_reqbufs			= vidioc_reqbufs,
> +	.vidioc_create_bufs		= vidioc_create_bufs,
>  	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
>  	.vidioc_querybuf		= vb2_ioctl_querybuf,
>  	.vidioc_qbuf			= vb2_ioctl_qbuf,
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> index 387df4ff01b0..b65b02eeeb97 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> @@ -257,7 +257,6 @@ int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
>  		return ret;
>  	if (f->type != V4L2_BUF_TYPE_VBI_CAPTURE && vb2_is_busy(&dev->vb_vbi_cap_q))
>  		return -EBUSY;
> -	dev->vbi_cap_dev.queue->type = V4L2_BUF_TYPE_VBI_CAPTURE;
>  	return 0;
>  }
>  
> @@ -324,7 +323,6 @@ int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format
>  	if (fmt->type != V4L2_BUF_TYPE_SLICED_VBI_CAPTURE && vb2_is_busy(&dev->vb_vbi_cap_q))
>  		return -EBUSY;
>  	dev->service_set_cap = vbi->service_set;
> -	dev->vbi_cap_dev.queue->type = V4L2_BUF_TYPE_SLICED_VBI_CAPTURE;
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
