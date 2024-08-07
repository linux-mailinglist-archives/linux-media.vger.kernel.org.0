Return-Path: <linux-media+bounces-15909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF20194A30F
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99E1E282DA2
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21DF1C9DDB;
	Wed,  7 Aug 2024 08:39:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6487E22334;
	Wed,  7 Aug 2024 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019998; cv=none; b=nXBHUHvV5siBqR1Eb0skVS/BNtesX7GOV+AAmRgIxXtgPGuqjg7LEki+z/vdZWEPd7fUoii7xsAFihNTL7Wh1W9FlZYJijcZiA48ZSc/d7VzJC9+I1CUs6d8HNigzUO1ssCiekMRHjDx3skeGvMTaE8qX0fJygrgSW3FJ7Yvx+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019998; c=relaxed/simple;
	bh=jzTnMXgFQA5iLaUC95ZNLIfjeuXrnP8ESJAhmX0zsKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYFEBtlEX8bCP8GGYiIqA0etZ2OhUWWMLFlGwTXWWtVG8o7BwK7xb3eJGz6062N0rjDolO+PryYUYOIWrKkbw/AfLCPEjzBqSBizmbj/JzhtAJMCq7IzOuw8fsTb2s0Ss61WzHH8tCmxbngS024SOh4lY4JYY8Eq6p752/ErKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997C3C32782;
	Wed,  7 Aug 2024 08:39:56 +0000 (UTC)
Message-ID: <c9e6ed97-bb42-465a-9bce-797adb44906f@xs4all.nl>
Date: Wed, 7 Aug 2024 10:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] media: videodev2: Add flag to unconditionally
 enumerate pixel formats
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240731093457.29095-1-benjamin.gaignard@collabora.com>
 <20240731093457.29095-2-benjamin.gaignard@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240731093457.29095-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2024 11:34, Benjamin Gaignard wrote:
> When the index is ORed with V4L2_FMTDESC_FLAG_ENUM_ALL the
> driver clears the flag and enumerate all the possible formats,
> ignoring any limitations from the current configuration.
> Drivers which do not support this flag yet always return an EINVAL.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> change in version 6:
> - Change flag name.
> - Improve documentation.
> 
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 16 +++++++++++++++-
>  .../media/videodev2.h.rst.exceptions             |  1 +
>  include/uapi/linux/videodev2.h                   |  3 +++
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 3adb3d205531..1112dc9044b2 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -85,7 +85,15 @@ the ``mbus_code`` field is handled differently:
>      * - __u32
>        - ``index``
>        - Number of the format in the enumeration, set by the application.
> -	This is in no way related to the ``pixelformat`` field.
> +        This is in no way related to the ``pixelformat`` field.
> +        When the index is ORed with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` the
> +        driver clears the flag and enumerate all the possible formats,

enumerate -> enumerates

> +        ignoring any limitations from the current configuration. Drivers
> +        which do not support this flag yet always return an ``EINVAL``

Drop the 'yet'.

But this raises a question: should this flag only be supported by drivers
that can actually return different format lists depending on this flag?

Or can it be supported as well by a driver where this makes no difference?

I'm inclined to limit it to drivers that actually can return different
results. If nothing else, that will indicate to the application that this
is actually possible.

If we agree on that, then that should be documented as well.

> +        error code.
> +        Formats enumerated when using ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
> +        shouldn't be used when calling :c:func:`VIDIOC_ENUM_FRAMESIZES`
> +        or :c:func:`VIDIOC_ENUM_FRAMEINTERVALS`.
>      * - __u32
>        - ``type``
>        - Type of the data stream, set by the application. Only these types
> @@ -234,6 +242,12 @@ the ``mbus_code`` field is handled differently:
>  	valid. The buffer consists of ``height`` lines, each having ``width``
>  	Data Units of data and the offset (in bytes) between the beginning of
>  	each two consecutive lines is ``bytesperline``.
> +    * - ``V4L2_FMTDESC_FLAG_ENUM_ALL``
> +      - 0x80000000
> +      - When the applications ORs ``index`` with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
> +        the driver enumerates all the possible pixel formats without taking care
> +        of any already set configuration. Drivers which do not support this flag
> +        yet, always return ``EINVAL``.

Drop 'yet'

>  
>  Return Value
>  ============
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index bdc628e8c1d6..0a9ea9686c24 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>  replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
> +replace define V4L2_FMTDESC_FLAG_ENUM_ALL fmtdesc-flags
>  
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 4e91362da6da..421a30cb0c51 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>  #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>  
> +/*  Format description flag, to be ORed with the index */
> +#define V4L2_FMTDESC_FLAG_ENUM_ALL		0x80000000
> +
>  	/* Frame Size and frame rate enumeration */
>  /*
>   *	F R A M E   S I Z E   E N U M E R A T I O N

Regards,

	Hans

