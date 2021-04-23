Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599EB368EF6
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 10:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhDWIlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 04:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbhDWIlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 04:41:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46ABBC061574
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 01:40:49 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CD26332;
        Fri, 23 Apr 2021 10:40:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619167247;
        bh=a430KVuvvBlbY8MTtCZtoRrGpingkTLTQqPB5KHyYM8=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=u1mJle8lM+qhG0SBJ2ZwAKvMhNfe68eYZ7C2vMUEzMPzT8HM3VziYKxnlVSx/jrmE
         LHVyZsS7Xixb4gzh1wMKnZsEvFglVyVNZ7mCMwx3OfBcHHP45C5bMUglJ9ixgW0PBa
         xg1ykA6wpHaXgApHes+6d2h81t5DyKJ4LqlST+7c=
Subject: Re: [PATCH v2 1/3] media: videobuf2-v4l2.c: add
 vb2_queue_change_type() helper
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
 <20210412110211.275791-2-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <5406d479-c319-0281-7302-099586911ca0@ideasonboard.com>
Date:   Fri, 23 Apr 2021 11:40:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412110211.275791-2-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/2021 14:02, Tomi Valkeinen wrote:
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
>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++++
>   include/media/videobuf2-v4l2.h                  | 15 +++++++++++++++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 7e96f67c60ba..2988bb38ceb1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -939,6 +939,20 @@ void vb2_queue_release(struct vb2_queue *q)
>   }
>   EXPORT_SYMBOL_GPL(vb2_queue_release);
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
>   __poll_t vb2_poll(struct vb2_queue *q, struct file *file, poll_table *wait)
>   {
>   	struct video_device *vfd = video_devdata(file);
> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
> index c203047eb834..12fa72a664cf 100644
> --- a/include/media/videobuf2-v4l2.h
> +++ b/include/media/videobuf2-v4l2.h
> @@ -261,6 +261,21 @@ int __must_check vb2_queue_init_name(struct vb2_queue *q, const char *name);
>    */
>   void vb2_queue_release(struct vb2_queue *q);
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
> + * v4l2_ioctl_ops.vidioc_create_bufs functions and call vb2_queue_change_type()
> + * before calling vb2_ioctl_reqbufs() or vb2_ioctl_create_bufs(), and thus
> + * "lock" the buffer type until the buffers have been released.
> + */
> +int vb2_queue_change_type(struct vb2_queue *q, unsigned int type);
> +
>   /**
>    * vb2_poll() - implements poll userspace operation
>    * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> 

This is missing doc for the type parameter. I have added this to my branch:

@type:      The type to change to (V4L2_BUF_TYPE_VIDEO_*)

I'll send a v3 after I get feedback on the vivid patches.

  Tomi
