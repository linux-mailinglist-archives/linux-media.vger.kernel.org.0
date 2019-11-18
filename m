Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C673E1006D3
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 14:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfKRNwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 08:52:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55390 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfKRNwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 08:52:41 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CF85228D974;
        Mon, 18 Nov 2019 13:52:39 +0000 (GMT)
Date:   Mon, 18 Nov 2019 14:52:37 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC] Add VIDIOC_DESTROY_BUFS
Message-ID: <20191118145237.27c5eea2@collabora.com>
In-Reply-To: <27184315-c71b-2dc2-aa95-9489c46d3fb9@xs4all.nl>
References: <27184315-c71b-2dc2-aa95-9489c46d3fb9@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On Mon, 18 Nov 2019 14:06:40 +0100
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Here is a proposal for a new VIDIOC_DESTROY_BUFS ioctl:

Thanks for sending this RFC.

> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c7c1179eea65..1a80d1119768 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2423,6 +2423,19 @@ struct v4l2_create_buffers {
>  	__u32			reserved[7];
>  };
> 
> +/**
> + * struct v4l2_destroy_buffers - VIDIOC_DESTROY_BUFS argument
> + * @type:	stream type
> + * @index:	index of the first buffer to destroy
> + * @count:	number of consecutive buffers starting from @index to destroy
> + */
> +struct v4l2_destroy_buffers {
> +	__u32			type;
> +	__u32			index;
> +	__u32			count;
> +};
> +
> +
>  /*
>   *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>   *
> @@ -2522,6 +2535,7 @@ struct v4l2_create_buffers {
>  #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
> 
>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
> +#define VIDIOC_DESTROY_BUFS	_IOW ('V', 104, struct v4l2_destroy_buffers)
> 
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> 
> 
> 
> So this basically just destroys buffers [index..index+count-1]. Does nothing if
> count == 0. All buffers in the sequence must be dequeued or it will return
> -EBUSY and do nothing.
> 
> If some of the buffers in that range are already destroyed, or in fact were
> never created, then they will be ignored. I.e., DESTROY_BUFS won't return
> an error in that case.

Sounds good to me.

> 
> 
> VIDIOC_CREATE_BUFS will need a few changes:
> 
> CREATE_BUFS will try to find a range of <count> free consecutive buffers.
> If that's not available, then it will reduce <count> to the count of the
> maximum freely available consecutive buffers. If <count> is 0, then it
> will set <index> to the maximum index of an existing buffer + 1.
> 
> As long as DESTROY_BUFS isn't used, then CREATE_BUFS acts exactly the same
> as it does today.

Sounds good too.

> 
> I would also like to extend struct v4l2_create_buffers with a new field:
> __u32 max_index. This is a maximum index possible, typically VIDEO_MAX_FRAME-1.

Shouldn't max_buffers be a property of the queue, set through a separate
ioctl()? BTW, how would you decrease the queue depth?
CREATE_BUFS.{count=0,max_index=<new-depth>}?

Thanks,

Boris
