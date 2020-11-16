Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129F02B432A
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 12:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgKPLv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 06:51:28 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57429 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726487AbgKPLv2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 06:51:28 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ed2VkeN7a6LFved2YkPW6s; Mon, 16 Nov 2020 12:51:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605527483; bh=wvpXY1bXqvPfXUmkeTEBtjHNVUl+owQFp7js4a8sUoM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Qrx67PAA53UfbyjtRF8dHd6NJ8tkoZzskYxXhyboLg5qZ19Y9qaHrE1aHEXdM6+b/
         //YahHrVQ1Zw5A0LneKU3gpeF6lc2yVFhDtDk3JibzsqDJagLdXiWQ1L14JvVYZbhM
         YX5Ny7PlfKeNu+ARJr6MFO56SEAE1y8LyK1S1qRx6i7ld34u9dnA74zvAePXondMTe
         vFW4Olzz7O6+gII40uj+bIcXy3a4rqK91vXBd1EKoi07bdPwnPBn82hgC51BgAggnG
         TQFtlle92mKmqOUjlJcqNq++f1BXsHVLpa3ios8ddsiDedOCSFgNULVvvFpeuGydRV
         eDSmzgTHngVBw==
Subject: Re: [PATCH v2 06/19] media: doc: pixfmt-rgb: Clarify naming scheme
 for RGB formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201102224102.30292-7-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ae3848f7-9742-53d1-f476-03b4ded32073@xs4all.nl>
Date:   Mon, 16 Nov 2020 12:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102224102.30292-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKlvBjyEjO1ob4OEURDaGFbqqitGwbfq0Ul71bS2Pr46Hn6o9sliNbBbZZKBJl8ooQcyF0LEzCbR3HdX4gqpZ9fQhB2HORgBrF0J5xhOF2FHxIuolk6p
 3gLJ1Y9lhjTwzSScqZ/CYFMAqdnuoH0W+lbOH7cXvJBg7GGiK2ynWfM6IxwhZs+mjOhC3b/K2+rJ54fGsTvnj6dztwWVWsJ1T53lUueLZ456ol/ajhcAIxXh
 3DmggIRZOzdjBVRziHoQPKQGIXi9cp4VIjMUvHCS8b/DyC7gQO8C+DyKcPyx8YTNfQ4nEiWkYfobfvgJwFSmq7/PXNiW3bEiKdaRrsMfPH7EDacPXrIxuzWq
 Iu7GhEW1Hiis2tDw4oY6ifszJAGsuQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/11/2020 23:40, Laurent Pinchart wrote:
> The naming scheme for the RGB pixel formats has been developed
> organically, and isn't consistent between formats stored in 1 or 2
> bytes, and formats stored in 3 or 4 bytes. For the latter category, the
> names use a components order convention that is the opposite of the
> first category, and the opposite of DRM pixel formats. This has led to
> lots of confusion in the past, and would really benefit from being
> explained more precisely. Do so, which also prepares for the addition of
> additional RGB pixels formats.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Clarify padding and padding requirements
> - Fix typo
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 195 ++++++++++++------
>  include/uapi/linux/videodev2.h                |   4 +-
>  2 files changed, 140 insertions(+), 59 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index 5045895e85e1..405d6f032078 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -6,13 +6,62 @@
>  RGB Formats
>  ***********
>  
> -Description
> -===========
> +These formats encode each pixel as a triplet of RGB values. They are packed
> +formats, meaning that the RGB values for one pixel are stored consecutively in
> +memory and each pixel consumes an integer number of bytes. When the number of
> +bits required to store a pixel is not aligned to a byte boundary, the data is
> +padded with additional bits to fill the remaining byte.
>  
> -These formats are designed to match the pixel formats of typical PC
> -graphics frame buffers. They occupy 8, 16, 24 or 32 bits per pixel.
> -These are all packed-pixel formats, meaning all the data for a pixel lie
> -next to each other in memory.
> +The formats differ by the number of bits per RGB component (typically but not
> +always the same for all components), the order of components in memory, and the
> +presence of an alpha component or additional padding bits.
> +
> +The usage and value of the alpha bits in formats that support them (named ARGB
> +or a permutation thereof, collectively referred to as alpha formats) depend on
> +the device type and hardware operation. :ref:`Capture <capture>` devices
> +(including capture queues of mem-to-mem devices) fill the alpha component in
> +memory. When the device captures an alpha channel the alpha component will have
> +a meaningful value. Otherwise, when the device doesn't capture an alpha channel
> +but can set the alpha bit to a user-configurable value, the
> +:ref:`V4L2_CID_ALPHA_COMPONENT <v4l2-alpha-component>` control is used to
> +specify that alpha value, and the alpha component of all pixels will be set to
> +the value specified by that control. Otherwise a corresponding format without
> +an alpha component (XRGB or XBGR) must be used instead of an alpha format.
> +
> +:ref:`Output <output>` devices (including output queues of mem-to-mem devices
> +and :ref:`video output overlay <osd>` devices) read the alpha component from
> +memory. When the device processes the alpha channel the alpha component must be
> +filled with meaningful values by applications. Otherwise a corresponding format
> +without an alpha component (XRGB or XBGR) must be used instead of an alpha
> +format.
> +
> +Formats that contain padding bits are named XRGB (or a permutation thereof).
> +The padding bits contain undefined values and must be ignored by applications,
> +devices and drivers, for both :ref:`capture` and :ref:`output` devices.
> +
> +.. note::
> +
> +   - In all the tables that follow, bit 7 is the most significant bit in a byte.
> +   - 'r', 'g' and 'b' denote bits of the red, green and blue components
> +     respectively. 'a' denotes bits of the alpha component (if supported by the
> +     format), and '-' denotes padding bits.
> +
> +
> +8 or 16 Bits Per Pixel
> +======================
> +
> +These formats store an RGB triplet in one or two bytes. They are named based on
> +the order of the RGB components as seen in a 8- or 16-bit word, which is then
> +stored in memory in little endian byte order (unless otherwise noted by the
> +presence of bit 31 in the 4CC value), and on the number of bits for each
> +component. For instance, the RGB565 format stores a pixel in a 16-bit word
> +[15:0] laid out at as [R\ :sub:`4` R\ :sub:`3` R\ :sub:`2` R\ :sub:`1`
> +R\ :sub:`0` G\ :sub:`5` G\ :sub:`4` G\ :sub:`3` G\ :sub:`2` G\ :sub:`1`
> +G\ :sub:`0` B\ :sub:`4` B\ :sub:`3` B\ :sub:`2` B\ :sub:`1` B\ :sub:`0`], and
> +stored in memory in two bytes, [R\ :sub:`4` R\ :sub:`3` R\ :sub:`2` R\ :sub:`1`
> +R\ :sub:`0` G\ :sub:`5` G\ :sub:`4` G\ :sub:`3`] followed by [G\ :sub:`2`
> +G\ :sub:`1` G\ :sub:`0` B\ :sub:`4` B\ :sub:`3` B\ :sub:`2` B\ :sub:`1`
> +B\ :sub:`0`].
>  
>  .. raw:: latex
>  
> @@ -20,10 +69,10 @@ next to each other in memory.
>      \tiny
>      \setlength{\tabcolsep}{2pt}
>  
> -.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
>  
>  
> -.. flat-table:: RGB Image Formats
> +.. flat-table:: RGB Formats With 8 or 16 Bits Per Pixel
>      :header-rows:  2
>      :stub-columns: 0
>  
> @@ -31,8 +80,6 @@ next to each other in memory.
>        - Code
>        - :cspan:`7` Byte 0 in memory
>        - :cspan:`7` Byte 1
> -      - :cspan:`7` Byte 2
> -      - :cspan:`7` Byte 3
>      * -
>        -
>        - 7
> @@ -52,24 +99,6 @@ next to each other in memory.
>        - 2
>        - 1
>        - 0
> -
> -      - 7
> -      - 6
> -      - 5
> -      - 4
> -      - 3
> -      - 2
> -      - 1
> -      - 0
> -
> -      - 7
> -      - 6
> -      - 5
> -      - 4
> -      - 3
> -      - 2
> -      - 1
> -      - 0
>      * .. _V4L2-PIX-FMT-RGB332:
>  
>        - ``V4L2_PIX_FMT_RGB332``
> @@ -544,6 +573,82 @@ next to each other in memory.
>        - b\ :sub:`1`
>        - b\ :sub:`0`
>        -
> +
> +.. raw:: latex
> +
> +    \endgroup
> +
> +
> +24 or 32 Bits Per Pixel

Wouldn't it be better to call this "8 Bits Per Component"? Since we'll later get
a section called "More Than 8 Bits Per Component".

Regards,

	Hans

> +=======================
> +
> +These formats store an RGB triplet in three or four bytes. They are named based
> +on the order of the RGB components as stored in memory, and on the total number
> +of bits per pixel (with an exception for the BGR666 format). For instance,
> +RGB24 format stores a pixel with [R\ :sub:`7` R\ :sub:`6` R\ :sub:`5`
> +R\ :sub:`4` R\ :sub:`3` R\ :sub:`2` R\ :sub:`1` R\ :sub:`0`] in the first byte,
> +[G\ :sub:`7` G\ :sub:`6` G\ :sub:`5` G\ :sub:`4` G\ :sub:`3` G\ :sub:`2`
> +G\ :sub:`1` G\ :sub:`0`] in the second byte and [B\ :sub:`7` B\ :sub:`6`
> +B\ :sub:`5` B\ :sub:`4` B\ :sub:`3` B\ :sub:`2` B\ :sub:`1` B\ :sub:`0`] in the
> +third byte. This differs from the DRM format nomenclature that instead use the
> +order of components as seen in a 24- or 32-bit little endian word.
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \tiny
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +
> +
> +.. flat-table:: RGB Formats With 24 or 32 Bits Per Pixel
> +    :header-rows:  2
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - :cspan:`7` Byte 0 in memory
> +      - :cspan:`7` Byte 1
> +      - :cspan:`7` Byte 2
> +      - :cspan:`7` Byte 3
> +    * -
> +      -
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
>      * .. _V4L2-PIX-FMT-BGR24:
>  
>        - ``V4L2_PIX_FMT_BGR24``
> @@ -973,40 +1078,14 @@ next to each other in memory.
>  
>      \endgroup
>  
> -.. note:: Bit 7 is the most significant bit.
> -
> -The usage and value of the alpha bits (a) in the ARGB and ABGR formats
> -(collectively referred to as alpha formats) depend on the device type
> -and hardware operation. :ref:`Capture <capture>` devices (including
> -capture queues of mem-to-mem devices) fill the alpha component in
> -memory. When the device outputs an alpha channel the alpha component
> -will have a meaningful value. Otherwise, when the device doesn't output
> -an alpha channel but can set the alpha bit to a user-configurable value,
> -the :ref:`V4L2_CID_ALPHA_COMPONENT <v4l2-alpha-component>` control
> -is used to specify that alpha value, and the alpha component of all
> -pixels will be set to the value specified by that control. Otherwise a
> -corresponding format without an alpha component (XRGB or XBGR) must be
> -used instead of an alpha format.
> -
> -:ref:`Output <output>` devices (including output queues of mem-to-mem
> -devices and :ref:`video output overlay <osd>` devices) read the alpha
> -component from memory. When the device processes the alpha channel the
> -alpha component must be filled with meaningful values by applications.
> -Otherwise a corresponding format without an alpha component (XRGB or
> -XBGR) must be used instead of an alpha format.
> -
> -The XRGB and XBGR formats contain undefined bits (-). Applications,
> -devices and drivers must ignore those bits, for both
> -:ref:`capture` and :ref:`output` devices.
> -
>  
>  Deprecated RGB Formats
>  ======================
>  
> -Formats defined in :ref:`pixfmt-rgb-deprecated` are deprecated and
> -must not be used by new drivers. They are documented here for reference.
> -The meaning of their alpha bits ``(a)`` are ill-defined and interpreted as in
> -either the corresponding ARGB or XRGB format, depending on the driver.
> +Formats defined in :ref:`pixfmt-rgb-deprecated` are deprecated and must not be
> +used by new drivers. They are documented here for reference. The meaning of
> +their alpha bits ``(a)`` is ill-defined and they are interpreted as in either
> +the corresponding ARGB or XRGB format, depending on the driver.
>  
>  .. raw:: latex
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 8775aebb3b6b..54b9fe3b7636 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -517,7 +517,7 @@ struct v4l2_pix_format {
>  
>  /*      Pixel format         FOURCC                          depth  Description  */
>  
> -/* RGB formats */
> +/* RGB formats (1 or 2 bytes per pixel) */
>  #define V4L2_PIX_FMT_RGB332  v4l2_fourcc('R', 'G', 'B', '1') /*  8  RGB-3-3-2     */
>  #define V4L2_PIX_FMT_RGB444  v4l2_fourcc('R', '4', '4', '4') /* 16  xxxxrrrr ggggbbbb */
>  #define V4L2_PIX_FMT_ARGB444 v4l2_fourcc('A', 'R', '1', '2') /* 16  aaaarrrr ggggbbbb */
> @@ -542,6 +542,8 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_ARGB555X v4l2_fourcc_be('A', 'R', '1', '5') /* 16  ARGB-5-5-5 BE */
>  #define V4L2_PIX_FMT_XRGB555X v4l2_fourcc_be('X', 'R', '1', '5') /* 16  XRGB-5-5-5 BE */
>  #define V4L2_PIX_FMT_RGB565X v4l2_fourcc('R', 'G', 'B', 'R') /* 16  RGB-5-6-5 BE  */
> +
> +/* RGB formats (3 or 4 bytes per pixel) */
>  #define V4L2_PIX_FMT_BGR666  v4l2_fourcc('B', 'G', 'R', 'H') /* 18  BGR-6-6-6	  */
>  #define V4L2_PIX_FMT_BGR24   v4l2_fourcc('B', 'G', 'R', '3') /* 24  BGR-8-8-8     */
>  #define V4L2_PIX_FMT_RGB24   v4l2_fourcc('R', 'G', 'B', '3') /* 24  RGB-8-8-8     */
> 

