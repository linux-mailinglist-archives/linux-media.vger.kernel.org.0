Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10BBD605A7
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 14:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfGEMCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 08:02:02 -0400
Received: from retiisi.org.uk ([95.216.213.190]:55782 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbfGEMCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jul 2019 08:02:01 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 0AF72634C7B;
        Fri,  5 Jul 2019 15:01:16 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hjMtv-0001jA-7e; Fri, 05 Jul 2019 15:01:15 +0300
Date:   Fri, 5 Jul 2019 15:01:15 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Edgar Thier <info@edgarthier.net>
Cc:     laurent.pinchart@ideasonboard.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/2] v4l: Add 12-bit raw bayer linear packed formats
Message-ID: <20190705120115.kf7becjc54rc7ihf@valkosipuli.retiisi.org.uk>
References: <20190705110723.29685-1-info@edgarthier.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705110723.29685-1-info@edgarthier.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Edgar,

Thanks for the update.

On Fri, Jul 05, 2019 at 01:07:23PM +0200, Edgar Thier wrote:
> These formats are compressed 12-bit raw bayer formats with four different
> pixel orders. The pixel follow one another without any padding,
> thus are packed in a 'linear' fashion.
> 
> Signed-off-by: Edgar Thier <info@edgarthier.net>
> ---
>  Documentation/media/uapi/v4l/pixfmt-rgb.rst   |  1 +
>  .../media/uapi/v4l/pixfmt-srggb12lp.rst       | 60 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 ++
>  include/uapi/linux/videodev2.h                |  7 +++
>  4 files changed, 72 insertions(+)
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
>      pixfmt-srggb14p
>      pixfmt-srggb16
> diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
> new file mode 100644
> index 000000000000..13d32ad92c73
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
> @@ -0,0 +1,60 @@
> +.. -*- coding: utf-8; mode: rst -*-
> +
> +.. _v4l2-pix-fmt-sgrbg12lp:
> +.. _v4l2-pix-fmt-srggb12lp:
> +.. _v4l2-pix-fmt-sbggr12lp:
> +.. _v4l2-pix-fmt-sgbrg12lp:
> +
> +**********************************************************************************************************************************
> +V4L2_PIX_FMT_SBGGR12LP ('BGCp'), V4L2_PIX_FMT_SGBRG12LP ('GBCp'), V4L2_PIX_FMT_SGRBG12LP ('GRCp'), V4L2_PIX_FMT_SRGGB12LP ('RGCp')
> +**********************************************************************************************************************************
> +
> +12-bit Bayer formats
> +
> +Description
> +===========
> +
> +These four pixel formats are used by industrial cameras, often in conjunction

s/four pixel/packed Bayer/

> +with UsbVision (see https://www.visiononline.org/userAssets/aiaUploads/file/USB3_Vision_Specification_v1-0-1.pdf).
> +
> +The formats are equal to the Genicam PFNC Bayer12p formats
> +(see https://www.emva.org/wp-content/uploads/GenICam_PFNC_2_3.pdf).
> +
> +They are raw sRGB / Bayer formats with 12 bits
> +per sample with 3 bytes for every 2 pixels.
> +
> +The format is little endian.
> +
> +Below is an example of a small image in V4L2_PIX_FMT_PFNC_BAYERBG12P format.

V4L2_PIX_FMT_SBGGR12LP?

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

01 -> 10

> +        B\ :sub:`00high`\ (bits 0--3)
> +      - G\ :sub:`01high`\

01 -> 10

> +
> +    * - start + 6:

start + 3 ?

And add three for each line of pixels below, too. Or you could add more
pixels per line, up to you.

> +      - G\ :sub:`02low`
> +      - R\ :sub:`03low`\ (bits 7--4)
> +        G\ :sub:`02high`\ (bits 0--3)
> +      - R\ :sub:`03high`

The line and column numbers seem to be a bit off --- I assume the first
number is the line, isn't it?

> +
> +    * - start + 12:
> +      - B\ :sub:`04low`
> +      - G\ :sub:`05low`\ (bits 7--4)
> +        B\ :sub:`04high`\ (bits 0--3)
> +      - G\ :sub:`05high`
> +
> +    * - start + 24:
> +      - G\ :sub:`06low`
> +      - R\ :sub:`07low`\ (bits 7--4)
> +        G\ :sub:`06high`\ (bits 0--3)
> +      - R\ :sub:`07high`
> +
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index ac87c3e37280..98c3c7fde046 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1275,6 +1275,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
>  	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SGBRG12LP:	descr = "12-bit Bayer GBGB/RGRG Linear Packed"; break;

You only have 32 bytes (including nil character). How about:

"12-bit Bayer GBRG Linear Packed".

> +	case V4L2_PIX_FMT_SGRBG12LP:	descr = "12-bit Bayer GRGR/BGBG Linear Packed"; break;
> +	case V4L2_PIX_FMT_SBGGR12LP:	descr = "12-bit Bayer BGBG/GRGR Linear Packed"; break;
> +	case V4L2_PIX_FMT_SRGGB12LP:	descr = "12-bit Bayer RGRG/GBGB Linear Packed"; break;

Could you arrange these after the other packed formats, the way they're in
documentation? Same below.

>  	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
>  	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1050a75fb7ef..f0b81b870f29 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -646,6 +646,13 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
> +
> +	/* 12bit raw bayer simple packed, 6 bytes for every 4 pixels */

"linearly packed"

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

Sakari Ailus
