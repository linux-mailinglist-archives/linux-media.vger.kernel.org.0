Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B19636E316
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 03:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235520AbhD2Bwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 21:52:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41468 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhD2Bwd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 21:52:33 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F03C6BC0;
        Thu, 29 Apr 2021 03:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619661107;
        bh=iMvHPjghY5v3vQr6vTsR361a0c4e+G0SJH3cs3nrO50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bAJMBey/uAOIfWinRltez3IqhSldbKfizwYXDzkaxE4mrsxByE8uJenTF1wQTPwEG
         0bTX+x0l0DIxJrwK1bvI2QrBuhOtXTSO9ubj35GV+0CGD+8DpmsvZK9YiYECT3m2IV
         c/WN2zujBV+7j4eksnVWwxz7kvxKaJjqJKfI+WjU=
Date:   Thu, 29 Apr 2021 04:51:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/6] media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG
 media bus formats
Message-ID: <YIoRLQfoNm0GJGsY@pendragon.ideasonboard.com>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
 <20210427120701.21809-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427120701.21809-2-m.felsch@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

Thank you for the patch.

On Tue, Apr 27, 2021 at 02:06:56PM +0200, Marco Felsch wrote:
> Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
> camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
> with the interleaved IR pixels looks like:
> 
>         |  G |  R |  G |  B | ...
>         +----+----+----+----+---
>         | IR |  G | IR |  G | ...
>         +----+----+----+----+---
>         |  G |  B |  G |  R | ...
>         +----+----+----+----+---
>         | IR |  G | IR |  G | ...
>         +----+----+----+----+---
>         | .. | .. | .. | .. | ..
> 
> [1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf

I think we're reaching a limit of the media bus codes model here, due to
a historical mistake. The four possible Bayer patterns, times the
different number of bits per pixel, creates a lot of media bus codes,
and drivers for CSI-2 receivers and IP cores further down the pipeline
have to support them all. This is already painful, and if we had a
non-Bayer pattern such as this one, we'll open the door to an explosion
of the number of media bus codes (imagine all the different possible
arrangements of this pattern, for instance if you enable horizontal
and/or vertical flipping on the sensor). All drivers would need to be
updated to support these new bus codes, and this really kills the
current model.

The historical mistake was to tie the Bayer pattern with the media bus
code. We should really have specified raw 8/10/12/14/16 media bus codes,
and conveyed the pattern separately. Most IP cores in the pipeline don't
need to care about the pattern at all, and those who do (that's mostly
ISPs) could be programmed explicitly by userspace as long as we have an
API to retrieve the pattern from the sensor. I believe it's time to bite
the bullet and go in that direction. I'm sorry for this case of yak
shaving, but it really wouldn't be manageable anymore :-(

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../media/v4l/subdev-formats.rst              | 42 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  4 +-
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index bd68588b2683..d774ccd57c1b 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -2252,6 +2252,27 @@ organization is given as an example for the first pixel only.
>        - g\ :sub:`2`
>        - g\ :sub:`1`
>        - g\ :sub:`0`
> +    * .. _MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG8_1X8:
> +
> +      - MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG8_1X8
> +      - 0x3021
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
>      * .. _MEDIA-BUS-FMT-SRGGB8-1X8:
>  
>        - MEDIA_BUS_FMT_SRGGB8_1X8
> @@ -2748,6 +2769,27 @@ organization is given as an example for the first pixel only.
>        - g\ :sub:`2`
>        - g\ :sub:`1`
>        - g\ :sub:`0`
> +    * .. _MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG12_1X12:
> +
> +      - MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG12_1X12
> +      - 0x3022
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - g\ :sub:`11`
> +      - g\ :sub:`10`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
>      * .. _MEDIA-BUS-FMT-SRGGB12-1X12:
>  
>        - MEDIA_BUS_FMT_SRGGB12_1X12
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 0dfc11ee243a..cdd995e44926 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -112,10 +112,11 @@
>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
>  
> -/* Bayer - next is	0x3021 */
> +/* Bayer - next is	0x3023 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
>  #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
>  #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
> +#define MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG8_1X8	0x3021
>  #define MEDIA_BUS_FMT_SRGGB8_1X8		0x3014
>  #define MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8		0x3015
>  #define MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8		0x3016
> @@ -136,6 +137,7 @@
>  #define MEDIA_BUS_FMT_SBGGR12_1X12		0x3008
>  #define MEDIA_BUS_FMT_SGBRG12_1X12		0x3010
>  #define MEDIA_BUS_FMT_SGRBG12_1X12		0x3011
> +#define MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG12_1X12	0x3022
>  #define MEDIA_BUS_FMT_SRGGB12_1X12		0x3012
>  #define MEDIA_BUS_FMT_SBGGR14_1X14		0x3019
>  #define MEDIA_BUS_FMT_SGBRG14_1X14		0x301a

-- 
Regards,

Laurent Pinchart
