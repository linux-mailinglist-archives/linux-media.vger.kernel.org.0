Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8DC1E1E1E
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 11:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731645AbgEZJOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 05:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731622AbgEZJOj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 05:14:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0757AC03E97E
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 02:14:39 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m12so21180057ljc.6
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wDpcErkal5SPfudsc5cgWQ3ocOLDqUOpPvJl+FkKN44=;
        b=EazX/CYZBaGX8Yr6ub8iBMNVM2dn3Y/B5jAaBqoETV4cTuSqZqVkD//4nvswiPyj1t
         UUS202llKuOQeORKYqUT8R6DhW4awooS1E+UgmwnCWUADHx3xhzm9o3xB1LS0cVo4lPp
         yWjId7UDf3HXO++u9iURNvXcfdPMCTv/4xUhH/wFG0jjWdO01vMNdh1D7hzkj0Ylp0uB
         t2ZnNHOtbhHvUYfCLOrMECQsmb7jXIpQbuYAzrIS6EB+jtluse/+fsbNm8wdkPQfrsSI
         FGCx2GUxP6iYKm1NL19/GdxZO7HrxIwd+aYWEcvyoCRu3mliv7ln3jV3qymObOxV9O+T
         tP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wDpcErkal5SPfudsc5cgWQ3ocOLDqUOpPvJl+FkKN44=;
        b=OxkEwpVMCHk6MFkBaX1MwUG6591bVHveof6b37la5s7oVyqLEKAvQhYQJq08atMVhU
         vV7EsaM3RJH5PMivtmMl6CGyyBeSQyDUuhyT7R6N9tN496fhaKv4x9jslVIIya5XgC89
         RSbS6Z0bqAFt8z03XN6bLeXAOQSegqNgHcrBVVSUGASYScsedbguQWrnGkgRXRDCAQ6I
         CHfkcFTYFsBq1avmJzbjTodjRqOquovNN8wxzE7EJsI0XO8lka/uSSXoBioPdu7AVf2h
         C5/YV1beEz7JfICjz5BzJD3YqOHbzyoXbhwxF5SUeNUlLdRgykdvYWS7pC8cG6JGMz/v
         dIDw==
X-Gm-Message-State: AOAM532ZnB51xgpZYFJi28yPtIybDlJqupbFgMhb0uffIi62GDEu/A/L
        0r7kGXaXAcoib7l1mCi73m3htw==
X-Google-Smtp-Source: ABdhPJxmpweaiSxR2yScFuc9xi6JmdZQe3VEixE3Vhl3SsA2zEQcu+NxkMAlb26OejuKvVyb7zXaHA==
X-Received: by 2002:a05:651c:1ad:: with SMTP id c13mr132250ljn.135.1590484477414;
        Tue, 26 May 2020 02:14:37 -0700 (PDT)
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id l2sm4546578ljg.124.2020.05.26.02.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 02:14:36 -0700 (PDT)
Subject: Re: [PATCH v3 04/10] media: i2c: imx290: Add support for 2 data lanes
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, manivannan.sadhasivam@linaro.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
 <20200524192505.20682-5-andrey.konovalov@linaro.org>
 <20200526090127.GG8214@valkosipuli.retiisi.org.uk>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <d68dda83-2911-be57-c5b9-b482fe1fa0ca@linaro.org>
Date:   Tue, 26 May 2020 12:14:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526090127.GG8214@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review

On 26.05.2020 12:01, Sakari Ailus wrote:
> Hi Andrey,
> 
> On Sun, May 24, 2020 at 10:24:59PM +0300, Andrey Konovalov wrote:
>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> The IMX290 sensor can output frames with 2/4 CSI2 data lanes. This commit
>> adds support for 2 lane mode in addition to the 4 lane and also
>> configuring the data lane settings in the driver based on system
>> configuration.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   drivers/media/i2c/imx290.c | 133 ++++++++++++++++++++++++++++++++++---
>>   1 file changed, 124 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
>> index 7b1de1f0c8b7..a361c9ac8bd5 100644
>> --- a/drivers/media/i2c/imx290.c
>> +++ b/drivers/media/i2c/imx290.c
>> @@ -25,7 +25,18 @@
>>   #define IMX290_STANDBY 0x3000
>>   #define IMX290_REGHOLD 0x3001
>>   #define IMX290_XMSTA 0x3002
>> +#define IMX290_FR_FDG_SEL 0x3009
>>   #define IMX290_GAIN 0x3014
>> +#define IMX290_HMAX_LOW 0x301c
>> +#define IMX290_HMAX_HIGH 0x301d
>> +#define IMX290_PHY_LANE_NUM 0x3407
>> +#define IMX290_CSI_LANE_MODE 0x3443
>> +
>> +/* HMAX fields */
>> +#define IMX290_HMAX_2_1920 0x1130
>> +#define IMX290_HMAX_4_1920 0x0898
>> +#define IMX290_HMAX_2_720 0x19C8
>> +#define IMX290_HMAX_4_720 0x0CE4
>>   
>>   #define IMX290_DEFAULT_LINK_FREQ 445500000
>>   
>> @@ -56,6 +67,7 @@ struct imx290 {
>>   	struct device *dev;
>>   	struct clk *xclk;
>>   	struct regmap *regmap;
>> +	u8 nlanes;
>>   
>>   	struct v4l2_subdev sd;
>>   	struct v4l2_fwnode_endpoint ep;
>> @@ -89,14 +101,11 @@ static const struct regmap_config imx290_regmap_config = {
>>   
>>   static const struct imx290_regval imx290_global_init_settings[] = {
>>   	{ 0x3007, 0x00 },
>> -	{ 0x3009, 0x00 },
>>   	{ 0x3018, 0x65 },
>>   	{ 0x3019, 0x04 },
>>   	{ 0x301a, 0x00 },
>> -	{ 0x3443, 0x03 },
>>   	{ 0x3444, 0x20 },
>>   	{ 0x3445, 0x25 },
>> -	{ 0x3407, 0x03 },
>>   	{ 0x303a, 0x0c },
>>   	{ 0x3040, 0x00 },
>>   	{ 0x3041, 0x00 },
>> @@ -169,7 +178,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
>>   	{ 0x3164, 0x1a },
>>   	{ 0x3480, 0x49 },
>>   	/* data rate settings */
>> -	{ 0x3009, 0x01 },
>>   	{ 0x3405, 0x10 },
>>   	{ 0x3446, 0x57 },
>>   	{ 0x3447, 0x00 },
>> @@ -187,8 +195,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
>>   	{ 0x3453, 0x00 },
>>   	{ 0x3454, 0x17 },
>>   	{ 0x3455, 0x00 },
>> -	{ 0x301c, 0x98 },
>> -	{ 0x301d, 0x08 },
>>   };
>>   
>>   static const struct imx290_regval imx290_720p_settings[] = {
>> @@ -210,7 +216,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
>>   	{ 0x3164, 0x1a },
>>   	{ 0x3480, 0x49 },
>>   	/* data rate settings */
>> -	{ 0x3009, 0x01 },
>>   	{ 0x3405, 0x10 },
>>   	{ 0x3446, 0x4f },
>>   	{ 0x3447, 0x00 },
>> @@ -228,8 +233,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
>>   	{ 0x3453, 0x00 },
>>   	{ 0x3454, 0x17 },
>>   	{ 0x3455, 0x00 },
>> -	{ 0x301c, 0xe4 },
>> -	{ 0x301d, 0x0c },
>>   };
>>   
>>   static const struct imx290_regval imx290_10bit_settings[] = {
>> @@ -522,6 +525,25 @@ static int imx290_write_current_format(struct imx290 *imx290,
>>   	return 0;
>>   }
>>   
>> +static int imx290_set_hmax(struct imx290 *imx290, u32 val)
>> +{
>> +	int ret;
>> +
>> +	ret = imx290_write_reg(imx290, IMX290_HMAX_LOW, (val & 0xff));
>> +	if (ret) {
>> +		dev_err(imx290->dev, "Error setting HMAX register\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = imx290_write_reg(imx290, IMX290_HMAX_HIGH, ((val >> 8) & 0xff));
>> +	if (ret) {
>> +		dev_err(imx290->dev, "Error setting HMAX register\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /* Start streaming */
>>   static int imx290_start_streaming(struct imx290 *imx290)
>>   {
>> @@ -551,6 +573,40 @@ static int imx290_start_streaming(struct imx290 *imx290)
>>   		return ret;
>>   	}
>>   
>> +	switch (imx290->nlanes) {
>> +	case 2:
>> +		if (imx290->current_mode->width == 1920) {
>> +			ret = imx290_set_hmax(imx290, IMX290_HMAX_2_1920);
>> +			if (ret < 0)
>> +				return ret;
>> +		} else {
>> +			ret = imx290_set_hmax(imx290, IMX290_HMAX_2_720);
>> +			if (ret < 0)
>> +				return ret;
>> +		}
>> +
>> +		break;
>> +	case 4:
>> +		if (imx290->current_mode->width == 1920) {
>> +			ret = imx290_set_hmax(imx290, IMX290_HMAX_4_1920);
>> +			if (ret < 0)
>> +				return ret;
>> +		} else {
>> +			ret = imx290_set_hmax(imx290, IMX290_HMAX_4_720);
>> +			if (ret < 0)
>> +				return ret;
> 
> I think it'd be nicer to put this where the mode definitions are, to avoid
> scattering the configuration around the driver.

Would it be OK if I move this inside imx290_write_current_format()?

>> +		}
>> +
>> +		break;
>> +	default:
>> +		/*
>> +		 * We should never hit this since the data lane count is
>> +		 * validated in probe itself
>> +		 */
>> +		dev_err(imx290->dev, "Lane configuration not supported\n");
>> +		return -EINVAL;
>> +	}
>> +
>>   	/* Apply customized values from user */
>>   	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
>>   	if (ret) {
>> @@ -607,6 +663,49 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
>>   				       imx290->supplies);
>>   }
>>   
>> +static int imx290_set_data_lanes(struct imx290 *imx290)
>> +{
>> +	int ret = 0, laneval, frsel;
>> +
>> +	switch (imx290->nlanes) {
>> +	case 2:
>> +		laneval = 0x01;
>> +		frsel = 0x02;
>> +		break;
>> +	case 4:
>> +		laneval = 0x03;
>> +		frsel = 0x01;
>> +		break;
>> +	default:
>> +		/*
>> +		 * We should never hit this since the data lane count is
>> +		 * validated in probe itself
>> +		 */
>> +		dev_err(imx290->dev, "Lane configuration not supported\n");
>> +		ret = -EINVAL;
>> +		goto exit;
>> +	}
>> +
>> +	ret = imx290_write_reg(imx290, IMX290_PHY_LANE_NUM, laneval);
>> +	if (ret) {
>> +		dev_err(imx290->dev, "Error setting Physical Lane number register\n");
>> +		goto exit;
>> +	}
>> +
>> +	ret = imx290_write_reg(imx290, IMX290_CSI_LANE_MODE, laneval);
>> +	if (ret) {
>> +		dev_err(imx290->dev, "Error setting CSI Lane mode register\n");
>> +		goto exit;
>> +	}
>> +
>> +	ret = imx290_write_reg(imx290, IMX290_FR_FDG_SEL, frsel);
>> +	if (ret)
>> +		dev_err(imx290->dev, "Error setting FR/FDG SEL register\n");
>> +
>> +exit:
>> +	return ret;
>> +}
>> +
>>   static int imx290_power_on(struct device *dev)
>>   {
>>   	struct i2c_client *client = to_i2c_client(dev);
>> @@ -631,6 +730,9 @@ static int imx290_power_on(struct device *dev)
>>   	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
>>   	usleep_range(30000, 31000);
>>   
>> +	/* Set data lane count */
>> +	imx290_set_data_lanes(imx290);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -703,6 +805,16 @@ static int imx290_probe(struct i2c_client *client)
>>   		goto free_err;
>>   	}
>>   
>> +	/* Get number of data lanes */
> 
> While at it, could you set the PHY type in the V4L2 fwnode endpoint before
> parsing the data using v4l2_fwnode_endpoint_alloc_parse()?

This is currently done in "[PATCH v3 10/10] media: i2c: imx290: set bus_type
before calling v4l2_fwnode_endpoint_alloc_parse()" (along with some more
clean-ups for the probe()). I can merge the PHY type in the V4L2 fwnode endpoint
change into this patch.

Thanks,
Andrey

>> +	imx290->nlanes = imx290->ep.bus.mipi_csi2.num_data_lanes;
>> +	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
>> +		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
>> +		ret = -EINVAL;
>> +		goto free_err;
>> +	}
>> +
>> +	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
>> +
>>   	if (!imx290->ep.nr_of_link_frequencies) {
>>   		dev_err(dev, "link-frequency property not found in DT\n");
>>   		ret = -EINVAL;
>> @@ -823,6 +935,9 @@ static int imx290_probe(struct i2c_client *client)
>>   		goto free_entity;
>>   	}
>>   
>> +	/* Set data lane count */
>> +	imx290_set_data_lanes(imx290);
>> +
>>   	pm_runtime_set_active(dev);
>>   	pm_runtime_enable(dev);
>>   	pm_runtime_idle(dev);
> 
