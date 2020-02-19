Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93B11163FD2
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgBSI4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:56:15 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45617 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726453AbgBSI4P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:56:15 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4L9NjzVjpP9a94L9QjnY5f; Wed, 19 Feb 2020 09:56:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582102573; bh=CWHOY3aAryOkJALF4S2I5H29EpQHa8XaqsIXkHAwkK8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GO1TmATXQp4sHlggtEMTV4yeEyoy5qiRQbOkB6c9J8XoJnQkI2pegigznjzqxvNt8
         SD3Iq6nciN5HAT1FM5tqEIDedxGA5mpFp17Hq7x9umCjH7vORxU+mPER11veybGrox
         dRr3MGN1yITOs+Fxxn/qx/8txCLsddhUlrfSb5N2dE8lYxT0aK5Vz6W7VPqsu71BiO
         Wt6xFG8uPoOdn6+0rBCh82JyTFoGr8tfeqoO9wYIFFs8nZmW7kL4CWgK/hw+HQ6kLm
         OtYUo60NBkSBN2fQhPR8h7g94ABQfHCRqH1kLvraUKVEDzonB3U0SWif+M5GKD+rzF
         EZfFjcmSU2WgQ==
Subject: Re: [RFC][PATCHv2 03/12] videobuf2: add
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
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
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-4-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <17e99adc-d86d-ebd3-ab52-d6c8e3ac14f3@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:56:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-4-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNc2jAr+RVDINafcaYHBfQcBwerM4edgvirE2yPHpS5QiLqdFhfIxeN4lx87YdqU+996ozl29ZJi7ABPmRGRDSzyx8af+Az2X0ZLVCXJBCbASpjQPKKi
 pQW8vgHPnBLRhPjM5FJPtu1R7CYDbSudIoCAPeg9tyeIE/uyHz4tBFfB/H9+xyI715q5n0pw+NKzqYO+U0x4kSFoGegI5fkXjjXSzF3aU0o3L7fuycinLKCz
 3R1Q7USD68dlejdt+M2HTVWQsTf9t+SV+YYnvGRXj/0csDRrlJs5kU2iYJWI6Kt8ClFv4X8cYjTr9JtxDFmyKjWmRKNH2WcQ82uIYiWOprNy5OlkxegqldC6
 VPOpc98TnYcC4SFODHN5i12PM+nhTtUCF0WWTENUDQn2Wsi8+4MZB6iJdhLgdkQ55SkCaiX41iiJVEdHCsGkNaexYxMqawfV7nLlsjrDkGjDwaD6GWiumrX9
 q1yyb1sZ95Yg/ybbJkf6W6td7gb5b5/FAXYiDYhmwcbWPaWZmwRQU6E3chCVlii7xd+kVb9dJ0TwZ57R
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
> By setting or clearing V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> user-space should be able to set or clear queue's NON_CONSISTENT
> ->dma_attrs. Queue's ->dma_attrs are passed to the underlying
> allocator in __vb2_buf_mem_alloc(), so thus user-space is able
> to request vb2 buffer's memory to be either consistent (coherent)
> or non-consistent.
> 
> Change-Id: Ib333081c482e23c9a89386078293e19c3fd59076
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  Documentation/media/uapi/v4l/buffer.rst | 27 +++++++++++++++++++++++++
>  include/uapi/linux/videodev2.h          |  2 ++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> index 9149b57728e5..af007daf0591 100644
> --- a/Documentation/media/uapi/v4l/buffer.rst
> +++ b/Documentation/media/uapi/v4l/buffer.rst
> @@ -705,6 +705,33 @@ Buffer Flags
>  
>  .. c:type:: v4l2_memory
>  
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
> +	coherent between CPU and bus) or non-consistent memory. The latter
> +	can provide performance gains, for instance CPU cache sync/flush
> +	operations can be avoided if the buffer is accesed by the corresponding
> +	device only and CPU does not read/write to/from that buffer. However,
> +	this requires extra care from the driver -- it must guarantee memory
> +	consistency by issuing cache flush/sync when consistency is needed.
> +	If this flag is set V4L2 will attempt to allocate vb2 buffer in
> +	non-consistent memory. This flag is ignored if queue does not report
> +        :ret:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.

This flag only makes sense for the MMAP memory model, right? That should be
documented and checked in the code.

An attempt to use this flag with the wrong memory model should just clear it,
I think (something to test as well in v4l2-compliance).

Regards,

	Hans

> +
>  enum v4l2_memory
>  ================
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5f9357dcb060..72efc1c544cd 100644
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
> 

