Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2944A59D71
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 16:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfF1OCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 10:02:42 -0400
Received: from retiisi.org.uk ([95.216.213.190]:34314 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726691AbfF1OCm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 10:02:42 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CDD2E634C7F;
        Fri, 28 Jun 2019 17:02:23 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hgrSJ-0000lK-4G; Fri, 28 Jun 2019 17:02:23 +0300
Date:   Fri, 28 Jun 2019 17:02:23 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Edgar Thier <info@edgarthier.net>
Cc:     laurent.pinchart@ideasonboard.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/2] v4l: Add Genicam 12-bit bayer packed formats
Message-ID: <20190628140222.jv7fapzhl44qywij@valkosipuli.retiisi.org.uk>
References: <20190628083740.21315-1-info@edgarthier.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628083740.21315-1-info@edgarthier.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Edgar,

On Fri, Jun 28, 2019 at 10:37:40AM +0200, Edgar Thier wrote:
> These formats are compressed 12-bit raw bayer formats with four different
> pixel orders. They are similar to 10-bit bayer formats 'IPU3'.
> The naming and pixel structure follow
> the Genicam Pixel Format Naming Convention (PFNC).

Genicam appears to define a naming scheme for most formats V4L2 already
supports. I'm not very eager to embark toward that route without evaluating
other possibilities. The fact is that the V4L2 naming of Bayer formats is
somewhat odd, but I don't think adopting Genicam PFNC as such is the
obvious solution. I'd also expect the new naming convention to be used on
existing formats, too, but that conversion should be done at the same time
than adopting that convention for new formats.

How about calling it "Linear Packed" as was suggested on #v4l?

> 
> Signed-off-by: Edgar Thier <info@edgarthier.net>
> ---
>  .../media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst | 61 +++++++++++++++++++
>  Documentation/media/uapi/v4l/pixfmt-rgb.rst   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 ++
>  include/uapi/linux/videodev2.h                |  7 +++
>  4 files changed, 73 insertions(+)
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst b/Documentation/media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst
> new file mode 100644
> index 000000000000..6d294cf89353
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst
> @@ -0,0 +1,61 @@
> +.. -*- coding: utf-8; mode: rst -*-
> +
> +.. _v4l2-pix-fmt-pfnc-bayergr12p:
> +.. _v4l2-pix-fmt-pfnc-bayerrg12p:
> +.. _v4l2-pix-fmt-pfnc-bayerbg12p:
> +.. _v4l2-pix-fmt-pfnc-bayergb12p:
> +
> +**********************************************************************************************************************************************************
> +V4L2_PIX_FMT_PFNC_BAYERBG12P ('BGCp'), V4L2_PIX_FMT_PFNC_BAYERGB12P ('GBCp'), V4L2_PIX_FMT_PFNC_BAYERGR12P ('GRCp'), V4L2_PIX_FMT_PFNC_BAYERRG12P ('RGCp')
> +**********************************************************************************************************************************************************
> +
> +12-bit Bayer formats
> +
> +Description
> +===========
> +
> +These four pixel formats are used by industrial cameras, often in conjunction
> +with UsbVision (see https://www.visiononline.org/userAssets/aiaUploads/file/USB3_Vision_Specification_v1-0-1.pdf).
> +
> +The naming is in accordance to the Genicam Pixel Format Naming Convention
> +(see https://www.emva.org/wp-content/uploads/GenICam_PFNC_2_3.pdf).
> +
> +They are raw sRGB / Bayer formats with 12 bits
> +per sample with 3 bytes for every 2 pixels.
> +
> +The format is little endian.
> +
> +In other respects this format is similar to :ref:`v4l2-pix-fmt-ipu3-sbggr10`.
> +Below is an example of a small image in V4L2_PIX_FMT_PFNC_BAYERBG12P format.
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
> +
> +    * - start + 6:
> +      - G\ :sub:`02low`
> +      - R\ :sub:`03low`\ (bits 7--4)
> +        G\ :sub:`02high`\ (bits 0--3)
> +      - R\ :sub:`03high`
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
> diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> index 48ab80024835..157a6a3a1e49 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> @@ -26,5 +26,6 @@ RGB Formats
>      pixfmt-srggb10-ipu3
>      pixfmt-srggb12
>      pixfmt-srggb12p
> +    pixfmt-pfnc-bayerrg12p
>      pixfmt-srggb14p
>      pixfmt-srggb16
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index ac87c3e37280..8fab2f3fcbe5 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1275,6 +1275,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
>  	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_PFNC_BAYERBG12P: descr = "12-bit Bayer BGBG/GRGR PFNC Packed"; break;
> +	case V4L2_PIX_FMT_PFNC_BAYERGB12P: descr = "12-bit Bayer GBGB/RGRG PFNC Packed"; break;
> +	case V4L2_PIX_FMT_PFNC_BAYERGR12P: descr = "12-bit Bayer GRGR/BGBG PFNC Packed"; break;
> +	case V4L2_PIX_FMT_PFNC_BAYERRG12P: descr = "12-bit Bayer RGRG/GBGB PFNC Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
>  	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1050a75fb7ef..2f0b7e821cc8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -646,6 +646,13 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
> +
> +	/* 12bit raw bayer simple packed, 6 bytes for every 4 pixels */
> +#define V4L2_PIX_FMT_PFNC_BAYERBG12P v4l2_fourcc('B', 'G', 'C', 'p')
> +#define V4L2_PIX_FMT_PFNC_BAYERGB12P v4l2_fourcc('G', 'B', 'C', 'p')
> +#define V4L2_PIX_FMT_PFNC_BAYERGR12P v4l2_fourcc('G', 'R', 'C', 'p')
> +#define V4L2_PIX_FMT_PFNC_BAYERRG12P v4l2_fourcc('R', 'G', 'C', 'p')
> +
>  	/* 12bit raw bayer packed, 6 bytes for every 4 pixels */
>  #define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
>  #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')

-- 
Kind regards,

Sakari Ailus
