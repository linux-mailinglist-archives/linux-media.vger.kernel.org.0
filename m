Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD7D419F16
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 16:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbfEJOZF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 10:25:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfEJOZF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 10:25:05 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9CD02DF;
        Fri, 10 May 2019 16:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557498303;
        bh=zSzgRVfiFBRbmuzyAkiLXYb3UpjWrMHBjfGkOzNX5Qc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PIAWnilmswlXjdhqRi+vmhoRv4cRy0BWhX/Lyew/olpkwpeIRHPRNNF01HIwS1ffp
         pSTrSSu9b/FnmqQ/f7QjmVRshENxUdqTP/gZL8nNtC0jlmw1oQEIxD5YxQw9u0WxOv
         imhp/alS0UaYeDZcVPy2swfFtPT+xhst69v7Jar4=
Date:   Fri, 10 May 2019 17:24:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Edgar Thier <info@edgarthier.net>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Patch v2] v4l: Add simple packed bayer 12-bit formats
Message-ID: <20190510142446.GC4972@pendragon.ideasonboard.com>
References: <b9dc4c99-5aaa-db43-f6cb-f829da9fd654@edgarthier.net>
 <462cc8c4-b288-9834-302c-02fd0d1a5d62@edgarthier.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <462cc8c4-b288-9834-302c-02fd0d1a5d62@edgarthier.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Edgar,

Thank you for the patch, and sorry for the delay.

On Thu, Jan 10, 2019 at 09:03:13AM +0100, Edgar Thier wrote:
> 
> These formats are compressed 12-bit raw bayer formats with four different
> pixel orders. They are similar to 10-bit bayer formats 'IPU3'.
> 
> Signed-off-by: Edgar Thier <info@edgarthier.net>
> ---
> Documentation/media/uapi/v4l/pixfmt-rgb.rst   |   1 +
> .../media/uapi/v4l/pixfmt-srggb12sp.rst       | 123 ++++++++++++++++++
> drivers/media/usb/uvc/uvc_driver.c            |  20 +++
> include/uapi/linux/videodev2.h                |   7 +
> 4 files changed, 151 insertions(+)
> create mode 100644 Documentation/media/uapi/v4l/pixfmt-srggb12sp.rst
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> index 1f9a7e3a07c9..5da00bd085f1 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> @@ -19,5 +19,6 @@ RGB Formats
> 	pixfmt-srggb10-ipu3
> 	pixfmt-srggb12
> 	pixfmt-srggb12p
> +	pixfmt-srggb12sp
> 	pixfmt-srggb14p
> 	pixfmt-srggb16
> diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12sp.rst
> b/Documentation/media/uapi/v4l/pixfmt-srggb12sp.rst
> new file mode 100644
> index 000000000000..829f6aef34bc
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-srggb12sp.rst
> @@ -0,0 +1,123 @@
> +.. -*- coding: utf-8; mode: rst -*-
> +
> +.. _v4l2-pix-fmt-sbggr12sp:
> +.. _v4l2-pix-fmt-sgbrg12sp:
> +.. _v4l2-pix-fmt-sgrbg12sp:
> +.. _v4l2-pix-fmt-srggb12sp:
> +
> +******************************************************************************************************************************************************
> +V4L2_PIX_FMT_SBGGR12SP ('SRGGB12SP'), V4L2_PIX_FMT_SGBRG12SP ('SGBRG12SP'),
> V4L2_PIX_FMT_SGRBG12SP('SGRBG12SP'), V4L2_PIX_FMT_SRGGB12SP ('SRGGB12SP')

Your mailer seems to wrap lines, corrupting the patch and making it
impossible to apply it with git am. Could you try to fix this for your
next submission ?

The string between parentheses is supposed to be the 4CC in string form,
'BGCp' for the first one for instance.


> +******************************************************************************************************************************************************
> +
> +12-bit Bayer formats
> +
> +Description
> +===========
> +
> +These four pixel formats are used by industrial cameras, often in conjunction with UsbVision (see
> https://www.visiononline.org/userAssets/aiaUploads/file/USB3_Vision_Specification_v1-0-1.pdf).

Please wrap lines at 80 colums (long URLs can of course be an
exception).

This document doesn't seem to describe the pixel formats. Is there
another document that would do so ?

> +
> +They are raw sRGB / Bayer formats with 12 bits per sample with 6 bytes for every 4 pixels.
> +The format is little endian.

It's actually 3 bytes for 2 pixels, the pattern repeats every two
pixels. The difference with the SRGGB12P family of formats is how bits
are packed, in SRGGB12P we have two bytes of MSBs followed by one byte
of combined LSBs, while here we have one byte of LSB, one combined byte
of MSB and LSB, and one byte of MSB.

> +
> +In other respects this format is similar to :ref:`v4l2-pix-fmt-ipu3-sbggr10`.
> +Below is an example of a small image in V4L2_PIX_FMT_SBGGR12SP format.
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|p{4.0cm}|p{4.0cm}|
> +
> +.. flat-table::
> +
> +    * - start + 0:
> +      - B\ :sub:`0000low`

The numerical suffix should be two digits only, with the first digit
being the line number and the second digit the column number.

> +      - G\ :sub:`0001low`\ (bits 7--4)
> +
> +        B\ :sub:`0000high`\ (bits 0--3)

So the LSBs of the G component go in the MSBs of this byte, and the MSBs
of the B component in the LSBs for this byte ? That's a strange
arrangement, could you confirm that it's indeed correct ?

> +
> +      - G\ :sub:`0001high`\
> +      - B\ :sub:`0002low`
> +
> +    * - start + 4:
> +      - G\ :sub:`0003low`\ (bits 7--4)
> +
> +        B\ :sub:`0002high`\ (bits 0--3)
> +      - G\ :sub:`0003high`
> +      - B\ :sub:`0004low`
> +      - G\ :sub:`0005low`\ (bits 7--2)
> +
> +        B\ :sub:`0004high`\ (bits 1--0)
> +
> +    * - start + 8:
> +      - G\ :sub:`0005high`
> +      - B\ :sub:`0006low`
> +      - G\ :sub:`0007low`\ (bits 7--4)
> +        B\ :sub:`0006high`\ (bits 3--0)
> +      - G\ :sub:`0007high`
> +

This is very difficult to read. You should reduce the image to a 4x4 image
instead of 8x4 (as the pattern repeats every two pixels, that's more
than enough, and have 6 bytes per line (so start + 0, start + 6, start +
12, ...).

> +    * - start + 12:
> +      - G\ :sub:`0008low`
> +      - R\ :sub:`0009low`\ (bits 7--4)
> +
> +        G\ :sub:`0008high`\ (bits 3--0)
> +      - R\ :sub:`0009high`
> +      - G\ :sub:`0010low`
> +
> +    * - start + 16:
> +      - R\ :sub:`0011low`\ (bits 7--4)
> +        G\ :sub:`00010high`\ (bits 3--0)
> +      - R\ :sub:`0011high`
> +      - G\ :sub:`0012low`
> +      - R\ :sub:`0013low`\ (bits 7--4)
> +        G\ :sub:`0012high`\ (bits 3--0)
> +
> +    * - start + 20
> +      - R\ :sub:`0013high`
> +      - G\ :sub:`0014low`
> +      - R\ :sub:`0015low`\ (bits 7--4)
> +        G\ :sub:`0014high`\ (bits 3--0)
> +      - R\ :sub:`0015high`
> +
> +    * - start + 24:
> +      - B\ :sub:`0016low`
> +      - G\ :sub:`0017low`\ (bits 7--4)
> +        B\ :sub:`0016high`\ (bits 0--3)
> +      - G\ :sub:`0017high`\
> +      - B\ :sub:`0018low`
> +
> +    * - start + 28:
> +      - G\ :sub:`0019low`\ (bits 7--4)
> +        B\ :sub:`00018high`\ (bits 0--3)
> +      - G\ :sub:`0019high`
> +      - B\ :sub:`0020low`
> +      - G\ :sub:`0021low`\ (bits 7--2)
> +        B\ :sub:`0020high`\ (bits 1--0)
> +
> +    * - start + 32:
> +      - G\ :sub:`0021high`
> +      - B\ :sub:`0022low`
> +      - G\ :sub:`0023low`\ (bits 7--4)
> +        B\ :sub:`0022high`\ (bits 3--0)
> +      - G\ :sub:`0024high`
> +
> +    * - start + 36:
> +      - G\ :sub:`0025low`
> +      - R\ :sub:`0026low`\ (bits 7--4)
> +        G\ :sub:`0025high`\ (bits 3--0)
> +      - R\ :sub:`0026high`
> +      - G\ :sub:`0027low`
> +
> +    * - start + 40:
> +      - R\ :sub:`0028low`\ (bits 7--4)
> +        G\ :sub:`00027high`\ (bits 3--0)
> +      - R\ :sub:`0028high`
> +      - G\ :sub:`0029low`
> +      - R\ :sub:`0030low`\ (bits 7--4)
> +        G\ :sub:`0029high`\ (bits 3--0)
> +
> +    * - start + 44:
> +      - R\ :sub:`0030high`
> +      - G\ :sub:`0031low`
> +      - R\ :sub:`0033low`\ (bits 7--4)
> +        G\ :sub:`0032high`\ (bits 3--0)
> +      - R\ :sub:`0033high`
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index d46dc432456c..3125ed5de3b4 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c

This belongs to the other patch in the series.

> @@ -179,6 +179,26 @@ static struct uvc_format_desc uvc_fmts[] = {
> 		.guid		= UVC_GUID_FORMAT_RW10,
> 		.fcc		= V4L2_PIX_FMT_SRGGB10P,
> 	},
> +	{
> +		.name		= "Bayer 12-bit simple packed (SBGGR12SP)",
> +		.guid		= UVC_GUID_FORMAT_BG12SP,
> +		.fcc		= V4L2_PIX_FMT_SBGGR12SP,
> +	},
> +	{
> +		.name		= "Bayer 12-bit simple packed (SGBRG12SP)",
> +		.guid		= UVC_GUID_FORMAT_GB12SP,
> +		.fcc		= V4L2_PIX_FMT_SGBRG12SP,
> +	},
> +	{
> +		.name		= "Bayer 12-bit simple packed (SRGGB12SP)",
> +		.guid		= UVC_GUID_FORMAT_RG12SP,
> +		.fcc		= V4L2_PIX_FMT_SRGGB12SP,
> +	},
> +	{
> +		.name		= "Bayer 12-bit simple packed (SGRBG12SP)",
> +		.guid		= UVC_GUID_FORMAT_GR12SP,
> +		.fcc		= V4L2_PIX_FMT_SGRBG12SP,
> +	},
> 	{
> 		.name		= "Bayer 16-bit (SBGGR16)",
> 		.guid		= UVC_GUID_FORMAT_BG16,
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5d1a3685bea9..573acd99ed09 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -605,6 +605,13 @@ struct v4l2_pix_format {
> #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
> #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
> #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
> ++
> +/* 12bit raw bayer simple packed, 6 bytes for every 4 pixels */

You're missing a tab here (or is it your mailer that removed it ?).

I don't think there are any way simpler than the SBGGR12P family. I
wonder if we could find better descriptive name, both for this comment
and for the format name in uvc_fmts[].

> +#define V4L2_PIX_FMT_SBGGR12SP v4l2_fourcc('B', 'G', 'C', 'p')
> +#define V4L2_PIX_FMT_SGBRG12SP v4l2_fourcc('G', 'B', 'C', 'p')
> +#define V4L2_PIX_FMT_SGRBG12SP v4l2_fourcc('G', 'R', 'C', 'p')
> +#define V4L2_PIX_FMT_SRGGB12SP v4l2_fourcc('R', 'G', 'C', 'p')
> +
> /* 12bit raw bayer packed, 6 bytes for every 4 pixels */
> #define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
> #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')

You should also update the v4l_fill_fmtdesc() function. Please use the
same format names there and in the uvc_fmts[] table.

-- 
Regards,

Laurent Pinchart
