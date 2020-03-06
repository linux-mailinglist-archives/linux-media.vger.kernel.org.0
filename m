Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702D017BFB9
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 14:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgCFN6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 08:58:45 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54809 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726498AbgCFN6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 08:58:44 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ADUvj3BSUEE3qADUwjCbcf; Fri, 06 Mar 2020 14:58:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583503122; bh=/l1z0MZMuaT6cFe4nw/quJ6V+Dx8A4O69/YlYuOr5KA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jDKn31pe142vncIoQGlDqqUFdYT/+VqV1lXXStxUXQ/oJ6B7TLQLhrhMiJfMDrEy5
         tAZSDivtFU2mgGaSRDRair+bnp6nECCTE0Z/xijD33cOf/ydXYaadJxurG4iPwDsE0
         VT9JOGTbZ8LVn6QYIv9fz8qCwppa8oJs12e7HHJCvTaMoICraGSkGP9exyB89LuGP4
         cTTwTC+Aog01URYBRI0Kh2kZSPq2qYTkdlXpjZ2r/EHDFmNagkvUOlhGTtmAAYXv7A
         9TioxU7n85c3CMhOdrJLov7zX2/aLMOE8M2QPsq+kAXxjPfF9s1CzzhigRSZFITl/D
         evTeZNaUpMu/g==
Subject: Re: [PATCHv4 03/11] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT
 flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-4-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <40b1cc23-5e28-837b-49d5-e32d9dd3edee@xs4all.nl>
Date:   Fri, 6 Mar 2020 14:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302041213.27662-4-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCaIgYU1vGUKCdlws5uiUl02UwuDCmgRsqPG4T/Hoay9fHAKqexx8loe8fZKYATat3k2dxKk1gkDSHpwwpGGs5xDtURLOTqpRXiBezqAD3twhCBuKjXN
 R41liAVhlFdxXgvGdPIPY7uRFXbKO/dHAu2mBiSOiXQY06ZkzhbEghF+iuklFMFkgPwVcBurGzYI58pDd9Dloz+S5dQDchK0hZ2R0/4+XrhhHSKK6bvamAt5
 0/4I02JnA1FWBnwy2Ne4ywCCBpQazOPh6UjUTLEOVrA5S3UHA+wZBYI4aGrIFsU+wfPdbJVJatgZOZQ9s7T8gHvFFiGSNNTmIl7f9oMcaA0OMd+I3M9yrjBf
 yt86IS5NMT37KPkOjv+OmiV1MzCnZXM3qQ3/qmIbhNB3dfzTFtuDIh8Hod7uYJnkLsDka2ncMcxuStOTPizVR58o79jbIHIBByt+neP2OLtqPoI1WarTKH5A
 1PTlBJ9Reh99aCwsvvA4VimP3+V8KMUH5iMr/2jlEV2X225KCoVLiInwnpLK8qhIgC6KvR64fY42wZHsT+ouqr21OndG+zUdrSGU7WvGjXUMM9dnRvB8n/gB
 oAnNOfcyGWrhYtp3uulS4C50avzPYnaoLiPiO/+UfN4OtQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2020 05:12, Sergey Senozhatsky wrote:
> By setting or clearing V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> user-space should be able to set or clear queue's NON_CONSISTENT
> ->dma_attrs. Queue's ->dma_attrs are passed to the underlying
> allocator in __vb2_buf_mem_alloc(), so thus user-space is able
> to request vb2 buffer's memory to be either consistent (coherent)
> or non-consistent.
> 
> The patch set also adds a corresponding capability flag:
> fill_buf_caps() reports V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS when
> queue supports user-space cache management hints.

When building the docs I got a bunch of reference errors. This patch fixes those:

-----------------------------------------------
diff --git b/Documentation/media/uapi/v4l/buffer.rst a/Documentation/media/uapi/v4l/buffer.rst
index 8084e3f2a58d..82bad4dbec16 100644
--- b/Documentation/media/uapi/v4l/buffer.rst
+++ a/Documentation/media/uapi/v4l/buffer.rst
@@ -695,7 +695,7 @@ Memory Consistency Flags
     :stub-columns: 0
     :widths:       3 1 4

-    * .. _`V4L2_FLAG_MEMORY_NON_CONSISTENT`:
+    * .. _`V4L2-FLAG-MEMORY-NON-CONSISTENT`:

       - ``V4L2_FLAG_MEMORY_NON_CONSISTENT``
       - 0x00000001
@@ -709,7 +709,9 @@ Memory Consistency Flags
 	consistency is needed. If this flag is set V4L2 will attempt to
 	allocate the buffer in non-consistent memory. The flag takes effect
 	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
-	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
+	queue reports the
+	:ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS <V4L2-BUF-CAP-SUPPORTS-CACHE-HINTS>`
+	capability.

 .. c:type:: v4l2_memory

diff --git b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index faf0df4f9bb6..1c0299424fbc 100644
--- b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -133,6 +133,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-REQUESTS:
 .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
 .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
+.. _V4L2-BUF-CAP-SUPPORTS-CACHE-HINTS:

 .. cssclass:: longtable

@@ -166,9 +167,10 @@ aborting or finishing any DMA in progress, an implicit
     * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
       - 0x00000040
       - Set when the queue/buffer supports memory consistency and cache
-        management hints. See :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT`,
-        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE` and
-        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN`.
+        management hints. See
+	:ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT <V4L2-FLAG-MEMORY-NON-CONSISTENT>`,
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.


 Return Value
-----------------------------------------------

Please fold that in this patch.

Regards,

	Hans

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  Documentation/media/uapi/v4l/buffer.rst       | 29 +++++++++++++++++++
>  .../media/uapi/v4l/vidioc-reqbufs.rst         |  7 +++++
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  2 ++
>  include/uapi/linux/videodev2.h                |  3 ++
>  4 files changed, 41 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> index 3112300c2fa0..8084e3f2a58d 100644
> --- a/Documentation/media/uapi/v4l/buffer.rst
> +++ b/Documentation/media/uapi/v4l/buffer.rst
> @@ -681,6 +681,35 @@ Buffer Flags
>  
>      \normalsize
>  
> +.. _memory-flags:
> +
> +Memory Consistency Flags
> +========================
> +
> +.. tabularcolumns:: |p{7.0cm}|p{2.2cm}|p{8.3cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * .. _`V4L2_FLAG_MEMORY_NON_CONSISTENT`:
> +
> +      - ``V4L2_FLAG_MEMORY_NON_CONSISTENT``
> +      - 0x00000001
> +      - A buffer is allocated either in consistent (it will be automatically
> +	coherent between the CPU and the bus) or non-consistent memory. The
> +	latter can provide performance gains, for instance the CPU cache
> +	sync/flush operations can be avoided if the buffer is accessed by the
> +	corresponding device only and the CPU does not read/write to/from that
> +	buffer. However, this requires extra care from the driver -- it must
> +	guarantee memory consistency by issuing a cache flush/sync when
> +	consistency is needed. If this flag is set V4L2 will attempt to
> +	allocate the buffer in non-consistent memory. The flag takes effect
> +	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
> +	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
>  
>  .. c:type:: v4l2_memory
>  
> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> index d0c643db477a..21ecacc72487 100644
> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> @@ -156,6 +156,13 @@ aborting or finishing any DMA in progress, an implicit
>        - Only valid for stateless decoders. If set, then userspace can set the
>          ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
>  	capture buffer until the OUTPUT timestamp changes.
> +    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
> +      - 0x00000040
> +      - Set when the queue/buffer supports memory consistency and cache
> +        management hints. See :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT`,
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE` and
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN`.
> +
>  
>  Return Value
>  ============
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 2a604bd7793a..c847bcea6e95 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -711,6 +711,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
>  	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> +	if (q->allow_cache_hints && (q->io_modes & VB2_MMAP))
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5f9357dcb060..e92c29864730 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -189,6 +189,8 @@ enum v4l2_memory {
>  	V4L2_MEMORY_DMABUF           = 4,
>  };
>  
> +#define V4L2_FLAG_MEMORY_NON_CONSISTENT		(1 << 0)
> +
>  /* see also http://vektor.theorem.ca/graphics/ycbcr/ */
>  enum v4l2_colorspace {
>  	/*
> @@ -946,6 +948,7 @@ struct v4l2_requestbuffers {
>  #define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
>  #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
>  #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
> +#define V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS		(1 << 6)
>  
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers
> 

