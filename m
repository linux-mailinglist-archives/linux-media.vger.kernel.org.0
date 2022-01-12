Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C016548C82C
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 17:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245467AbiALQWA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 11:22:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243649AbiALQV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 11:21:59 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25979340;
        Wed, 12 Jan 2022 17:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642004518;
        bh=ZW3ETm1MzODOrkFmFW/ElfspZEWfb4Lg14fYtn9Pzp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aM00dXvTMCpQMHoaVvCyaGiQYyHtwzSc2VqgfZzPTWAx7tTWVFqMJpb0+FhknriIh
         UX0e201bHzN8/YOJrV++3vEDGKkGezvndEijattajelx2TkwjWGmlA+zkF//Vd4gIY
         achpaccX3OthyyV+1VF5xc5KU1AwqoTsjsMNqDTU=
Date:   Wed, 12 Jan 2022 18:21:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, dave.stevenson@raspberrypi.com
Subject: Re: [PATCH 3/3] media: v4l: Add V4L2-PIX-FMT-Y14P format
Message-ID: <Yd8AG3bQpJu+RHpK@pendragon.ideasonboard.com>
References: <20220112161014.972076-1-jeanmichel.hautbois@ideasonboard.com>
 <20220112161014.972076-4-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220112161014.972076-4-jeanmichel.hautbois@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel

Thank you for the patch.

On Wed, Jan 12, 2022 at 05:10:14PM +0100, Jean-Michel Hautbois wrote:
> This is a packed grey-scale image format with a depth of 14 bits per
> pixel. Every four consecutive samples are packed into seven bytes. Each
> of the first four bytes contain the eight high order bits of the pixels,
> and the three following bytes contains the six least significants bits
> of each pixel, in the same order.
> 
> As the other formats only needed 5 bytes before, append two bytes in the
> documentation array.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-yuv-luma.rst             | 33 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  3 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index d37ce6027095..1f645fde6d5c 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -36,6 +36,8 @@ are often referred to as greyscale formats.
>        - Byte 2
>        - Byte 3
>        - Byte 4
> +      - Byte 5
> +      - Byte 6
>  
>      * .. _V4L2-PIX-FMT-GREY:
>  
> @@ -47,6 +49,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y10:
>  
> @@ -58,6 +62,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y10BPACK:
>  
> @@ -69,6 +75,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`2`\ [9:6]
>        - Y'\ :sub:`2`\ [5:0] Y'\ :sub:`3`\ [9:8]
>        - Y'\ :sub:`3`\ [7:0]
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y10P:
>  
> @@ -80,6 +88,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`2`\ [9:2]
>        - Y'\ :sub:`3`\ [9:2]
>        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y12:
>  
> @@ -91,6 +101,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y12P:
>  
> @@ -102,6 +114,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [3:0]
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y14:
>  
> @@ -113,6 +127,21 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
> +
> +    * .. _V4L2-PIX-FMT-Y14P:
> +
> +      - ``V4L2_PIX_FMT_Y14P``
> +      - 'Y14P'
> +
> +      - Y'\ :sub:`0`\ [13:6]
> +      - Y'\ :sub:`1`\ [13:6]
> +      - Y'\ :sub:`2`\ [13:6]
> +      - Y'\ :sub:`3`\ [13:6]
> +      - Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [5:0]
> +      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [5:2]
> +      - Y'\ :sub:`3`\ [5:0] Y'\ :sub:`2`\ [1:0]

This should be

      - Y'\ :sub:`3`\ [5:0] Y'\ :sub:`2`\ [5:4]

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>      * .. _V4L2-PIX-FMT-Y16:
>  
> @@ -124,6 +153,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y16-BE:
>  
> @@ -135,6 +166,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>  .. raw:: latex
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e90979af8efb..4e33b86c6d27 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1264,6 +1264,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>  	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
> +	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 39ab8c216fe8..581537ce12a3 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -570,6 +570,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
>  #define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
> +#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Greyscale, MIPI RAW12 packed */
>  
>  /* Palette formats */
>  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */

-- 
Regards,

Laurent Pinchart
