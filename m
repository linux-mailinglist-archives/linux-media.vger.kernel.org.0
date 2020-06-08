Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090611F161F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 12:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbgFHKAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 06:00:38 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:51365 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729222AbgFHKAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 06:00:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iEZyjQ1DHCKzeiEa1jlUC6; Mon, 08 Jun 2020 12:00:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591610434; bh=izWnsrcY9dZmwbtBOdIBBRtB0p/T//50m8BLfByNCkM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=R3VCmfmOSYupXE1aN61eH7PVC04zHnaQzFl/woVwAMec+n21q+fwBzBSGrXkvFP5j
         4feWD/q62ZePOCPYKDacGqMRpGEqneX6xMG5MsA1tzqi84k6OZQYvz98pv70BOOxr4
         vbAZEAVEz+pS/3GB7i02iL6d92aAYUf1BKCV99kVckrr4FF/vkwIN1MS7EF+TR859j
         OhMshD+by2K+QbNXtNH3aaTcIxBJ8sYJAow8in7q3LW5X41nE/bOvwhhcz1r8a8aUz
         jKFDY6dNEGchj4e49VNT0SdHikc0mUSm7thAONgR0nDwT0FAaiFgwmn1HmPxFaB4E3
         Kg9ZOgcDXcjJA==
Subject: Re: [RFC v4 4/8] v4l2: add support for colorspace conversion API
 (CSC) for video capture and subdevices
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de, Hans Verkuil <hans.verkuil@cisco.com>
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
 <20200605172625.19777-5-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <973edb0c-4c52-c29c-4b22-54a05eca6f7a@xs4all.nl>
Date:   Mon, 8 Jun 2020 12:00:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200605172625.19777-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBGYQ0Mw9g8GcNp7QONh1Mv2y7k2gMYnl52OVNE4TYcegRDqBXxXmWZ6eum2D+TbCVnmyU5Qp1SbDNyU2PBv3phL97mXTum25NSGpM+KhYlehUM7fKYf
 zD4iekMytRVexTmfGWNccjlXY6HbkLgRUhaPQokO/8joTKHzkSS6f+yUxagQuqZx3W6Ztnc4EGi/h+Ps9rDIwlabDI9qVBmvXGITbkuv7GcyqLCQxWLUrssk
 fmCJ8wSMlmXwwB9t8dYPD6MuTpoTtmHZ6oWMC3GCn5s17N04K8YnAwSBWM4dhLOgnKpBtmTRvrCGJ3z8MwmOctEAB2osXxM02AGSpWM0DpEcWnRCyXvSJ03h
 ROLaDhjT9Q36C9PtuEoe7syUPrpq1Dj/cNhv9y7gxCm8BF7tZZtct1RuYSu5Cc92FYiRmv75P9j+cdIlih8850lxqKzdMWjyZWs0KLuFdP8l5wabbPcf6iRe
 pMGuFrrF4KVlvaU1OFnpaSbr7UEmBqK7a8bgcxl500HYVbmwc7EOT5imEcHWCtv7oEs/c65GR/99Md68Zj2tl2i8i+FEZRKXVebdYpfJRzdK4GC94FEpDTUJ
 qnmUTzNW4s9xQfVs0OAGZGzPe4GUPxeYV7IKSKyNTa0xv7HWopG3ne6pq/w2FcwNyfzGTj7FrbAfKnNpKtf35vvD
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/06/2020 19:26, Dafna Hirschfeld wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> For video capture it is the driver that reports the colorspace,
> Y'CbCr/HSV encoding, quantization range and transfer function
> used by the video, and there is no way to request something
> different, even though many HDTV receivers have some sort of
> colorspace conversion capabilities.
> 
> For output video this feature already exists since the application
> specifies this information for the video format it will send out, and
> the transmitter will enable any available CSC if a format conversion has
> to be performed in order to match the capabilities of the sink.
> 
> For video capture we propose adding new v4l2_pix_format flag:
> V4L2_PIX_FMT_FLAG_SET_CSC. The flag is set by the application,
> the driver will interpret the ycbcr_enc/hsv_enc, and quantization fields
> as the requested colorspace information and will attempt to
> do the conversion it supports.
> 
> Drivers set the flags
> V4L2_FMT_FLAG_CSC_YCBCR_ENC,
> V4L2_FMT_FLAG_CSC_HSV_ENC,
> V4L2_FMT_FLAG_CSC_QUANTIZATION,
> in the flags field of the struct v4l2_fmtdesc during enumeration to
> indicate that they support colorspace conversion for the respective field.
> Currently the conversion of the fields 'colorspace' and 'xfer_func' is not
> supported since there are no drivers that support it.
> 
> The same API is added for the subdevices. With the flag
> V4L2_MBUS_FRAMEFMT_SET_CSC set by the application in VIDIOC_SUBDEV_S_FMT
> ioctl and the flags V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC,
> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION set by the driver in the
> VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.
> 
> For subdevices, new 'flags' fields were added to the structs
> v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed from the
> 'reserved' field
> 
> Drivers do not have to actually look at the flagsr. If the flags are not

flagsr -> flags

> set, then the colorspace, ycbcr_enc and quantization fields are set to
> the default values by the core, i.e. just pass on the received format
> without conversion.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../media/v4l/pixfmt-v4l2-mplane.rst          | 16 ++----
>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   | 46 ++++++++++++++--
>  .../media/v4l/subdev-formats.rst              | 52 +++++++++++++++++--
>  .../media/v4l/vidioc-enum-fmt.rst             | 22 +++++++-
>  .../v4l/vidioc-subdev-enum-mbus-code.rst      | 28 ++++++++++
>  .../media/videodev2.h.rst.exceptions          |  3 ++
>  include/uapi/linux/v4l2-mediabus.h            |  5 +-
>  include/uapi/linux/v4l2-subdev.h              |  5 +-
>  include/uapi/linux/videodev2.h                |  4 ++
>  9 files changed, 160 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
> index 444b4082684c..66f3365d7b72 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
> @@ -105,29 +105,21 @@ describing all planes of that format.
>      * - __u8
>        - ``ycbcr_enc``
>        - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
> -        This information supplements the ``colorspace`` and must be set by
> -	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	See struct :c:type:`v4l2_pix_format`.
>      * - __u8
>        - ``hsv_enc``
>        - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
> -        This information supplements the ``colorspace`` and must be set by
> -	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	See struct :c:type:`v4l2_pix_format`.
>      * - }
>        -
>      * - __u8
>        - ``quantization``
>        - Quantization range, from enum :c:type:`v4l2_quantization`.
> -        This information supplements the ``colorspace`` and must be set by
> -	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	See struct :c:type:`v4l2_pix_format`.
>      * - __u8
>        - ``xfer_func``
>        - Transfer function, from enum :c:type:`v4l2_xfer_func`.
> -        This information supplements the ``colorspace`` and must be set by
> -	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	See struct :c:type:`v4l2_pix_format`.
>      * - __u8
>        - ``reserved[7]``
>        - Reserved for future extensions. Should be zeroed by drivers and
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
> index ffa539592822..f23404efd90f 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
> @@ -148,13 +148,29 @@ Single-planar format structure
>        - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
>          This information supplements the ``colorspace`` and must be set by
>  	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	streams, see :ref:`colorspaces`. If the application sets the
> +	flag ``V4L2_PIX_FMT_FLAG_SET_CSC`` then the application can set
> +	this field for a capture stream to request a specific Y'CbCr encoding
> +	for the captured image data. If the driver cannot handle requested
> +	conversion, it will return another supported encoding.
> +	This field is ignored for HSV pixelformats. The driver indicates that
> +	ycbcr_enc conversion is supported by setting the flag
> +	V4L2_FMT_FLAG_CSC_YCBCR_ENC in the corresponding struct
> +	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`

Missing period at the end.

>      * - __u32
>        - ``hsv_enc``
>        - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
>          This information supplements the ``colorspace`` and must be set by
>  	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	streams, see :ref:`colorspaces`. If the application sets the flag
> +	``V4L2_PIX_FMT_FLAG_SET_CSC`` then the application can set this
> +	field for a capture stream to request a specific HSV encoding for the
> +	captured image data. If the driver cannot handle requested
> +	conversion, it will return another supported encoding.
> +	This field is ignored for non-HSV pixelformats. The driver indicates
> +	that hsv_enc conversion is supported by setting the flag
> +	V4L2_FMT_FLAG_CSC_HSV_ENC in the corresponding struct
> +	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`

Missing period at the end.

>      * - }
>        -
>      * - __u32
> @@ -162,7 +178,14 @@ Single-planar format structure
>        - Quantization range, from enum :c:type:`v4l2_quantization`.
>          This information supplements the ``colorspace`` and must be set by
>  	the driver for capture streams and by the application for output
> -	streams, see :ref:`colorspaces`.
> +	streams, see :ref:`colorspaces`. If the application sets the flag
> +	``V4L2_PIX_FMT_FLAG_SET_CSC`` then the application can set
> +	this field for a capture stream to request a specific quantization
> +	range for the captured image data. If the driver cannot handle requested
> +	conversion, it will return another supported encoding.
> +	The driver indicates that quantization conversion is supported by setting
> +	the flag V4L2_FMT_FLAG_CSC_QUANTIZATION in the corresponding struct
> +	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`

Missing period at the end.

>      * - __u32
>        - ``xfer_func``
>        - Transfer function, from enum :c:type:`v4l2_xfer_func`.
> @@ -186,3 +209,20 @@ Single-planar format structure
>  	by RGBA values (128, 192, 255, 128), the same pixel described with
>  	premultiplied colors would be described by RGBA values (64, 96,
>  	128, 128)
> +    * .. _`v4l2-pix-fmt-flag-set-csc`:
> +
> +      - ``V4L2_PIX_FMT_FLAG_SET_CSC``
> +      - 0x00000002
> +      - Set by the application. It is only used for capture and is
> +        ignored for output streams. If set, then request the device to do
> +	colorspace conversion from the received colorspace to the requested
> +	colorspace values. If colorimetry field (``ycncr_enc``, ``hsv_enc``

ycncr_enc -> ycbcr_enc

> +	or ``quantization``) is set to 0, then that colorimetry setting will
> +	remain unchanged from what was received. So to change the quantization
> +	only the ``quantization`` field shall be set to non-zero values
> +	(``V4L2_QUANTIZATION_FULL_RANGE`` or ``V4L2_QUANTIZATION_LIM_RANGE``)
> +	and all other colorimetry fields shall be set to 0. The API does not

does not -> does not (yet)

> +	support the conversion of the fields ``colorspace`` and ``xfer_func``

Missing period at the end.

> +
> +	To check which conversions are supported by the hardware for the current
> +	pixel format, see :ref:`fmtdesc-flags`.
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 9a4d61b0d76f..75eb7f8bb4c5 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -49,13 +49,32 @@ Media Bus Formats
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
> +	See :ref:`v4l2-subdev-mbus-code-flags`

Missing period at the end.

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
> +	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`

Missing period at the end.

> +
>      * - __u16
>        - ``xfer_func``
>        - Transfer function, from enum :c:type:`v4l2_xfer_func`.
> @@ -63,10 +82,37 @@ Media Bus Formats
>  	the driver for capture streams and by the application for output
>  	streams, see :ref:`colorspaces`.
>      * - __u16
> -      - ``reserved``\ [11]
> +      - ``flags``
> +      - flags See:  :ref:v4l2-mbus-framefmt-flags
> +    * - __u16
> +      - ``reserved``\ [10]
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
> +      - 0x0001
> +      - Set by the application. It is only used for capture and is
> +	ignored for output streams. If set, then request the subdevice to do
> +	colorspace conversion from the received colorspace to the requested
> +	colorspace values. If colorimetry field (``ycbcr_enc`` or
> +	``quantization``) is set to 0, then that colorimetry setting will remain
> +	unchanged from what was received. So to change the quantization, only the
> +	``quantization`` field shall be set to non-zero values
> +	(``V4L2_QUANTIZATION_FULL_RANGE`` or ``V4L2_QUANTIZATION_LIM_RANGE``)
> +	and all other colorimetry fields shall be set to 0. The API does not
> +	support the conversion of the fields ``colorspace`` and ``xfer_func``.
> +
> +	To check which conversions are supported by the hardware for the current
> +	media bus frame format, see :ref:`v4l2-mbus-framefmt-flags`.
>  
>  
>  .. _v4l2-mbus-pixelcode:
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index a53dd3d7f7e2..11323755d41b 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -178,7 +178,27 @@ the ``mbus_code`` field is handled differently:
>  	parameters are detected. This flag can only be used in combination
>  	with the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
>  	compressed formats only. It is also only applies to stateful codecs.
> -
> +    * - ``V4L2_FMT_FLAG_CSC_YCBCR_ENC``
> +      - 0x0010
> +      - The driver allows the application to try to change the default
> +	Y'CbCr encoding. This flag is relevant only for capture devices.
> +	The application can ask to configure the ycbcr_enc of the capture device
> +	when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
> +	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
> +    * - ``V4L2_FMT_FLAG_CSC_HSV_ENC``
> +      - 0x0010
> +      - The driver allows the application to try to change the default
> +	HSV encoding. This flag is relevant only for capture devices.
> +	The application can ask to configure the hsv_enc of the capture device
> +	when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
> +	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
> +    * - ``V4L2_FMT_FLAG_CSC_QUANTIZATION``
> +      - 0x0020
> +      - The driver allows the application to try to change the default
> +	quantization. This flag is relevant only for capture devices.
> +	The application can ask to configure the quantization of the capture
> +	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
> +	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
>  
>  Return Value
>  ============
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> index 35b8607203a4..3d3430bdd71f 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> @@ -78,12 +78,40 @@ information about the try formats.
>        - ``which``
>        - Media bus format codes to be enumerated, from enum
>  	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> +    * - __u32
> +      - ``flags``
> +      - See :ref:`v4l2-subdev-mbus-code-flags`
>      * - __u32
>        - ``reserved``\ [8]

'[8]' should now be changed to '[7]'.

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
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
> +      - 0x00000001
> +      - The driver allows the application to try to change the default Y'CbCr
> +	encoding. The application can ask to configure the ycbcr_enc of the
> +	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +    * - V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION
> +      - 0x00000002
> +      - The driver allows the application to try to change the default
> +	quantization. The application can ask to configure the quantization of
> +	the subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
> +	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
> +	See :ref:`v4l2-mbus-format` on how to do this.
> +
>  Return Value
>  ============
>  
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 564a3bf5bc6d..f7be008cd479 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -187,6 +187,9 @@ replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
>  replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
>  replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
> +replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
> +replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
> +replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>  
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> index 123a231001a8..0f916278137a 100644
> --- a/include/uapi/linux/v4l2-mediabus.h
> +++ b/include/uapi/linux/v4l2-mediabus.h
> @@ -16,6 +16,8 @@
>  #include <linux/types.h>
>  #include <linux/videodev2.h>
>  
> +#define V4L2_MBUS_FRAMEFMT_SET_CSC	0x0001
> +
>  /**
>   * struct v4l2_mbus_framefmt - frame format on the media bus
>   * @width:	image width
> @@ -36,7 +38,8 @@ struct v4l2_mbus_framefmt {
>  	__u16			ycbcr_enc;
>  	__u16			quantization;
>  	__u16			xfer_func;
> -	__u16			reserved[11];
> +	__u16			flags;
> +	__u16			reserved[10];
>  };
>  
>  #ifndef __KERNEL__
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 5d2a1dab7911..972e64d8b54e 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -65,6 +65,8 @@ struct v4l2_subdev_crop {
>  	__u32 reserved[8];
>  };
>  
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC	0x00000001
> +#define V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION	0x00000002
>  /**
>   * struct v4l2_subdev_mbus_code_enum - Media bus format enumeration
>   * @pad: pad number, as reported by the media API
> @@ -77,7 +79,8 @@ struct v4l2_subdev_mbus_code_enum {
>  	__u32 index;
>  	__u32 code;
>  	__u32 which;
> -	__u32 reserved[8];
> +	__u32 flags;
> +	__u32 reserved[7];
>  };
>  
>  /**
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c3a1cf1c507f..15824316e0ca 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -774,6 +774,7 @@ struct v4l2_pix_format {
>  
>  /* Flags */
>  #define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA	0x00000001
> +#define V4L2_PIX_FMT_FLAG_SET_CSC	0x00000002
>  
>  /*
>   *	F O R M A T   E N U M E R A T I O N
> @@ -792,6 +793,9 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_EMULATED			0x0002
>  #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
>  #define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
> +#define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0010
> +#define V4L2_FMT_FLAG_CSC_HSV_ENC		0x0010
> +#define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0020
>  
>  	/* Frame Size and frame rate enumeration */
>  /*
> 

Regards,

	Hans
