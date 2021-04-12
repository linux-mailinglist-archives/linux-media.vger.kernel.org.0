Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807B235BC90
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 10:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbhDLInp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 04:43:45 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56097 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237516AbhDLInk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 04:43:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VsA8l4OfKMxedVsABlcLav; Mon, 12 Apr 2021 10:43:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618216999; bh=+BZdwhRFYlnjSDtb0J7xVpHRMjC98xI+H52aP1iqj8U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=n5Mj8+9LTgL8Bm13eU1v/xUhm/+g77/oGofhpEC3xtjr2rzyr8cnp4aA+BHE3+oTD
         DXFdoXNi6l0+dWWSzm/3+ImWc8cDPufi9GPj4sbqupiYa2wLKE55js/4nUHrh6Crb0
         uiZZvH6Kfp8QgxDXdrbd3gtzmGqUbqprIfSz0qdqfqRPD0smluKhG4mNeoNLc4Nrl+
         BXxmowVIzVIGRZeGMVjMLJ/S2DqP7hQOFJppe/sHFas02g4o01V+ePwOS5UtJfNONV
         Pp6MBJINWSEatuwDBXe+7gghNn4W/u5LPQPBifWnq4tlMH4vJ7mTWkxT/URcaar/hS
         fLFGkCxX9uOhg==
Subject: Re: [PATCH] media: videobuf2-v4l2.c: add vb2_queue_change_type()
 helper
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210412081255.104788-1-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3a11426a-303c-3d8e-2ff0-842390f3c7fd@xs4all.nl>
Date:   Mon, 12 Apr 2021 10:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412081255.104788-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH3DpSxfbGhopwwa0P3pAs8GmD5e8pvU5rIXALAoIYqNqaDdYK6NCJ6RvX/QZT1o15c7AWmlotSL7Kdxh/+8AFhRZAVtPl41z1TNuErT0ayXjmzhp6jJ
 8cHapA/izuUJMc8tCrbSuznI3ngwcWDFd10ByrCHAjUgp93HaAdObsikUJE1Qlwmq3HVDlcz89JJDaX88VDJblCBV6zu7NtEwSFo+4f7Ail+qDzfpwfy7ST/
 Z1nK3kKafG8BCHc6vMjQ3AQ98uJ8jAiqhVz9xLU7oZZDz0F4e8Qlc+9EHltOqEg9pvpdEimSqOaR8iiI6ZNBSiatTNsqBikIOmjf2b2dJLtWoQJHKWmSV5D9
 7/uYfELGJ6KAGpu2+hHQdQrN9gykxDKzZ1i8XqJ7iBxHA4iRbLw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 12/04/2021 10:12, Tomi Valkeinen wrote:
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
> index c203047eb834..3e604c1b5e1b 100644
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
> + * if the queue is not busy (i.e. no buffers have been queued).

queued -> allocated

> + *
> + * vb2_queue_change_type() can be used to support multiple buffer types using
> + * the same queue. The driver can implement v4l2_ioctl_ops.vidioc_reqbufs and
> + * v4l2_ioctl_ops.vidioc_create_bufs functions and call vb2_queue_change_type()
> + * before calling vb2_ioctl_reqbufs() or vb2_ioctl_create_bufs(), and thus
> + * "lock" the buffer type until the buffers have been released.
> + */
> +int vb2_queue_change_type(struct vb2_queue *q, unsigned int type);
> +
>  /**
>   * vb2_poll() - implements poll userspace operation
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> 

Can you also update vivid to use this function? That would also be a good test.
Check with v4l2-compliance as well. It is not impossible that some changes
have to be made to v4l2-compliance, ping me on irc if that's the case.

Regards,

	Hans
