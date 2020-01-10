Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4CC136A0E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 10:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbgAJJgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 04:36:37 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:36697 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbgAJJgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 04:36:37 -0500
Received: from [IPv6:2001:420:44c1:2577:c8b4:9150:fb1b:52f6]
 ([IPv6:2001:420:44c1:2577:c8b4:9150:fb1b:52f6])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pqiUilZj6pLtbpqiYiPfdz; Fri, 10 Jan 2020 10:36:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578648994; bh=s4atuWRiXh9yWC2skxK0e8ALLvdYO1y0fvYdMvunco4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KKOcZ+b0+aVDOd2RWLPqG9fB54yBlpc1zMk38tPVbdOSj/S8wApt273E0JFknbCKF
         BDaKAq1+mR42wYu/ScUaQEtsMJ5s0HrjOha7qzWna0SY9C2y6ULoDQwW1j6QhQ28zT
         dfthllDdw3LEGUOuqXvLD6b3nf5ORijYKUR0mjVo3uc9IgRyTIpoP78tti44JiL8/e
         bFpUj1DRWMSz9YG5LBFURwG/QrFq0c2QTHy/weDcCk9D0nTlWwddc1F2MDgpRoXRAm
         LFOtxciT+mmRFkGrkYeJSaWl1QA6He8nlUFwmknCPDjoRoAjlcmI+A74IQOYcAJEk1
         Ye2EXfyLBL8zQ==
Subject: Re: [RFC][PATCH 03/15] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT
 flag
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
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-4-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <750a0c62-0f0f-a5c9-1d7f-f0c5d6b620fa@xs4all.nl>
Date:   Fri, 10 Jan 2020 10:36:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217032034.54897-4-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCRR/1EIqmeph7/1UlWyTG1z9YK6OF5GcLxUApOJ8INmx3TFMP3S3Wyj0d/J61AuoRObAaj+WxgTLKnEb8//dmqfCL3l8CTwx+XlzzJDnffTAl0oyW+U
 OcHw2dWWQjc3a8KIVAR/l1uwk3whyZdrIaa0oVUeaWBr5Je5ss9mvfyNKfU9lwUXcyZQLerNN0M0JFw/8EK24e9TkEKyhWvLyn5uY39vrmUcsv677jAwBFOc
 05OT8VMpZ0JKcOFFfag0/1kytiKwfTqTXBYu9DL4HfbfpFn38/GZA53LrTFLMZQG7br6481LmultFNoizyEXDK5yHFMVjAaeR4QNDjfLHew+lr6ptCvEIg5G
 DXizYAvQ8DYMZFbNvxTt9OfxhP38xdkHnYV756+Kod3eHjmOxm9qWNQ1bezGbFpb970H5jDJBS7bZ9kYOdCFQwPI0LPoM9IYGEkCh++uq/2GW3KkmHK00ZFB
 4wgQdf91J61sFe7H7IpVsOKtYz2qP/JF3ePm9nKfoty5kq8Yupm//zr8MOJQlR8bHDPvQ8A3r5nOWcFru/RfkaDBLXPvKart3NOVuZEqFAgmXwQhAWiyfEwg
 ChAyHlRmnrbKv9oRhQzULwVBLMdfx4FoH13OmKMN4TFIdE6Xek5BAL5u3Fs8k+6Njdw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> By setting or clearing V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> user-space should be able to set or clear queue's NON_CONSISTENT
> ->dma_attrs. Queue's ->dma_attrs are passed to the underlying
> allocator in __vb2_buf_mem_alloc(), so user-space will be able
> to request consistent or non-consistent memory allocations.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  Documentation/media/uapi/v4l/buffer.rst | 19 +++++++++++++++++++
>  include/uapi/linux/videodev2.h          |  2 ++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> index 9149b57728e5..b08b5609f5f3 100644
> --- a/Documentation/media/uapi/v4l/buffer.rst
> +++ b/Documentation/media/uapi/v4l/buffer.rst
> @@ -705,6 +705,25 @@ Buffer Flags
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
> +      - Set DMA_ATTR_NON_CONSISTENT queue memory consistency bit,
> +	so all queue buffers may be allocated in non-consistent memory.

This needs much more extensive documentation. This is a userspace API,
and it shouldn't refer to a kernelspace API. Instead, explain what it
means from a user perspective. Also, how does this relate to the cache
buffer flags?

These things are tricky, so it is worth spending some time on writing
good documentation.

Regards,

	Hans

> +
>  enum v4l2_memory
>  ================
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 04481c717fee..d352997f2b62 100644
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

