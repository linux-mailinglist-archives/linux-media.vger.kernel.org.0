Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4829F228162
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 15:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgGUNyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 09:54:19 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:59251 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726120AbgGUNyT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 09:54:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xsimjiBjfNPeYxsinjufOB; Tue, 21 Jul 2020 15:54:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595339657; bh=PDSQ9CQyuDNzepwlhrVFRQg5sIt+xIhogYTeu7Pbyh4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jYZawbeItMgcBeR5Py1hyn08kt/wV0uQ6dK712Q6c0AkMkCUj6MJBEWZQli9ffIqb
         08yuv6pGROp0gYsfQlx5jOISsvT7QtkocWADbCmM8/xwyCSmMjJ0FvLPnViRvWHI5y
         sd71cca+zrSSmar01ksF2FM2+qZ64d8PvQzIo1M66MKHgoTFKKhF8hY3ZHvpknFeGr
         leGnHuucMZb0YPR9cnRLUHr3olWTs4CZBHn3CfOP/9WudSJSFlQfocSKAQfzs8hGfZ
         LWtSGP5XXFvAbMKDVxTbiSTMUeXmHZujjBY6QjoLHYyVl4W3JBfQi6GXZtI5d9RJdA
         wCwxgGgowrTkg==
Subject: Re: [PATCH v5 5/7] media: v4l2: add support for the subdev CSC API
 for hsv_enc on mediabus
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-6-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f78cd2d5-a38b-7bbd-b03a-299ca8644bc9@xs4all.nl>
Date:   Tue, 21 Jul 2020 15:54:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703171019.19270-6-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGRGQXQuDOc+R/i4nqKvbfg6vLpe3Nkqk+SMkWMW2a64e99MvCfO9+6Y0etrVRPUKhtoGVqOoIG+/xP766k/y0kSMzDi98/9nUKvct0Qcmf6GU8fZJZZ
 jmJc9UzZBVjWXuooJkCdblR7NNIE1IWC+F6JQaFhVJ7AFtvi1WQ7HeXYiOvO1RM8OUsXzUyosJ+nV0BC1WnIAn2yTswNINF/Tq0KOM5PEdcufB8wY7dqIvl1
 RZTuqhD7IbnwYEWB+hHGh7IT4H3ULathYMMM6rwYPVTV5+5+KQQDgMCkl9Wp3ACjNFgEPI2XsoGqSEvmF5lmLnEV81oECEYJP6hwRrdWaorY6DjZ6v0MF6XY
 Kj4uJDWaGi3KpnMO7C0B7xEIySKGrxmDkR/RSC1Um1FWUGP/4UpIpRaJqwQAIkrf/yytsRYCK6nDehXm+NBCca69v6MqRsoAaL7rQQt7xpQs//XbEw4U7uyx
 SUryBKJ4UZ3cCZSGWcxLoaLHp1IFLekY8P9FTN58QhGcMdYwNc0JB9hbVPimSC5sbvOy37r5BQjff76K0ZB+9EbpWpzXL6wLqTCGSxTUlgVk+3/V4AX/K0c6
 I4Sn3PXhnrolrzFhGZyqux4lWjrA7OwdMED+3sLdEAeQjZfj6R1xZflCwYJZwDYYYs8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/07/2020 19:10, Dafna Hirschfeld wrote:
> Add the flag V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC that drivers
> can set when enumerating the supported mediabus formats
> on subdevices to indicate that the userspace can ask to
> set the 'hsv_enc'. The patch also replaces the 'ycbcr_enc'
> field in 'struct v4l2_mbus_framefmt' with a union that
> includes 'hsv_enc'

I would just squash this patch with the previous patch. There is really
no need to split this into two patches.

Regards,

	Hans

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 33 +++++++++++++++----
>  include/uapi/linux/v4l2-mediabus.h            |  8 ++++-
>  include/uapi/linux/v4l2-subdev.h              |  1 +
>  3 files changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 7362ee0b1e96..dddc38191547 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -51,7 +51,9 @@ Media Bus Formats
>  	The driver indicates that colorspace conversion is supported by setting
>  	the flag V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE in the corresponding struct
>  	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> -	See :ref:`colorspaces`.
> +	See :ref:`v4l2-subdev-mbus-code-flags`.
> +    * - union {
> +      - (anonymous)
>      * - __u16
>        - ``ycbcr_enc``
>        - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
> @@ -67,7 +69,23 @@ Media Bus Formats
>  	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC in the corresponding struct
>  	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
>  	See :ref:`v4l2-subdev-mbus-code-flags`.
> -
> +    * - __u16
> +      - ``hsv_enc``
> +      - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
> +        This information supplements the ``colorspace`` and must be set by
> +	the driver for capture streams and by the application for output
> +	streams, see :ref:`colorspaces`. If the application sets the
> +	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field for a capture stream to request a specific HSV encoding
> +	for the media bus data. If the driver cannot handle requested
> +	conversion, it will return another supported encoding.
> +	This field is ignored for Y'CbCr media bus formats. The driver indicates
> +	that hsv_enc conversion is supported by setting the flag
> +	V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC in the corresponding struct
> +	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> +	See :ref:`v4l2-subdev-mbus-code-flags`
> +    * - }
> +      -
>      * - __u16
>        - ``quantization``
>        - Quantization range, from enum :c:type:`v4l2_quantization`.
> @@ -123,11 +141,12 @@ Media Bus Formats
>  	ignored for output streams. If set, then request the subdevice to do
>  	colorspace conversion from the received colorspace to the requested
>  	colorspace values. If colorimetry field (``colorspace``, ``ycbcr_enc``,
> -	``quantization`` or ``xfer_func``) is set to 0, then that colorimetry
> -	setting will remain unchanged from what was received. So to change the
> -	quantization, only the ``quantization`` field shall be set to non-zero values
> -	(``V4L2_QUANTIZATION_FULL_RANGE`` or ``V4L2_QUANTIZATION_LIM_RANGE``)
> -	and all other colorimetry fields shall be set to 0.
> +	''hsv_enc``, ``quantization`` or ``xfer_func``) is set to 0, then that
> +	colorimetry setting will remain unchanged from what was received. So to
> +	change the quantization, only the ``quantization`` field shall be set to
> +	non-zero values (``V4L2_QUANTIZATION_FULL_RANGE`` or
> +	``V4L2_QUANTIZATION_LIM_RANGE``) and all other colorimetry fields shall
> +	be set to 0.
>  
>  	To check which conversions are supported by the hardware for the current
>  	media bus frame format, see :ref:`v4l2-subdev-mbus-code-flags`.
> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> index 3b7d692b4015..d0bc8df18ad5 100644
> --- a/include/uapi/linux/v4l2-mediabus.h
> +++ b/include/uapi/linux/v4l2-mediabus.h
> @@ -26,6 +26,7 @@
>   * @field:	used interlacing type (from enum v4l2_field)
>   * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
>   * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
>   * @quantization: quantization of the data (from enum v4l2_quantization)
>   * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
>   * @reserved2:  two reserved bytes that can be later used
> @@ -38,7 +39,12 @@ struct v4l2_mbus_framefmt {
>  	__u32			code;
>  	__u32			field;
>  	__u32			colorspace;
> -	__u16			ycbcr_enc;
> +	union {
> +		/* enum v4l2_ycbcr_encoding */
> +		__u16			ycbcr_enc;
> +		/* enum v4l2_hsv_encoding */
> +		__u16			hsv_enc;
> +	};
>  	__u16			quantization;
>  	__u16			xfer_func;
>  	__u16			reserved2;
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index c20aa9a89864..08e25a961d15 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -67,6 +67,7 @@ struct v4l2_subdev_crop {
>  
>  #define V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE	0x00000001
>  #define V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC	0x00000002
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
>  #define V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION	0x00000004
>  #define V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC	0x00000008
>  /**
> 

