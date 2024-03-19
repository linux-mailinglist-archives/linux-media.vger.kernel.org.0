Return-Path: <linux-media+bounces-7342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDFC880845
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31B811F22E6E
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 23:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367675FBA4;
	Tue, 19 Mar 2024 23:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AiI6fUJS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B725FB90
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710891651; cv=none; b=tvheRLk4Rg+aMVAxSjqrbhSQsQUSmvZ5a+dO1Du3YpaCqnK87O0Ocm43zpxeTESX5sFFblqPaZXgB6SBlOkeKIeqf1FY5MejvzK8yoMh9rYFMpwbKoBvf8NFQ9B9J6gk1AVjQwmvztoc5FDX0nRi4et+PY+IXSL1UWXn+NYpL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710891651; c=relaxed/simple;
	bh=QrLwwyO3weym4E1hs1WOAh/G6GqLH1n51Cwn1isynQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8OTGq0qJ5nEMDsKTbs6sH8aq1DjTewgjeo8n/z3UDcVAGXUfld7GaQTIueJdY6NE+HvZQsL03fruxWwHnrjlISHxzf0wJhly6iMRIt+jw8dZDwKS8b7tiU8+6Qsiz1EIdCWV7hjpcpIkemhCuS48ws1sxlWqlHVRNowbc+svcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AiI6fUJS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EC13B1;
	Wed, 20 Mar 2024 00:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710891620;
	bh=QrLwwyO3weym4E1hs1WOAh/G6GqLH1n51Cwn1isynQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiI6fUJSEI5DHYlpTBP+hlB518FbsxXBDxOyyqGLqauGsYqLyD7c77pvFWFOk+kH8
	 uMuYweKosrnDUZemDEb6WXaTT0SDVLHEeYQZK2KtQSWQVZb9er03I/cEJFg7JcqvMZ
	 A08l/5w+S37hNOnac3GWjvnYbIXc6rV0L2YpW3ck=
Date: Wed, 20 Mar 2024 01:40:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 06/38] media: v4l: Support line-based metadata capture
Message-ID: <20240319234044.GK8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-7-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:44AM +0200, Sakari Ailus wrote:
> many camera sensors, among other devices, transmit embedded data and image

s/many/Many/

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
> ---
>  .../userspace-api/media/v4l/dev-meta.rst          | 15 +++++++++++++++
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst   |  7 +++++++
>  .../media/videodev2.h.rst.exceptions              |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c              |  5 +++--
>  include/uapi/linux/videodev2.h                    | 10 ++++++++++
>  5 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
> index 0e7e1ee1471a..4dfd79e0a705 100644
> --- a/Documentation/userspace-api/media/v4l/dev-meta.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
> @@ -65,3 +65,18 @@ to 0.
>        - ``buffersize``
>        - Maximum buffer size in bytes required for data. The value is set by the
>          driver.
> +    * - __u32
> +      - ``width``
> +      - Width of a line of metadata in Data units. Valid when
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
> index 000c154b0f98..a79abf4428c8 100644
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
> +	Data units of data and offset (in bytes) between the beginning of each

s/and offset/, and the offset/

> +	two consecutive lines is ``bytesperline``.
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
> index 7cb6063f7056..d125d23e4e61 100644
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
> index 6a4f8ae30186..88fdf190a437 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -877,6 +877,7 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
>  #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> +#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200

Could the V4L2_FMT_FLAG_META_LINE_BASED flag be set by the V4L2 core for
line-based metadata formats, instead of requiring drivers to set it ? It
would ensure consistency.

>  
>  	/* Frame Size and frame rate enumeration */
>  /*
> @@ -2423,10 +2424,19 @@ struct v4l2_sdr_format {
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

