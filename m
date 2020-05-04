Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549551C3B5E
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 15:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgEDNgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 09:36:49 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35279 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726404AbgEDNgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 09:36:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VbGzjO5j8hEkrVbH3jumWh; Mon, 04 May 2020 15:36:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588599406; bh=gS3mEk/hXH4UjyuO6mtimQUI4NpdzupkxnK75I3D7NI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=H7Q6n9wN/XxKZSj7GKH8sUVx7OnIgilHElfNHLzU1wQjA/zsP2aJ0p347Feo8bpto
         hpxhCINw2ADmXch4db/K0mpsmhEisffQr6w2NiSMc7s4kBbJbN+gjNvXUvmXun8bkL
         7NaCv32jrvCzp/miUgWeGhfU827wyQ11qix2DyKbCopwR4p07f46DExDA2iud9zW8q
         bU79ThN3529ti8juDxbqH8W/G2d8n+Aeapmv4KmG0VWsVsVhEUfjVxWvcoCvEeFV0g
         l8dnd7MoW2grJ9VB/wEe2jKXLeK7nGz1ODSL8drFKQtaB8rnknhcGOBgQ6b0YgqVUj
         orL9PXY+Bym2Q==
Subject: Re: [PATCH v2 32/34] media: videobuf2: Allow exporting of a struct
 dmabuf
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-33-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <75f625a4-947d-6af6-38cd-49b5cb2a58a9@xs4all.nl>
Date:   Mon, 4 May 2020 15:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200504092611.9798-33-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA+TE3EIN9MJADF8uyauRRI8HH2oLVWf8jm9PwUH1fCSuhwwCEjFDOB5dvVd+0Dr2fTLb09EZQR1D2yRpKyPYlg+pgjgFhwBvDRSdo8NzUutw2t6jVfj
 Zyqa7tMd71pWma+5VHOk0wc5x/vh6z0M+YArEyfqqjajY4GrMBzj295FOUvcQwe1UvJV/ohJf6MWWoQN/J1keM0hpzs+As6628QkPPQCVL2eW9GI6c9wpRBv
 x4gkYqFjLIIdVvB0S4vaTjC8Wj4TOBd8/sCqSscV9tX6F+IELZKvYxLc20y2yVHqBZYs3UwCMp5zvJeH8/WRaVLrhEUtYj8K+cBTpZPlJkt5K2hV5iCUzaT8
 94tDFAgKP7l71XkoO81yyGhsnnooIuSvqPjWjDMm686FJH5igX9rONJwu7WH8cHU19sC9YUssEvwODPdRxNKji3GK5hGI5mdk+zF91geY211n03jHOk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/05/2020 11:26, Laurent Pinchart wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> videobuf2 only allowed exporting a dmabuf as a file descriptor,
> but there are instances where having the struct dma_buf is
> useful within the kernel.
> 
> Split the current implementation into two, one step which
> exports a struct dma_buf, and the second which converts that
> into an fd.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 21 ++++++++++++++++---
>  include/media/videobuf2-core.h                | 15 +++++++++++++
>  2 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 44d65f5be845..befdc89983e2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2073,12 +2073,12 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
>  	return -EINVAL;
>  }
>  
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -		unsigned int index, unsigned int plane, unsigned int flags)
> +int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
> +			   unsigned int index, unsigned int plane,
> +			   unsigned int flags, struct dma_buf **dmabuf)

Just returning struct dma_buf and using ERR_PTR() to report errors would
be much more elegant.

Otherwise this patch is fine.

Regards,

	Hans

>  {
>  	struct vb2_buffer *vb = NULL;
>  	struct vb2_plane *vb_plane;
> -	int ret;
>  	struct dma_buf *dbuf;
>  
>  	if (q->memory != VB2_MEMORY_MMAP) {
> @@ -2128,6 +2128,21 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
>  		return -EINVAL;
>  	}
>  
> +	*dmabuf = dbuf;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
> +
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> +		    unsigned int index, unsigned int plane, unsigned int flags)
> +{
> +	struct dma_buf *dbuf;
> +	int ret;
> +
> +	ret = vb2_core_expbuf_dmabuf(q, type, index, plane, flags, &dbuf);
> +	if (ret)
> +		return ret;
> +
>  	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
>  	if (ret < 0) {
>  		dprintk(3, "buffer %d, plane %d failed to export (%d)\n",
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index f11b96514cf7..86920d3264ab 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -875,6 +875,21 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
>   */
>  int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>  
> +/**
> + * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
> + * @q:         videobuf2 queue
> + * @type:      buffer type
> + * @index:     id number of the buffer
> + * @plane:     index of the plane to be exported, 0 for single plane queues
> + * @flags:     flags for newly created file, currently only O_CLOEXEC is
> + *             supported, refer to manual of open syscall for more details
> + * @dmabuf:    Returns the dmabuf pointer
> + *
> + */
> +int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
> +			   unsigned int index, unsigned int plane,
> +			   unsigned int flags, struct dma_buf **dmabuf);
> +
>  /**
>   * vb2_core_expbuf() - Export a buffer as a file descriptor.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> 

