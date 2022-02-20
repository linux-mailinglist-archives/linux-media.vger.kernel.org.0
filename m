Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C0C4BCD40
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 09:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235148AbiBTIdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 03:33:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiBTIde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 03:33:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC4EE37BD9
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 00:33:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62B6725B;
        Sun, 20 Feb 2022 09:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645345992;
        bh=SSzti+MYr0t/j5M/vov4iLoAGcUFZ09VWqVqvZvlJXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W5DWM0wJpoGWqweVrrZ0Wc6rjkvqYK/+AVIVjx7cE60WkEbwyi62yP5p0Yp81282T
         WalR8y8boBLAtRow3VfMf0HDSR/wCS6HN77Px9q059PVINyH6dHXjutmdNLWQApGWA
         jHcUMXpIBZykQHHwD4GFR6AeuJyQSngnm/BIK7GA=
Date:   Sun, 20 Feb 2022 10:33:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 7/7] media: imx: imx-mipi-csis: Add output format
Message-ID: <YhH8vTlAJa6R+mTl@pendragon.ideasonboard.com>
References: <20220218183421.583874-1-jacopo@jmondi.org>
 <20220218183421.583874-8-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220218183421.583874-8-jacopo@jmondi.org>
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

On Fri, Feb 18, 2022 at 07:34:21PM +0100, Jacopo Mondi wrote:
> Due to how pixel components are transmitted on the CSI-2 serial bus
> and how they are stored in memory by the CSI-2 receiver, the component
> ordering might change and the image formats on the sink and source pads
> of the receiver should reflect it.
> 
> For RGB24, in example, the component ordering on the wire as described by
> the CSI-2 specification matches the BGR888 format, while once stored in
> in memory by the CSIS receiver they match the RGB888 format.

The CSI-2 receiver doesn't store data in memory. The issue this patch
fixes is that the CSI-2 receiver deserializes data and outputs it on a
parallel bus, with a bit order that is specific to the receiver and may
not match the media bus code used to described the format on the CSI-2
bus.

> Add an additional .output field to struct csis_pix_format to allow
> propagating the correct format to the source pad after a format
> configuration on the sink.
> 
> The change is only relevant for RGB24 but paves the way for further
> format translations in future.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 29 +++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index fdf133f81c5b..128f4180d1e9 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -351,6 +351,7 @@ struct csis_pix_format {
>  	u32 code;
>  	u32 data_type;
>  	u8 width;
> +	u32 output;

I'd move this right after code, as they're related.

>  };
>  
>  static const struct csis_pix_format mipi_csis_formats[] = {
> @@ -359,95 +360,117 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
>  		.width = 16,
> +		.output = MEDIA_BUS_FMT_UYVY8_1X16,
>  	},
>  	/* RGB formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_RGB565_1X16,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
>  		.width = 16,
> +		.output = MEDIA_BUS_FMT_RGB565_1X16,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_BGR888_1X24,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
>  		.width = 24,
> +		.output = MEDIA_BUS_FMT_RGB888_1X24,
>  	},
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
> +		.output = MEDIA_BUS_FMT_SBGGR8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
> +		.output = MEDIA_BUS_FMT_SGBRG8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
> +		.output = MEDIA_BUS_FMT_SGRBG8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
> +		.output = MEDIA_BUS_FMT_SRGGB8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
> +		.output = MEDIA_BUS_FMT_Y8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
> +		.output = MEDIA_BUS_FMT_SBGGR10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
> +		.output = MEDIA_BUS_FMT_SGBRG10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
> +		.output = MEDIA_BUS_FMT_SGRBG10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
> +		.output = MEDIA_BUS_FMT_SRGGB10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
> +		.output = MEDIA_BUS_FMT_Y10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
> +		.output = MEDIA_BUS_FMT_SBGGR12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
> +		.output = MEDIA_BUS_FMT_SGBRG12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
> +		.output = MEDIA_BUS_FMT_SGRBG12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
> +		.output = MEDIA_BUS_FMT_SRGGB12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
> +		.output = MEDIA_BUS_FMT_Y12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
> +		.output = MEDIA_BUS_FMT_SBGGR14_1X14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
> +		.output = MEDIA_BUS_FMT_SGBRG14_1X14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
> +		.output = MEDIA_BUS_FMT_SGRBG14_1X14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
> +		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
>  	}
>  };
>  
> @@ -1090,7 +1113,11 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	/* Propagate the format from sink to source. */
>  	fmt = mipi_csis_get_format(state, sd_state, sdformat->which,
>  				   CSIS_PAD_SOURCE);
> -	*fmt = sdformat->format;
> +
> +	/* The format on the source pad might change due to unpacking. */
> +	fmt->code = csis_fmt->output;
> +	fmt->width = sdformat->format.width;
> +	fmt->height = sdformat->format.height;

You need to also propagate colorspace. The simplest solution is

	*fmt = sdformat->format;

	/* The format on the source pad might change due to unpacking. */
	fmt->code = csis_fmt->output;

>  	/* Store the CSIS format descriptor for active formats. */
>  	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)

-- 
Regards,

Laurent Pinchart
