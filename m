Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278333445C1
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 14:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhCVNbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 09:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhCVNal (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 09:30:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC93EC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 06:30:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FE8DAD6;
        Mon, 22 Mar 2021 14:30:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616419837;
        bh=+1f1ihXhrLp47+y78E8UK3i1NJWdnYNG2eDyOrf2Pak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b8G58pqVJrxUnKfBeXsT/u2KRPVNOY7UAiYXK8L8I3xDjHq47hXdF55RZCdLuiMcU
         7Ql+JGRa2AEDynj4n1cukLMUb91fkRuRXvOlbxJl2ujAvOwlspFb3/40F5b1aam2gT
         mHFdW5eeE+8IxDuKfHMqjY5MEOpm8LOjMC8PNW9k=
Date:   Mon, 22 Mar 2021 15:29:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Edgar Thier <info@edgarthier.net>
Cc:     sakari.ailus@iki.fi,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] v4l: Add 12-bit raw bayer linear packed formats
Message-ID: <YFib1BNtNYSp2m7W@pendragon.ideasonboard.com>
References: <20190708060225.5172-1-info@edgarthier.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190708060225.5172-1-info@edgarthier.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Edgar,

I've just been notified that I had forgotten about this patch series :-S
Mea culpa.

On Mon, Jul 08, 2019 at 08:02:25AM +0200, Edgar Thier wrote:
> These formats are compressed 12-bit raw bayer formats with four different
> pixel orders. The pixel follow one another without any padding,

s/pixel follow/pixels follow/

> thus are packed in a 'linear' fashion.
> 
> Signed-off-by: Edgar Thier <info@edgarthier.net>
> ---
>  Documentation/media/uapi/v4l/pixfmt-rgb.rst   |  1 +
>  .../media/uapi/v4l/pixfmt-srggb12lp.rst       | 76 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +
>  include/uapi/linux/videodev2.h                |  7 ++
>  4 files changed, 88 insertions(+)
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> index 48ab80024835..9efa500c02dc 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> @@ -26,5 +26,6 @@ RGB Formats
>      pixfmt-srggb10-ipu3
>      pixfmt-srggb12
>      pixfmt-srggb12p
> +    pixfmt-srggb12lp

I'd move this above srggb12p to order them alphabetically.

>      pixfmt-srggb14p
>      pixfmt-srggb16
> diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
> new file mode 100644
> index 000000000000..08d73cfdc42d
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
> @@ -0,0 +1,76 @@
> +.. -*- coding: utf-8; mode: rst -*-
> +
> +.. _v4l2-pix-fmt-sbggr12lp:
> +.. _v4l2-pix-fmt-sgbrg12lp:
> +.. _v4l2-pix-fmt-sgrbg12lp:
> +.. _v4l2-pix-fmt-srggb12lp:
> +
> +**********************************************************************************************************************************
> +V4L2_PIX_FMT_SBGGR12LP ('BGCp'), V4L2_PIX_FMT_SGBRG12LP ('GBCp'), V4L2_PIX_FMT_SGRBG12LP ('GRCp'), V4L2_PIX_FMT_SRGGB12LP ('RGCp')
> +**********************************************************************************************************************************
> +
> +12-bit Bayer formats

This should be

12-bit linear packed Bayer formats
----------------------------------

> +
> +Description
> +===========
> +
> +These packed Bayer formats are used by industrial cameras, often in conjunction
> +with UsbVision (see https://www.visiononline.org/userAssets/aiaUploads/file/USB3_Vision_Specification_v1-0-1.pdf).
> +
> +The formats are equal to the Genicam PFNC Bayer12p formats
> +(see https://www.emva.org/wp-content/uploads/GenICam_PFNC_2_3.pdf).
> +
> +They are raw sRGB / Bayer formats with 12 bits
> +per sample with 3 bytes for every 2 pixels.
> +
> +The format is little endian.

I'd drop this line, as there's no real endianess here, is there ?

With those small changes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

There's no need to resubmit this patch if you agree with the proposed
changes, I'll apply them locally.

> +
> +Below is an example of a small image in V4L2_PIX_FMT_SBGGR12LP format.
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|p{4.0cm}|p{4.0cm}|
> +
> +.. flat-table::
> +
> +    * - start + 0:
> +      - B\ :sub:`00low`
> +      - G\ :sub:`01low`\ (bits 7--4)
> +        B\ :sub:`00high`\ (bits 0--3)
> +      - G\ :sub:`01high`\
> +      - B\ :sub:`02low`
> +      - G\ :sub:`03low`\ (bits 7--4)
> +        B\ :sub:`02high`\ (bits 0--3)
> +      - G\ :sub:`03high`\
> +
> +    * - start + 6:
> +      - G\ :sub:`10low`
> +      - R\ :sub:`11low`\ (bits 7--4)
> +        G\ :sub:`10high`\ (bits 0--3)
> +      - R\ :sub:`11high`
> +      - G\ :sub:`12low`
> +      - R\ :sub:`13low`\ (bits 7--4)
> +        G\ :sub:`12high`\ (bits 0--3)
> +      - R\ :sub:`13high`
> +
> +    * - start + 12:
> +      - B\ :sub:`20low`
> +      - G\ :sub:`21low`\ (bits 7--4)
> +        B\ :sub:`20high`\ (bits 0--3)
> +      - G\ :sub:`21high`
> +      - B\ :sub:`22low`
> +      - G\ :sub:`21low`\ (bits 7--4)
> +        B\ :sub:`22high`\ (bits 0--3)
> +      - G\ :sub:`21high`
> +
> +    * - start + 18:
> +      - G\ :sub:`30low`
> +      - R\ :sub:`31low`\ (bits 7--4)
> +        G\ :sub:`30high`\ (bits 0--3)
> +      - R\ :sub:`31high`
> +      - G\ :sub:`32low`
> +      - R\ :sub:`33low`\ (bits 7--4)
> +        G\ :sub:`32high`\ (bits 0--3)
> +      - R\ :sub:`33high`
> +
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index ac87c3e37280..0cef797e4989 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1275,6 +1275,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
>  	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SBGGR12LP:	descr = "12-bit Bayer BGGR Linear Packed"; break;
> +	case V4L2_PIX_FMT_SGBRG12LP:	descr = "12-bit Bayer GBRG Linear Packed"; break;
> +	case V4L2_PIX_FMT_SGRBG12LP:	descr = "12-bit Bayer GRBG Linear Packed"; break;
> +	case V4L2_PIX_FMT_SRGGB12LP:	descr = "12-bit Bayer RGGB Linear Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
>  	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1050a75fb7ef..adee353d5913 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -646,6 +646,13 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
> +
> +	/* 12bit raw bayer linearly packed, 6 bytes for every 4 pixels */
> +#define V4L2_PIX_FMT_SBGGR12LP v4l2_fourcc('B', 'G', 'C', 'p')
> +#define V4L2_PIX_FMT_SGBRG12LP v4l2_fourcc('G', 'B', 'C', 'p')
> +#define V4L2_PIX_FMT_SGRBG12LP v4l2_fourcc('G', 'R', 'C', 'p')
> +#define V4L2_PIX_FMT_SRGGB12LP v4l2_fourcc('R', 'G', 'C', 'p')
> +
>  	/* 12bit raw bayer packed, 6 bytes for every 4 pixels */
>  #define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
>  #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')

-- 
Regards,

Laurent Pinchart
