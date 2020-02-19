Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12101163EC0
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgBSITw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:19:52 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47245 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726539AbgBSITw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:19:52 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4KaAjzEowP9a94KaEjnLlk; Wed, 19 Feb 2020 09:19:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582100390; bh=nfF8wMmiXD8n6wpKKTJOHRpwFi71Fz2zG1LZaP4lDVo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EgNvAQKeI195N08iqj121owBGpQz1h+ESmVg5R+imkIC3o8YQTT+9BTaVj0fGFEYH
         6+JqWGrhfz0M1lvgKJlfE3A5Nf6c7LeybrbeifAlV8iu5jVdakyMljozU3gBv1md5T
         YZ1Fz4vqPVfEOVSy/pcY7SeVr+nny9NR8IylKlx+nROJ+2CzJFnyuJE0//FvZWWw/Z
         r92BUl0Rlm01RUh6zwbJIymcP/9zqtoUg2zCk6rO+w9oH24rkKS2pqfqo+h73a7Qr+
         uzlgCHUgpcI2u99ejNbt8TwyQ5ncxBrN5XDZqjfGnXGLQJ811K8tTo4Tmc37yL+RAk
         FVMB1lNr7dlMQ==
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
Message-ID: <bc32cd42-6452-dba2-e98e-e757b9ffc6d4@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-4-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHRKjqqrhjrAxguj1fFSS2HkyPrdNgyyQE1o7/yoUy9HTR6KV9bzpSgYBDS5JeS+476yAyR/gX0ymWe6aGHWfmx8ei6rKbDRPamxFXw6mk3KitOh04yU
 D1x9D0nOCRtTzNIEQ8cpzNFeZ9ll5qY79sQF3Csdz4khdyHaU17Hv6fCAMyz4A8TR/KFF2DpgZtm3cZszNN9Dpym3WhOIpt6JI7VleLZG/zb0sMMJ5PPXGGf
 vdsT4CJpmWqMBv5kno9l3DX/GH7smcD7i76wlSRSAbtc9+9QmFTLesP/0kpNg8Ss0KDlfNyEtLTr5JTGco073d+WOPZZquRgNsoQvXl2Uw8pC472AwbAbyfV
 KNHoY6F39Vk/61/vbvvTop3qI2ELg3Y8cTcg38e2Br+aci4VAWeDfkomfHVKVT+EgIbTK9wES8HurJ8CKObqLwpfh7Z/DDHh1yb5Tdlya/EldRJT0z8C/VbS
 vPUg84ckHuB+Avk2iEAz0zqLoDssz02DGipo8yoNvM+7z+iZ7U95OZTpf50ybEI2Zc694rS5YnkmXxUi
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

This new part should be added *above* the '.. c:type:: v4l2_memory' line.

You also need to add '.. _memory-flags:' just before this section so that
you can link to it from the create_bufs and reqbufs ioctl descriptions.

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

accesed -> accessed

> +	device only and CPU does not read/write to/from that buffer. However,
> +	this requires extra care from the driver -- it must guarantee memory
> +	consistency by issuing cache flush/sync when consistency is needed.
> +	If this flag is set V4L2 will attempt to allocate vb2 buffer in
> +	non-consistent memory. This flag is ignored if queue does not report
> +        :ret:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.

V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is not defined. Add that first in a separate
patch.

Also update the current description of the V4L2_BUF_FLAG_NO_CACHE_INVALIDATE/CLEAN
flags to indicate that they are only valid if V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS
is set (that should be done in the patch adding the V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS
capability).

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

