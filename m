Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCAB10FA19
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 09:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfLCIqL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 03:46:11 -0500
Received: from retiisi.org.uk ([95.216.213.190]:45614 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725845AbfLCIqL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 03:46:11 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 43FBF634C87;
        Tue,  3 Dec 2019 10:45:21 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ic3o8-0001N9-Ne; Tue, 03 Dec 2019 10:45:20 +0200
Date:   Tue, 3 Dec 2019 10:45:20 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH 1/5] media: i2c: imx290: Add support for 2 data lanes
Message-ID: <20191203084520.GP833@valkosipuli.retiisi.org.uk>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129190541.30315-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

Thanks for the patchset.

On Sat, Nov 30, 2019 at 12:35:37AM +0530, Manivannan Sadhasivam wrote:
> The IMX290 sensor can output frames with 2/4 CSI2 data lanes. This commit
> adds support for 2 lane mode in addition to the 4 lane and also
> configuring the data lane settings in the driver based on system
> configuration.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/media/i2c/imx290.c | 130 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 121 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index f7678e5a5d87..1d49910937fb 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -25,7 +25,18 @@
>  #define IMX290_STANDBY 0x3000
>  #define IMX290_REGHOLD 0x3001
>  #define IMX290_XMSTA 0x3002
> +#define IMX290_FR_FDG_SEL 0x3009
>  #define IMX290_GAIN 0x3014
> +#define IMX290_HMAX_LOW 0x301c
> +#define IMX290_HMAX_HIGH 0x301d
> +#define IMX290_PHY_LANE_NUM 0x3407
> +#define IMX290_CSI_LANE_MODE 0x3443
> +
> +/* HMAX fields */
> +#define IMX290_HMAX_2_1920 0x1130
> +#define IMX290_HMAX_4_1920 0x0898
> +#define IMX290_HMAX_2_720 0x19C8
> +#define IMX290_HMAX_4_720 0x0CE4
>  
>  #define IMX290_DEFAULT_LINK_FREQ 445500000
>  
> @@ -56,6 +67,7 @@ struct imx290 {
>  	struct device *dev;
>  	struct clk *xclk;
>  	struct regmap *regmap;
> +	int nlanes;

You're using u8 for another small (unsigned) integer later. How about u8
here?

>  
>  	struct v4l2_subdev sd;
>  	struct v4l2_fwnode_endpoint ep;
> @@ -89,14 +101,11 @@ static const struct regmap_config imx290_regmap_config = {
>  
>  static const struct imx290_regval imx290_global_init_settings[] = {
>  	{ 0x3007, 0x00 },
> -	{ 0x3009, 0x00 },
>  	{ 0x3018, 0x65 },
>  	{ 0x3019, 0x04 },
>  	{ 0x301a, 0x00 },
> -	{ 0x3443, 0x03 },
>  	{ 0x3444, 0x20 },
>  	{ 0x3445, 0x25 },
> -	{ 0x3407, 0x03 },
>  	{ 0x303a, 0x0c },
>  	{ 0x3040, 0x00 },
>  	{ 0x3041, 0x00 },
> @@ -169,7 +178,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
>  	{ 0x3164, 0x1a },
>  	{ 0x3480, 0x49 },
>  	/* data rate settings */
> -	{ 0x3009, 0x01 },
>  	{ 0x3405, 0x10 },
>  	{ 0x3446, 0x57 },
>  	{ 0x3447, 0x00 },
> @@ -187,8 +195,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
>  	{ 0x3453, 0x00 },
>  	{ 0x3454, 0x17 },
>  	{ 0x3455, 0x00 },
> -	{ 0x301c, 0x98 },
> -	{ 0x301d, 0x08 },
>  };
>  
>  static const struct imx290_regval imx290_720p_settings[] = {
> @@ -210,7 +216,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
>  	{ 0x3164, 0x1a },
>  	{ 0x3480, 0x49 },
>  	/* data rate settings */
> -	{ 0x3009, 0x01 },
>  	{ 0x3405, 0x10 },
>  	{ 0x3446, 0x4f },
>  	{ 0x3447, 0x00 },
> @@ -228,8 +233,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
>  	{ 0x3453, 0x00 },
>  	{ 0x3454, 0x17 },
>  	{ 0x3455, 0x00 },
> -	{ 0x301c, 0xe4 },
> -	{ 0x301d, 0x0c },
>  };
>  
>  static const struct imx290_regval imx290_10bit_settings[] = {
> @@ -522,6 +525,25 @@ static int imx290_write_current_format(struct imx290 *imx290,
>  	return 0;
>  }
>  
> +static int imx290_set_hmax(struct imx290 *imx290, u32 val)
> +{
> +	int ret;
> +
> +	ret = imx290_write_reg(imx290, IMX290_HMAX_LOW, (val & 0xff));
> +	if (ret) {
> +		dev_err(imx290->dev, "Error setting HMAX register\n");
> +		return ret;
> +	}
> +
> +	ret = imx290_write_reg(imx290, IMX290_HMAX_HIGH, ((val >> 8) & 0xff));
> +	if (ret) {
> +		dev_err(imx290->dev, "Error setting HMAX register\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /* Start streaming */
>  static int imx290_start_streaming(struct imx290 *imx290)
>  {
> @@ -551,6 +573,40 @@ static int imx290_start_streaming(struct imx290 *imx290)
>  		return ret;
>  	}
>  
> +	switch (imx290->nlanes) {
> +	case 2:
> +		if (imx290->current_mode->width == 1920) {
> +			ret = imx290_set_hmax(imx290, IMX290_HMAX_2_1920);
> +			if (ret < 0)
> +				return ret;
> +		} else {
> +			ret = imx290_set_hmax(imx290, IMX290_HMAX_2_720);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		break;
> +	case 4:
> +		if (imx290->current_mode->width == 1920) {
> +			ret = imx290_set_hmax(imx290, IMX290_HMAX_4_1920);
> +			if (ret < 0)
> +				return ret;
> +		} else {
> +			ret = imx290_set_hmax(imx290, IMX290_HMAX_4_720);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		break;
> +	default:
> +		/*
> +		 * We should never hit this since the data lane count is
> +		 * validated in probe itself
> +		 */
> +		dev_err(imx290->dev, "Lane configuration not supported\n");
> +		return -EINVAL;
> +	}
> +
>  	/* Apply customized values from user */
>  	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
>  	if (ret) {
> @@ -607,6 +663,49 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
>  				       imx290->supplies);
>  }
>  
> +static int imx290_set_data_lanes(struct imx290 *imx290)
> +{
> +	int ret = 0, laneval, frsel;
> +
> +	switch (imx290->nlanes) {
> +	case 2:
> +		laneval = 0x01;
> +		frsel = 0x02;
> +		break;
> +	case 4:
> +		laneval = 0x03;
> +		frsel = 0x01;
> +		break;
> +	default:
> +		/*
> +		 * We should never hit this since the data lane count is
> +		 * validated in probe itself
> +		 */
> +		dev_err(imx290->dev, "Lane configuration not supported\n");
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	ret = imx290_write_reg(imx290, IMX290_PHY_LANE_NUM, laneval);
> +	if (ret) {
> +		dev_err(imx290->dev, "Error setting Physical Lane number register\n");
> +		goto exit;
> +	}
> +
> +	ret = imx290_write_reg(imx290, IMX290_CSI_LANE_MODE, laneval);
> +	if (ret) {
> +		dev_err(imx290->dev, "Error setting CSI Lane mode register\n");
> +		goto exit;
> +	}
> +
> +	ret = imx290_write_reg(imx290, IMX290_FR_FDG_SEL, frsel);
> +	if (ret)
> +		dev_err(imx290->dev, "Error setting FR/FDG SEL register\n");
> +
> +exit:
> +	return ret;
> +}
> +
>  static int imx290_power_on(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> @@ -703,6 +802,16 @@ static int imx290_probe(struct i2c_client *client)
>  		goto free_err;
>  	}
>  
> +	/* Get number of data lanes */
> +	imx290->nlanes = imx290->ep.bus.mipi_csi2.num_data_lanes;
> +	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
> +		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
> +		ret = -EINVAL;
> +		goto free_err;
> +	}
> +
> +	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
> +
>  	if (!imx290->ep.nr_of_link_frequencies) {
>  		dev_err(dev, "link-frequency property not found in DT\n");
>  		ret = -EINVAL;
> @@ -822,6 +931,9 @@ static int imx290_probe(struct i2c_client *client)
>  		goto free_entity;
>  	}
>  
> +	/* Set data lane count */
> +	imx290_set_data_lanes(imx290);

The sensor is likely (but not necessarily) about to be powered off here.
Wouldn't this also belong to be put to the power on sequence?

> +
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>  	pm_runtime_idle(dev);

-- 
Regards,

Sakari Ailus
