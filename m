Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE5C343A27
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 08:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhCVHCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 03:02:37 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51007 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229614AbhCVHCI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 03:02:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id OEZdldH3UGEYcOEZilWFK3; Mon, 22 Mar 2021 08:02:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616396526; bh=xX6EJ7/zMangVi2S1iQkbFpQhMJe8Ebhn1H5+8CxHmk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VfLDM5oLnpr6svGfSLKK/TJCyIB3yr9pVXfWfe4kqsvX2cEYBZr+tGGDU/PTRCBPs
         wmJ+a41wrooxwbCAF8Vys0Ci5fNmJSpOypCXQIwlZWNi4CJx3tgEGtTDnsC61cfSUt
         p2JdRYZ68v0hcZT8t78PJyaDUOl8XeyU3kug6gOOn09j7gA6+Qn5uo3f91U3QgPY0Z
         F8O/vfBVwSFS2JrOsSNOLt2mbNDXT++4NxqK2F8SH6oftnX1nBPlSC1AXTEkUvL9zw
         4/8WEKqc/JNQHKClLJg2FiV6rAKfmQyHWpBLakVmwZniQPz3C79dbRK7+UISghdzwA
         yGMrFylOhytPQ==
Subject: Re: [PATCH 5/8] videobuf2: add V4L2_FLAG_MEMORY_NON_COHERENT flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302004624.31294-1-senozhatsky@chromium.org>
 <20210302004624.31294-6-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <17db1ef3-ff90-1d4e-9b31-52efd296d224@xs4all.nl>
Date:   Mon, 22 Mar 2021 08:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302004624.31294-6-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMFUNiHqJYzV1+oXvtvClq+OtzvnPVCRsNwSNP7fTXaGBgvNzKB9QAI3Up+mtdN+J/Ex0INsoOJFDofPN3sCu58REKyhnEy3VG9bXtbmc5joqXhAUKEm
 8ArVDZBK6SbXtawEPoGo7B6FuUETHNMhtsCqH83ydVYMlNE4BeZ+NSsTiCaYWAh69+LdGSgst7hY/9/7qvuElVckGDhTN7Vx29mwye5CmUybwCjkQdbShjKI
 AYf+mTyauS83xLb/ecyu5qNovVYqzs8iVvxr2k6yJ4yS2zs0Ty268A7tLcP4Xv0W6j2EN01LNgqCuSxvKbbQ04miPe92/lOM3I0fmfZFWzAtIdy6S4m/0nOE
 dQ+qvB6b
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2021 01:46, Sergey Senozhatsky wrote:
> By setting or clearing V4L2_FLAG_MEMORY_NON_COHERENT flag
> user-space should be able to hint vb2 that either a non-coherent
> (if supported) or coherent memory should be used for the buffer
> allocation.
> 
> The patch set also adds a corresponding capability flag:
> fill_buf_caps() reports V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> when queue supports user-space cache management hints.

Hmm, this paragraph is probably outdated (copy and paste?) since this
capability already exists.

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../userspace-api/media/v4l/buffer.rst        | 40 ++++++++++++++++++-
>  .../media/v4l/vidioc-reqbufs.rst              |  5 ++-
>  include/uapi/linux/videodev2.h                |  2 +
>  3 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 1b0fdc160533..a39852d6174f 100644
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
> +    * .. _`V4L2-FLAG-MEMORY-NON-COHERENT`:
> +
> +      - ``V4L2_FLAG_MEMORY_NON_COHERENT``

Rename this to V4L2_MEMORY_FLAG_NON_COHERENT: this is consistent with
V4L2_FMT_FLAG_ and V4L2_BUF_FLAG_.

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
> index c1c88e00b106..950e7ec1aac5 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -154,8 +154,9 @@ aborting or finishing any DMA in progress, an implicit
>        - This capability is set by the driver to indicate that the queue supports
>          cache and memory management hints. However, it's only valid when the
>          queue is used for :ref:`memory mapping <mmap>` streaming I/O. See
> -        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
> -        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
> +        :ref:`V4L2_FLAG_MEMORY_NON_COHERENT <V4L2-FLAG-MEMORY-NON-COHERENT>`.
>  
>  Return Value
>  ============
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..b1d4171fe50b 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -954,6 +954,8 @@ struct v4l2_requestbuffers {
>  	__u32			reserved[1];
>  };
>  
> +#define V4L2_FLAG_MEMORY_NON_COHERENT			(1 << 0)
> +
>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
>  #define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
>  #define V4L2_BUF_CAP_SUPPORTS_USERPTR			(1 << 1)
> 

Regards,

	Hans
