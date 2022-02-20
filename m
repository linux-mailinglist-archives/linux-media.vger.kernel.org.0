Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65B84BCE94
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 14:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238559AbiBTNNq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 08:13:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbiBTNNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 08:13:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FBE3703C
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 05:13:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3866D25B;
        Sun, 20 Feb 2022 14:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645362803;
        bh=ahGrBVpZwZ0i2j+z7bfFuimtWtEpZ8WP+BZXKc7nDVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=javKoK591H7tnGRlKTDtD4GOQ10PKbRQIWNvU0Xsjoo3bs8bvSfGbubGqrser4tIj
         XCTbqD6WtpxgnVo5XlpzTvt3k8Us9iGbDDg168VFC3LmLT0k3x32y1i+hSNDnIb/hF
         VMLjHQGMT9Y6mBhpFWQMvbDq8k2JonbfnLnsS60g=
Date:   Sun, 20 Feb 2022 15:13:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 21/23] media: ov5640: Add RGB888/BGR888 formats
Message-ID: <YhI+aQrbsFnZ1M2U@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210111044.152904-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210111044.152904-2-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Feb 10, 2022 at 12:10:42PM +0100, Jacopo Mondi wrote:
> Add support for RGB888/BGR888 image formats.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 3a21f4648acf..f894570ac53c 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -224,6 +224,14 @@ static const struct ov5640_pixfmt {
>  		.code = MEDIA_BUS_FMT_RGB565_1X16,
>  		.colorspace = V4L2_COLORSPACE_SRGB,
>  		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.bpp = 24,
> +	}, {
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.bpp = 16,

bpp = 24

If we can limit MEDIA_BUS_FMT_RGB565_1X16 to CSI-2 mode in the previous
patch, then this should be limited too.

>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.colorspace = V4L2_COLORSPACE_SRGB,
> @@ -2777,6 +2785,16 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
>  		fmt = 0x61;
>  		mux = OV5640_FMT_MUX_RGB;
>  		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		/* RGB888: BGR */

The datasheet documents formats 0x22 and 0x23 as BGRBGR... and RGBRGB...
but doesn't tell how that's mapped to the MIPI CSI-2 RGB888 formats
(which is transmitted with the blue bits first). I thus can't tell which
order is correct here. We can fix it later if it turns out not to be
correct.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
