Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56384A7B47
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 23:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347948AbiBBWtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 17:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347938AbiBBWtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 17:49:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA555C061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 14:49:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D510D88;
        Wed,  2 Feb 2022 23:49:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643842185;
        bh=9BYJj9AtSpUEvqx2ps3HV0V0HM/L0iggdL68gxEfkpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=REb0Pd4rJuSLZCBcLlzuLqJ4HuUpwtni2ZOpR8Ydzp4c1+JP/pb1QjMmzz82L1aF1
         gpvS1w8iXYwjJSKXAsRsJISD3aZByVZxysigFWV6A3cdC/GATWTX40RjHMQvP2JpI/
         qqoSyNRfwqsG1fVzgxvyZ75p77BbIHLRABCxKg80=
Date:   Thu, 3 Feb 2022 00:49:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 19/21] media: ov5640: Add RGB888/BGR888 formats
Message-ID: <YfsKchnYP/+hqyNx@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144529.129096-1-jacopo@jmondi.org>
 <20220131144529.129096-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131144529.129096-3-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:45:29PM +0100, Jacopo Mondi wrote:
> Add support for RGB888/BGR888 image formats.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index db77cdb8a958..5891eaab05ee 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -198,6 +198,8 @@ static const struct ov5640_pixfmt {
>  	{ MEDIA_BUS_FMT_RGB565_2X8_LE, V4L2_COLORSPACE_SRGB, 16},
>  	{ MEDIA_BUS_FMT_RGB565_2X8_BE, V4L2_COLORSPACE_SRGB, 16},
>  	{ MEDIA_BUS_FMT_RGB565_1X16, V4L2_COLORSPACE_SRGB, 16},
> +	{ MEDIA_BUS_FMT_RGB888_1X24, V4L2_COLORSPACE_SRGB, 24},
> +	{ MEDIA_BUS_FMT_BGR888_1X24, V4L2_COLORSPACE_SRGB, 24},

If we can limit MEDIA_BUS_FMT_RGB565_1X16 to CSI-2 mode in the previous
patch, then this should be limited too. The rest of the patch looks
fine,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_COLORSPACE_SRGB, 8},
>  	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_COLORSPACE_SRGB, 8},
>  	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_COLORSPACE_SRGB, 8},
> @@ -2757,6 +2759,16 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
>  		fmt = 0x61;
>  		mux = OV5640_FMT_MUX_RGB;
>  		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		/* RGB888: BGR */
> +		fmt = 0x22;
> +		mux = OV5640_FMT_MUX_RGB;
> +		break;
> +	case MEDIA_BUS_FMT_BGR888_1X24:
> +		/* BGR888: RGB */
> +		fmt = 0x23;
> +		mux = OV5640_FMT_MUX_RGB;
> +		break;
>  	case MEDIA_BUS_FMT_JPEG_1X8:
>  		/* YUV422, YUYV */
>  		fmt = 0x30;

-- 
Regards,

Laurent Pinchart
