Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100C936E30B
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 03:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhD2Bq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 21:46:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41416 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbhD2Bq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 21:46:29 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3FAABC0;
        Thu, 29 Apr 2021 03:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619660743;
        bh=ghGPA7bLKWBj8eAZ1z2kTg/MH2bN8pJIyC0ohrv5qe0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b4rwszH237F+CJCKE+Db6ZzJQUzmi/PRRgk8viPK+JvJwZwXC1Zh1XsFrmjIn7H24
         lFBa7RFNW81T4sOxDsxkef39lR5oSXnyNer7FTDVaOF81FzijAqVr7F6yjq1pyOWQT
         WpgOH1grbbwV8/46/B2vUPfVMxPm+/eDEgznvwwM=
Date:   Thu, 29 Apr 2021 04:45:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/6] media: v4l: Add definition for bayered IR formats
Message-ID: <YIoPwYQel0J4qmPs@pendragon.ideasonboard.com>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
 <20210427120701.21809-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427120701.21809-3-m.felsch@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

Thank you for the patch.

On Tue, Apr 27, 2021 at 02:06:57PM +0200, Marco Felsch wrote:
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
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  include/uapi/linux/videodev2.h | 4 ++++

The documentation is missing.

>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 311a01cc5775..45ffd3867394 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -632,6 +632,8 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG8  v4l2_fourcc('G', 'R', 'B', 'G') /*  8  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB8  v4l2_fourcc('R', 'G', 'G', 'B') /*  8  RGRG.. GBGB.. */
> +	/* 8bit infrared interleaved bayer format */
> +#define V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG8 v4l2_fourcc('I', 'R', '0', '8') /* 8 GRGB.. IGIG.. GBGR.. IGIG.. */
>  #define V4L2_PIX_FMT_SBGGR10 v4l2_fourcc('B', 'G', '1', '0') /* 10  BGBG.. GRGR.. */
>  #define V4L2_PIX_FMT_SGBRG10 v4l2_fourcc('G', 'B', '1', '0') /* 10  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG10 v4l2_fourcc('B', 'A', '1', '0') /* 10  GRGR.. BGBG.. */
> @@ -673,6 +675,8 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
> +	/* 16bit infrared interleaved bayer format */
> +#define V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG16 v4l2_fourcc('I', 'R', '1', '6') /* 16 GRGB.. IGIG.. GBGR.. IGIG.. */
>  
>  /* HSV formats */
>  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')

-- 
Regards,

Laurent Pinchart
