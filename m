Return-Path: <linux-media+bounces-9774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4BB8AB2D4
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 18:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BADEB1F22268
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 16:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF4B12FF81;
	Fri, 19 Apr 2024 16:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bKH++2UD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A9F130E31
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713542764; cv=none; b=gRg27Bfh0N38HrVI6pWFT292btEao7/yaVPCzdKla0Mm03tI/MFRz75Xl051AJcLBKb7nDPC0M95ruSILottdLdXB4QYj3A+QL0r0lvz6MezOKRLnv7fx3vfuPbU3XoFdSEPFGxeEkiWENt1/rwI+p08E7+X+16EmIRacz5XJ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713542764; c=relaxed/simple;
	bh=NiCGTcktrtgX+q/kqT36eB223093AZfn8KOaaHlzlcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWoQ7SRyYO8xrN3lO+W5YuZAB05tIcyI07rgc1lhqIEI/CEqOlW8bwZc56CI95XkGki3jerf+GJr5h77DvsYYy/E7uA4e+0gQNe3U4p/UWpyVtlkDscidN/BaKSkso75uvNFLciOsS/dVquNaCbdbXlXh0BJzNHkvAxznT2dbKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bKH++2UD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F0D4827;
	Fri, 19 Apr 2024 18:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713542712;
	bh=NiCGTcktrtgX+q/kqT36eB223093AZfn8KOaaHlzlcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKH++2UDwtYx0d5V7QL+lfi50suJwX/6k3zc12631ZPI4OBdIkpjY2Os79Sq/Cnwd
	 7di+o7Pcsj0X+VlJahwxOeDlt2YP0US2JhRtaKter5RTsrHEyTA3NSO/NgvPTuy7Yg
	 xIBWguae0nJEUeG7MeH+kCFEyAesMbNj2zHGaAZ0=
Date: Fri, 19 Apr 2024 19:05:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 05/46] media: uapi: Document which mbus format fields
 are valid for metadata
Message-ID: <20240419160553.GE6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:32:38PM +0300, Sakari Ailus wrote:
> Now that metadata mbus formats have been added, it is necessary to define
> which fields in struct v4l2_mbus_format are applicable to them (not many).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst | 15 ++++++++-------
>  include/uapi/linux/v4l2-mediabus.h             | 18 ++++++++++++------
>  2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index d9a5ee954cdd..0547f2733ee3 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -33,7 +33,7 @@ Media Bus Formats
>      * - __u32
>        - ``field``
>        - Field order, from enum :c:type:`v4l2_field`. See
> -	:ref:`field-order` for details.
> +	:ref:`field-order` for details. Zero on metadata mbus codes.

I would write "Zero for" instead of "Zero on".

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>      * - __u32
>        - ``colorspace``
>        - Image colorspace, from enum :c:type:`v4l2_colorspace`.
> @@ -45,7 +45,7 @@ Media Bus Formats
>  	conversion is supported by setting the flag
>  	V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE in the corresponding struct
>  	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> -	See :ref:`v4l2-subdev-mbus-code-flags`.
> +	See :ref:`v4l2-subdev-mbus-code-flags`. Zero on metadata mbus codes.
>      * - union {
>        - (anonymous)
>      * - __u16
> @@ -61,7 +61,7 @@ Media Bus Formats
>  	that ycbcr_enc conversion is supported by setting the flag
>  	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC in the corresponding struct
>  	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> -	See :ref:`v4l2-subdev-mbus-code-flags`.
> +	See :ref:`v4l2-subdev-mbus-code-flags`. Zero on metadata mbus codes.
>      * - __u16
>        - ``hsv_enc``
>        - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
> @@ -75,7 +75,7 @@ Media Bus Formats
>  	that hsv_enc conversion is supported by setting the flag
>  	V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC in the corresponding struct
>  	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> -	See :ref:`v4l2-subdev-mbus-code-flags`
> +	See :ref:`v4l2-subdev-mbus-code-flags`. Zero on metadata mbus codes.
>      * - }
>        -
>      * - __u16
> @@ -90,8 +90,8 @@ Media Bus Formats
>  	The driver indicates that quantization conversion is supported by
>  	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION in the
>  	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
> -	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
> -
> +	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`. Zero on
> +	metadata mbus codes.
>      * - __u16
>        - ``xfer_func``
>        - Transfer function, from enum :c:type:`v4l2_xfer_func`.
> @@ -104,7 +104,8 @@ Media Bus Formats
>  	The driver indicates that the transfer function conversion is supported by
>  	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC in the
>  	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
> -	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
> +	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`. Zero on
> +	metadata mbus codes.
>      * - __u16
>        - ``flags``
>        - flags See:  :ref:v4l2-mbus-framefmt-flags
> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> index 6b07b73473b5..de1d6161bf62 100644
> --- a/include/uapi/linux/v4l2-mediabus.h
> +++ b/include/uapi/linux/v4l2-mediabus.h
> @@ -19,12 +19,18 @@
>   * @width:	image width
>   * @height:	image height
>   * @code:	data format code (from enum v4l2_mbus_pixelcode)
> - * @field:	used interlacing type (from enum v4l2_field)
> - * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
> - * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> - * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
> - * @quantization: quantization of the data (from enum v4l2_quantization)
> - * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> + * @field:	used interlacing type (from enum v4l2_field), zero on metadata
> + *		mbus codes
> + * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
> + *		metadata mbus codes
> + * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
> + *		on metadata mbus codes
> + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
> + *		metadata mbus codes
> + * @quantization: quantization of the data (from enum v4l2_quantization), zero
> + *		on metadata mbus codes
> + * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
> + *		on metadata mbus codes
>   * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
>   * @reserved:  reserved bytes that can be later used
>   */

-- 
Regards,

Laurent Pinchart

