Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CACD3DE817
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 10:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbhHCIMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 04:12:37 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:36927 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234248AbhHCIMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 04:12:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ApXCmT3NXXTlcApXDmkLwO; Tue, 03 Aug 2021 10:12:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627978343; bh=nJAT4/TY9kAvr0jgZL4sTyPUkvxuezWK4PADS7XhJmE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s4P2peHCmMtkOB6hlRicbMb/PhZ5RiRVCJADXDKDXkWXsHiokl8y5MshvaVg7S4Et
         AmPFV7DewYB4gsPWPAt9EYIKv92gvslx5MSV9lCIGOAbfIAmL/11ctTvLzRRS/oHa7
         aTsYUvYbiH13jSMHILR0Y6BKXLG7hh7mmZ74eLt0UGag3/KBcW3ew6H8fUgesWuvqh
         7/pdo9B8c9UIMsFjoHooBH8+Uo8OqccnvnETbDKNKINby5xxABvqGHAgc99U9hE7P8
         8+FvbO6qf7EkAVXYp7NuWyQtxCUsl8KkyYrYL8QZHSMNWIWL5qhIHXQSH1C9iPD8h7
         3QauOTpZiPCaw==
Subject: Re: [PATCHv4 5/8] videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-6-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <45dbd3f1-778b-eb6c-94b3-51e8a92429b6@xs4all.nl>
Date:   Tue, 3 Aug 2021 10:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727070517.443167-6-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL9glTvDB4IJVNjXR/BbbplpliCXT7ZRiUm3ex+DKhuzQvOevne25CJdJ0yxy2idMFon6V9BnducT0FYnzUwcn+EELFJb5A+8IsC0eRllSqYpmVLpHuG
 yWWpm2YRkcTy0eBjb0qV+YTJn8iJ/t838Km1ZJ3TNTmztldLdfyEBNLewZoTdhQbgg9R5x1O7IRhEQzhs7SF2KJ13tPEbpcv/O7XO50FthJrM5usAtE6YYGE
 yESOIXrUw+XvJEtlF4+1N0nimaCcPgpneeKyd3r1iX+L/PAmalu3mafiMlFOVtYqgQc7nwi3MOM9DWYg2IMVsYplQY6nQdRV+KPkgrGF7dhp1mocLOZokEat
 iG8OqoTjjvhojmhJz39iBeEJiaBCGFBa1zXdPauSZBiMun0t1cRLd+rdjlLQW8Yf11jiTzV9zNvw4dKQUGc8TvRL4fZXL2P5K02IxU7vUAnm0hYww0IZYO4P
 CTpfRsevLMXEreFB8HQLjdSVWZOFaKYGxbsmTcgrO6owPAgm74DNATDAUVX4vN6gmjg12JWSJ+sDNyip
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2021 09:05, Sergey Senozhatsky wrote:
> By setting or clearing V4L2_MEMORY_FLAG_NON_COHERENT flag

clearing -> clearing the

> user-space should be able to hint vb2 that either a non-coherent

either a -> either

> (if supported) or coherent memory should be used for the buffer
> allocation.

Regards,

	Hans

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../userspace-api/media/v4l/buffer.rst        | 40 ++++++++++++++++++-
>  .../media/v4l/vidioc-reqbufs.rst              |  5 ++-
>  include/uapi/linux/videodev2.h                |  2 +
>  3 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index e991ba73d873..4638ec64db00 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -676,8 +676,6 @@ Buffer Flags
>  
>      \normalsize
>  
> -.. _memory-flags:
> -
>  enum v4l2_memory
>  ================
>  
> @@ -701,6 +699,44 @@ enum v4l2_memory
>        - 4
>        - The buffer is used for :ref:`DMA shared buffer <dmabuf>` I/O.
>  
> +.. _memory-flags:
> +
> +Memory Consistency Flags
> +------------------------
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. tabularcolumns:: |p{7.0cm}|p{2.1cm}|p{8.4cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * .. _`V4L2-MEMORY-FLAG-NON-COHERENT`:
> +
> +      - ``V4L2_MEMORY_FLAG_NON_COHERENT``
> +      - 0x00000001
> +      - A buffer is allocated either in coherent (it will be automatically
> +	coherent between the CPU and the bus) or non-coherent memory. The
> +	latter can provide performance gains, for instance the CPU cache
> +	sync/flush operations can be avoided if the buffer is accessed by the
> +	corresponding device only and the CPU does not read/write to/from that
> +	buffer. However, this requires extra care from the driver -- it must
> +	guarantee memory consistency by issuing a cache flush/sync when
> +	consistency is needed. If this flag is set V4L2 will attempt to
> +	allocate the buffer in non-coherent memory. The flag takes effect
> +	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
> +	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> +	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> +
> +.. raw:: latex
> +
> +    \normalsize
>  
>  Timecodes
>  =========
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index 50ea72043bb0..e59306aba2b0 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -158,8 +158,9 @@ aborting or finishing any DMA in progress, an implicit
>        - This capability is set by the driver to indicate that the queue supports
>          cache and memory management hints. However, it's only valid when the
>          queue is used for :ref:`memory mapping <mmap>` streaming I/O. See
> -        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
> -        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
> +        :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.
>  
>  .. raw:: latex
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9260791b8438..9d11e1d9c934 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -956,6 +956,8 @@ struct v4l2_requestbuffers {
>  	__u32			reserved[1];
>  };
>  
> +#define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
> +
>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
>  #define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
>  #define V4L2_BUF_CAP_SUPPORTS_USERPTR			(1 << 1)
> 

