Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455012B4343
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 13:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgKPMDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 07:03:37 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39125 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726238AbgKPMDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 07:03:36 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id edEJkeT2E6LFvedEMkPa0I; Mon, 16 Nov 2020 13:03:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605528214; bh=P6WI77AyqGnYdNL6fF5L8nPwS/SJHDCENzFFCkrlSUE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KN1L02gEDDxXD+UuF0089VrE0P2QIqz9zrcaBBaK5pbcUptIi+B1qtgY6Qc1evpX6
         WIJZ/VpXVy9qJaycLDUiNQe7FIWkiZU/o/CS1WapZYQvsLrBlnOVz88JG0hbx6dqkO
         /uvzDudlXSEhXNxwtHRFOPP9d/cG2vt9dlPcu3ceAq8sxfnmBl5VoTN5T9sNMh7yZf
         VomxvwE/oUQbfRbLajkXoTN+IhfURoI2dc+PIUVC7MXAqvNFAXHAzm0i85ocunNW1/
         yK8QS82y46hco7KDjC6pf/Gh+4uyUHHvLQlQpLUvTTPEM45mYO2ALpi49wTf6iY/BU
         USSGHxWEpdeng==
Subject: Re: [PATCH v2 15/19] media: v4l2: Add 10-, 12- and 16-bpc BGR formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201102224102.30292-16-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a2fd9dba-b0aa-7c27-21c4-127942548028@xs4all.nl>
Date:   Mon, 16 Nov 2020 13:03:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102224102.30292-16-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMVulGvjyFz6PzwBX4bRpj0VgNDUUQ3hNmJnC8MEdhvssoeGB8tJSKgTqh1gpo/3W0l2thC98KefYqb0weJqI9j05BFw/b/Plv1DxK/o3kHW3C3TusZu
 D9AfDiHCv6O/iMqfDF3SBi1KRJZkXChGgleZcMxjl9IT0W5N4+XQAlMavnDWy1xF/m/GqJt+NsNAb3w647ij+4v3sEYEXSCdAVkUtrep30+xosvgS93ujYcJ
 vmZms63oeJE/fW3KZuALaV/VlIGrmih3mC5nzrdp55P1TurC+UGHBcajv6JMmKdU2xLSlHpGFGLPQSSEEsjSUNr/0KqTwa+gcH+AAbiKjUKEeZNhDfg6n++5
 DQ7rlcqSbGMEvdBVAwMAMuL4bSe8QQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/11/2020 23:40, Laurent Pinchart wrote:
> Add three new pixel formats that store RGB data in BGR order with 10, 12
> and 16 bits per component. They are used by the Xilinx Video Frame
> Buffer Read/Write IP cores.
> 
> The nomenclature for these new formats follows the 8- and 16-bpp RGB
> formats and the DRM format naming conventions, which differs from the
> 24- and 32-bpp RGB formats in V4L2.
> 
> As the number of bits per pixel grows quite large, a table with one
> column per bit would be difficult to read. These formats are thus
> described with one column per byte.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Interleave component names and number of bits
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 69 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  5 ++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index 405d6f032078..846d307624fc 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -1079,6 +1079,75 @@ order of components as seen in a 24- or 32-bit little endian word.
>      \endgroup
>  
>  
> +More Than 8 Bits Per Component
> +==============================
> +
> +These formats store an RGB triplet in four bytes or more. Similarly to the 8-
> +and 16-bpp formats, they are named based on the order of the RGB components as
> +seen in a word, which is then stored in memory in little endian byte order, and
> +on the number of bits for each component. The component names and the
> +corresponding number of bits are interleaved for clarity.
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \tiny
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|
> +
> +
> +.. flat-table:: RGB Formats With More Than 8 Bits Per Component
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - Byte 0 in memory
> +      - Byte 1
> +      - Byte 2
> +      - Byte 3
> +      - Byte 4
> +      - Byte 5
> +    * .. _V4L2-PIX-FMT-X2B10G10R10:
> +
> +      - ``V4L2_PIX_FMT_X2B10G10R10``
> +      - 'XB30'
> +
> +      - R\ :sub:`7-0`
> +      - G\ :sub:`5-0` R\ :sub:`9-8`
> +      - B\ :sub:`3-0` G\ :sub:`9-6`
> +      - `-`\ :sub:`1-0` B\ :sub:`9-4`

Hmm, this is hard to read and understand.

The problem here is the use of '-' to indicate padding (unused) bits.

I was wondering whether it wouldn't be clearer to replace '-' by 'x' (for
an unused bit) or 'X' (for an unused byte) throughout these docs.

So this then becomes: X\ :sub:`1-0`.

It would also nicely correspond to the use of 'X' in the format name.

Regards,

	Hans

> +
> +      -
> +    * .. _V4L2-PIX-FMT-X4B12G12R12:
> +
> +      - ``V4L2_PIX_FMT_X4B12G12R12``
> +      - 'XB36'
> +
> +      - R\ :sub:`7-0`
> +      - G\ :sub:`3-0` R\ :sub:`11-8`
> +      - G\ :sub:`11-4`
> +      - B\ :sub:`7-0`
> +      - `-`\ :sub:`3-0` B\ :sub:`11-8`
> +
> +      -
> +    * .. _V4L2-PIX-FMT-B16G16R16:
> +
> +      - ``V4L2_PIX_FMT_B16G16R16``
> +      - 'XB48'
> +
> +      - R\ :sub:`7-0`
> +      - R\ :sub:`15-8`
> +      - G\ :sub:`7-0`
> +      - G\ :sub:`15-8`
> +      - B\ :sub:`7-0`
> +      - B\ :sub:`15-8`
> +
> +.. raw:: latex
> +
> +    \endgroup
> +
> +
>  Deprecated RGB Formats
>  ======================
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 54b9fe3b7636..fab1dbb1a618 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -558,6 +558,11 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB-8-8-8-8  */
>  #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB-8-8-8-8  */
>  
> +/* RGB formats (more than 8 bits per component) */
> +#define V4L2_PIX_FMT_X2B10G10R10 v4l2_fourcc('X', 'B', '3', '0') /* 32  XBGR-2-10-10-10 */
> +#define V4L2_PIX_FMT_X4B12G12R12 v4l2_fourcc('X', 'B', '3', '6') /* 40  XBGR-4-12-12-12 */
> +#define V4L2_PIX_FMT_B16G16R16 v4l2_fourcc('X', 'B', '4', '8') /* 48  BGR-16-16-16 */
> +
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
>  #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
> 

