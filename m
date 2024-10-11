Return-Path: <linux-media+bounces-19420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F999A504
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 15:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 535B91F23E36
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 13:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CC7218D6D;
	Fri, 11 Oct 2024 13:29:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A0620CCE6;
	Fri, 11 Oct 2024 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653382; cv=none; b=XKZxoPJ8N7FzLjb4q3u0lIrUBTGJJoLAmdrWh/yLzxdCOBUY/dVCwz/WixZGtzoNC0oB9w70GLPUAohZXNg4kb55zdheSa9YPTDgWWU3TzmG40JoPXFGlNiEFv04OaAOHa0XtTW9E2/D3oOjINfNb6Z97o3NHbhLCZDtyx7TUEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653382; c=relaxed/simple;
	bh=3/khhb4dshCmgaie0jZhAGL7mH9Ib6h+BrfD+wsuW2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzChSjVKfUA3F9Bf1Xn8M2rC0NYT5Tq/g9bWgHgtyI8erdLZa3YSvjGFO8RQbfsVxgYEuZeQi6LCmVL3xbYXbiLCXDfzsr1FA6vWwzmbxYKq1RoHpCErTMvaTAa05QJcum4dqYxehgLKrA7kwFFkVy0EL7uTdvKFBVlotdNnOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F09C4CEC7;
	Fri, 11 Oct 2024 13:29:40 +0000 (UTC)
Message-ID: <250bf825-7e64-4132-9c70-fa25c5976ed3@xs4all.nl>
Date: Fri, 11 Oct 2024 15:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] media: videodev2: Add flag to unconditionally
 enumerate pixel formats
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240826172407.140538-1-benjamin.gaignard@collabora.com>
 <010201918fb77141-93148d3e-6899-4b09-bff3-5d4f146f1449-000000@eu-west-1.amazonses.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <010201918fb77141-93148d3e-6899-4b09-bff3-5d4f146f1449-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Benjamin,

On 26/08/2024 19:24, Benjamin Gaignard wrote:
> When the index is ORed with V4L2_FMTDESC_FLAG_ENUM_ALL the
> driver clears the flag and enumerate all the possible formats,
> ignoring any limitations from the current configuration.
> Drivers which do not support this flag yet always return an EINVAL.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> change in version 7:
> - Rework documentation about which drivers should use the flag
> 
>  .../media/v4l/vidioc-enum-fmt.rst              | 18 +++++++++++++++++-
>  .../media/videodev2.h.rst.exceptions           |  1 +
>  include/uapi/linux/videodev2.h                 |  3 +++
>  3 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 3adb3d205531..e39c87bcbfc3 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -85,7 +85,17 @@ the ``mbus_code`` field is handled differently:
>      * - __u32
>        - ``index``
>        - Number of the format in the enumeration, set by the application.
> -	This is in no way related to the ``pixelformat`` field.
> +        This is in no way related to the ``pixelformat`` field.
> +        When the index is ORed with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` the
> +        driver clears the flag and enumerates all the possible formats,
> +        ignoring any limitations from the current configuration. Drivers
> +        which do not support this flag always return an ``EINVAL``
> +        error code.

I would like to add: " without clearing this flag."

> +        Formats enumerated when using ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
> +        shouldn't be used when calling :c:func:`VIDIOC_ENUM_FRAMESIZES`
> +        or :c:func:`VIDIOC_ENUM_FRAMEINTERVALS`.
> +        ``V4L2_FMTDESC_FLAG_ENUM_ALL`` should only be used by drivers that
> +        can return different format list depending on this flag.
>      * - __u32
>        - ``type``
>        - Type of the data stream, set by the application. Only these types
> @@ -234,6 +244,12 @@ the ``mbus_code`` field is handled differently:
>  	valid. The buffer consists of ``height`` lines, each having ``width``
>  	Data Units of data and the offset (in bytes) between the beginning of
>  	each two consecutive lines is ``bytesperline``.
> +    * - ``V4L2_FMTDESC_FLAG_ENUM_ALL``
> +      - 0x80000000
> +      - When the applications ORs ``index`` with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
> +        the driver enumerates all the possible pixel formats without taking care
> +        of any already set configuration. Drivers which do not support this flag,
> +        always return ``EINVAL``.

Ditto.

If you agree, then I can make that change myself, no need to post a new version.

Regards,

	Hans

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


