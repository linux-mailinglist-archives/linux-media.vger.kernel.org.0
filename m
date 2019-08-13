Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 282DE8BA96
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 15:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbfHMNm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 09:42:29 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35523 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728694AbfHMNm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 09:42:29 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xX43hLqdSqTdhxX4Ah9znk; Tue, 13 Aug 2019 15:42:22 +0200
Subject: Re: [PATCH v2 1/1] v4l: Documentation: Raw Bayer formats are not RGB
 formats
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20190813133232.5075-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ecc13f2e-a466-3a82-7669-6d33f9c81beb@xs4all.nl>
Date:   Tue, 13 Aug 2019 15:42:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190813133232.5075-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF0kP+3v9TnwsfJt10DYeyt5EDJjiaqAfdB+JBaurNoSMgSnlF2DFk3uG2zfTvDctonULBkn3rtWd4f3svm2j0GSLgwVbeq/iLlBBwOb4IL7yuXAAZ/U
 LbTlWI665yb4GtEzE8Iypo9AxwH2Y4+2NgLRxDEhfA30XGsdh5AGWV2GTOdRBCj1ebrjWmYh5T6RqBWrFizrlyWoyX67hrg++nrVpdvXwPm/u1jTB1efcQGk
 npLhVlahyKBe/uL3KybuWNEIUt3j12w+Jk3gVCIinFUO4fgGVjl4M2KRjA4fS2lI9OFYY9c1EloYJOpIv0AyPBg2q7rfND3jEFUFq251pps=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/13/19 3:32 PM, Sakari Ailus wrote:
> The raw Bayer formats have been listed under the label of RGB formats but
> in fact they're quite different. The latter are readily usable as such
> whereas the former require quite bit of image processing before useful.
> 
> Split them into RGB and raw Bayer formats.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
> since v1:
> 
> - Add description for raw Bayer formats
> 
> - Fix reference clash (rename _pixfmt-rgb to _pixfmt-bayer in
>   pixfmt-bayer.rst)
> 
> - Remove _rgb-formats: and refer to _pixfmt-rgb: instead. Same for
>   _rgb-formats-deprecated.
> 
>  Documentation/media/uapi/v4l/control.rst      |    2 +-
>  Documentation/media/uapi/v4l/hist-v4l2.rst    |    2 +-
>  .../v4l/{pixfmt-rgb.rst => pixfmt-bayer.rst}  |   18 +-
>  .../media/uapi/v4l/pixfmt-packed-rgb.rst      | 1306 -----------------
>  Documentation/media/uapi/v4l/pixfmt-rgb.rst   | 1302 +++++++++++++++-
>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    2 +-
>  Documentation/media/uapi/v4l/pixfmt.rst       |    1 +
>  7 files changed, 1305 insertions(+), 1328 deletions(-)
>  copy Documentation/media/uapi/v4l/{pixfmt-rgb.rst => pixfmt-bayer.rst} (60%)
>  delete mode 100644 Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst
> 
> diff --git a/Documentation/media/uapi/v4l/control.rst b/Documentation/media/uapi/v4l/control.rst
> index 71417bba028c6..ef62e088ff7ae 100644
> --- a/Documentation/media/uapi/v4l/control.rst
> +++ b/Documentation/media/uapi/v4l/control.rst
> @@ -295,7 +295,7 @@ Control IDs
>      Sets the alpha color component. When a capture device (or capture
>      queue of a mem-to-mem device) produces a frame format that includes
>      an alpha component (e.g.
> -    :ref:`packed RGB image formats <rgb-formats>`) and the alpha value
> +    :ref:`packed RGB image formats <pixfmt-rgb>`) and the alpha value
>      is not defined by the device or the mem-to-mem input data this
>      control lets you select the alpha component value of all pixels.
>      When an output device (or output queue of a mem-to-mem device)
> diff --git a/Documentation/media/uapi/v4l/hist-v4l2.rst b/Documentation/media/uapi/v4l/hist-v4l2.rst
> index 7d8e9efbeb1ed..9e097f34cb743 100644
> --- a/Documentation/media/uapi/v4l/hist-v4l2.rst
> +++ b/Documentation/media/uapi/v4l/hist-v4l2.rst
> @@ -900,7 +900,7 @@ V4L2 in Linux 2.6.19
>     :ref:`VIDIOC_ENUM_FRAMEINTERVALS`
>     were added.
>  
> -3. A new pixel format ``V4L2_PIX_FMT_RGB444`` (:ref:`rgb-formats`) was
> +3. A new pixel format ``V4L2_PIX_FMT_RGB444`` (:ref:`pixfmt-rgb`) was
>     added.
>  
>  
> diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-bayer.rst
> similarity index 60%
> copy from Documentation/media/uapi/v4l/pixfmt-rgb.rst
> copy to Documentation/media/uapi/v4l/pixfmt-bayer.rst
> index 48ab800248352..cfa2f4e3e1142 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-bayer.rst
> @@ -7,17 +7,25 @@
>  ..
>  .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>  
> -.. _pixfmt-rgb:
> +.. _pixfmt-bayer:
>  
> -***********
> -RGB Formats
> -***********
> +*****************
> +Raw Bayer Formats
> +*****************
> +
> +Description
> +===========
> +
> +The raw Bayer formats are used by image sensors before much if any processing is
> +performed on the image. The formats contain green, red and blue components, with
> +alternating lines of red and green, and blue and green pixels in different
> +orders. See also `the Wikipedia article on Bayer filter
> +<https://en.wikipedia.org/wiki/Bayer_filter>`__.
>  
>  
>  .. toctree::
>      :maxdepth: 1
>  
> -    pixfmt-packed-rgb
>      pixfmt-srggb8
>      pixfmt-srggb10
>      pixfmt-srggb10p
> diff --git a/Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst
> deleted file mode 100644
> index 738bb14c0ee28..0000000000000
> --- a/Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst
> +++ /dev/null
> @@ -1,1306 +0,0 @@
> -.. Permission is granted to copy, distribute and/or modify this
> -.. document under the terms of the GNU Free Documentation License,
> -.. Version 1.1 or any later version published by the Free Software
> -.. Foundation, with no Invariant Sections, no Front-Cover Texts
> -.. and no Back-Cover Texts. A copy of the license is included at
> -.. Documentation/media/uapi/fdl-appendix.rst.
> -..
> -.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
> -
> -.. _packed-rgb:
> -
> -******************
> -Packed RGB formats
> -******************
> -
> -Description
> -===========
> -
> -These formats are designed to match the pixel formats of typical PC
> -graphics frame buffers. They occupy 8, 16, 24 or 32 bits per pixel.
> -These are all packed-pixel formats, meaning all the data for a pixel lie
> -next to each other in memory.
> -
> -.. raw:: latex
> -
> -    \begingroup
> -    \tiny
> -    \setlength{\tabcolsep}{2pt}
> -
> -.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> -
> -
> -.. _rgb-formats:
> -
> -.. flat-table:: Packed RGB Image Formats
> -    :header-rows:  2
> -    :stub-columns: 0
> -
> -    * - Identifier
> -      - Code
> -      - :cspan:`7` Byte 0 in memory
> -      - :cspan:`7` Byte 1
> -      - :cspan:`7` Byte 2
> -      - :cspan:`7` Byte 3
> -    * -
> -      -
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
> -    * .. _V4L2-PIX-FMT-RGB332:
> -
> -      - ``V4L2_PIX_FMT_RGB332``
> -      - 'RGB1'
> -
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-ARGB444:
> -
> -      - ``V4L2_PIX_FMT_ARGB444``
> -      - 'AR12'
> -
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-XRGB444:
> -
> -      - ``V4L2_PIX_FMT_XRGB444``
> -      - 'XR12'
> -
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      -
> -      -
> -      -
> -      -
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-RGBA444:
> -
> -      - ``V4L2_PIX_FMT_RGBA444``
> -      - 'RA12'
> -
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-RGBX444:
> -
> -      - ``V4L2_PIX_FMT_RGBX444``
> -      - 'RX12'
> -
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -      -
> -      -
> -      -
> -
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-ABGR444:
> -
> -      - ``V4L2_PIX_FMT_ABGR444``
> -      - 'AB12'
> -
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-XBGR444:
> -
> -      - ``V4L2_PIX_FMT_XBGR444``
> -      - 'XB12'
> -
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      -
> -      -
> -      -
> -      -
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-BGRA444:
> -
> -      - ``V4L2_PIX_FMT_BGRA444``
> -      - 'BA12'
> -
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-BGRX444:
> -
> -      - ``V4L2_PIX_FMT_BGRX444``
> -      - 'BX12'
> -
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      -
> -      -
> -      -
> -      -
> -
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-ARGB555:
> -
> -      - ``V4L2_PIX_FMT_ARGB555``
> -      - 'AR15'
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - a
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      -
> -    * .. _V4L2-PIX-FMT-XRGB555:
> -
> -      - ``V4L2_PIX_FMT_XRGB555``
> -      - 'XR15'
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      -
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      -
> -    * .. _V4L2-PIX-FMT-RGBA555:
> -
> -      - ``V4L2_PIX_FMT_RGBA555``
> -      - 'RA15'
> -
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - a
> -
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      -
> -    * .. _V4L2-PIX-FMT-RGBX555:
> -
> -      - ``V4L2_PIX_FMT_RGBX555``
> -      - 'RX15'
> -
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      -
> -    * .. _V4L2-PIX-FMT-ABGR555:
> -
> -      - ``V4L2_PIX_FMT_ABGR555``
> -      - 'AB15'
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - a
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      -
> -    * .. _V4L2-PIX-FMT-XBGR555:
> -
> -      - ``V4L2_PIX_FMT_XBGR555``
> -      - 'XB15'
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      -
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      -
> -    * .. _V4L2-PIX-FMT-BGRA555:
> -
> -      - ``V4L2_PIX_FMT_BGRA555``
> -      - 'BA15'
> -
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - a
> -
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      -
> -    * .. _V4L2-PIX-FMT-BGRX555:
> -
> -      - ``V4L2_PIX_FMT_BGRX555``
> -      - 'BX15'
> -
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      -
> -
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      -
> -    * .. _V4L2-PIX-FMT-RGB565:
> -
> -      - ``V4L2_PIX_FMT_RGB565``
> -      - 'RGBP'
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      -
> -    * .. _V4L2-PIX-FMT-ARGB555X:
> -
> -      - ``V4L2_PIX_FMT_ARGB555X``
> -      - 'AR15' | (1 << 31)
> -
> -      - a
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-XRGB555X:
> -
> -      - ``V4L2_PIX_FMT_XRGB555X``
> -      - 'XR15' | (1 << 31)
> -
> -      -
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-RGB565X:
> -
> -      - ``V4L2_PIX_FMT_RGB565X``
> -      - 'RGBR'
> -
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-BGR24:
> -
> -      - ``V4L2_PIX_FMT_BGR24``
> -      - 'BGR3'
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-RGB24:
> -
> -      - ``V4L2_PIX_FMT_RGB24``
> -      - 'RGB3'
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-BGR666:
> -
> -      - ``V4L2_PIX_FMT_BGR666``
> -      - 'BGRH'
> -
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -    * .. _V4L2-PIX-FMT-ABGR32:
> -
> -      - ``V4L2_PIX_FMT_ABGR32``
> -      - 'AR24'
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - a\ :sub:`7`
> -      - a\ :sub:`6`
> -      - a\ :sub:`5`
> -      - a\ :sub:`4`
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -    * .. _V4L2-PIX-FMT-XBGR32:
> -
> -      - ``V4L2_PIX_FMT_XBGR32``
> -      - 'XR24'
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -    * .. _V4L2-PIX-FMT-BGRA32:
> -
> -      - ``V4L2_PIX_FMT_BGRA32``
> -      - 'RA24'
> -
> -      - a\ :sub:`7`
> -      - a\ :sub:`6`
> -      - a\ :sub:`5`
> -      - a\ :sub:`4`
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -    * .. _V4L2-PIX-FMT-BGRX32:
> -
> -      - ``V4L2_PIX_FMT_BGRX32``
> -      - 'RX24'
> -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -    * .. _V4L2-PIX-FMT-RGBA32:
> -
> -      - ``V4L2_PIX_FMT_RGBA32``
> -      - 'AB24'
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - a\ :sub:`7`
> -      - a\ :sub:`6`
> -      - a\ :sub:`5`
> -      - a\ :sub:`4`
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -    * .. _V4L2-PIX-FMT-RGBX32:
> -
> -      - ``V4L2_PIX_FMT_RGBX32``
> -      - 'XB24'
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -    * .. _V4L2-PIX-FMT-ARGB32:
> -
> -      - ``V4L2_PIX_FMT_ARGB32``
> -      - 'BA24'
> -
> -      - a\ :sub:`7`
> -      - a\ :sub:`6`
> -      - a\ :sub:`5`
> -      - a\ :sub:`4`
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -    * .. _V4L2-PIX-FMT-XRGB32:
> -
> -      - ``V4L2_PIX_FMT_XRGB32``
> -      - 'BX24'
> -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -      -
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -.. raw:: latex
> -
> -    \endgroup
> -
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
> -**Byte Order.**
> -Each cell is one byte.
> -
> -
> -.. raw:: latex
> -
> -    \small
> -
> -.. tabularcolumns:: |p{3.1cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|
> -
> -.. flat-table:: RGB byte order
> -    :header-rows:  0
> -    :stub-columns: 0
> -    :widths:       11 3 3 3 3 3 3 3 3 3 3 3 3
> -
> -    * - start + 0:
> -      - B\ :sub:`00`
> -      - G\ :sub:`00`
> -      - R\ :sub:`00`
> -      - B\ :sub:`01`
> -      - G\ :sub:`01`
> -      - R\ :sub:`01`
> -      - B\ :sub:`02`
> -      - G\ :sub:`02`
> -      - R\ :sub:`02`
> -      - B\ :sub:`03`
> -      - G\ :sub:`03`
> -      - R\ :sub:`03`
> -    * - start + 12:
> -      - B\ :sub:`10`
> -      - G\ :sub:`10`
> -      - R\ :sub:`10`
> -      - B\ :sub:`11`
> -      - G\ :sub:`11`
> -      - R\ :sub:`11`
> -      - B\ :sub:`12`
> -      - G\ :sub:`12`
> -      - R\ :sub:`12`
> -      - B\ :sub:`13`
> -      - G\ :sub:`13`
> -      - R\ :sub:`13`
> -    * - start + 24:
> -      - B\ :sub:`20`
> -      - G\ :sub:`20`
> -      - R\ :sub:`20`
> -      - B\ :sub:`21`
> -      - G\ :sub:`21`
> -      - R\ :sub:`21`
> -      - B\ :sub:`22`
> -      - G\ :sub:`22`
> -      - R\ :sub:`22`
> -      - B\ :sub:`23`
> -      - G\ :sub:`23`
> -      - R\ :sub:`23`
> -    * - start + 36:
> -      - B\ :sub:`30`
> -      - G\ :sub:`30`
> -      - R\ :sub:`30`
> -      - B\ :sub:`31`
> -      - G\ :sub:`31`
> -      - R\ :sub:`31`
> -      - B\ :sub:`32`
> -      - G\ :sub:`32`
> -      - R\ :sub:`32`
> -      - B\ :sub:`33`
> -      - G\ :sub:`33`
> -      - R\ :sub:`33`
> -
> -.. raw:: latex
> -
> -    \normalsize
> -
> -Formats defined in :ref:`rgb-formats-deprecated` are deprecated and
> -must not be used by new drivers. They are documented here for reference.
> -The meaning of their alpha bits ``(a)`` are ill-defined and interpreted as in
> -either the corresponding ARGB or XRGB format, depending on the driver.
> -
> -
> -.. raw:: latex
> -
> -    \begingroup
> -    \tiny
> -    \setlength{\tabcolsep}{2pt}
> -
> -.. tabularcolumns:: |p{2.6cm}|p{0.70cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> -
> -.. _rgb-formats-deprecated:
> -
> -.. flat-table:: Deprecated Packed RGB Image Formats
> -    :header-rows:  2
> -    :stub-columns: 0
> -
> -    * - Identifier
> -      - Code
> -      - :cspan:`7` Byte 0 in memory
> -
> -      - :cspan:`7` Byte 1
> -
> -      - :cspan:`7` Byte 2
> -
> -      - :cspan:`7` Byte 3
> -    * -
> -      -
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
> -    * .. _V4L2-PIX-FMT-RGB444:
> -
> -      - ``V4L2_PIX_FMT_RGB444``
> -      - 'R444'
> -
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-RGB555:
> -
> -      - ``V4L2_PIX_FMT_RGB555``
> -      - 'RGBO'
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - a
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      -
> -    * .. _V4L2-PIX-FMT-RGB555X:
> -
> -      - ``V4L2_PIX_FMT_RGB555X``
> -      - 'RGBQ'
> -
> -      - a
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -      -
> -    * .. _V4L2-PIX-FMT-BGR32:
> -
> -      - ``V4L2_PIX_FMT_BGR32``
> -      - 'BGR4'
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - a\ :sub:`7`
> -      - a\ :sub:`6`
> -      - a\ :sub:`5`
> -      - a\ :sub:`4`
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -    * .. _V4L2-PIX-FMT-RGB32:
> -
> -      - ``V4L2_PIX_FMT_RGB32``
> -      - 'RGB4'
> -
> -      - a\ :sub:`7`
> -      - a\ :sub:`6`
> -      - a\ :sub:`5`
> -      - a\ :sub:`4`
> -      - a\ :sub:`3`
> -      - a\ :sub:`2`
> -      - a\ :sub:`1`
> -      - a\ :sub:`0`
> -
> -      - r\ :sub:`7`
> -      - r\ :sub:`6`
> -      - r\ :sub:`5`
> -      - r\ :sub:`4`
> -      - r\ :sub:`3`
> -      - r\ :sub:`2`
> -      - r\ :sub:`1`
> -      - r\ :sub:`0`
> -
> -      - g\ :sub:`7`
> -      - g\ :sub:`6`
> -      - g\ :sub:`5`
> -      - g\ :sub:`4`
> -      - g\ :sub:`3`
> -      - g\ :sub:`2`
> -      - g\ :sub:`1`
> -      - g\ :sub:`0`
> -
> -      - b\ :sub:`7`
> -      - b\ :sub:`6`
> -      - b\ :sub:`5`
> -      - b\ :sub:`4`
> -      - b\ :sub:`3`
> -      - b\ :sub:`2`
> -      - b\ :sub:`1`
> -      - b\ :sub:`0`
> -
> -.. raw:: latex
> -
> -    \endgroup
> -
> -A test utility to determine which RGB formats a driver actually supports
> -is available from the LinuxTV v4l-dvb repository. See
> -`https://linuxtv.org/repo/ <https://linuxtv.org/repo/>`__ for access
> -instructions.
> diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> index 48ab800248352..4ce305cc45da2 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> @@ -13,18 +13,1292 @@
>  RGB Formats
>  ***********
>  
> +Description
> +===========
>  
> -.. toctree::
> -    :maxdepth: 1
> -
> -    pixfmt-packed-rgb
> -    pixfmt-srggb8
> -    pixfmt-srggb10
> -    pixfmt-srggb10p
> -    pixfmt-srggb10alaw8
> -    pixfmt-srggb10dpcm8
> -    pixfmt-srggb10-ipu3
> -    pixfmt-srggb12
> -    pixfmt-srggb12p
> -    pixfmt-srggb14p
> -    pixfmt-srggb16
> +These formats are designed to match the pixel formats of typical PC
> +graphics frame buffers. They occupy 8, 16, 24 or 32 bits per pixel.
> +These are all packed-pixel formats, meaning all the data for a pixel lie
> +next to each other in memory.
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
> +.. flat-table:: RGB Image Formats
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
> +    * .. _V4L2-PIX-FMT-RGB332:
> +
> +      - ``V4L2_PIX_FMT_RGB332``
> +      - 'RGB1'
> +
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-ARGB444:
> +
> +      - ``V4L2_PIX_FMT_ARGB444``
> +      - 'AR12'
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-XRGB444:
> +
> +      - ``V4L2_PIX_FMT_XRGB444``
> +      - 'XR12'
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      -
> +      -
> +      -
> +      -
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-RGBA444:
> +
> +      - ``V4L2_PIX_FMT_RGBA444``
> +      - 'RA12'
> +
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-RGBX444:
> +
> +      - ``V4L2_PIX_FMT_RGBX444``
> +      - 'RX12'
> +
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +      -
> +      -
> +      -
> +
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-ABGR444:
> +
> +      - ``V4L2_PIX_FMT_ABGR444``
> +      - 'AB12'
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-XBGR444:
> +
> +      - ``V4L2_PIX_FMT_XBGR444``
> +      - 'XB12'
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      -
> +      -
> +      -
> +      -
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-BGRA444:
> +
> +      - ``V4L2_PIX_FMT_BGRA444``
> +      - 'BA12'
> +
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-BGRX444:
> +
> +      - ``V4L2_PIX_FMT_BGRX444``
> +      - 'BX12'
> +
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      -
> +      -
> +      -
> +      -
> +
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-ARGB555:
> +
> +      - ``V4L2_PIX_FMT_ARGB555``
> +      - 'AR15'
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - a
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      -
> +    * .. _V4L2-PIX-FMT-XRGB555:
> +
> +      - ``V4L2_PIX_FMT_XRGB555``
> +      - 'XR15'
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      -
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      -
> +    * .. _V4L2-PIX-FMT-RGBA555:
> +
> +      - ``V4L2_PIX_FMT_RGBA555``
> +      - 'RA15'
> +
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - a
> +
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      -
> +    * .. _V4L2-PIX-FMT-RGBX555:
> +
> +      - ``V4L2_PIX_FMT_RGBX555``
> +      - 'RX15'
> +
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      -
> +    * .. _V4L2-PIX-FMT-ABGR555:
> +
> +      - ``V4L2_PIX_FMT_ABGR555``
> +      - 'AB15'
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - a
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      -
> +    * .. _V4L2-PIX-FMT-XBGR555:
> +
> +      - ``V4L2_PIX_FMT_XBGR555``
> +      - 'XB15'
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      -
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      -
> +    * .. _V4L2-PIX-FMT-BGRA555:
> +
> +      - ``V4L2_PIX_FMT_BGRA555``
> +      - 'BA15'
> +
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - a
> +
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      -
> +    * .. _V4L2-PIX-FMT-BGRX555:
> +
> +      - ``V4L2_PIX_FMT_BGRX555``
> +      - 'BX15'
> +
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      -
> +
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      -
> +    * .. _V4L2-PIX-FMT-RGB565:
> +
> +      - ``V4L2_PIX_FMT_RGB565``
> +      - 'RGBP'
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      -
> +    * .. _V4L2-PIX-FMT-ARGB555X:
> +
> +      - ``V4L2_PIX_FMT_ARGB555X``
> +      - 'AR15' | (1 << 31)
> +
> +      - a
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-XRGB555X:
> +
> +      - ``V4L2_PIX_FMT_XRGB555X``
> +      - 'XR15' | (1 << 31)
> +
> +      -
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-RGB565X:
> +
> +      - ``V4L2_PIX_FMT_RGB565X``
> +      - 'RGBR'
> +
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-BGR24:
> +
> +      - ``V4L2_PIX_FMT_BGR24``
> +      - 'BGR3'
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-RGB24:
> +
> +      - ``V4L2_PIX_FMT_RGB24``
> +      - 'RGB3'
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-BGR666:
> +
> +      - ``V4L2_PIX_FMT_BGR666``
> +      - 'BGRH'
> +
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +    * .. _V4L2-PIX-FMT-ABGR32:
> +
> +      - ``V4L2_PIX_FMT_ABGR32``
> +      - 'AR24'
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - a\ :sub:`7`
> +      - a\ :sub:`6`
> +      - a\ :sub:`5`
> +      - a\ :sub:`4`
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +    * .. _V4L2-PIX-FMT-XBGR32:
> +
> +      - ``V4L2_PIX_FMT_XBGR32``
> +      - 'XR24'
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +    * .. _V4L2-PIX-FMT-BGRA32:
> +
> +      - ``V4L2_PIX_FMT_BGRA32``
> +      - 'RA24'
> +
> +      - a\ :sub:`7`
> +      - a\ :sub:`6`
> +      - a\ :sub:`5`
> +      - a\ :sub:`4`
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +    * .. _V4L2-PIX-FMT-BGRX32:
> +
> +      - ``V4L2_PIX_FMT_BGRX32``
> +      - 'RX24'
> +
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +    * .. _V4L2-PIX-FMT-RGBA32:
> +
> +      - ``V4L2_PIX_FMT_RGBA32``
> +      - 'AB24'
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - a\ :sub:`7`
> +      - a\ :sub:`6`
> +      - a\ :sub:`5`
> +      - a\ :sub:`4`
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +    * .. _V4L2-PIX-FMT-RGBX32:
> +
> +      - ``V4L2_PIX_FMT_RGBX32``
> +      - 'XB24'
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +    * .. _V4L2-PIX-FMT-ARGB32:
> +
> +      - ``V4L2_PIX_FMT_ARGB32``
> +      - 'BA24'
> +
> +      - a\ :sub:`7`
> +      - a\ :sub:`6`
> +      - a\ :sub:`5`
> +      - a\ :sub:`4`
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +    * .. _V4L2-PIX-FMT-XRGB32:
> +
> +      - ``V4L2_PIX_FMT_XRGB32``
> +      - 'BX24'
> +
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +.. raw:: latex
> +
> +    \endgroup
> +
> +.. note:: Bit 7 is the most significant bit.
> +
> +The usage and value of the alpha bits (a) in the ARGB and ABGR formats
> +(collectively referred to as alpha formats) depend on the device type
> +and hardware operation. :ref:`Capture <capture>` devices (including
> +capture queues of mem-to-mem devices) fill the alpha component in
> +memory. When the device outputs an alpha channel the alpha component
> +will have a meaningful value. Otherwise, when the device doesn't output
> +an alpha channel but can set the alpha bit to a user-configurable value,
> +the :ref:`V4L2_CID_ALPHA_COMPONENT <v4l2-alpha-component>` control
> +is used to specify that alpha value, and the alpha component of all
> +pixels will be set to the value specified by that control. Otherwise a
> +corresponding format without an alpha component (XRGB or XBGR) must be
> +used instead of an alpha format.
> +
> +:ref:`Output <output>` devices (including output queues of mem-to-mem
> +devices and :ref:`video output overlay <osd>` devices) read the alpha
> +component from memory. When the device processes the alpha channel the
> +alpha component must be filled with meaningful values by applications.
> +Otherwise a corresponding format without an alpha component (XRGB or
> +XBGR) must be used instead of an alpha format.
> +
> +The XRGB and XBGR formats contain undefined bits (-). Applications,
> +devices and drivers must ignore those bits, for both
> +:ref:`capture` and :ref:`output` devices.
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. tabularcolumns:: |p{3.1cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|
> +
> +.. flat-table:: RGB byte order
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       11 3 3 3 3 3 3 3 3 3 3 3 3
> +
> +    * - start + 0:
> +      - B\ :sub:`00`
> +      - G\ :sub:`00`
> +      - R\ :sub:`00`
> +      - B\ :sub:`01`
> +      - G\ :sub:`01`
> +      - R\ :sub:`01`
> +      - B\ :sub:`02`
> +      - G\ :sub:`02`
> +      - R\ :sub:`02`
> +      - B\ :sub:`03`
> +      - G\ :sub:`03`
> +      - R\ :sub:`03`
> +    * - start + 12:
> +      - B\ :sub:`10`
> +      - G\ :sub:`10`
> +      - R\ :sub:`10`
> +      - B\ :sub:`11`
> +      - G\ :sub:`11`
> +      - R\ :sub:`11`
> +      - B\ :sub:`12`
> +      - G\ :sub:`12`
> +      - R\ :sub:`12`
> +      - B\ :sub:`13`
> +      - G\ :sub:`13`
> +      - R\ :sub:`13`
> +    * - start + 24:
> +      - B\ :sub:`20`
> +      - G\ :sub:`20`
> +      - R\ :sub:`20`
> +      - B\ :sub:`21`
> +      - G\ :sub:`21`
> +      - R\ :sub:`21`
> +      - B\ :sub:`22`
> +      - G\ :sub:`22`
> +      - R\ :sub:`22`
> +      - B\ :sub:`23`
> +      - G\ :sub:`23`
> +      - R\ :sub:`23`
> +    * - start + 36:
> +      - B\ :sub:`30`
> +      - G\ :sub:`30`
> +      - R\ :sub:`30`
> +      - B\ :sub:`31`
> +      - G\ :sub:`31`
> +      - R\ :sub:`31`
> +      - B\ :sub:`32`
> +      - G\ :sub:`32`
> +      - R\ :sub:`32`
> +      - B\ :sub:`33`
> +      - G\ :sub:`33`
> +      - R\ :sub:`33`
> +
> +.. raw:: latex
> +
> +    \normalsize
> +
> +Formats defined in :ref:`pixfmt-rgb-deprecated` are deprecated and
> +must not be used by new drivers. They are documented here for reference.
> +The meaning of their alpha bits ``(a)`` are ill-defined and interpreted as in
> +either the corresponding ARGB or XRGB format, depending on the driver.
> +
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \tiny
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. tabularcolumns:: |p{2.6cm}|p{0.70cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +
> +.. _pixfmt-rgb-deprecated:
> +
> +.. flat-table:: Deprecated Packed RGB Image Formats
> +    :header-rows:  2
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - :cspan:`7` Byte 0 in memory
> +
> +      - :cspan:`7` Byte 1
> +
> +      - :cspan:`7` Byte 2
> +
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
> +    * .. _V4L2-PIX-FMT-RGB444:
> +
> +      - ``V4L2_PIX_FMT_RGB444``
> +      - 'R444'
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-RGB555:
> +
> +      - ``V4L2_PIX_FMT_RGB555``
> +      - 'RGBO'
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - a
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      -
> +    * .. _V4L2-PIX-FMT-RGB555X:
> +
> +      - ``V4L2_PIX_FMT_RGB555X``
> +      - 'RGBQ'
> +
> +      - a
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      -
> +    * .. _V4L2-PIX-FMT-BGR32:
> +
> +      - ``V4L2_PIX_FMT_BGR32``
> +      - 'BGR4'
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - a\ :sub:`7`
> +      - a\ :sub:`6`
> +      - a\ :sub:`5`
> +      - a\ :sub:`4`
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +    * .. _V4L2-PIX-FMT-RGB32:
> +
> +      - ``V4L2_PIX_FMT_RGB32``
> +      - 'RGB4'
> +
> +      - a\ :sub:`7`
> +      - a\ :sub:`6`
> +      - a\ :sub:`5`
> +      - a\ :sub:`4`
> +      - a\ :sub:`3`
> +      - a\ :sub:`2`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +.. raw:: latex
> +
> +    \endgroup
> +
> +A test utility to determine which RGB formats a driver actually supports
> +is available from the LinuxTV v4l-dvb repository. See
> +`https://linuxtv.org/repo/ <https://linuxtv.org/repo/>`__ for access
> +instructions.
> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> index da6da2ef139a8..500916f751953 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> @@ -44,7 +44,7 @@ Single-planar format structure
>        - The pixel format or type of compression, set by the application.
>  	This is a little endian
>  	:ref:`four character code <v4l2-fourcc>`. V4L2 defines standard
> -	RGB formats in :ref:`rgb-formats`, YUV formats in
> +	RGB formats in :ref:`pixfmt-rgb`, YUV formats in
>  	:ref:`yuv-formats`, and reserved codes in
>  	:ref:`reserved-formats`
>      * - __u32
> diff --git a/Documentation/media/uapi/v4l/pixfmt.rst b/Documentation/media/uapi/v4l/pixfmt.rst
> index 29be001796dbc..a7d4cd43a298f 100644
> --- a/Documentation/media/uapi/v4l/pixfmt.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt.rst
> @@ -31,6 +31,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
>      pixfmt-intro
>      pixfmt-indexed
>      pixfmt-rgb
> +    pixfmt-bayer
>      yuv-formats
>      hsv-formats
>      depth-formats
> 

