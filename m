Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A618E4BE661
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 19:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357042AbiBUL4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 06:56:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357041AbiBUL4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 06:56:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0271FA42
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 03:56:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB12482;
        Mon, 21 Feb 2022 12:56:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645444572;
        bh=djr/BuPYc4aFFuol1nvZ2YRvpwj1sPYaHURlGa/jEf8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k1gEzYuFBsR3Hyw7IU5iYqAVU2EMoIcXtY4hqvq1AMYqoxPDRGQI1u2Xn5b/GjeqG
         5Vl1MhbzwPHbi4bXk5hmcMkQ/3XW283wuguu8BXqX7PyOTp3I3GVNAA7vkjC3stwJl
         lc/9/L4BnQaQDyW06erIqrUfoEvTHygUPTju62oc=
Date:   Mon, 21 Feb 2022 13:56:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
        dorota.czaplejewicz@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 7/7] media: imx: imx-mipi-csis: Add output format
Message-ID: <YhN902Mu1HJz8J2g@pendragon.ideasonboard.com>
References: <20220221110436.45419-1-jacopo@jmondi.org>
 <20220221110436.45419-8-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220221110436.45419-8-jacopo@jmondi.org>
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

On Mon, Feb 21, 2022 at 12:04:36PM +0100, Jacopo Mondi wrote:
> Due to how pixel components are transmitted on the CSI-2 serial bus
> and how they are deserialized by the CSI-2 receiver, the component
> ordering might change and the image formats on the sink and source pads
> of the receiver should reflect it.
> 
> For RGB24, in example, the component ordering on the wire as described by
> the CSI-2 specification matches the BGR888 format, while once
> deserialized by the CSIS receiver it matches the RGB888 format.
> 
> Add an additional .output field to struct csis_pix_format to allow
> propagating the correct format to the source pad after a format
> configuration on the sink.
> 
> The change is only relevant for RGB24 but paves the way for further
> format translations in future.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index a05ab151bebc..6f975b3702bc 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -349,6 +349,7 @@ struct csi_state {
>  
>  struct csis_pix_format {
>  	u32 code;
> +	u32 output;
>  	u32 data_type;
>  	u8 width;
>  };
> @@ -357,94 +358,116 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  	/* YUV formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.output = MEDIA_BUS_FMT_UYVY8_1X16,
>  		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
>  		.width = 16,
>  	},
>  	/* RGB formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_RGB565_1X16,
> +		.output = MEDIA_BUS_FMT_RGB565_1X16,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
>  		.width = 16,
>  	}, {
>  		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.output = MEDIA_BUS_FMT_RGB888_1X24,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
>  		.width = 24,
>  	},
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.output = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.output = MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.output = MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.output = MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y8_1X8,
> +		.output = MEDIA_BUS_FMT_Y8_1X8,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.output = MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.output = MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.output = MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.output = MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.output = MEDIA_BUS_FMT_Y10_1X10,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.output = MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.output = MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.output = MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.output = MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y12_1X12,
> +		.output = MEDIA_BUS_FMT_Y12_1X12,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.output = MEDIA_BUS_FMT_SBGGR14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.output = MEDIA_BUS_FMT_SGBRG14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.output = MEDIA_BUS_FMT_SGRBG14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
>  	}
> @@ -1103,6 +1126,9 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  				   CSIS_PAD_SOURCE);
>  	*fmt = sdformat->format;
>  
> +	/* The format on the source pad might change due to unpacking. */
> +	fmt->code = csis_fmt->output;
> +
>  	/* Store the CSIS format descriptor for active formats. */
>  	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		state->csis_fmt = csis_fmt;

-- 
Regards,

Laurent Pinchart
