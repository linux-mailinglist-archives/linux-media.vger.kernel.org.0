Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0276E11F9B7
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfLORei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 12:34:38 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37854 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfLORei (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 12:34:38 -0500
Received: by mail-pf1-f194.google.com with SMTP id p14so2556509pfn.4
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2019 09:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6ujSsSDcBK3n4Bqga7fblzha00kGWmWX/mW5knjSwJI=;
        b=fKV7iVkg13oi3VruUvio7vqK8Q2GWFGCtNPCZ0HOvf1in8V7rly04vSo4vslMzhp06
         D2KT5fcASGtjlxvFvUuy+dPePqli/AWrf7usu7sXa5Hi2yZD6N3SfMAFgK1Q2btTli3u
         seQC10OwxDddTwndiPRo0qfBsNqHSBhMeJ2twxVULPp3y+6Vv9fGsz5sghc9VhuymnN0
         zyqkdkRg5YDRGs2DIBvCUIPs099QX0kWhU+EOE6jBNvieO4yX1rtGTiQoOhblZDKxaYW
         SUtN0CeytIh2QeBni/yLEIairIY8jrRh9AgcK+oQJRkwePC6+yaJfbbm/LKdL9a9BZmN
         CznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6ujSsSDcBK3n4Bqga7fblzha00kGWmWX/mW5knjSwJI=;
        b=ZKLweJMs3VTHGNwZuIBa/8fXMes6YR8ytdWAUSv6W/qJ3x1pktG/Fj1Dg+nRR8yVlw
         Y3v/3xlrs9zPRidnzn9iL0K7f9GiMY3znqBkh4S6/j3YHKyFJVF9b9d3rz1EupN/ghwA
         vnxv5FobA45dGzib09fnX7CvMz0tMOgXY8ScLkbieSWArJ8jqnUo5WQmW1Cb403JBKZG
         ZwhaSu5X3jmMZ5Rz/O0s8p5gUZ4FuC44WO+WChYEuo/JaC1+Qob2pBH2jM6L/eUC2E05
         miApy/hVdQw7tQgXRPuwXBi3lUJlmFwl2vpuNvk0XQsxJjxl9KjMw2quaQ5C/lSlc0by
         vM6g==
X-Gm-Message-State: APjAAAUTLuCoD9X8F831A8zxr/3QmuZDSntALwqBxycxb9jIJKF70nMu
        yoUe4H3cxIboHcLZivzkP0z/
X-Google-Smtp-Source: APXvYqwwXd8GtkKGFw4dphFWy1z9O5IvZPRJrfF08u65UmzJenhFAZT/srpftlljFJd8KFgNGCFA0Q==
X-Received: by 2002:a63:7045:: with SMTP id a5mr13479457pgn.49.1576431277135;
        Sun, 15 Dec 2019 09:34:37 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:78f:3e30:ad66:df45:6a09:a260])
        by smtp.gmail.com with ESMTPSA id q21sm18928635pff.105.2019.12.15.09.34.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:34:35 -0800 (PST)
Date:   Sun, 15 Dec 2019 23:04:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH 1/5] media: i2c: imx290: Add support for 2 data lanes
Message-ID: <20191215173427.GA11427@Mani-XPS-13-9360>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-2-manivannan.sadhasivam@linaro.org>
 <20191203084520.GP833@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203084520.GP833@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Dec 03, 2019 at 10:45:20AM +0200, Sakari Ailus wrote:
> Hi Manivannan,
> 
> Thanks for the patchset.
> 
> On Sat, Nov 30, 2019 at 12:35:37AM +0530, Manivannan Sadhasivam wrote:
> > The IMX290 sensor can output frames with 2/4 CSI2 data lanes. This commit
> > adds support for 2 lane mode in addition to the 4 lane and also
> > configuring the data lane settings in the driver based on system
> > configuration.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/media/i2c/imx290.c | 130 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 121 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index f7678e5a5d87..1d49910937fb 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -25,7 +25,18 @@
> >  #define IMX290_STANDBY 0x3000
> >  #define IMX290_REGHOLD 0x3001
> >  #define IMX290_XMSTA 0x3002
> > +#define IMX290_FR_FDG_SEL 0x3009
> >  #define IMX290_GAIN 0x3014
> > +#define IMX290_HMAX_LOW 0x301c
> > +#define IMX290_HMAX_HIGH 0x301d
> > +#define IMX290_PHY_LANE_NUM 0x3407
> > +#define IMX290_CSI_LANE_MODE 0x3443
> > +
> > +/* HMAX fields */
> > +#define IMX290_HMAX_2_1920 0x1130
> > +#define IMX290_HMAX_4_1920 0x0898
> > +#define IMX290_HMAX_2_720 0x19C8
> > +#define IMX290_HMAX_4_720 0x0CE4
> >  
> >  #define IMX290_DEFAULT_LINK_FREQ 445500000
> >  
> > @@ -56,6 +67,7 @@ struct imx290 {
> >  	struct device *dev;
> >  	struct clk *xclk;
> >  	struct regmap *regmap;
> > +	int nlanes;
> 
> You're using u8 for another small (unsigned) integer later. How about u8
> here?
> 

Yeah, this is a left over. I was initially trying to use some error
checking with this! Will change it to u8.

> >  
> >  	struct v4l2_subdev sd;
> >  	struct v4l2_fwnode_endpoint ep;
> > @@ -89,14 +101,11 @@ static const struct regmap_config imx290_regmap_config = {
> >  
> >  static const struct imx290_regval imx290_global_init_settings[] = {
> >  	{ 0x3007, 0x00 },
> > -	{ 0x3009, 0x00 },
> >  	{ 0x3018, 0x65 },
> >  	{ 0x3019, 0x04 },
> >  	{ 0x301a, 0x00 },
> > -	{ 0x3443, 0x03 },
> >  	{ 0x3444, 0x20 },
> >  	{ 0x3445, 0x25 },
> > -	{ 0x3407, 0x03 },
> >  	{ 0x303a, 0x0c },
> >  	{ 0x3040, 0x00 },
> >  	{ 0x3041, 0x00 },
> > @@ -169,7 +178,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
> >  	{ 0x3164, 0x1a },
> >  	{ 0x3480, 0x49 },
> >  	/* data rate settings */
> > -	{ 0x3009, 0x01 },
> >  	{ 0x3405, 0x10 },
> >  	{ 0x3446, 0x57 },
> >  	{ 0x3447, 0x00 },
> > @@ -187,8 +195,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
> >  	{ 0x3453, 0x00 },
> >  	{ 0x3454, 0x17 },
> >  	{ 0x3455, 0x00 },
> > -	{ 0x301c, 0x98 },
> > -	{ 0x301d, 0x08 },
> >  };
> >  
> >  static const struct imx290_regval imx290_720p_settings[] = {
> > @@ -210,7 +216,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
> >  	{ 0x3164, 0x1a },
> >  	{ 0x3480, 0x49 },
> >  	/* data rate settings */
> > -	{ 0x3009, 0x01 },
> >  	{ 0x3405, 0x10 },
> >  	{ 0x3446, 0x4f },
> >  	{ 0x3447, 0x00 },
> > @@ -228,8 +233,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
> >  	{ 0x3453, 0x00 },
> >  	{ 0x3454, 0x17 },
> >  	{ 0x3455, 0x00 },
> > -	{ 0x301c, 0xe4 },
> > -	{ 0x301d, 0x0c },
> >  };
> >  
> >  static const struct imx290_regval imx290_10bit_settings[] = {
> > @@ -522,6 +525,25 @@ static int imx290_write_current_format(struct imx290 *imx290,
> >  	return 0;
> >  }
> >  
> > +static int imx290_set_hmax(struct imx290 *imx290, u32 val)
> > +{
> > +	int ret;
> > +
> > +	ret = imx290_write_reg(imx290, IMX290_HMAX_LOW, (val & 0xff));
> > +	if (ret) {
> > +		dev_err(imx290->dev, "Error setting HMAX register\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = imx290_write_reg(imx290, IMX290_HMAX_HIGH, ((val >> 8) & 0xff));
> > +	if (ret) {
> > +		dev_err(imx290->dev, "Error setting HMAX register\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /* Start streaming */
> >  static int imx290_start_streaming(struct imx290 *imx290)
> >  {
> > @@ -551,6 +573,40 @@ static int imx290_start_streaming(struct imx290 *imx290)
> >  		return ret;
> >  	}
> >  
> > +	switch (imx290->nlanes) {
> > +	case 2:
> > +		if (imx290->current_mode->width == 1920) {
> > +			ret = imx290_set_hmax(imx290, IMX290_HMAX_2_1920);
> > +			if (ret < 0)
> > +				return ret;
> > +		} else {
> > +			ret = imx290_set_hmax(imx290, IMX290_HMAX_2_720);
> > +			if (ret < 0)
> > +				return ret;
> > +		}
> > +
> > +		break;
> > +	case 4:
> > +		if (imx290->current_mode->width == 1920) {
> > +			ret = imx290_set_hmax(imx290, IMX290_HMAX_4_1920);
> > +			if (ret < 0)
> > +				return ret;
> > +		} else {
> > +			ret = imx290_set_hmax(imx290, IMX290_HMAX_4_720);
> > +			if (ret < 0)
> > +				return ret;
> > +		}
> > +
> > +		break;
> > +	default:
> > +		/*
> > +		 * We should never hit this since the data lane count is
> > +		 * validated in probe itself
> > +		 */
> > +		dev_err(imx290->dev, "Lane configuration not supported\n");
> > +		return -EINVAL;
> > +	}
> > +
> >  	/* Apply customized values from user */
> >  	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> >  	if (ret) {
> > @@ -607,6 +663,49 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
> >  				       imx290->supplies);
> >  }
> >  
> > +static int imx290_set_data_lanes(struct imx290 *imx290)
> > +{
> > +	int ret = 0, laneval, frsel;
> > +
> > +	switch (imx290->nlanes) {
> > +	case 2:
> > +		laneval = 0x01;
> > +		frsel = 0x02;
> > +		break;
> > +	case 4:
> > +		laneval = 0x03;
> > +		frsel = 0x01;
> > +		break;
> > +	default:
> > +		/*
> > +		 * We should never hit this since the data lane count is
> > +		 * validated in probe itself
> > +		 */
> > +		dev_err(imx290->dev, "Lane configuration not supported\n");
> > +		ret = -EINVAL;
> > +		goto exit;
> > +	}
> > +
> > +	ret = imx290_write_reg(imx290, IMX290_PHY_LANE_NUM, laneval);
> > +	if (ret) {
> > +		dev_err(imx290->dev, "Error setting Physical Lane number register\n");
> > +		goto exit;
> > +	}
> > +
> > +	ret = imx290_write_reg(imx290, IMX290_CSI_LANE_MODE, laneval);
> > +	if (ret) {
> > +		dev_err(imx290->dev, "Error setting CSI Lane mode register\n");
> > +		goto exit;
> > +	}
> > +
> > +	ret = imx290_write_reg(imx290, IMX290_FR_FDG_SEL, frsel);
> > +	if (ret)
> > +		dev_err(imx290->dev, "Error setting FR/FDG SEL register\n");
> > +
> > +exit:
> > +	return ret;
> > +}
> > +
> >  static int imx290_power_on(struct device *dev)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev);
> > @@ -703,6 +802,16 @@ static int imx290_probe(struct i2c_client *client)
> >  		goto free_err;
> >  	}
> >  
> > +	/* Get number of data lanes */
> > +	imx290->nlanes = imx290->ep.bus.mipi_csi2.num_data_lanes;
> > +	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
> > +		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
> > +		ret = -EINVAL;
> > +		goto free_err;
> > +	}
> > +
> > +	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
> > +
> >  	if (!imx290->ep.nr_of_link_frequencies) {
> >  		dev_err(dev, "link-frequency property not found in DT\n");
> >  		ret = -EINVAL;
> > @@ -822,6 +931,9 @@ static int imx290_probe(struct i2c_client *client)
> >  		goto free_entity;
> >  	}
> >  
> > +	/* Set data lane count */
> > +	imx290_set_data_lanes(imx290);
> 
> The sensor is likely (but not necessarily) about to be powered off here.
> Wouldn't this also belong to be put to the power on sequence?
> 

Agree, will add.

Thanks,
Mani

> > +
> >  	pm_runtime_set_active(dev);
> >  	pm_runtime_enable(dev);
> >  	pm_runtime_idle(dev);
> 
> -- 
> Regards,
> 
> Sakari Ailus
