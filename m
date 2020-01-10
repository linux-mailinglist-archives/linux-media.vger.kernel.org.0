Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4387A136A50
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 10:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgAJJz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 04:55:59 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:55021 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727274AbgAJJz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 04:55:59 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pr1Filiw4pLtbpr1IiPmiA; Fri, 10 Jan 2020 10:55:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578650157; bh=BwacujmROvU6llGx0HTWoJb8ykjGIXGBs8a7e368hXE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wTFTE5+DiOJnzN+QAgXlzB7b8xWmdpWjJFRHwEXMayIIAFnmOqr2kX1d6kFVofMIE
         n16bmbEXy0m792lJrH6keJq4I3ibPJComti6pGU/hWSEPhXAYhEJT+xnwaVPRmQ+qI
         xiaRkiKsRDR1Z7r6LGn3j396s6prqqN9658vGeLMgGeGunhwSIj7bSF5NMELuo89dV
         Tz6r0rGmohIQOsdaPDLJ7F0HL/gnfhfrHb/XLR2h6HkQeU8BJEOFpn9SiTOIClnQ4t
         RvS4NU3yYDPiGW1TAceaWolvTuzRRlS5PDcWDFORD9mfIrGDruSeq4IHAl/TLy5XMR
         XwXs+V5ly1l1g==
Subject: Re: [RFC][PATCH 05/15] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT in REQBUFS
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-6-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8d0c95c3-64a2-ec14-0ac2-204b0430b2b4@xs4all.nl>
Date:   Fri, 10 Jan 2020 10:55:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217032034.54897-6-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCfq+5onDbtpArYan3kYQIhvL/k2PgbaOWvKGHUXgRZZMPAIVvS76/2xObvmreR6fWDyFVYb3hJqsHWGZ+/Hl3xysoBOb1Pynce2WIfEK9ib24wjdWfj
 a64PDx4ydLshJOyO0+X+VLYclDPKnEHY6FmCqIM5ftyeEYIdJXtzsW9YOoxj82eLOGB+Et55MpVvKQeTsYND9N3sFye1B8MDW+041jm0vSRjjPQcTyOE0vKs
 tfxcdDH0kz0QaG0lIIrbeKkLYsmKkq4nvHfRuIX+XTcgBwYA2ETnGm8HUWTxKdMf0NxOARz/LewaPQtCxUqULmVcoMVa9QDY3OpgR3KUxT20VehkrE6tWcZE
 SP6xvvQgLRnqb8/EFcyCbbedfKOZezFnO9dn8gJCaJu9YYAtxaihmNbpIH3KqMhaXjdc0wM5s0mnWh2hxVHVR2QG32ZeAeI/T5/RWdWoK6aTXp9FHGSv7C1j
 aBiveqv8ryuZKshiBvyFHKJZdhdQvwGtHcoSjwqxNikoO3JrA38c15zc+1GBfUpf4kHdUVUOm0kpac1nZLdnPOCMp6HFeR+dwdzihXbYtiyJbOluQ7EFRDn+
 /S7fQU2BT6pHrhHHTvW+B26wg6FxBBc0xkGESpKPeQFd+bc0YnALgC4+yjoWWKWUZjo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> This patch lets user-space to request a non-consistent memory
> allocation during REQBUFS ioctl call. We use one bit of a
> ->reserved[1] member of struct v4l2_requestbuffers, which is
> now renamed to ->flags.
> 
> There is just 1 four-byte reserved area in v4l2_requestbuffers
> struct, therefore for backward compatibility ->reserved and
> ->flags were put into anonymous union.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  Documentation/media/uapi/v4l/vidioc-reqbufs.rst | 14 ++++++++++++--
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c            |  3 ---
>  include/uapi/linux/videodev2.h                  |  5 ++++-
>  4 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> index d0c643db477a..9b69a61d9fd4 100644
> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> @@ -112,10 +112,20 @@ aborting or finishing any DMA in progress, an implicit
>  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
>  	free any previously allocated buffers, so this is typically something
>  	that will be done at the start of the application.
> -    * - __u32
> +    * - union
> +      - (anonymous)
> +    * -
> +      - __u32
> +      - ``flags``\ [1]
> +      - Specifies additional buffer management attributes. E.g. when
> +        ``V4L2_FLAG_MEMORY_NON_CONSISTENT`` set vb2 backends may be allocated
> +        in non-consistent memory.

This should link to the table with these memory flags, rather than
effectively documenting V4L2_FLAG_MEMORY_NON_CONSISTENT again.

You also probably meant "vb2 buffers" rather than "vb2 backends".

> +    * -
> +      - __u32
>        - ``reserved``\ [1]
>        - A place holder for future extensions. Drivers and applications
> -	must set the array to zero.
> +	must set the array to zero, unless application wants to specify
> +        buffer management ``flags``.

I think support for this flag should be signaled as a V4L2_BUF_CAP capability.
If the capability is not set, then vb2 should set 'flags' to 0 to preserve the
old 'Drivers and applications must set the array to zero' behavior.

The documentation for 'reserved[1]' should be changed to something like:

	Kept for backwards compatibility. Use ``flags`` instead.

Regards,

	Hans
>  
>  .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index f1e88c9398c7..0eabb589684f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -693,9 +693,15 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
> +	bool consistent = true;
> +
> +	if (req->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent = false;
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
> +	if (ret)
> +		return ret;
> +	return vb2_core_reqbufs(q, req->memory, consistent, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -939,13 +945,17 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  {
>  	struct video_device *vdev = video_devdata(file);
>  	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
> +	bool consistent = true;
>  
>  	fill_buf_caps(vdev->queue, &p->capabilities);
>  	if (res)
>  		return res;
>  	if (vb2_queue_is_busy(vdev, file))
>  		return -EBUSY;
> -	res = vb2_core_reqbufs(vdev->queue, p->memory, true, &p->count);
> +	if (p->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent = false;
> +
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, consistent, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 003b7422aeef..225d06819bce 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1973,9 +1973,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  
>  	if (ret)
>  		return ret;
> -
> -	CLEAR_AFTER_FIELD(p, capabilities);
> -
>  	return ops->vidioc_reqbufs(file, fh, p);
>  }
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index d352997f2b62..73a4854f71bd 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -919,7 +919,10 @@ struct v4l2_requestbuffers {
>  	__u32			type;		/* enum v4l2_buf_type */
>  	__u32			memory;		/* enum v4l2_memory */
>  	__u32			capabilities;
> -	__u32			reserved[1];
> +	union {
> +		__u32		flags;
> +		__u32		reserved[1];
> +	};
>  };
>  
>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> 

