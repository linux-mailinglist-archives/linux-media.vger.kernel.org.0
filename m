Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274C424B761
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 12:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbgHTKwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 06:52:49 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49365 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731544AbgHTKwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 06:52:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8iBNkGQXoywL58iBOkZMwu; Thu, 20 Aug 2020 12:52:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597920754; bh=Np0c45tfz4b2wCTVMFNX3magSDwvbRp0758VD0auqBU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ewCFczcxqepExmBK+RGjwVRwAPkpaYTDziTxiqnpwxw7Z4iwDezQj7+cYV2zf0GRo
         CtVYeEP7nJIYavOmZEDAOfTI7JV/RmiEzj0GBx3CgZ2dlmQ/OHUKtiHtwdczJt8Kgt
         ukqN/aNwFomu5VdNrVbZ2G2w2Ldk4bbuK01gOALN6wJTM7h+tc9DNBmLARfZssWiRo
         uz9JNyQNa7ikN0/37VZy1z6vReeWEnsoNZPGjS30BRMhbS0hy3sYRK6F1KlDpi4wWA
         FrgBN0Aw706OOkIvOroq6znHQAnqoAWLtR9NifiGaIwxceigA3VbVN9oP3lzrq+Nr9
         rXkrM0ioCq18A==
Subject: Re: [PATCH v6 4/6] v4l2: extend the CSC API to subdevice.
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200818081807.23134-1-dafna.hirschfeld@collabora.com>
 <20200818081807.23134-5-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <34565997-3757-0031-d283-8be7b915743a@xs4all.nl>
Date:   Thu, 20 Aug 2020 12:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818081807.23134-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPe1+tIyE/tMiAkmsPm7zg2+/vU2TuxyKwf4II7ld5WtOSaRCtFon3bAdCwjmR6dioW4A2rHqW2WDp+I6+RhB1B4HKVaC2RfPbB1v25ijdjFwtuRVwBj
 L63ltcisB5vTylCrFSHGQ0r4qjMCKs2386JwRvA3U4Gl3rd62ZycG9MY07vz7VY/IY/NQlrVs9IqWZeVPLBEI+BdkrlFkCtqw8U7WnQOH4AErN+QZJnzC1KX
 Z3u2DcP7XMjB467nvsJnyz0D2/dodlBjTYwpRnjr4eqJTcM2N/wXF5KG1LvAr69W8ISWPdLQbeX7Pi60SaxeuBaS/j0ooTnOg6Jg5KwnIHdejz8/pC+6fC5L
 U+qoT3eX8B/W6gy+Y2s74UiaCFaNPkt0HOjIuEz3DRR4+RMgP2A0wwjguviwJjf+NKgtNHDMQRbOpoE/y+hysptGkHR0Ue7nLGFiPWNFMYLnkb8HL63Cgpu0
 44wjpRGUcDFhepz6h2tJoRe7yKRncV/8l7nmq91M4DVfBQr1o2IYwZj9cHMpxZWpNKKJAcBAZi4PoyR9hGAjo4hrjUGChP+rZvf/N+6g6HMpFzl/Orq1cxl8
 FmjWfoBx3qCur4EsNcpj89gPBTIC5aLC10/LJJqL2BHUTHww3zBZSvc0Rx3Z0uO+1t4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/08/2020 10:18, Dafna Hirschfeld wrote:
> This patch extends the CSC API in video devices to be supported
> also on sub-devices. The flag V4L2_MBUS_FRAMEFMT_SET_CSC set by
> the application when calling VIDIOC_SUBDEV_S_FMT ioctl.
> The flags:
> 
> V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE,
> V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC,
> V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC/V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC
> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION
> 
> are set by the driver in the VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.
> 
> New 'flags' fields were added to the structs
> v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed
> from the 'reserved' field
> 
> The patch also replaces the 'ycbcr_enc' field in
> 'struct v4l2_mbus_framefmt' with a union that includes 'hsv_enc'
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 98 +++++++++++++++++--
>  .../v4l/vidioc-subdev-enum-mbus-code.rst      | 51 +++++++++-
>  include/uapi/linux/v4l2-mediabus.h            | 17 +++-
>  include/uapi/linux/v4l2-subdev.h              |  9 +-
>  4 files changed, 161 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 9a4d61b0d76f..6495bf183896 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -41,32 +41,110 @@ Media Bus Formats
>  	:ref:`field-order` for details.
>      * - __u32
>        - ``colorspace``
> -      - Image colorspace, from enum
> -	:c:type:`v4l2_colorspace`. See
> -	:ref:`colorspaces` for details.
> +      - Image colorspace, from enum :c:type:`v4l2_colorspace`.
> +        Must be set by the driver for subdevices. If the application sets the
> +	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set this
> +	field on the source pad to request a specific colorspace for the media
> +	bus data. If the driver cannot handle the requested conversion, it will
> +	return another supported colorspace. The driver indicates that colorspace
> +	conversion is supported by setting the flag
> +	V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE in the corresponding struct
> +	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> +	See :ref:`v4l2-subdev-mbus-code-flags`.
> +    * - union {
> +      - (anonymous)
>      * - __u16
>        - ``ycbcr_enc``
>        - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
>          This information supplements the ``colorspace`` and must be set by
> -	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	the driver for subdevices, see :ref:`colorspaces`. If the application
> +	sets the flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field on a source pad to request a specific Y'CbCr encoding
> +	for the media bus data. If the driver cannot handle the requested
> +	conversion, it will return another supported encoding.
> +	This field is ignored for HSV media bus formats. The driver indicates
> +	that ycbcr_enc conversion is supported by setting the flag
> +	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC in the corresponding struct
> +	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
> +	See :ref:`v4l2-subdev-mbus-code-flags`.
> +    * - __u16
> +      - ``hsv_enc``
> +      - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
> +        This information supplements the ``colorspace`` and must be set by
> +	the driver for subdevices, see :ref:`colorspaces`. If the application
> +	sets the flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field on a source pad to request a specific HSV encoding
> +	for the media bus data. If the driver cannot handle the requested
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
>          This information supplements the ``colorspace`` and must be set by
> -	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	the driver for subdevices, see :ref:`colorspaces`. If the application
> +	sets the flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field on a source pad to request a specific quantization
> +	for the media bus data. If the driver cannot handle the requested
> +	conversion, it will return another supported quantization.
> +	The driver indicates that quantization conversion is supported by
> +	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION in the
> +	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
> +	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
> +
>      * - __u16
>        - ``xfer_func``
>        - Transfer function, from enum :c:type:`v4l2_xfer_func`.
>          This information supplements the ``colorspace`` and must be set by
> -	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	the driver for subdevices, see :ref:`colorspaces`. If the application
> +	sets the flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field on a source pad to request a specific transfer
> +	function for the media bus data. If the driver cannot handle the requested
> +	conversion, it will return another supported transfer function.
> +	The driver indicates that the transfer function conversion is supported by
> +	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC in the
> +	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
> +	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
>      * - __u16
> -      - ``reserved``\ [11]
> +      - ``reserved2``
> +      - Reserved for future extensions.
> +    * - __u32
> +      - ``flags``
> +      - flags See:  :ref:v4l2-mbus-framefmt-flags
> +    * - __u16
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
> +      - Set by the application. It is only used for source pads and is
> +	ignored for sink pads. If set, then request the subdevice to do
> +	colorspace conversion from the received colorspace to the requested
> +	colorspace values. If the colorimetry field (``colorspace``, ``xfer_func``,
> +	``ycbcr_enc``, ``hsv_enc`` or ``quantization``) is set to ``*_DEFAULT``,
> +	then that colorimetry setting will remain unchanged from what was received.
> +	So in order to change the quantization, only the ``quantization`` field shall
> +	be set to non default value (``V4L2_QUANTIZATION_FULL_RANGE`` or
> +	``V4L2_QUANTIZATION_LIM_RANGE``) and all other colorimetry fields shall
> +	be set to ``*_DEFAULT``.
> +
> +	To check which conversions are supported by the hardware for the current
> +	media bus frame format, see :ref:`v4l2-subdev-mbus-code-flags`.
>  
>  
>  .. _v4l2-mbus-pixelcode:
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> index 35b8607203a4..d9bb12ac2145 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> @@ -79,11 +79,60 @@ information about the try formats.
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
> +	encoding. The application can ask to configure the colorspace of the
> +	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC
> +      - 0x00000002
> +      - The driver allows the application to try to change the default transform function.
> +	The application can ask to configure the transform function of
> +	the subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
> +      - 0x00000004
> +      - The driver allows the application to try to change the default Y'CbCr
> +	encoding. The application can ask to configure the Y'CbCr encoding of the
> +	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC
> +      - 0x00000004
> +      - The driver allows the application to try to change the default HSV
> +	encoding. The application can ask to configure the HSV encoding of the
> +	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION
> +      - 0x00000008
> +      - The driver allows the application to try to change the default
> +	quantization. The application can ask to configure the quantization of
> +	the subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +
>  Return Value
>  ============
>  
> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> index 123a231001a8..d0bc8df18ad5 100644
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
> @@ -24,8 +26,12 @@
>   * @field:	used interlacing type (from enum v4l2_field)
>   * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
>   * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
>   * @quantization: quantization of the data (from enum v4l2_quantization)
>   * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> + * @reserved2:  two reserved bytes that can be later used
> + * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
> + * @reserved:  reserved bytes that can be later used
>   */
>  struct v4l2_mbus_framefmt {
>  	__u32			width;
> @@ -33,10 +39,17 @@ struct v4l2_mbus_framefmt {
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
> -	__u16			reserved[11];
> +	__u16			reserved2;
> +	__u32			flags;
> +	__u16			reserved[8];

Having to introduce a reserved2 field is pretty bad.

I would just make flags a __u16. If we ever need more than 16 bits, then it is easy
to add a flags2 field, but for now just stick to a __u16 flags field to avoid a
reserved2.

>  };
>  
>  #ifndef __KERNEL__
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 5d2a1dab7911..e93970a2a38f 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -65,19 +65,26 @@ struct v4l2_subdev_crop {
>  	__u32 reserved[8];
>  };
>  
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE	0x00000001
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC	0x00000002
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC	0x00000004
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION	0x00000008
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

