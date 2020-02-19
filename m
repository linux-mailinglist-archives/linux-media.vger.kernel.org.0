Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB43D163F44
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgBSIdo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:33:44 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60771 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbgBSIdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:33:44 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4KnajzLNyP9a94KndjnQZ8; Wed, 19 Feb 2020 09:33:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582101222; bh=U4aCjIQZIUNVY1swRODrnzqk0CR4OpJjzREh1VmipCg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BdQLS4bGfYyGaWBHwId8rEQWPOPy1irz/tI3r4ZVGHCzxDhVdC4TzQI9WZPfJd0iA
         Qh7/mRS444K94GNpK8v3lHNgOWSQwoYi8dI56/aWLyzwc5/AbiQ1tGf4qGjDlKHUUG
         da9eegx5dOqBS/FiU0VhR+13EFLxXZzpGPAlhLQmJ6/Kpp+9UBFUFU+JqDevLIVpic
         DoV0fRDGe4LW6rJC50M+A0Pnf4i2kwKqXHOnEC1IoDx9FDPdxGhKH4NAu9H54ndl8Z
         mk3EqwGGBdsQP96c8olsg311dkyaJUefmpmt1d/GRZPVwtreE2I3nf+0E626JJX2s8
         zHlyQlAQsNAYg==
Subject: Re: [RFC][PATCHv2 09/12] videobuf2: let user-space know if driver
 supports cache hints
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
 <20200204025641.218376-10-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2a00bf5c-462e-8d35-844c-55ce2383b8e2@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:33:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-10-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKAipsOTGflQIVzAKHv/f8PHD8rgdCZg3/cZg+G8zuAR56O83+FOHU3nacfXDUOCJNaRWo69OPauisxgllNKypIewXOCJTMOFZqDXY4OtiD7Hrrkaf40
 glFNRTCn7plDtPzidS0uNOCb8jfgMey2VdS3QfU4ONlCfI/robe7HDVkNNn6glpEJJBNJxoPdugY/sWCQ2TLUZxRgL6GADVoJlynGu7vtz1sAUgIpXLe5F1z
 Ooaw77mPpTRUpzeu39yKtuA3lnY6EPwF6vaiYFqzq9nVF/41dorGu+s20vFVYGsQEdVNiLoQ6A15b1TEYLVY/Ikjsi2+QER37dQzYmGWV4oboWWrixrb7mgU
 bBKUCNlonhbJoAV0BR3AR3zpWMa9dQAZau9HdaKxm4dxuDZuLC1g2YkBjSiwDE/LCvHNzZ/cDBE+RigQMa9rACLOtZlRR9XcJjVazxj5sUtD+pvgVsZXECH5
 it31l/TluPqnXSqufUZ5yjlpL1F/hZ+jDaEvfFnf5GYw4ImehHIg6ZV5XeQBTKr+aMbJ+PKbF8R4yPnM
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
> Add V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS to fill_buf_caps(), which
> is set when queue supports user-space cache management hints.

Ah, you add the capability here :-)

This should be moved forward in the series. Actually, I think this should
be merged with the first patch of the series.

Regards,

	Hans

> 
> Change-Id: Ieac93f3726c61fd3b88e02c36980c1f3c7a82ecc
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  Documentation/media/uapi/v4l/vidioc-reqbufs.rst | 7 +++++++
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 2 ++
>  include/uapi/linux/videodev2.h                  | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> index 9741dac0d5b3..80603f57eb8a 100644
> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> @@ -165,6 +165,13 @@ aborting or finishing any DMA in progress, an implicit
>        - Only valid for stateless decoders. If set, then userspace can set the
>          ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
>  	capture buffer until the OUTPUT timestamp changes.
> +    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
> +      - 0x00000040
> +      - Set when the queue/buffer support memory consistency and cache
> +        management hints. See :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT`,
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE` and
> +        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN`.
> +
>  
>  Return Value
>  ============
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index eb5d1306cb03..22ae0ff64684 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -698,6 +698,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
>  	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> +	if (q->allow_cache_hints)
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 169a8cf345ed..12b1bd220347 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -951,6 +951,7 @@ struct v4l2_requestbuffers {
>  #define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
>  #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
>  #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
> +#define V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS		(1 << 6)
>  
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers
> 

