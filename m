Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCDE810FA3A
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 09:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfLCIzH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 03:55:07 -0500
Received: from retiisi.org.uk ([95.216.213.190]:45714 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbfLCIzG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 03:55:06 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3F903634C87;
        Tue,  3 Dec 2019 10:54:18 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ic3wn-0001NZ-OF; Tue, 03 Dec 2019 10:54:17 +0200
Date:   Tue, 3 Dec 2019 10:54:17 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH 3/5] media: i2c: imx290: Add RAW12 mode support
Message-ID: <20191203085417.GB5282@valkosipuli.retiisi.org.uk>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129190541.30315-4-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Sat, Nov 30, 2019 at 12:35:39AM +0530, Manivannan Sadhasivam wrote:
> IMX290 is capable of outputting frames in both Raw Bayer (packed) 10 and
> 12 bit formats. Since the driver already supports RAW10 mode, let's add
> the missing RAW12 mode as well.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/media/i2c/imx290.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index e218c959a729..d5bb3a59ac46 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -75,6 +75,7 @@ struct imx290 {
>  	struct clk *xclk;
>  	struct regmap *regmap;
>  	int nlanes;
> +	u8 bpp;
>  
>  	struct v4l2_subdev sd;
>  	struct v4l2_fwnode_endpoint ep;
> @@ -98,6 +99,7 @@ struct imx290_pixfmt {
>  
>  static const struct imx290_pixfmt imx290_formats[] = {
>  	{ MEDIA_BUS_FMT_SRGGB10_1X10 },
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12 },
>  };
>  
>  static const struct regmap_config imx290_regmap_config = {
> @@ -265,6 +267,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
>  	{ 0x300b, 0x00},
>  };
>  
> +static const struct imx290_regval imx290_12bit_settings[] = {
> +	{ 0x3005, 0x01 },
> +	{ 0x3046, 0x01 },
> +	{ 0x3129, 0x00 },
> +	{ 0x317c, 0x00 },
> +	{ 0x31ec, 0x0e },
> +	{ 0x3441, 0x0c },
> +	{ 0x3442, 0x0c },
> +	{ 0x300a, 0xf0 },
> +	{ 0x300b, 0x00 },
> +};
> +
>  /* supported link frequencies */
>  static const s64 imx290_link_freq[] = {
>  	IMX290_DEFAULT_LINK_FREQ,
> @@ -550,6 +564,21 @@ static int imx290_write_current_format(struct imx290 *imx290,
>  			dev_err(imx290->dev, "Could not set format registers\n");
>  			return ret;
>  		}
> +
> +		imx290->bpp = 10;
> +
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		ret = imx290_set_register_array(imx290, imx290_12bit_settings,
> +						ARRAY_SIZE(
> +							imx290_12bit_settings));
> +		if (ret < 0) {
> +			dev_err(imx290->dev, "Could not set format registers\n");
> +			return ret;
> +		}
> +
> +		imx290->bpp = 12;
> +
>  		break;
>  	default:
>  		dev_err(imx290->dev, "Unknown pixel format\n");
> @@ -910,6 +939,9 @@ static int imx290_probe(struct i2c_client *client)
>  		goto free_err;
>  	}
>  
> +	/* Default bits per pixel value */
> +	imx290->bpp = 10;

Where is the format being initialised at the moment? Nowhere?

If that is the case, I think it should be fixed before this patch.

> +
>  	mutex_init(&imx290->lock);
>  
>  	v4l2_ctrl_handler_init(&imx290->ctrls, 4);

-- 
Kind regards,

Sakari Ailus
