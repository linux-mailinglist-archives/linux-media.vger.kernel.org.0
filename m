Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F9E1BC1A7
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 16:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgD1OsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 10:48:06 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41055 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727079AbgD1OsG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 10:48:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TRWhjKkVAZJ1DTRWkjxq8m; Tue, 28 Apr 2020 16:48:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588085283; bh=6UTtjoXH7m3ecE8TYYDLIbrgLiXJPKPNUM/ViUXuslg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Mk7RK3D8WuVNDLPfQc6DZT16vOI8/EyBb4+nVxzSZT9NUt3WCQc4K6YUByY8DjIyM
         l8Mi6vZVxKXv6tFjTIYZwiCRp4yL/+R0wx49bm4Q9NEFOVrNbwTXFq1Z0PHV9jQ5G+
         bVkvl+X711bUQggzqwbTxayUZuJI5Z++Bb/lO1Mn2b+eiAwfKXD86ZIdakXGl3HM1L
         XlzHZOGWaJMS/gvEjDgfHAXWg67xnSSrY8tcqKJXoFyvrfP1rVCM6GM38E4R59h8tL
         uDy1x+6874opdquUcGCX+9t2qQ+t6H6zsuP39/rpjtMZmWNOz7WaaUOTWgi95OhjEu
         EnP7GSKVs0rZg==
Subject: Re: [PATCHv5 00/13] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aa246282-ca02-a20b-8d8e-0c33f4a2259d@xs4all.nl>
Date:   Tue, 28 Apr 2020 16:47:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfExhS0SpowdLLC8QbyJICf9ObluL9H+94cpujJcf7c2W5j9j9fnGYigY30KUyAVBo+pCosp+/P438c7591PTgPQk/LSmrp0l+8Y/QxVHHpp9hBNclFnM
 ndSPO2jpVTkSOAW3vrNN/HOyyAmqjyPJs2EUUUbYHHE21aoas1XnduYvI9jJwBlQ6v7zjtb3QSZVGDg95WPCbQ4+xPrqSalQfNRPF/LKX3ZtQQvGgqDVwcAc
 2veWmcjVikDw/FdyySRdTOCZErMFsBOeOE6QU9halEaolIFs80NhkT0Aq8a7C+MUGE9Y+bvrlTNndOm91bMGt//a+d45B/Sovevii1Zty17RFvU8vCD1LRPQ
 BHsnYEms
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On 24/04/2020 11:29, Sergey Senozhatsky wrote:
> Hello,
> 
> 	v5 with fixes and improvements.
> 
> I have a simple v4l-compliance patch now (will send it separately) which
> tests cache and consistency hints. I ran compliance against the vivid
> test driver, which was additionally extended with cache_hints module param:
> Trimmed v4l-compliance output:
> 
> - vivid with disabled cache hints support
> 
> [..]
> Buffer ioctls (Input 3):
> 	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
> 	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
> 	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> [..]
> 
> - vivid with enabled cache hints (cache_hints=1,...)
> 
> [..]
> Buffer ioctls (Input 3):
> 	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
> 	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
> 	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> [..]
> 
> 
> v4l-compliance revealed that we cannot reliably report
> V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS, it's a bit special.
> Let's look at fill_buf_caps()
> 
> 	if (q->allow_cache_hints && q->io_modes & VB2_MMAP)
> 		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
> 
> There are several things here. First, if the queue is not setup yet
> (we didn't call driver's ->queue_setup()) then ->allow_cache_hints
> is expected to be 0. It's only in the ->queue_setup() that the driver
> sets ->allow_cache_hints for those queues that can benefit from cache
> management. What this means, is that if one does
> 
> 	q.init(node->g_type(), memory);
> 	q.reqbufs(node);
> 	q.g_capabilities();
> 
> the cache hints cap will not be reported. We need to setup the queue
> 
> 	q.init(node->g_type(), memory);
> 	q.reqbufs(node, 1);
> 	q.g_capabilities();

I missed that. What should happen is that q->allow_cache_hints is set by the
driver before vb2_queue_init is called. And the documentation should be updated
to say that the V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS flag is only valid when using the
MMAP streaming I/O model.

Perhaps the flag should be renamed to V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS to
make this explicit? Other opinions are welcome.

> 
> Second. Even if the queue is setup, we still can report wrong cache
> hint values. Let's look at the following code
> 
> 	fill_buf_caps(q, &p->capabilities);
> 	if (!vb2_queue_allows_cache_hints(q))
> 		p->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;

The problem here is that vb2_queue_allows_cache_hints(q) uses stale information:
the current streaming mode instead of the requested streaming mode.

This should read:

	if (!q->allow_cache_hints || p->memory != V4L2_MEMORY_MMAP)
		p->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;

And V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is always set regardless of the
memory model. It just needs to be documented that this capability applies
to MMAP mode only.

> 	ret = vb2_core_reqbufs(...);
> 	return ret;
> 
> The thing here is that vb2_core_reqbufs() and vb2_core_create_bufs()
> can re-initialize the queue and invoke ->queue_setup(), possibly
> changing its memory model, etc. so cache hints cap which we set or
> clear before vb2_core_reqbufs() and vb2_core_create_bufs() can become
> invalid after we call those functions. It's the same with
> ``req->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT``, we cannot clear
> it before reqbufs()/create_bufs(). Therefore I added two simple
> functions which fixup cache hint cap and non_consistent flag after
> reqbufs()/create_bufs(). So the code looks like this now:
> 
> 	fill_buf_caps(q, &p->capabilities);
> 	ret = vb2_core_reqbufs(...);
> 	fixup_consistency_attr(q, &p->flags);
> 	fixup_cache_hints_cap(q, &p->capabilities);

These fixup functions are ugly, unless I missed something I think the
approach described above works just fine.

With these changes I think it is ready to go in.

Regards,

	Hans

> 	return ret;
> 
> 
> The rest is the pretty much the same.
> 
> Previous series:
> v4 link: https://lore.kernel.org/lkml/20200302041213.27662-1-senozhatsky@chromium.org/
> v3 link: https://lore.kernel.org/lkml/20200226111529.180197-1-senozhatsky@chromium.org
> v2 link: https://lore.kernel.org/lkml/20200204025641.218376-1-senozhatsky@chromium.org/
> v1 link: https://lore.kernel.org/lkml/20191217032034.54897-1-senozhatsky@chromium.org/
> 
> Series Intro
> ========================================================================
> 
> 	This is a reworked version of the vb2 cache hints
> (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE / V4L2_BUF_FLAG_NO_CACHE_CLEAN)
> support patch series which previsouly was developed by Sakari and
> Laurent [0].
> 
> The patch set attempts to preserve the existing behvaiour - cache
> sync is performed in ->prepare() and ->finish() (unless the buffer
> is DMA exported). User space can request “default behavior” override
> with cache management hints, which are handled on a per-buffer basis
> and should be supplied with v4l2_buffer ->flags during buffer
> preparation. There are two possible hints:
> 
> - V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
> 	No cache sync on ->finish()
> 
> - V4L2_BUF_FLAG_NO_CACHE_CLEAN
> 	No cache sync on ->prepare()
> 
> In order to keep things on the safe side, we also require driver
> to explicitly state which of its queues (if any) support user space
> cache management hints (such queues should have ->allow_cache_hints
> bit set).
> 
> The patch set also (to some extent) simplifies allocators' ->prepare()
> and ->finish() callbacks. Namely, we move cache management decision
> making to the upper - core - layer. For example, if, previously, we
> would have something like this
> 
> 	vb2_buffer_done()
> 	  vb2_dc_finish()
> 	    if (buf->db_attach)
> 	      return;
> 
> where each allocators' ->finish() callback would either bail
> out (DMA exported buffer, for instance) or sync, now that "bail
> out or sync" decision is made before we call into the allocator.
> 
> Along with cache management hints, user space is also able to
> adjust queue's memory consistency attributes. Memory consistency
> attribute (dma_attrs) is per-queue, yet it plays its role on the
> allocator level, when we allocate buffers’ private memory (planes).
> For the time being, only one consistency attribute is supported:
> DMA_ATTR_NON_CONSISTENT.
> 
> [0] https://www.mail-archive.com/linux-media@vger.kernel.org/msg112459.html
> 
> Sergey Senozhatsky (13):
>   videobuf2: use explicit unsigned int in vb2_queue
>   videobuf2: add cache management members
>   videobuf2: handle V4L2 buffer cache flags
>   videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
>   videobuf2: add queue memory consistency parameter
>   videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
>   videobuf2: factor out planes prepare/finish functions
>   videobuf2: do not sync caches when we are allowed not to
>   videobuf2: check ->synced flag in prepare() and finish()
>   videobuf2: add begin/end cpu_access callbacks to dma-contig
>   videobuf2: add begin/end cpu_access callbacks to dma-sg
>   videobuf2: don't test db_attach in dma-contig prepare and finish
>   media: vivid: add cache_hints module param
> 
>  Documentation/admin-guide/media/vivid.rst     |   9 ++
>  .../userspace-api/media/v4l/buffer.rst        |  41 +++++-
>  .../media/v4l/vidioc-create-bufs.rst          |   7 +-
>  .../media/v4l/vidioc-reqbufs.rst              |  20 ++-
>  .../media/common/videobuf2/videobuf2-core.c   | 121 +++++++++++++-----
>  .../common/videobuf2/videobuf2-dma-contig.c   |  41 +++++-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  38 ++++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  93 +++++++++++++-
>  drivers/media/dvb-core/dvb_vb2.c              |   2 +-
>  drivers/media/test-drivers/vivid/vivid-core.c |   9 ++
>  drivers/media/test-drivers/vivid/vivid-core.h |   1 +
>  .../media/test-drivers/vivid/vivid-meta-cap.c |   5 +
>  .../media/test-drivers/vivid/vivid-meta-out.c |   5 +
>  .../media/test-drivers/vivid/vivid-sdr-cap.c  |   7 +
>  .../test-drivers/vivid/vivid-touch-cap.c      |   5 +
>  .../media/test-drivers/vivid/vivid-vbi-cap.c  |   5 +
>  .../media/test-drivers/vivid/vivid-vbi-out.c  |   5 +
>  .../media/test-drivers/vivid/vivid-vid-cap.c  |   5 +
>  .../media/test-drivers/vivid/vivid-vid-out.c  |   5 +
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
>  include/media/videobuf2-core.h                |  47 +++++--
>  include/uapi/linux/videodev2.h                |  13 +-
>  23 files changed, 426 insertions(+), 72 deletions(-)
> 

