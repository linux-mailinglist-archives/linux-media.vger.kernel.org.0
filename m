Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921E565638D
	for <lists+linux-media@lfdr.de>; Mon, 26 Dec 2022 15:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbiLZOsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Dec 2022 09:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbiLZOsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Dec 2022 09:48:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EDF113A;
        Mon, 26 Dec 2022 06:48:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93B5C74C;
        Mon, 26 Dec 2022 15:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672066100;
        bh=FGzNtUSlcIYqKz4nBvZ0Wzt0Jl5BIGyXQ4DAT1O+pQU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kzu815/Xar9XotqceBt2rVxp2e6o2MD39JrMc/4+oPRNPcfZtn4U1xqcEB6XzCpii
         UrLE+AKhzdFUSJ2m8Bvw6dTZygTMVaT3q6I20svbirJMzm00/iqfnyIGpDNcfSZYzm
         0KINbLsrSbF5SHvg+MWkH6Lpo+fa4buePey9ZRMU=
Date:   Mon, 26 Dec 2022 16:48:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 1/7] media: Add 2-10-10-10 RGB formats
Message-ID: <Y6m0MBW0VIZSsn7R@pendragon.ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221221092448.741294-2-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221221092448.741294-2-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Dec 21, 2022 at 11:24:42AM +0200, Tomi Valkeinen wrote:
> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.

You forgot to rename the formats in the commit message.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   3 +
>  include/uapi/linux/videodev2.h                |   3 +
>  3 files changed, 200 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index 30f51cd33f99..d330aeb4d3eb 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -763,6 +763,200 @@ nomenclature that instead use the order of components as seen in a 24- or
>      \normalsize
>  
>  
> +10 Bits Per Component
> +=====================
> +
> +These formats store a 30-bit RGB triplet with an optional 2 bit alpha in four
> +bytes. They are named based on the order of the RGB components as seen in a
> +32-bit word, which is then stored in memory in little endian byte order
> +(unless otherwise noted by the presence of bit 31 in the 4CC value), and on the
> +number of bits for each component.
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
> +.. flat-table:: RGB Formats 10 Bits Per Color Component
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
> +    * .. _V4L2-PIX-FMT-RGBX1010102:
> +
> +      - ``V4L2_PIX_FMT_RGBX1010102``
> +      - 'RX30'
> +
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - x
> +      - x
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      -
> +    * .. _V4L2-PIX-FMT-RGBA1010102:
> +
> +      - ``V4L2_PIX_FMT_RGBA1010102``
> +      - 'RA30'
> +
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      -
> +    * .. _V4L2-PIX-FMT-ARGB2101010:
> +
> +      - ``V4L2_PIX_FMT_ARGB2101010``
> +      - 'AR30'
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
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      -
> +
> +.. raw:: latex
> +
> +    \endgroup
> +
> +
>  Deprecated RGB Formats
>  ======================
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index fddba75d9074..875b9a95e3c8 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1304,6 +1304,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_RGBX1010102:	descr = "32-bit RGBX-10-10-10-2"; break;

There should be a space instead of a dash between RGBX and 10-10-10-2.
Same below.

Conditionally-Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

If this is the only change needed in the series, I can fix this when
applying.

> +	case V4L2_PIX_FMT_RGBA1010102:	descr = "32-bit RGBA-10-10-10-2"; break;
> +	case V4L2_PIX_FMT_ARGB2101010:	descr = "32-bit ARGB-2-10-10-10"; break;
>  	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 29da1f4b4578..51d6a8aa4e17 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -576,6 +576,9 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_RGBX32  v4l2_fourcc('X', 'B', '2', '4') /* 32  RGBX-8-8-8-8  */
>  #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB-8-8-8-8  */
>  #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB-8-8-8-8  */
> +#define V4L2_PIX_FMT_RGBX1010102 v4l2_fourcc('R', 'X', '3', '0') /* 32  RGBX-10-10-10-2 */
> +#define V4L2_PIX_FMT_RGBA1010102 v4l2_fourcc('R', 'A', '3', '0') /* 32  RGBA-10-10-10-2 */
> +#define V4L2_PIX_FMT_ARGB2101010 v4l2_fourcc('A', 'R', '3', '0') /* 32  ARGB-2-10-10-10 */
>  
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */

-- 
Regards,

Laurent Pinchart
