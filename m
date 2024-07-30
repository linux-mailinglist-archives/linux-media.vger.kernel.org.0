Return-Path: <linux-media+bounces-15517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE594090F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A5261C2261E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D86918E769;
	Tue, 30 Jul 2024 07:08:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09054774;
	Tue, 30 Jul 2024 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323303; cv=none; b=WVwTkqvCryhUe6V5jRvHuYYFoDSJSjlpH18gp0RRUIrWJJyYOamQ9qOi+J39rDtCg2mMzmYcC6RDkgMwgRAsM1esblfDcIziPSIh+Djo+LCN7IQj7/n55pi4SSckDfYUmeoKElY3Z+MlYrnhf01Ca/RDhS66kunx5JdQ7XJ8ftU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323303; c=relaxed/simple;
	bh=0dDu7bl/LFbIRHGBz+C54Ptv7QOkHoxyUDIhes5f9fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKpoEbsxGzaUzJWIbHsLXRpqsJKu/WTo2WvlIbFMjSKYf2kAkd+GgWrhiqH0z0bXhel17nUoZz2qbk5W6lultgJks1fXlgLvxcK2BFxppyjrx6ZHL59pfaIaeppaf+CVqnFGI/q8ak39zj8mlJOCclxd/5SygPqnjTMZ1OwGriE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CB5C32782;
	Tue, 30 Jul 2024 07:08:21 +0000 (UTC)
Message-ID: <0b4e2f13-8d79-4931-b868-6100f8b8893f@xs4all.nl>
Date: Tue, 30 Jul 2024 09:08:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: videodev2: Add flag to unconditionnaly
 enumerate pixels formats
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-2-benjamin.gaignard@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240722150523.149667-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/07/2024 17:05, Benjamin Gaignard wrote:
> When the index field is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver
> will ignore any configuration and enumerate all the possible formats.
> Drivers which do not support this flag yet always return an EINVAL
> error code.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 5:
> - Reset the proposal to follow Hans's advices
> - Add new flag to be used with index field.
> 
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst      | 12 +++++++++++-
>  .../userspace-api/media/videodev2.h.rst.exceptions   |  1 +
>  include/uapi/linux/videodev2.h                       |  3 +++
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 3adb3d205531..12e1e65e6a71 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -85,7 +85,11 @@ the ``mbus_code`` field is handled differently:
>      * - __u32
>        - ``index``
>        - Number of the format in the enumeration, set by the application.
> -	This is in no way related to the ``pixelformat`` field.
> +        This is in no way related to the ``pixelformat`` field. When the

You need to start a new paragraph before 'When'. Otherwise you might read
that the 'When' sentence is somehow related to the previous sentence.

> +        index is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver will ignore
> +        any configuration and enumerate all the possible formats. Drivers

I'd rephrase this a little bit:

the driver will enumerate all the possible formats, ignoring any limitations
from the current configuration.

And after that I would like to see an example of a use-case.

> +        which do not support this flag yet always return an ``EINVAL``
> +        error code.
>      * - __u32
>        - ``type``
>        - Type of the data stream, set by the application. Only these types
> @@ -234,6 +238,12 @@ the ``mbus_code`` field is handled differently:
>  	valid. The buffer consists of ``height`` lines, each having ``width``
>  	Data Units of data and the offset (in bytes) between the beginning of
>  	each two consecutive lines is ``bytesperline``.
> +    * - ``V4L2_FMT_FLAG_ENUM_ALL``

I am not really happy with this name since the prefix is identical to that
of other V4L2_FMT_FLAG_ defines. How about: V4L2_FMTDESC_FLAG_ENUM_ALL?
Or V4L2_FMT_IDX_ENUM_ALL?

> +      - 0x80000000
> +      - When the applications ORs ``index`` with ``V4L2_FMT_FLAG_ENUM_ALL`` flag
> +        the driver enumerates all the possible pixel formats without taking care
> +        of any already set configuration. Drivers which do not support this flag
> +        yet always return ``EINVAL``.
>  
>  Return Value
>  ============
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index bdc628e8c1d6..8dc10a500fc6 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>  replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
> +replace define V4L2_FMT_FLAG_ENUM_ALL fmtdesc-flags
>  
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 4e91362da6da..3d11f91273a1 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>  #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>  
> +/*  Format description flag, to be ORed with the index */
> +#define V4L2_FMT_FLAG_ENUM_ALL			0x80000000
> +
>  	/* Frame Size and frame rate enumeration */
>  /*
>   *	F R A M E   S I Z E   E N U M E R A T I O N

Regards,

	Hans

