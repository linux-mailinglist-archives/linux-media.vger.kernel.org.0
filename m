Return-Path: <linux-media+bounces-15086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024CE933D86
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 15:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DC4AB22784
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A59D1802CE;
	Wed, 17 Jul 2024 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DTfVQg2p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59417E91B;
	Wed, 17 Jul 2024 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222430; cv=none; b=l9I3mvFGwKYanqkRuBOpASqgA/qz6NsqQ5fMqX59B1NucFZzzBnRF0Zjcenv3KbhM9VAaunDnHgSQATsV5lglZdIJ+qQL85AHET+WMmbl0F2F6BqWgtLWf0YEObh7VyWp5BovnobJLykZnhrDas9yZsQBxhTVYSWYONd+1cidD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222430; c=relaxed/simple;
	bh=xJhLkxr8GnDgQcnn+eHP223Mwxx9xMB3r5nYZ1GfO+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpxOg3vLcCIVb09/5hsJ+mSF+yJf4CuGVfJ9OiqxPC+SuatnshOHT07L83xzE0eOIbLAwaxTcxUV2c98AwuBTEJigoh4kEbx9TWphi7AIUoDQCLcYuKZ79oFyFVOsUSIXS/4Sv5PYA1OXADorOieBguHOvDZJzdf26Pr3jYa5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DTfVQg2p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0EA566F;
	Wed, 17 Jul 2024 15:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721222382;
	bh=xJhLkxr8GnDgQcnn+eHP223Mwxx9xMB3r5nYZ1GfO+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTfVQg2pJfN2MChipp5o9W1r+nGIszMo7TFQ1cno6bVQFczxr6jewddQKUrNLmty2
	 /A29AmhHq6zkes5zDtl+4xaiMVvGGls3MZscA2PdvxShxLy0HtpMjrfqsVYylk+MDQ
	 +v04F/g2H99vRU+LaqVGG+kN8qt5o4k4k23OI4lc=
Date: Wed, 17 Jul 2024 15:20:17 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, 
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
Message-ID: <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240717131430.159727-2-benjamin.gaignard@collabora.com>

Hi Benjamin

On Wed, Jul 17, 2024 at 03:14:29PM GMT, Benjamin Gaignard wrote:
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

Thanks, however I think this can be wrapper on the previous line

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
>  	memset_after(p, 0, type);
>  	p->mbus_code = mbus_code;
> +	p->flags = flags;

Won't this set V4L2_FMT_FLAG_ENUM_ALL_FORMATS (if present) in the
flags returned to userspace ? Shouldn't be drivers to set
V4L2_FMT_FLAG_ALL_FORMATS instead ?

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
> --
> 2.43.0
>
>

