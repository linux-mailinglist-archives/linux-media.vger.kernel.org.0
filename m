Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345EC228159
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 15:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgGUNwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 09:52:25 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35649 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726109AbgGUNwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 09:52:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xsgvjiAtlNPeYxsgwjuehc; Tue, 21 Jul 2020 15:52:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595339542; bh=I2pwYg86omvfEOcbzHamtFqqq8pa4MMAA9pDwCGfYwc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=V97cRmahw1kJ0utvmctwBV9k+a7PNFUBcCYJU0sCKqRGZnv6jZ/tbgiq7fiy4rPL7
         ENDk9jc2NGjLbpEkP3unJW51NL1tVrauujQ6EKwtUzowAPOjatVrG4aQy1yGaIeMxZ
         zx0Z/JMsoZ2gt52Cmn3LfjU5nVuUyD+dMVEYQmd8DUX6XJva9lLF52c6iG+vRs0Fn5
         A8/j6r82842p5SBjtaHU5RZZeE/ShjoDjjAOgyeArtVi1R7zQu/kX65Jlg/NtVmces
         sw/93HLMAdDm1fC3garrTVpT78ZSqqL0yKGQ8o0f+Ar9c33urfLoZh1qCfbtEBpvST
         kJF0+EUvTRoFQ==
Subject: Re: [PATCH v5 4/7] v4l2: extend the CSC API to subdevice.
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-5-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1cf2d884-0e20-bfa6-fd38-2c53a89699e8@xs4all.nl>
Date:   Tue, 21 Jul 2020 15:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703171019.19270-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPiRpop1Gz5Kts24n2yCgPAoP7SL0GIwELt6d4LzJJeOQNfYFslMtSKNMwd8b6s4jGSOvO7uGqtJnJ3IgVARlBaqmW1PhYieYmSyySo73XR/7EN6Txd5
 OBKWqUFHYtY2PoPkf3uwzcI42M6s3QKM6VjlbiT7Yvmtpyb/1zlQVALRA+a0Tf/jNhrs+ZjeN3f7bubT2OOUlWnR1rVY1he29IKYhIU7z5gyr/wA5lVOUGiM
 mqeg3P135K/7r0g3wjkg6hsWgvi4gVhZ/Oc9Wq3cuDh1Pm00ZuDeIXoUmPQxvX7hhgNVn26rGbCmbPubXMkBYRNo1rYPXq3UkF3fi/Eq1sG7nJVxpEATCeGo
 YnhIfODOTfBpJ4hNEoi0aF+OK7uvuusTG+OIZhmTAT7ITjwyT/GyUc06a5T0a1CjOU6RTN7SJcWHxTL25RXJ2gLtip9U8rNBl4od81IxgNaU/15+ODXt8zld
 BGGV56D3PgJasmezm9IjTgNmWPhyQLQueZwPcqotCkJGu0MujkZryTVyODyWYncYGGznbQGL+Id4VVWPCRhC1yFBg4e0tr0/xse7s7m6rbeHVP7U0DKrI3T3
 Y0XO5u6amgUrsxvZ6esMXsaP2QRRLAiJGgn3HZDF5H8T1JmK9d5TshqvM8QkL63DIMs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/07/2020 19:10, Dafna Hirschfeld wrote:
> This patch extends the CSC API in video devices to be supported
> also on sub-devices. The flag V4L2_MBUS_FRAMEFMT_SET_CSC set by
> the application when calling VIDIOC_SUBDEV_S_FMT ioctl.
> The flags:
> 
> V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE, V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC,
> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC,

Reorder.

> 
> are set by the driver in the VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.
> 
> New 'flags' fields were added to the structs
> v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed
> from the 'reserved' field
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 78 +++++++++++++++++--
>  .../v4l/vidioc-subdev-enum-mbus-code.rst      | 44 ++++++++++-
>  include/uapi/linux/v4l2-mediabus.h            |  9 ++-
>  include/uapi/linux/v4l2-subdev.h              |  8 +-
>  4 files changed, 129 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 9a4d61b0d76f..7362ee0b1e96 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -41,32 +41,96 @@ Media Bus Formats
>  	:ref:`field-order` for details.
>      * - __u32
>        - ``colorspace``
> -      - Image colorspace, from enum
> -	:c:type:`v4l2_colorspace`. See
> -	:ref:`colorspaces` for details.
> +      - Image colorspace, from enum :c:type:`v4l2_colorspace`.
> +        Must be set by the driver for capture streams and by the application
> +	for output streams, see :ref:`colorspaces`. If the application sets the
> +	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field for a capture stream to request a specific colorspace
> +	for the media bus data. If the driver cannot handle requested
> +	conversion, it will return another supported colorspace.
> +	The driver indicates that colorspace conversion is supported by setting
> +	the flag V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE in the corresponding struct
> +	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> +	See :ref:`colorspaces`.
>      * - __u16
>        - ``ycbcr_enc``
>        - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
>          This information supplements the ``colorspace`` and must be set by
>  	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	streams, see :ref:`colorspaces`. If the application sets the
> +	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field for a capture stream to request a specific Y'CbCr encoding
> +	for the media bus data. If the driver cannot handle requested
> +	conversion, it will return another supported encoding.
> +	This field is ignored for HSV media bus formats. The driver indicates
> +	that ycbcr_enc conversion is supported by setting the flag
> +	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC in the corresponding struct
> +	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> +	See :ref:`v4l2-subdev-mbus-code-flags`.
> +
>      * - __u16
>        - ``quantization``
>        - Quantization range, from enum :c:type:`v4l2_quantization`.
>          This information supplements the ``colorspace`` and must be set by
>  	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	streams, see :ref:`colorspaces`. If the application sets the
> +	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field for a capture stream to request a specific quantization
> +	encoding for the media bus data. If the driver cannot handle requested
> +	conversion, it will return another supported encoding.
> +	The driver indicates that quantization conversion is supported by
> +	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION in the
> +	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
> +	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
> +
>      * - __u16
>        - ``xfer_func``
>        - Transfer function, from enum :c:type:`v4l2_xfer_func`.
>          This information supplements the ``colorspace`` and must be set by
>  	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	streams, see :ref:`colorspaces`. If the application sets the
> +	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field for a capture stream to request a specific transfer
> +	function for the media bus data. If the driver cannot handle the requested
> +	conversion, it will return another supported transfer function.
> +	The driver indicates that the transfer function conversion is supported by
> +	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC in the
> +	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
> +	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
> +    * - __u16
> +      - ``reserved2``
> +      - Reserved for future extensions.
> +    * - __u32
> +      - ``flags``
> +      - flags See:  :ref:v4l2-mbus-framefmt-flags
>      * - __u16
> -      - ``reserved``\ [11]
> +      - ``reserved``\ [8]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> +.. _v4l2-mbus-framefmt-flags:
> +
> +.. flat-table:: v4l2_mbus_framefmt Flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * .. _`mbus-framefmt-set-csc`:
> +
> +      - ``V4L2_MBUS_FRAMEFMT_SET_CSC``
> +      - 0x00000001
> +      - Set by the application. It is only used for capture and is
> +	ignored for output streams. If set, then request the subdevice to do
> +	colorspace conversion from the received colorspace to the requested
> +	colorspace values. If colorimetry field (``colorspace``, ``ycbcr_enc``,

If -> If the

> +	``quantization`` or ``xfer_func``) is set to 0, then that colorimetry

Reorder.

> +	setting will remain unchanged from what was received. So to change the
> +	quantization, only the ``quantization`` field shall be set to non-zero values
> +	(``V4L2_QUANTIZATION_FULL_RANGE`` or ``V4L2_QUANTIZATION_LIM_RANGE``)
> +	and all other colorimetry fields shall be set to 0.
> +
> +	To check which conversions are supported by the hardware for the current
> +	media bus frame format, see :ref:`v4l2-subdev-mbus-code-flags`.
>  
>  
>  .. _v4l2-mbus-pixelcode:
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> index 35b8607203a4..8ed355a285e9 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> @@ -79,11 +79,53 @@ information about the try formats.
>        - Media bus format codes to be enumerated, from enum
>  	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>      * - __u32
> -      - ``reserved``\ [8]
> +      - ``flags``
> +      - See :ref:`v4l2-subdev-mbus-code-flags`
> +    * - __u32
> +      - ``reserved``\ [7]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
>  
> +
> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{7.7cm}|
> +
> +.. _v4l2-subdev-mbus-code-flags:
> +
> +.. flat-table:: Subdev Media Bus Code Enumerate Flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE
> +      - 0x00000001
> +      - The driver allows the application to try to change the default colorspace
> +        encoding. The application can ask to configure the colorspace of the
> +	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
> +      - 0x00000002
> +      - The driver allows the application to try to change the default Y'CbCr
> +	encoding. The application can ask to configure the ycbcr_enc of the
> +	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION
> +      - 0x00000004
> +      - The driver allows the application to try to change the default
> +	quantization. The application can ask to configure the quantization of
> +	the subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC
> +      - 0x00000008
> +      - The driver allows the application to try to change the default transform function.
> +	The application can ask to configure the transform function of
> +	the subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.

Reorder and renumber the V4L2_SUBDEV_MBUS_CODE_CSC_ values.

> +
>  Return Value
>  ============
>  
> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> index 123a231001a8..3b7d692b4015 100644
> --- a/include/uapi/linux/v4l2-mediabus.h
> +++ b/include/uapi/linux/v4l2-mediabus.h
> @@ -16,6 +16,8 @@
>  #include <linux/types.h>
>  #include <linux/videodev2.h>
>  
> +#define V4L2_MBUS_FRAMEFMT_SET_CSC	0x00000001
> +
>  /**
>   * struct v4l2_mbus_framefmt - frame format on the media bus
>   * @width:	image width
> @@ -26,6 +28,9 @@
>   * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
>   * @quantization: quantization of the data (from enum v4l2_quantization)
>   * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> + * @reserved2:  two reserved bytes that can be later used
> + * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
> + * @reserved:  reserved bytes that can be later used
>   */
>  struct v4l2_mbus_framefmt {
>  	__u32			width;
> @@ -36,7 +41,9 @@ struct v4l2_mbus_framefmt {
>  	__u16			ycbcr_enc;
>  	__u16			quantization;
>  	__u16			xfer_func;
> -	__u16			reserved[11];
> +	__u16			reserved2;
> +	__u32			flags;
> +	__u16			reserved[8];
>  };
>  
>  #ifndef __KERNEL__
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 5d2a1dab7911..c20aa9a89864 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -65,19 +65,25 @@ struct v4l2_subdev_crop {
>  	__u32 reserved[8];
>  };
>  
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE	0x00000001
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC	0x00000002
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION	0x00000004
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC	0x00000008

Reorder and renumber.

Regards,

	Hans

>  /**
>   * struct v4l2_subdev_mbus_code_enum - Media bus format enumeration
>   * @pad: pad number, as reported by the media API
>   * @index: format index during enumeration
>   * @code: format code (MEDIA_BUS_FMT_ definitions)
>   * @which: format type (from enum v4l2_subdev_format_whence)
> + * @flags: flags set by the driver, (V4L2_SUBDEV_MBUS_CODE_*)
>   */
>  struct v4l2_subdev_mbus_code_enum {
>  	__u32 pad;
>  	__u32 index;
>  	__u32 code;
>  	__u32 which;
> -	__u32 reserved[8];
> +	__u32 flags;
> +	__u32 reserved[7];
>  };
>  
>  /**
> 

