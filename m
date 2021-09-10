Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E74D406B4F
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 14:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhIJMV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 08:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233116AbhIJMV2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 08:21:28 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CF9C061574;
        Fri, 10 Sep 2021 05:20:16 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OfVrmyp1feJ0cOfVsmgYfC; Fri, 10 Sep 2021 14:20:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631276412; bh=BmaC5XLDfehFRF8CsffpEY3ha6T2YsjjdDpvMu18ao4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r1/KA2KpKdvo1PbOPPf6vz3AiftZUPABUefgmib9yak0C2TKXZy5lTmO0L4w3vc0H
         vXr61U/upU6gcTIGVR5Gcpwt+PvnwCgQe9mfsGgOqtovNlK9sBJR3SM5ZYrFgdJbj7
         QyFHGuepSmJAtiZjpo2n3skUHOhbdmOzaIHXZQ9f2eooOLmMfrsIssji/y9dwYMJXB
         OfNwLbHpX0gntDXoPxozx72MZmHVhtpSN6rPFh4N8K7esoBnYo3Qv/AzQeq6Nllql1
         EiIjw+ranpoMDVFQzPYZBFBy9vu9MzhwIw7a6NShee+BQ2oYIs9PvwPFZNrMm0hofe
         UDLGH9kRvoclw==
Subject: Re: [PATCH] v4l-compliance: re-introduce NON_COHERENT and cache hints
 tests
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210709092227.1051346-1-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <619afe51-4cba-95e0-69bc-bb96e1f88aae@xs4all.nl>
Date:   Fri, 10 Sep 2021 14:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210709092227.1051346-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMnZILbwYj5EhG/u2Yp+rU0gXCBRfCRXSvz39eXm1v1WQsW43T1WskKQP1pwhg8gqZvUqLH/B1Kuse8Jh5jcn0XPqq5N2xtsrWLeC2hmt0+723++oGx9
 0mY2x/ILGrWrD93BMCFBMovaoAxr7AsmXlIR2dL5/AxX5rilOucRCvd6i79ZR4EuhzZc8rHG9IKlQi0G/4shcYs1VLfs/8X/WbtdFAPf7naplcHQPt1zQSdL
 LAS6Ctaq5gMgGiiEHMlI/PwD4BHITwq9wfd9qslbtuep/QC5QcCkN4SoU4LYdJtB1oK/C8UQYV2CT+pkFAj8UQashP8KNRrD+yGscSyOysFMFieT43dYf3p0
 PajVZoLfydxg/ZDa739ct91FQtN3NhzEbQPUVXt0He4i37DfQyz37X7pII2Sx80TCh4iuJ4qiLEecYvJEbWcVhuHT8uDfQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

I've applied the "[PATCHv6 0/8] videobuf2: support new noncontiguous DMA API" series
to my kernel, and applied this patch to v4l-utils.

Running 'test-media vim2m' in contrib/test results in the following compliance failures:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture: Captured 8 buffers
        test MMAP (no poll): OK
        Video Capture: Captured 8 buffers
        test MMAP (select): OK
        Video Capture: Captured 8 buffers
        test MMAP (epoll): OK
        Video Capture: Captured 8 buffers
        test USERPTR (no poll): OK
        Video Capture: Captured 8 buffers
        test USERPTR (select): OK
                fail: v4l2-test-buffers.cpp(1869): !(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
                fail: v4l2-test-buffers.cpp(1932): setupDmaBuf(expbuf_node, node, q, exp_q)
        test DMABUF (no poll): FAIL
                fail: v4l2-test-buffers.cpp(1869): !(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
                fail: v4l2-test-buffers.cpp(1932): setupDmaBuf(expbuf_node, node, q, exp_q)
        test DMABUF (select): FAIL

The same happens with e.g. vivid, but vim2m is quicker to test.

I'm not sure whether this is a bug in this v4l2-compliance patch or whether it is
a bug in the v6 series, but it should be checked.

Regards,

	Hans

On 09/07/2021 11:22, Sergey Senozhatsky wrote:
> This returns back non-coherent (previously known as NON_COHERENT)
> memory flag and buffer cache management hints testing (for VB2_MEMORY_MMAP
> buffers).
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  utils/common/cv4l-helpers.h                 |  8 +--
>  utils/common/v4l-helpers.h                  |  8 ++-
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 65 ++++++++++++++++++---
>  3 files changed, 66 insertions(+), 15 deletions(-)
> 
> diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
> index 712efde6..3cee372b 100644
> --- a/utils/common/cv4l-helpers.h
> +++ b/utils/common/cv4l-helpers.h
> @@ -754,17 +754,17 @@ public:
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
> index f96b3c38..c09cd987 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -1515,7 +1515,7 @@ static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, uns
>  }
>  
>  static inline int v4l_queue_reqbufs(struct v4l_fd *f,
> -		struct v4l_queue *q, unsigned count)
> +		struct v4l_queue *q, unsigned count, unsigned int flags = 0)
>  {
>  	struct v4l2_requestbuffers reqbufs;
>  	int ret;
> @@ -1523,6 +1523,7 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
>  	reqbufs.type = q->type;
>  	reqbufs.memory = q->memory;
>  	reqbufs.count = count;
> +	reqbufs.flags = flags;
>  	/*
>  	 * Problem: if REQBUFS returns an error, did it free any old
>  	 * buffers or not?
> @@ -1547,7 +1548,7 @@ static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_
>  
>  static inline int v4l_queue_create_bufs(struct v4l_fd *f,
>  		struct v4l_queue *q, unsigned count,
> -		const struct v4l2_format *fmt)
> +		const struct v4l2_format *fmt, unsigned int flags = 0)
>  {
>  	struct v4l2_create_buffers createbufs;
>  	int ret;
> @@ -1555,6 +1556,7 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
>  	createbufs.format.type = q->type;
>  	createbufs.memory = q->memory;
>  	createbufs.count = count;
> +	createbufs.flags = flags;
>  	if (fmt) {
>  		createbufs.format = *fmt;
>  	} else {
> @@ -1733,7 +1735,7 @@ static inline void v4l_queue_free(struct v4l_fd *f, struct v4l_queue *q)
>  	v4l_ioctl(f, VIDIOC_STREAMOFF, &q->type);
>  	v4l_queue_release_bufs(f, q, 0);
>  	v4l_queue_close_exported_fds(q);
> -	v4l_queue_reqbufs(f, q, 0);
> +	v4l_queue_reqbufs(f, q, 0, 0);
>  }
>  
>  static inline void v4l_queue_buffer_update(const struct v4l_queue *q,
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index e40461bd..6997f40b 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -663,6 +663,10 @@ int testReqBufs(struct node *node)
>  		fail_on_test(q.reqbufs(node, 0));
>  
>  		for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++) {
> +			bool cache_hints_cap = false;
> +			bool coherent;
> +
> +			cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
>  			if (!(node->valid_memorytype & (1 << m)))
>  				continue;
>  			cv4l_queue q2(i, m);
> @@ -678,8 +682,17 @@ int testReqBufs(struct node *node)
>  			reqbufs.count = 1;
>  			reqbufs.type = i;
>  			reqbufs.memory = m;
> +			reqbufs.flags = V4L2_MEMORY_FLAG_NON_COHERENT;
>  			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
> -			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
> +			coherent = reqbufs.flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> +			if (!cache_hints_cap) {
> +				fail_on_test(coherent);
> +			} else {
> +				if (m == V4L2_MEMORY_MMAP)
> +					fail_on_test(!coherent);
> +				else
> +					fail_on_test(coherent);
> +			}
>  			q.reqbufs(node);
>  
>  			ret = q.create_bufs(node, 0);
> @@ -692,9 +705,32 @@ int testReqBufs(struct node *node)
>  			node->g_fmt(crbufs.format, i);
>  			crbufs.count = 1;
>  			crbufs.memory = m;
> +			crbufs.flags = V4L2_MEMORY_FLAG_NON_COHERENT;
>  			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
>  			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
>  			fail_on_test(crbufs.index != q.g_buffers());
> +
> +			coherent = crbufs.flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> +			if (!cache_hints_cap) {
> +				fail_on_test(coherent);
> +			} else {
> +				if (m == V4L2_MEMORY_MMAP)
> +					fail_on_test(!coherent);
> +				else
> +					fail_on_test(coherent);
> +			}
> +
> +			if (cache_hints_cap) {
> +				/*
> +				 * Different memory consistency model. Should fail for MMAP
> +				 * queues which support cache hints.
> +				 */
> +				crbufs.flags = 0;
> +				if (m == V4L2_MEMORY_MMAP)
> +					fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
> +				else
> +					fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
> +			}
>  			q.reqbufs(node);
>  
>  			fail_on_test(q.create_bufs(node, 1));
> @@ -1207,10 +1243,16 @@ static int setupMmap(struct node *node, cv4l_queue &q)
>  		fail_on_test(buf.querybuf(node, i));
>  		fail_on_test(buf.check(q, Unqueued, i));
>  
> -		flags = buf.g_flags();
> -		flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> -		flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> -		buf.s_flags(flags);
> +		/*
> +		 * Do not set cache hints for all the buffers, but only on
> +		 * some of them, so that we can test more cases.
> +		 */
> +		if (i == 0) {
> +			flags = buf.g_flags();
> +			flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> +			flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> +			buf.s_flags(flags);
> +		}
>  
>  		for (unsigned p = 0; p < buf.g_num_planes(); p++) {
>  			// Try a random offset
> @@ -1250,8 +1292,15 @@ static int setupMmap(struct node *node, cv4l_queue &q)
>  		}
>  		flags = buf.g_flags();
>  		if (cache_hints) {
> -			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
> -			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
> +			if (i == 0) {
> +				/* We do expect cache hints on this buffer */
> +				fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
> +				fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
> +			} else {
> +				/* We expect no cache hints on this buffer */
> +				fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
> +				fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
> +			}
>  		} else if (node->might_support_cache_hints) {
>  			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
>  			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
> @@ -1341,7 +1390,7 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
>  			have_createbufs = false;
>  		if (have_createbufs) {
>  			q.reqbufs(node);
> -			q.create_bufs(node, 2, &cur_fmt);
> +			q.create_bufs(node, 2, &cur_fmt, V4L2_MEMORY_FLAG_NON_COHERENT);
>  			fail_on_test(setupMmap(node, q));
>  			q.munmap_bufs(node);
>  			q.reqbufs(node, 2);
> 

