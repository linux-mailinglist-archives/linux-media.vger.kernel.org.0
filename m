Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A465C1E1E7F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 11:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbgEZJ1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 05:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbgEZJ1X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 05:27:23 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC09BC03E97E
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 02:27:22 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id w15so11863925lfe.11
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YWAzRC5vWFaerT+PrxcgDVCznHprBq1vLeMtOT5UI3Y=;
        b=AYUR1ofTIxp3pqwzqQ1seObOtjzronTTrGCkzzAsp0YMandNUBwAyUhWkyE/bTjIRk
         yeIe1ufA2NWyTU/ILAeqSUIWE2a7mwbLGAFIBKm8UZLENyRshx0lRL8p41Mqwv9l9aae
         6/5SLqVFyXjcuN3p0MHiZ0QLet6LWlJjWlfXnxeQCXXzJaiPbDXvfyGXozxEYPLbck8Y
         Wzy9E6s0TFRq0IT0bhz2OFIOHK+dg2mqcGXs34gHvxtjpVERFeO8SR0llmtjzWoAMiOI
         9xbkeWfhkPS9OpExAq9tjhoWoxYKHookPLBG50lUGMWqIG0wUhzhtyhv6GA+USMql8vQ
         b3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YWAzRC5vWFaerT+PrxcgDVCznHprBq1vLeMtOT5UI3Y=;
        b=ZuwVe5HYWkBekHxd3aEBZdnzw8F8Cc/krEOJyawi0CvJ+D9WBEGN6NEwgsgf2bsIpr
         l/zEg0sxvZoDPW4ryKJGmN9QIjjTJuSLytORvCxmY2dWY6K4huYjaOFsaRBSmstsKSZ9
         lcru/nlF8+I64asrfG2EmIVx+ONaFbkLjeLfSvDuUYqOTuMzTN3gzdbRCjjYZDGoMSPH
         psIRXLdLhmu/jQ8r0XBiTOSiTcZriRODlhcCO2jigmaxA7PQjdoqzdG7mmTxjRRxwvHY
         iDH77X2fveK6xaLEjYRnM51RT6fK7s95+riqU5OPFk0GgX7Lg0aYojZPghJ1hSqSYSUb
         IGAw==
X-Gm-Message-State: AOAM530eayfKrjAn30/c5Ob5R62cOr2FXDL4tht4r9Xnqz6+Eh3YPHUS
        7te9baJXb6HskmNdWMeKibwUNiyEqN3hRg==
X-Google-Smtp-Source: ABdhPJzZUg1AeY4ObpOP45wzM2E/oF0RXCpzj6bu00nxqPnJ9qOQUO8OvvuUXVdVxVqN6Sf5gmINyA==
X-Received: by 2002:a19:7714:: with SMTP id s20mr58762lfc.161.1590485240999;
        Tue, 26 May 2020 02:27:20 -0700 (PDT)
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id z16sm2694573lji.44.2020.05.26.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 02:27:20 -0700 (PDT)
Subject: Re: [PATCH v3 05/10] media: i2c: imx290: Add configurable link
 frequency and pixel rate
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, manivannan.sadhasivam@linaro.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
 <20200524192505.20682-6-andrey.konovalov@linaro.org>
 <20200526091234.GH8214@valkosipuli.retiisi.org.uk>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <91992bdb-deb1-0355-e61f-78c38a68f6d1@linaro.org>
Date:   Tue, 26 May 2020 12:27:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526091234.GH8214@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review!

On 26.05.2020 12:12, Sakari Ailus wrote:
> Hi Andrey,
> 
> On Sun, May 24, 2020 at 10:25:00PM +0300, Andrey Konovalov wrote:
>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> IMX290 operates with multiple link frequency and pixel rate combinations.
>> The initial driver used a single setting for both but since we now have
>> the lane count support in place, let's add configurable link frequency
>> and pixel rate.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   drivers/media/i2c/imx290.c | 100 ++++++++++++++++++++++++-------------
>>   1 file changed, 66 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
>> index a361c9ac8bd5..e800557cf423 100644
>> --- a/drivers/media/i2c/imx290.c
>> +++ b/drivers/media/i2c/imx290.c
>> @@ -38,8 +38,6 @@
>>   #define IMX290_HMAX_2_720 0x19C8
>>   #define IMX290_HMAX_4_720 0x0CE4
>>   
>> -#define IMX290_DEFAULT_LINK_FREQ 445500000
>> -
>>   static const char * const imx290_supply_name[] = {
>>   	"vdda",
>>   	"vddd",
>> @@ -56,8 +54,6 @@ struct imx290_regval {
>>   struct imx290_mode {
>>   	u32 width;
>>   	u32 height;
>> -	u32 pixel_rate;
>> -	u32 link_freq_index;
>>   
>>   	const struct imx290_regval *data;
>>   	u32 data_size;
>> @@ -248,8 +244,13 @@ static const struct imx290_regval imx290_10bit_settings[] = {
>>   };
>>   
>>   /* supported link frequencies */
>> -static const s64 imx290_link_freq[] = {
>> -	IMX290_DEFAULT_LINK_FREQ,
>> +static const s64 imx290_link_freq_2lanes[] = {
>> +	891000000, /* 1920x1080 -  2 lane */
>> +	594000000, /* 1280x720  -  2 lane */
>> +};
>> +static const s64 imx290_link_freq_4lanes[] = {
>> +	445500000, /* 1920x1080 -  4 lane */
>> +	297000000, /* 1280x720  -  4 lane */
>>   };
>>   
>>   /* Mode configs */
>> @@ -259,16 +260,12 @@ static const struct imx290_mode imx290_modes[] = {
>>   		.height = 1080,
>>   		.data = imx290_1080p_settings,
>>   		.data_size = ARRAY_SIZE(imx290_1080p_settings),
>> -		.pixel_rate = 178200000,
>> -		.link_freq_index = 0,
>>   	},
>>   	{
>>   		.width = 1280,
>>   		.height = 720,
>>   		.data = imx290_720p_settings,
>>   		.data_size = ARRAY_SIZE(imx290_720p_settings),
>> -		.pixel_rate = 178200000,
>> -		.link_freq_index = 0,
>>   	},
>>   };
>>   
>> @@ -442,6 +439,32 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
>>   	return 0;
>>   }
>>   
>> +static u8 imx290_get_link_freq_index(struct imx290 *imx290)
>> +{
>> +	const struct imx290_mode *cur_mode = imx290->current_mode;
>> +
>> +	return (cur_mode->width == 1920) ? 0 : 1;
> 
> Could you use (imx290->current_mode - imx290_modes) / sizeof(*imx290_modes)
> or something like that? It'd have fewer chances of breaking if new modes
> are added.
> 
>> +}
>> +
>> +static s64 imx290_get_link_freq(struct imx290 *imx290)
>> +{
>> +	u8 index = imx290_get_link_freq_index(imx290);
>> +
>> +	if (imx290->nlanes == 4)
>> +		return imx290_link_freq_4lanes[index];
>> +	else
>> +		return imx290_link_freq_2lanes[index];
> 
> Or even better: store the link frequencies to the modes themselves. They
> are a property of the modes after all.

Then we will get two sets (for 2 lanes and for 4 lanes) of two modes (1080p and 720p), right?

>> +}
>> +
>> +static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
>> +{
>> +	s64 link_freq = imx290_get_link_freq(imx290);
>> +	u8 nlanes = imx290->nlanes;
>> +
>> +	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
>> +	return (link_freq * 2 * nlanes / 10);
>> +}
>> +
>>   static int imx290_set_fmt(struct v4l2_subdev *sd,
>>   			  struct v4l2_subdev_pad_config *cfg,
>>   		      struct v4l2_subdev_format *fmt)
>> @@ -475,10 +498,14 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>>   		format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>>   	} else {
>>   		format = &imx290->current_format;
>> -		__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>> -		__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, mode->pixel_rate);
>> -
>>   		imx290->current_mode = mode;
>> +
>> +		if (imx290->link_freq)
>> +			__v4l2_ctrl_s_ctrl(imx290->link_freq,
>> +					   imx290_get_link_freq_index(imx290));
>> +		if (imx290->pixel_rate)
>> +			__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
>> +						 imx290_calc_pixel_rate(imx290));
>>   	}
>>   
>>   	*format = fmt->format;
>> @@ -502,12 +529,11 @@ static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
>>   	return 0;
>>   }
>>   
>> -static int imx290_write_current_format(struct imx290 *imx290,
>> -				       struct v4l2_mbus_framefmt *format)
>> +static int imx290_write_current_format(struct imx290 *imx290)
>>   {
>>   	int ret;
>>   
>> -	switch (format->code) {
>> +	switch (imx290->current_format.code) {
>>   	case MEDIA_BUS_FMT_SRGGB10_1X10:
>>   		ret = imx290_set_register_array(imx290, imx290_10bit_settings,
>>   						ARRAY_SIZE(
>> @@ -558,8 +584,8 @@ static int imx290_start_streaming(struct imx290 *imx290)
>>   		return ret;
>>   	}
>>   
>> -	/* Set current frame format */
>> -	ret = imx290_write_current_format(imx290, &imx290->current_format);
>> +	/* Apply the register values related to current frame format */
>> +	ret = imx290_write_current_format(imx290);
>>   	if (ret < 0) {
>>   		dev_err(imx290->dev, "Could not set frame format\n");
>>   		return ret;
>> @@ -821,12 +847,6 @@ static int imx290_probe(struct i2c_client *client)
>>   		goto free_err;
>>   	}
>>   
>> -	if (imx290->ep.link_frequencies[0] != IMX290_DEFAULT_LINK_FREQ) {
> 
> This check needs to be modified to correspond to the driver's new
> capabilities, not removed.

Agreed.
Do I understand correct that as the driver uses two link frequencies
for a given number of lanes now, it must check that *the both* frequencies
(for the given number of lanes) are listed in the device tree node?

Thanks,
Andrey

>> -		dev_err(dev, "Unsupported link frequency\n");
>> -		ret = -EINVAL;
>> -		goto free_err;
>> -	}
>> -
>>   	/* Only CSI2 is supported for now */
>>   	if (imx290->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
>>   		dev_err(dev, "Unsupported bus type, should be CSI2\n");
>> @@ -879,23 +899,38 @@ static int imx290_probe(struct i2c_client *client)
>>   
>>   	mutex_init(&imx290->lock);
>>   
>> +	/*
>> +	 * Initialize the frame format. In particular, imx290->current_mode
>> +	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() call
>> +	 * below relies on these fields.
>> +	 */
>> +	imx290_entity_init_cfg(&imx290->sd, NULL);
>> +
>>   	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
>>   
>>   	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>>   			  V4L2_CID_GAIN, 0, 72, 1, 0);
>> -	imx290->link_freq =
>> -		v4l2_ctrl_new_int_menu(&imx290->ctrls,
>> -				       &imx290_ctrl_ops,
>> -				       V4L2_CID_LINK_FREQ,
>> -				       ARRAY_SIZE(imx290_link_freq) - 1,
>> -				       0, imx290_link_freq);
>> +	if (imx290->nlanes == 4)
>> +		imx290->link_freq =
>> +			v4l2_ctrl_new_int_menu(&imx290->ctrls,
>> +					       &imx290_ctrl_ops,
>> +					       V4L2_CID_LINK_FREQ,
>> +					       ARRAY_SIZE(imx290_link_freq_4lanes) - 1,
>> +					       0, imx290_link_freq_4lanes);
>> +	else
>> +		imx290->link_freq =
>> +			v4l2_ctrl_new_int_menu(&imx290->ctrls,
>> +					       &imx290_ctrl_ops,
>> +					       V4L2_CID_LINK_FREQ,
>> +					       ARRAY_SIZE(imx290_link_freq_2lanes) - 1,
>> +					       0, imx290_link_freq_2lanes);
>>   	if (imx290->link_freq)
>>   		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>   
>>   	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>>   					       V4L2_CID_PIXEL_RATE, 1,
>>   					       INT_MAX, 1,
>> -					       imx290_modes[0].pixel_rate);
>> +					       imx290_calc_pixel_rate(imx290));
>>   
>>   	imx290->sd.ctrl_handler = &imx290->ctrls;
>>   
>> @@ -919,9 +954,6 @@ static int imx290_probe(struct i2c_client *client)
>>   		goto free_ctrl;
>>   	}
>>   
>> -	/* Initialize the frame format (this also sets imx290->current_mode) */
>> -	imx290_entity_init_cfg(&imx290->sd, NULL);
>> -
>>   	ret = v4l2_async_register_subdev(&imx290->sd);
>>   	if (ret < 0) {
>>   		dev_err(dev, "Could not register v4l2 device\n");
> 
