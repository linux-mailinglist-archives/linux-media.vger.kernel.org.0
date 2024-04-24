Return-Path: <linux-media+bounces-10045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1AE8B0E1F
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BA531C24955
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A72915FA6A;
	Wed, 24 Apr 2024 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DjVVM39j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378BD15DBA5
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972479; cv=none; b=Kvdjia5kVVjFiyUPUZl3oaayOkuc9M74f8qf98cg6fHDWzInQuyI3DOu1MRB/WLNxjaFLdaDqaGf8PeD4Sny/WkW6vx6w5Q+FYciRF/pv9rk5ntGKqn5C30y5YPfjyxFIxwiCCRHP2DC5Q1WDiuK0iISNLlrs3ca3L7/Sgao5H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972479; c=relaxed/simple;
	bh=ethZocRoGrrUVeaYW7NRNbsJ7kew5+2dXzp1se7/7Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJ24bDXxgP5NwSX7ZLYcMN1gGM8XK949qDPOm2Uh5HhNHbmNx7bNUaQnPd+3NoVF57pxbTAuVDDJFf6wqi4kPwX70TP1kdA61uN1XFyh9SYPuRbIDhURApqhcyBmGzwwijZBL3h4G40n4Gp7ftNm1a0hsQRBwQpAUgqjLaZ8PqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DjVVM39j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3003674;
	Wed, 24 Apr 2024 17:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972425;
	bh=ethZocRoGrrUVeaYW7NRNbsJ7kew5+2dXzp1se7/7Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjVVM39jCPwwDBRhHTCxOBy+BB7NSr+i/0f7kXPzmZbS9tDKCSnovw4tAT41ziEjc
	 Z6+IP3Ajrb+qrCgpnE6ovVfcX9NOfp3yn8mfIEMyK/BXJo4/06l14EIkJNbmimG3Rp
	 ggL0XpDhrGrazw1XKRTz3iUMjce9Xo1c1GwYJxPg=
Date: Wed, 24 Apr 2024 18:27:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 06/14] media: v4l: Support line-based metadata capture
Message-ID: <20240424152750.GB32190@pendragon.ideasonboard.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
 <20240424122237.875000-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424122237.875000-7-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Apr 24, 2024 at 03:22:29PM +0300, Sakari Ailus wrote:
> Many camera sensors, among other devices, transmit embedded data and image
> data for each CSI-2 frame. This embedded data typically contains register
> configuration of the sensor that has been used to capture the image data
> of the same frame.
> 
> The embedded data is received by the CSI-2 receiver and has the same
> properties as the image data, including that it is line based: it has
> width, height and bytesperline (stride).
> 
> Add these fields to struct v4l2_meta_format and document them.
> 
> Also add V4L2_FMT_FLAG_META_LINE_BASED to tell a given format is
> line-based i.e. these fields of struct v4l2_meta_format are valid for it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../userspace-api/media/v4l/dev-meta.rst      | 21 +++++++++++++++++++
>  .../media/v4l/vidioc-enum-fmt.rst             |  7 +++++++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +++--
>  include/uapi/linux/videodev2.h                | 10 +++++++++
>  5 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
> index 0e7e1ee1471a..5eee9ab60395 100644
> --- a/Documentation/userspace-api/media/v4l/dev-meta.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
> @@ -47,6 +47,12 @@ member of the ``fmt`` union as needed per the desired operation. Both drivers
>  and applications must set the remainder of the :c:type:`v4l2_format` structure
>  to 0.
>  
> +Devices that capture metadata by line have the struct v4l2_fmtdesc
> +``V4L2_FMT_FLAG_META_LINE_BASED`` flag set for :c:func:`VIDIOC_ENUM_FMT`. Such
> +devices can typically also :ref:`capture image data <capture>`. This primarily
> +involves devices that receive the data from a different devices such as a camera
> +sensor.
> +
>  .. c:type:: v4l2_meta_format
>  
>  .. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> @@ -65,3 +71,18 @@ to 0.
>        - ``buffersize``
>        - Maximum buffer size in bytes required for data. The value is set by the
>          driver.
> +    * - __u32
> +      - ``width``
> +      - Width of a line of metadata in Data Units. Valid when
> +	:c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set,
> +	otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> +    * - __u32
> +      - ``height``
> +      - Number of rows of metadata. Valid when :c:type`v4l2_fmtdesc` flag
> +	``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> +	:c:func:`VIDIOC_ENUM_FMT`.
> +    * - __u32
> +      - ``bytesperline``
> +      - Offset in bytes between the beginning of two consecutive lines. Valid
> +	when :c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is
> +	set, otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 000c154b0f98..3adb3d205531 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -227,6 +227,13 @@ the ``mbus_code`` field is handled differently:
>  	The application can ask to configure the quantization of the capture
>  	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
>  	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
> +    * - ``V4L2_FMT_FLAG_META_LINE_BASED``
> +      - 0x0200
> +      - The metadata format is line-based. In this case the ``width``,
> +	``height`` and ``bytesperline`` fields of :c:type:`v4l2_meta_format` are
> +	valid. The buffer consists of ``height`` lines, each having ``width``
> +	Data Units of data and the offset (in bytes) between the beginning of

s/ and the offset/, and the offset/

It's hard to read otherwise.

> +	each two consecutive lines is ``bytesperline``.
>  
>  Return Value
>  ============
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 3e58aac4ef0b..bdc628e8c1d6 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -215,6 +215,7 @@ replace define V4L2_FMT_FLAG_CSC_XFER_FUNC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
> +replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>  
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index ae2dca7f2817..2cfc9106857a 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -343,8 +343,9 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		meta = &p->fmt.meta;
>  		pixelformat = meta->dataformat;
> -		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
> -			&pixelformat, meta->buffersize);
> +		pr_cont(", dataformat=%p4cc, buffersize=%u, width=%u, height=%u, bytesperline=%u\n",
> +			&pixelformat, meta->buffersize, meta->width,
> +			meta->height, meta->bytesperline);
>  		break;
>  	}
>  }
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 0f44b8486ea8..647ce3419bd8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -877,6 +877,7 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
>  #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> +#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>  
>  	/* Frame Size and frame rate enumeration */
>  /*
> @@ -2424,10 +2425,19 @@ struct v4l2_sdr_format {
>   * struct v4l2_meta_format - metadata format definition
>   * @dataformat:		little endian four character code (fourcc)
>   * @buffersize:		maximum size in bytes required for data
> + * @width:		number of data units of data per line (valid for line
> + *			based formats only, see format documentation)
> + * @height:		number of lines of data per buffer (valid for line based
> + *			formats only)
> + * @bytesperline:	offset between the beginnings of two adjacent lines in
> + *			bytes (valid for line based formats only)
>   */
>  struct v4l2_meta_format {
>  	__u32				dataformat;
>  	__u32				buffersize;
> +	__u32				width;
> +	__u32				height;
> +	__u32				bytesperline;
>  } __attribute__ ((packed));
>  
>  /**

-- 
Regards,

Laurent Pinchart

