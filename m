Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2270639BAFF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 16:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhFDOkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 10:40:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35704 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhFDOkC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 10:40:02 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E45D2A3;
        Fri,  4 Jun 2021 16:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622817495;
        bh=xTjcZtdFEiY4zZBPYiOMxoT7iHdsHD2wxRZRBWENyqE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n9wCcVnm0NUDl7oMeyPanELSLRPQz+HbRYoYsXu32UFwjgMnwrLu5pLGAfVR1TDch
         kNfvRl8QlnPCrlM47KTve5Q7qUCINStCXslS1VZ9wo9/AVjMx9GpWBKDebm7YnyLUJ
         q3dvHxfA1X2TRHTur8cKcs4lw9lDDt3sqRlWNWvU=
Date:   Fri, 4 Jun 2021 17:38:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: videobuf2-v4l2.c: add
 vb2_queue_change_type() helper
Message-ID: <YLo6yjdnODaIU8aC@pendragon.ideasonboard.com>
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
 <20210412110211.275791-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412110211.275791-2-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:02:09PM +0300, Tomi Valkeinen wrote:
> On some platforms a video device can capture either video data or
> metadata. The driver can implement vidioc functions for both video and
> metadata, and use a single vb2_queue for the buffers. However, vb2_queue
> requires choosing a single buffer type, which conflicts with the idea of
> capturing either video or metadata.
> 
> The buffer type of vb2_queue can be changed, but it's not obvious how
> this should be done in the drivers. To help this, add a new helper
> function vb2_queue_change_type() which ensures the correct checks and
> documents how it can be used.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++++
>  include/media/videobuf2-v4l2.h                  | 15 +++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 7e96f67c60ba..2988bb38ceb1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -939,6 +939,20 @@ void vb2_queue_release(struct vb2_queue *q)
>  }
>  EXPORT_SYMBOL_GPL(vb2_queue_release);
>  
> +int vb2_queue_change_type(struct vb2_queue *q, unsigned int type)
> +{
> +	if (type == q->type)
> +		return 0;
> +
> +	if (vb2_is_busy(q))
> +		return -EBUSY;
> +
> +	q->type = type;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vb2_queue_change_type);
> +
>  __poll_t vb2_poll(struct vb2_queue *q, struct file *file, poll_table *wait)
>  {
>  	struct video_device *vfd = video_devdata(file);
> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
> index c203047eb834..12fa72a664cf 100644
> --- a/include/media/videobuf2-v4l2.h
> +++ b/include/media/videobuf2-v4l2.h
> @@ -261,6 +261,21 @@ int __must_check vb2_queue_init_name(struct vb2_queue *q, const char *name);
>   */
>  void vb2_queue_release(struct vb2_queue *q);
>  
> +/**
> + * vb2_queue_change_type() - change the type of an inactive vb2_queue
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> + *
> + * This function changes the type of the vb2_queue. This is only possible
> + * if the queue is not busy (i.e. no buffers have been allocated).
> + *
> + * vb2_queue_change_type() can be used to support multiple buffer types using
> + * the same queue. The driver can implement v4l2_ioctl_ops.vidioc_reqbufs and

I think this should be &v4l2_ioctl_ops.vidioc_reqbufs() (same below) to
generate links properly.

> + * v4l2_ioctl_ops.vidioc_create_bufs functions and call vb2_queue_change_type()
> + * before calling vb2_ioctl_reqbufs() or vb2_ioctl_create_bufs(), and thus
> + * "lock" the buffer type until the buffers have been released.

It would be nice if selection of the type could be moved to the
.queue_setup() operation, but that's more difficult and would require
rework of the reqbufs and create_bufs implementations that may be
tricky.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + */
> +int vb2_queue_change_type(struct vb2_queue *q, unsigned int type);
> +
>  /**
>   * vb2_poll() - implements poll userspace operation
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.

-- 
Regards,

Laurent Pinchart
