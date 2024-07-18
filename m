Return-Path: <linux-media+bounces-15123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14E934F8C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 17:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88F021F24AE6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B005143C57;
	Thu, 18 Jul 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Tv/Nqa2x"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6B433DC
	for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314851; cv=none; b=XN/xPBU9gZBQY3O0Vojt8GZ2UY26rnsZBpXZ2r7LeNEbVoMWfXuGS5rXGLzmV9RLsfbbRvw6XWgGKrug4/nET6vpAxo/0IB0cWEKfvc54iKXJz/zVswWmWWJqfVP0fJpV5JjauLmjfdC6oV+OkJvSUnpYL2UNsd1perISp6RSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314851; c=relaxed/simple;
	bh=m42yOJM+Frljex900R5oZ6PpF6Cus5U+vnSyExOSOPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYzPuRpTEi0vOFNkKUavCDCVLCLr/jHiUX5pFzntMZwX5A90iqLcPL+/SqD5NUOpGYw4H6ya6BN2Oaf+6ySwKqx2g9OqXEPP1ORquhFEEjp8TK3qAbHVTYtS6tc/VO8wJuXXjHN0Oa740aRqsLKKGbDm6IfCFj3bThnC0KXpvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Tv/Nqa2x; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 5a7f6df5-4516-11ef-a711-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 5a7f6df5-4516-11ef-a711-005056992ed3;
	Thu, 18 Jul 2024 16:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=VbTu66uVJvri6ErjbMpV/PMWBFoqz29BbQuueWS4RX8=;
	b=Tv/Nqa2xdbO11Q+GevcPrTDm/X3+ku3jzhmyhxG+cIJMD2mvtVodlzkw73/bVnC01BG6MszpQX68k
	 IrlteS3R5lMbhsO23YPFOzA1Vk+S7I+5FQ2gTwEeZpGKNKPBs+2FUXrNlQorXDLdm38tuii0esaSYc
	 XXsFLwWTx0ov4Bw2p1YT3lpPOXtH82gQCTuyBHrdQUsWhfhCmIs1gl6VYgeLfZT7d8BBvaEaSNlmpQ
	 V/gVjmH6f/JULAv02buIrMC14clDNA/fQ1ZUmRE7yP75YKGhSXIBICCr/VIFcMjhlsU6pv2XFVb6ey
	 hSlpLmtaeXRQaAa/t8ILj4D2gzsI5dQ==
X-KPN-MID: 33|thKJU0JUSXv3GG/vI4/r/F50//nnLTuLyvhUlOexkhSCQCwXFUUZX63kMORDY4v
 HYh6FeaWEq4jPmaFHCDlAjg6WvLJRXzA7cHZuvVeUGBo=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|Sm9eP5GdZd2nk3nPD3oPIkumTq45msKKjeoo1MeGMYe3YXt3uipQia7WlF0PN4Q
 Abcj0OaDtScvcRWzmR9F/Mw==
Received: from [10.47.75.249] (unknown [173.38.220.48])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 5acfab74-4516-11ef-9128-00505699b758;
	Thu, 18 Jul 2024 16:59:39 +0200 (CEST)
Message-ID: <ecca825c-a668-4ca9-9b28-c1a9497b172e@xs4all.nl>
Date: Thu, 18 Jul 2024 16:59:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240717131430.159727-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/17/24 15:14, Benjamin Gaignard wrote:
> Add new flags to enumerate all pixels formats when calling VIDIOC_ENUM_FMT ioctl.
> When this V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag is set drivers must
> ignore the configuration and return the hardware supported pixel
> formats for the specified queue.
> To distinguish this particular enumeration case V4L2_FMT_FLAG_ALL_FORMATS
> flag must be set by the drivers to highlight support of this feature
> to user space applications.
> This will permit to discover which pixel formats are supported
> without setting codec-specific information so userland can more easily
> know if the driver suits its needs well.
> The main target are stateless decoders so update the documentation
> about how to use this flag.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 4:
> - Explicitly document that the new flags are targeting mem2mem devices.
> 
>  .../userspace-api/media/v4l/dev-stateless-decoder.rst |  6 ++++++
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst       | 11 +++++++++++
>  .../userspace-api/media/videodev2.h.rst.exceptions    |  2 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c                  |  3 +++
>  include/uapi/linux/videodev2.h                        |  2 ++
>  5 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> index 35ed05f2695e..b0b657de910d 100644
> --- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> @@ -58,6 +58,12 @@ Querying capabilities
>       default values for these controls being used, and a returned set of formats
>       that may not be usable for the media the client is trying to decode.
>  
> +   * If the ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS`` flag is set the driver must enumerate
> +     all the supported formats without taking care of codec-dependent controls
> +     set on the ``OUTPUT`` queue. To indicate that the driver has take care of this
> +     flag it must set ``V4L2_FMT_FLAG_ALL_FORMATS`` flag for each format while
> +     enumerating.
> +
>  3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect supported
>     resolutions for a given format, passing desired pixel format in
>     :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 3adb3d205531..15bc2f59c05a 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -234,6 +234,17 @@ the ``mbus_code`` field is handled differently:
>  	valid. The buffer consists of ``height`` lines, each having ``width``
>  	Data Units of data and the offset (in bytes) between the beginning of
>  	each two consecutive lines is ``bytesperline``.
> +    * - ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS``
> +      - 0x0400
> +      - Set by userland applications to enumerate all possible pixel formats
> +        without taking care of any OUTPUT or CAPTURE queue configuration.
> +        This flag is relevant only for mem2mem devices.
> +    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
> +      - 0x0800
> +      - Set by the driver to indicated that format have been enumerated because
> +        :ref:`V4L2_FMT_FLAG_ENUM_ALL_FORMATS <v4l2-pix-fmt-flag-set-csc>` has
> +        been set by the userland application.
> +        This flag is relevant only for mem2mem devices.
>  
>  Return Value
>  ============
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index bdc628e8c1d6..7a3a1e9dc055 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -216,6 +216,8 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>  replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
> +replace define V4L2_FMT_FLAG_ENUM_ALL_FORMATS fmtdesc-flags
> +replace define V4L2_FMT_FLAG_ALL_FORMATS fmtdesc-flags
>  
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 4c76d17b4629..5785a98b6ba2 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  	int ret = check_fmt(file, p->type);
>  	u32 mbus_code;
>  	u32 cap_mask;
> +	u32 flags;
>  
>  	if (ret)
>  		return ret;
> @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  		p->mbus_code = 0;
>  
>  	mbus_code = p->mbus_code;
> +	flags = p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;

Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Sorry, you can't just change a read-only field (i.e. set by the driver) to
something that can be set by the application as well. That can easily cause
problems: e.g. applications that leave the flags field uninitialized.

I will try to look at alternatives tomorrow, but this approach is definitely
a no-go.

Regards,

	Hans


>  	memset_after(p, 0, type);
>  	p->mbus_code = mbus_code;
> +	p->flags = flags;
>  
>  	switch (p->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index fe6b67e83751..b6a5da79ba21 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>  #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
> +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
>  
>  	/* Frame Size and frame rate enumeration */
>  /*


