Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3687617171B
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 13:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbgB0MZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 07:25:47 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:42439 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728986AbgB0MZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 07:25:46 -0500
Received: from [IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0]
 ([IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7IEWjDumtjmHT7IEZjiZoo; Thu, 27 Feb 2020 13:25:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582806344; bh=ndiP9Z2eVHjGWO0UT4EN64zPnMFCnTreS5Hb6wkPG7M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=P/miqiEp1E1suE5aS9fC+L65nmeY/kEwAHshUyKUSsRuT5ZwUGw/4v0YSUIS7Jad4
         O2xPPckCsNYt/hMkqUykv4u5qAPAuccPgoN9EyoNLlfEpUgmA1gv+Lqu5UXWatMprE
         F5dOKLW3xSqhjQmh31J88B0B4Q5JGXiokWtWXi0sFguDUr99DiOgrtU9rRGwemOpC9
         oSOMF0dMQeujeJ2Iz6s1hd3aFvajl44w23dbcqkqq3QkUlpZ35ylXaVfUQY4i5QGMD
         5TLB7k6hu60d3s9TyCOyssRSsMz/kg6UGevMyl2agwrDvPb2yMNKJD0jZUmh1OxWbG
         KKDMVjKmKph4g==
Subject: Re: [PATCHv3 03/11] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT
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
References: <20200226111529.180197-1-senozhatsky@chromium.org>
 <20200226111529.180197-4-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <19422259-f9ca-8715-508a-0f650d2fa0e3@xs4all.nl>
Date:   Thu, 27 Feb 2020 13:25:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226111529.180197-4-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA4w6XfT1cWL/oRXBwbfa/cML5aWojMPQKuOtcfuUFzs4QkpHWYtufHeF/94fwoXXKBV3gjjOVynQWPS8jQ+DhW2UVABhtwfWnAkAVN8V4Sc8TsnLZuC
 cTO40VHew0IFfYhOqcaKrXL78aw7dN5PKPs8wM3/3Iswg6hHZShJKPxNmV/XLdGETqa1ChUPC99uOxNxG9DdNfFhWiBtg4gSKWOngfIF1f+vVJbfZOKN7BMw
 E2CEQUUot/TYftOJ0lsvR4hY3pGsjedc2zfOMT8dsE87WaaisuX8qBa0gy+0fLfJ50QYuOmTgsOIxmCYY2+xsvQ4QwQafQXko6B2caLqID8WDI3DzC0UyONE
 Iq8r2rnw2B3+TG7KJUBTaJ4XSyaZlye/lm2bqC9iRTMcsEHjfZZpKhxN6D8P0lw1UmYyhCSNwwdVhK2GkQTFrLieqD+0BP9kDGgZXo9Buk7gNAU9TTMJjj6e
 eQXAi/1Z64ECL2zB+BuxMeld73dI+XEa0V2GXtXkxwjWCLgGOoq14BTGixa6r44LRDDJzAYN+vUsVGYxWlt0YDferhtp/Jd4KCsAJcvPc3BBICbO/ExMfGV0
 FsfwfCkfrQgFWXSx5p0RiLlp80/7p8fnGP+ksb7x8sBiUvPPJmYIdBgb71R4EFEoL2A=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/26/20 12:15 PM, Sergey Senozhatsky wrote:
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
> index 3112300c2fa0..6b629ac59bf2 100644
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
> +      - vb2 buffer is allocated either in consistent (it will be automatically

vb2 -> A

(vb2 is a kAPI term, and shouldn't be used in uAPI documentation)

> +	coherent between CPU and bus) or non-consistent memory. The latter

CPU and bus -> the CPU and the bus

> +	can provide performance gains, for instance CPU cache sync/flush

CPU -> the CPU

> +	operations can be avoided if the buffer is accessed by the corresponding
> +	device only and CPU does not read/write to/from that buffer. However,

CPU -> the CPU

> +	this requires extra care from the driver -- it must guarantee memory
> +	consistency by issuing cache flush/sync when consistency is needed.

cache -> a cache

> +	If this flag is set V4L2 will attempt to allocate vb2 buffer in

vb2 -> the

> +	non-consistent memory. The flag takes effect only if the buffer is
> +	used for :ref:`memory mapping <mmap>` I/O and the queue reports

reports -> reports the

> +	:ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
>  
>  .. c:type:: v4l2_memory
>  
> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> index d0c643db477a..917df6fb6486 100644
> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> @@ -156,6 +156,13 @@ aborting or finishing any DMA in progress, an implicit
>        - Only valid for stateless decoders. If set, then userspace can set the
>          ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
>  	capture buffer until the OUTPUT timestamp changes.
> +    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
> +      - 0x00000040
> +      - Set when the queue/buffer support memory consistency and cache

support -> supports

> +        management hints. See :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT`,
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE` and
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN`.
> +
>  
>  Return Value
>  ============
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 2a604bd7793a..f91cba37e223 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -711,6 +711,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
>  	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> +	if ((q->allow_cache_hints != 0) && (q->io_modes & VB2_MMAP))

Just say:

	if (q->allow_cache_hints && (q->io_modes & VB2_MMAP))

Regards,

	Hans

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

