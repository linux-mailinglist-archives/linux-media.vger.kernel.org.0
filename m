Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F96C4D125F
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 09:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345004AbiCHIiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 03:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344998AbiCHIiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 03:38:22 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B951161
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 00:37:25 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E60AE1C0003;
        Tue,  8 Mar 2022 08:37:23 +0000 (UTC)
Date:   Tue, 8 Mar 2022 09:37:22 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: v4l: Add packed YUV 4:4:4 YUVA and YUVX pixel
 formats
Message-ID: <20220308083722.qapoft64p3ghgibx@uno.localdomain>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
 <20220307180342.10666-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220307180342.10666-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, Mar 07, 2022 at 08:03:40PM +0200, Laurent Pinchart wrote:
> The new YUVA and YUVX are permutations of the existing AYUV and XYUV
> formats. They are use by the NXP i.MX8 ISI hardware.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

All three patches looks good
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Slighlty unrelated: aren't the following format definitions identical ?
Is this intentional ?

    * .. _V4L2-PIX-FMT-YUV32:

      - ``V4L2_PIX_FMT_YUV32``
      - 'YUV4'

      - A\ :sub:`7-0`
      - Y'\ :sub:`7-0`
      - Cb\ :sub:`7-0`
      - Cr\ :sub:`7-0`

    * .. _V4L2-PIX-FMT-AYUV32:

      - ``V4L2_PIX_FMT_AYUV32``
      - 'AYUV'

      - A\ :sub:`7-0`
      - Y'\ :sub:`7-0`
      - Cb\ :sub:`7-0`
      - Cr\ :sub:`7-0`

Thanks
   j

> ---
>  .../media/v4l/pixfmt-packed-yuv.rst           | 20 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
>  include/uapi/linux/videodev2.h                |  2 ++
>  3 files changed, 24 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> index 62bc2bb3f499..92394786251a 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> @@ -229,6 +229,26 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
>        - Y'\ :sub:`7-0`
>        - X\ :sub:`7-0`
>
> +    * .. _V4L2-PIX-FMT-YUVA32:
> +
> +      - ``V4L2_PIX_FMT_YUVA32``
> +      - 'YUVA'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`7-0`
> +      - Cr\ :sub:`7-0`
> +      - A\ :sub:`7-0`
> +
> +    * .. _V4L2-PIX-FMT-YUVX32:
> +
> +      - ``V4L2_PIX_FMT_YUVX32``
> +      - 'YUVX'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`7-0`
> +      - Cr\ :sub:`7-0`
> +      - X\ :sub:`7-0`
> +
>      * .. _V4L2-PIX-FMT-YUV24:
>
>        - ``V4L2_PIX_FMT_YUV24``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index aeecaca3edba..ca3c7bd19d7e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1290,6 +1290,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
>  	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
>  	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index df8b9c486ba1..16dcd9dd1a50 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -592,6 +592,8 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
>  #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
>  #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
> +#define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
> +#define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
>  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
>
>  /* two planes -- one Y, one Cr + Cb interleaved  */
> --
> Regards,
>
> Laurent Pinchart
>
