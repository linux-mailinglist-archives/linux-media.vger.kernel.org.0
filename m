Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB051EE3A2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 13:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgFDLnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 07:43:53 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35007 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726151AbgFDLnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 07:43:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id goHij2KiVnv5ngoHljtugi; Thu, 04 Jun 2020 13:43:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591271030; bh=77ykhnZPMncuJJMa/iH2HGPwKJDwbY9K+nadBZKR8mM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ibmgGP5ntd3tRZeR3zmD5d7m6fNsSvHplauZGIFoGZ8OOaLWVmsEQCJaaVf07RQ40
         7qAoT8PNAEemNEutyQ5yy3H05bLY8/iQUVnGp98ueDotfNoxp871JOdCe2ryIYGoTu
         sK/0lSrhuwBBJU5s34r/s1YCRQ8klm3gudIe3EVS0SlTDAH3wM3eS32KGHttXa4c3h
         vc0vwCcF7Ltyc5UiF9vXHQbmzeFJz4sNOw91q1rGLasF/qoEeddt3Tx1bDYtDJkQP7
         SGRCdYrPJA6gHBBQFUj8kRsa0LULwYHPniWDZ5AsjHegidkWKQQhUFeqwmQFLHSj+3
         vJ5tJcBKRMU2Q==
Subject: Re: [PATCH v2] v4l2-utils: test cache_hints for MMAP queues
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     linux-media@vger.kernel.org
References: <20200604044752.107856-1-sergey.senozhatsky@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <401fe6a5-542e-cc3c-8455-aa7c424122b8@xs4all.nl>
Date:   Thu, 4 Jun 2020 13:43:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200604044752.107856-1-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKuRG/1kgFZC/TaUtizSfnivUcxxV71Sksu95r48eFooinmhW+gszapExyoFWQmbcOEwoQn9UM/jfMtK+HcoIU3GiqI47nR+t3F9apJj7BmhRJ18jyrZ
 17WKJxc/DTwVltoMs5jlfb0cm8k6PvunnDV35CLZ7s75yxt14Sx+HcOO/FZPAbR99rwniKeSWMsV8gS7Rs2htE8zLeAlStgwxSHJcViX+B0rUEIqV/hhL79/
 isqGJ0c88LvRkSGmSRnhBg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/06/2020 06:47, Sergey Senozhatsky wrote:
> The patch adds V4L2_FLAG_MEMORY_NON_CONSISTENT consistency
> attr test to VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS ioctl-s,
> and V4L2_BUF_FLAG_NO_CACHE_INVALIDATE/V4L2_BUF_FLAG_NO_CACHE_CLEAN
> buffer cache management hints test for MMAP queues.
> 
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

With this patch the compliance test passes.

But I have some comments about this code:

> ---
> 
> - Fixed dmabuf cache sync/flags assertion (Hans)
> 
>  utils/common/cv4l-helpers.h                 |   8 +-
>  utils/common/v4l-helpers.h                  |  10 +-
>  utils/common/v4l2-info.cpp                  |   1 +
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 127 +++++++++++++++++++-
>  4 files changed, 133 insertions(+), 13 deletions(-)
> 
> diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
> index 9505e334..9de0cdf0 100644
> --- a/utils/common/cv4l-helpers.h
> +++ b/utils/common/cv4l-helpers.h
> @@ -753,17 +753,17 @@ public:
>  	int g_fd(unsigned index, unsigned plane) const { return v4l_queue_g_fd(this, index, plane); }
>  	void s_fd(unsigned index, unsigned plane, int fd) { v4l_queue_s_fd(this, index, plane, fd); }
>  
> -	int reqbufs(cv4l_fd *fd, unsigned count = 0)
> +	int reqbufs(cv4l_fd *fd, unsigned count = 0, unsigned int flags = 0)
>  	{
> -		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count);
> +		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
>  	}
>  	bool has_create_bufs(cv4l_fd *fd) const
>  	{
>  		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
>  	}
> -	int create_bufs(cv4l_fd *fd, unsigned count, const v4l2_format *fmt = NULL)
> +	int create_bufs(cv4l_fd *fd, unsigned count, const v4l2_format *fmt = NULL, unsigned int flags = 0)
>  	{
> -		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt);
> +		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt, flags);
>  	}
>  	int mmap_bufs(cv4l_fd *fd, unsigned from = 0)
>  	{
> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> index b794ff88..53f7bec9 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -1513,7 +1513,7 @@ static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, uns
>  }
>  
>  static inline int v4l_queue_reqbufs(struct v4l_fd *f,
> -		struct v4l_queue *q, unsigned count)
> +		struct v4l_queue *q, unsigned count, unsigned int flags = 0)
>  {
>  	struct v4l2_requestbuffers reqbufs;
>  	int ret;
> @@ -1521,7 +1521,7 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
>  	reqbufs.type = q->type;
>  	reqbufs.memory = q->memory;
>  	reqbufs.count = count;
> -	memset(reqbufs.reserved, 0, sizeof(reqbufs.reserved));
> +	reqbufs.flags = flags;
>  	/*
>  	 * Problem: if REQBUFS returns an error, did it free any old
>  	 * buffers or not?
> @@ -1545,7 +1545,8 @@ static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_
>  }
>  
>  static inline int v4l_queue_create_bufs(struct v4l_fd *f,
> -		struct v4l_queue *q, unsigned count, const struct v4l2_format *fmt)
> +		struct v4l_queue *q, unsigned count,
> +		const struct v4l2_format *fmt, unsigned int flags = 0)
>  {
>  	struct v4l2_create_buffers createbufs;
>  	int ret;
> @@ -1553,6 +1554,7 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
>  	createbufs.format.type = q->type;
>  	createbufs.memory = q->memory;
>  	createbufs.count = count;
> +	createbufs.flags = flags;
>  	if (fmt) {
>  		createbufs.format = *fmt;
>  	} else {
> @@ -1731,7 +1733,7 @@ static inline void v4l_queue_free(struct v4l_fd *f, struct v4l_queue *q)
>  	v4l_ioctl(f, VIDIOC_STREAMOFF, &q->type);
>  	v4l_queue_release_bufs(f, q, 0);
>  	v4l_queue_close_exported_fds(q);
> -	v4l_queue_reqbufs(f, q, 0);
> +	v4l_queue_reqbufs(f, q, 0, 0);
>  }
>  
>  static inline void v4l_queue_buffer_update(const struct v4l_queue *q,
> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
> index 0aac8504..a69569a6 100644
> --- a/utils/common/v4l2-info.cpp
> +++ b/utils/common/v4l2-info.cpp
> @@ -206,6 +206,7 @@ static const flag_def bufcap_def[] = {
>  	{ V4L2_BUF_CAP_SUPPORTS_REQUESTS, "requests" },
>  	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
>  	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
> +	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
>  	{ 0, NULL }
>  };
>  
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index fc49fff6..b6419d27 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -381,8 +381,6 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
>  	if (g_flags() & V4L2_BUF_FLAG_BFRAME)
>  		frame_types++;
>  	fail_on_test(frame_types > 1);
> -	fail_on_test(g_flags() & (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE |
> -				  V4L2_BUF_FLAG_NO_CACHE_CLEAN));
>  	if (g_flags() & V4L2_BUF_FLAG_QUEUED)
>  		buf_states++;
>  	if (g_flags() & V4L2_BUF_FLAG_DONE)
> @@ -534,6 +532,88 @@ static int testCanSetSameTimings(struct node *node)
>  	return 0;
>  }
>  
> +static int setupMmap(struct node *node, cv4l_queue &q);
> +
> +static int testCacheHints(struct node *node, int m)
> +{
> +	struct v4l2_create_buffers crbufs = { };
> +	struct v4l2_requestbuffers reqbufs = { };
> +	bool cache_hints_cap = false;
> +	bool consistent;
> +	cv4l_queue q;
> +	cv4l_fmt fmt;
> +	int ret;
> +
> +	q.init(node->g_type(), m);
> +	ret = q.reqbufs(node);
> +	if (ret)
> +		return ret;
> +
> +	cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
> +
> +	reqbufs.count = 2;
> +	reqbufs.type = q.g_type();
> +	reqbufs.memory = q.g_memory();
> +	reqbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
> +	fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
> +	consistent = reqbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
> +	if (!cache_hints_cap) {
> +		fail_on_test(consistent);
> +	} else {
> +		if (m == V4L2_MEMORY_MMAP)
> +			fail_on_test(!consistent);
> +		else
> +			fail_on_test(consistent);
> +	}
> +
> +	q.reqbufs(node);
> +
> +	node->g_fmt(crbufs.format, q.g_type());
> +	crbufs.count = 2;
> +	crbufs.memory = q.g_memory();
> +	crbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
> +	fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
> +	consistent = crbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
> +	if (!cache_hints_cap) {
> +		fail_on_test(consistent);
> +	} else {
> +		if (m == V4L2_MEMORY_MMAP)
> +			fail_on_test(!consistent);
> +		else
> +			fail_on_test(consistent);
> +	}
> +
> +	if (cache_hints_cap) {
> +		crbufs.count = 2;
> +		crbufs.memory = q.g_memory();
> +		/*
> +		 * Different memory consistency model. Should fail for MMAP
> +		 * queues which support cache hints.
> +		 */
> +		crbufs.flags = 0;
> +		if (m == V4L2_MEMORY_MMAP)
> +			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
> +		else
> +			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
> +	}

The code above can be integrated into testReqBufs() in the
'for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++)' loop.

Currently it sets reqbufs.flags/crbufs.flags to 0, but you can just set it to
V4L2_FLAG_MEMORY_NON_CONSISTENT instead and add the relevant tests.

> +	q.reqbufs(node);
> +
> +	/* For the time being only MMAP is tested */
> +	if (m != V4L2_MEMORY_MMAP)
> +		return 0;
> +
> +	node->g_fmt(fmt, q.g_type());
> +	q.create_bufs(node, 2, &fmt, 0);
> +	fail_on_test(setupMmap(node, q));
> +
> +	q.reqbufs(node);
> +	q.create_bufs(node, 2, &fmt, V4L2_FLAG_MEMORY_NON_CONSISTENT);
> +	fail_on_test(setupMmap(node, q));

This test should be part of testMmap instead.

> +
> +	q.reqbufs(node, 1);
> +	return ret;
> +}
> +
>  int testReqBufs(struct node *node)
>  {
>  	struct v4l2_create_buffers crbufs = { };
> @@ -676,8 +756,8 @@ int testReqBufs(struct node *node)
>  			reqbufs.count = 0;
>  			reqbufs.type = i;
>  			reqbufs.memory = m;
> +			reqbufs.flags = 0;
>  			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
> -			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
>  			q.reqbufs(node);
>  
>  			ret = q.create_bufs(node, 1);
> @@ -698,6 +778,7 @@ int testReqBufs(struct node *node)
>  			node->g_fmt(crbufs.format, i);
>  			crbufs.count = 0;
>  			crbufs.memory = m;
> +			crbufs.flags = 0;
>  			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
>  			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
>  			fail_on_test(crbufs.index != q.g_buffers());
> @@ -721,6 +802,8 @@ int testReqBufs(struct node *node)
>  					fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
>  				fail_on_test(q.create_bufs(node, 1, &fmt));
>  			}
> +
> +			printf("\ttest V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS: %s\n", ok(testCacheHints(node, m)));

With those changes this line will disappear.

Regards,

	Hans

>  		}
>  		fail_on_test(q.reqbufs(node));
>  	}
> @@ -1176,14 +1259,22 @@ static int bufferOutputErrorTest(struct node *node, const buffer &orig_buf)
>  
>  static int setupMmap(struct node *node, cv4l_queue &q)
>  {
> +	bool cache_hints = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
> +
>  	fail_on_test(q.mmap_bufs(node));
>  	for (unsigned i = 0; i < q.g_buffers(); i++) {
>  		buffer buf(q);
> +		unsigned int flags;
>  		int ret;
>  
>  		fail_on_test(buf.querybuf(node, i));
>  		fail_on_test(buf.check(q, Unqueued, i));
>  
> +		flags = buf.g_flags();
> +		flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> +		flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> +		buf.s_flags(flags);
> +
>  		for (unsigned p = 0; p < buf.g_num_planes(); p++) {
>  			// Try a random offset
>  			fail_on_test(node->mmap(buf.g_length(p),
> @@ -1220,6 +1311,14 @@ static int setupMmap(struct node *node, cv4l_queue &q)
>  			buf.s_index(buf.g_index() - VIDEO_MAX_FRAME);
>  			fail_on_test(buf.g_index() != i);
>  		}
> +		flags = buf.g_flags();
> +		if (cache_hints) {
> +			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
> +			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
> +		} else {
> +			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
> +			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
> +		}
>  		fail_on_test(buf.querybuf(node, i));
>  		fail_on_test(buf.check(q, Queued, i));
>  		fail_on_test(!buf.dqbuf(node));
> @@ -1475,11 +1574,17 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
>  {
>  	for (unsigned i = 0; i < q.g_buffers(); i++) {
>  		buffer buf(q);
> +		unsigned int flags;
>  		int ret;
>  
>  		fail_on_test(buf.querybuf(node, i));
>  		fail_on_test(buf.check(q, Unqueued, i));
>  
> +		flags = buf.g_flags();
> +		flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> +		flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> +		buf.s_flags(flags);
> +
>  		for (unsigned p = 0; p < buf.g_num_planes(); p++) {
>  			// This should not work!
>  			fail_on_test(node->mmap(buf.g_length(p), 0) != MAP_FAILED);
> @@ -1537,7 +1642,10 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
>  			if (v4l_type_is_output(q.g_type()))
>  				fail_on_test(!buf.g_bytesused(p));
>  		}
> -		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
> +		flags = buf.g_flags();
> +		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
> +		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
> +		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
>  		fail_on_test(buf.querybuf(node, i));
>  		fail_on_test(buf.check(q, Queued, i));
>  	}
> @@ -1732,12 +1840,17 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
>  	fail_on_test(q.mmap_bufs(node));
>  	for (unsigned i = 0; i < q.g_buffers(); i++) {
>  		buffer buf(q);
> +		unsigned int flags;
>  		int ret;
>  
>  		buf.init(q, i);
>  		fail_on_test(buf.querybuf(node, i));
>  		for (unsigned p = 0; p < buf.g_num_planes(); p++)
>  			buf.s_fd(q.g_fd(i, p), p);
> +		flags = buf.g_flags();
> +		flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> +		flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> +		buf.s_flags(flags);
>  		ret = buf.prepare_buf(node, q);
>  		if (ret != ENOTTY) {
>  			fail_on_test(ret);
> @@ -1757,7 +1870,11 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
>  			if (v4l_type_is_output(q.g_type()))
>  				fail_on_test(!buf.g_bytesused(p));
>  		}
> -		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
> +		flags = buf.g_flags();
> +		/* We always skip cache sync/flush for DMABUF memory type */
> +		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
> +		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
> +		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
>  		fail_on_test(buf.querybuf(node, i));
>  		fail_on_test(buf.check(q, Queued, i));
>  	}
> 

