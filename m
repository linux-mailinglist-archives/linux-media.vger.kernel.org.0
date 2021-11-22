Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695DE458760
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 01:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhKVAVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Nov 2021 19:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhKVAVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Nov 2021 19:21:32 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD05C061574
        for <linux-media@vger.kernel.org>; Sun, 21 Nov 2021 16:18:26 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id b12so29424279wrh.4
        for <linux-media@vger.kernel.org>; Sun, 21 Nov 2021 16:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=go7c2QBWhq0lsbH7L8wuZFptE1FECQtUD91SbcbS62M=;
        b=ftOoQ9A/ultzzppg619InPMqybQfdEcYs9VVNa4yKybrFgZIBNO/3LBIO0LjSL7LFo
         0xRYjKED75Ot2x8cpK5nMuvGtCF11IsAu5cQyyD5XtK3LqwOBeXVLHvflrDnt3TVaYx6
         ToSGIQexsLERzzWMQZQ2nP7WVumr+MFOQXN9M+Tf9DBoauPcc/E3V6B5kj9fv8XXvWs+
         OIe7k85FMb8yswN9XlSDwtMpEPZFmfNYxG6UTr6gXZ5FUqCd+sUvL8UD68nj3zB5ORuR
         w1HA+kaQAzUkhxgP+Q8kKrnjvb0PP0I4RFsVUIlF5GOKUgiPaGn8Q7Lmy5p5YwQSoiHQ
         2fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=go7c2QBWhq0lsbH7L8wuZFptE1FECQtUD91SbcbS62M=;
        b=DvYB8BKii9DcZnNbz/+p7HI0wEy12cHPcof/p0CMlobu49UTXYBx0RzrTaT9Z9bEp7
         v0YOcd3UN11ZvZRlRJYQuVi6TuK6tZbRdGVPRZscp3Y48H3mBpjetpwCotzavuNrJDpB
         X9bp0XRrDJcrA16jBnhTkmnbou7r4wqrLmgYejt5kxaSgPo9oCVL+wG/sKgnlzGQ3JAX
         mjmD7mgYAmUSZHyHfDTYNgipLI+Qmos3VYk67GYOx/Cq+gpRkpgBCPC4YrSjMWqc8BWN
         CJcoAC+Dt72vdtNY4jK9X7FI3AkuXlpZXWbZ2uuPAltj4+lBvdoTaqDB5Ra9IQXK26bk
         D+rA==
X-Gm-Message-State: AOAM530MMI35o2dJr2NRT84SeJqWl9qVBw4x7lRaJqPgQhi1W84M0OJ1
        y+Qw2pqoIbT0/G6tddULWnc=
X-Google-Smtp-Source: ABdhPJzZ2tPHsUVbR4t0DrMjmr2CL+Sgh3jp0uPOzYVi8VU5BOsqllndBfTt5ZF+9Fq8m+yOAtFeIw==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr30771470wrt.122.1637540305113;
        Sun, 21 Nov 2021 16:18:25 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id c1sm7204046wrt.14.2021.11.21.16.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 16:18:24 -0800 (PST)
Subject: Re: [PATCH v4 09/16] media: i2c: Update HTS values in ov8865
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-10-djrscally@gmail.com>
 <YYAB81QH3giCg7Wd@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <54dfa685-b61e-7118-1124-cbd5f3b58053@gmail.com>
Date:   Mon, 22 Nov 2021 00:18:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYAB81QH3giCg7Wd@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 01/11/2021 15:04, Sakari Ailus wrote:
> Hi Daniel,
>
> On Mon, Nov 01, 2021 at 12:11:12AM +0000, Daniel Scally wrote:
>> The HTS values for some of the modes in the ov8865 driver are a bit
>> unusual, coming in lower than the output_size_x is set to. It seems
>> like they might be calculated to fit the desired framerate into a
>> configuration with just two data lanes. To bring this more in line
>> with expected behaviour, raise the HTS values above the output_size_x.
> This isn't necessarily a problem as binning may be done in analogue domain.
> I don't know about this sensor though.
>
> Is the frame interval still as expected in binned modes after this patch?


Actually none of the modes have binning in the X dimension set on. The
ones with Y binning still have the framerates I expect, and the only
modes who's HTS values I'm changing here don't use binning at all

>
>> The corollary of that change is that the hardcoded frame intervals
>> against the modes no longer make sense, so remove those entirely.
>> Update the .g/s_frame_interval() callbacks to calculate the frame
>> interval based on the current mode and the vblank and hblank settings.
>>
>> The implementation of the .enum_frame_interval() callback is no longer
>> suitable since the possible frame rate is now a continuous range depending
>> on the vblank control setting, so remove that callback entirely.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  drivers/media/i2c/ov8865.c | 65 +++++++-------------------------------
>>  1 file changed, 11 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index 4b18cc80f985..1b8674152750 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -659,8 +659,6 @@ struct ov8865_mode {
>>  	unsigned int blc_anchor_right_start;
>>  	unsigned int blc_anchor_right_end;
>>  
>> -	struct v4l2_fract frame_interval;
>> -
>>  	bool pll2_binning;
>>  
>>  	const struct ov8865_register_value *register_values;
>> @@ -964,7 +962,7 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  	{
>>  		/* Horizontal */
>>  		.output_size_x			= 3264,
>> -		.hts				= 1944,
>> +		.hts				= 3888,
>>  
>>  		/* Vertical */
>>  		.output_size_y			= 2448,
>> @@ -1003,9 +1001,6 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  		.blc_anchor_right_start		= 1984,
>>  		.blc_anchor_right_end		= 2239,
>>  
>> -		/* Frame Interval */
>> -		.frame_interval			= { 1, 30 },
>> -
>>  		/* PLL */
>>  		.pll2_binning			= false,
>>  
>> @@ -1018,11 +1013,11 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  	{
>>  		/* Horizontal */
>>  		.output_size_x			= 3264,
>> -		.hts				= 2582,
>> +		.hts				= 3888,
>>  
>>  		/* Vertical */
>>  		.output_size_y			= 1836,
>> -		.vts				= 2002,
>> +		.vts				= 2470,
>>  
>>  		.size_auto			= true,
>>  		.size_auto_boundary_x		= 8,
>> @@ -1057,9 +1052,6 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  		.blc_anchor_right_start		= 1984,
>>  		.blc_anchor_right_end		= 2239,
>>  
>> -		/* Frame Interval */
>> -		.frame_interval			= { 1, 30 },
>> -
>>  		/* PLL */
>>  		.pll2_binning			= false,
>>  
>> @@ -1115,9 +1107,6 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  		.blc_anchor_right_start		= 992,
>>  		.blc_anchor_right_end		= 1119,
>>  
>> -		/* Frame Interval */
>> -		.frame_interval			= { 1, 30 },
>> -
>>  		/* PLL */
>>  		.pll2_binning			= true,
>>  
>> @@ -1179,9 +1168,6 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  		.blc_anchor_right_start		= 992,
>>  		.blc_anchor_right_end		= 1119,
>>  
>> -		/* Frame Interval */
>> -		.frame_interval			= { 1, 90 },
>> -
>>  		/* PLL */
>>  		.pll2_binning			= true,
>>  
>> @@ -2628,11 +2614,18 @@ static int ov8865_g_frame_interval(struct v4l2_subdev *subdev,
>>  {
>>  	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
>>  	const struct ov8865_mode *mode;
>> +	unsigned int framesize;
>> +	unsigned int fps;
>>  
>>  	mutex_lock(&sensor->mutex);
>>  
>>  	mode = sensor->state.mode;
>> -	interval->interval = mode->frame_interval;
>> +	framesize = mode->hts * (mode->output_size_y +
>> +				 sensor->ctrls.vblank->val);
>> +	fps = DIV_ROUND_CLOSEST(sensor->ctrls.pixel_rate->val, framesize);
>> +
>> +	interval->interval.numerator = 1;
>> +	interval->interval.denominator = fps;
>>  
>>  	mutex_unlock(&sensor->mutex);
>>  
>> @@ -2777,41 +2770,6 @@ static int ov8865_enum_frame_size(struct v4l2_subdev *subdev,
>>  	return 0;
>>  }
>>  
>> -static int ov8865_enum_frame_interval(struct v4l2_subdev *subdev,
>> -				      struct v4l2_subdev_state *sd_state,
>> -				      struct v4l2_subdev_frame_interval_enum *interval_enum)
>> -{
>> -	const struct ov8865_mode *mode = NULL;
>> -	unsigned int mode_index;
>> -	unsigned int interval_index;
>> -
>> -	if (interval_enum->index > 0)
>> -		return -EINVAL;
>> -	/*
>> -	 * Multiple modes with the same dimensions may have different frame
>> -	 * intervals, so look up each relevant mode.
>> -	 */
>> -	for (mode_index = 0, interval_index = 0;
>> -	     mode_index < ARRAY_SIZE(ov8865_modes); mode_index++) {
>> -		mode = &ov8865_modes[mode_index];
>> -
>> -		if (mode->output_size_x == interval_enum->width &&
>> -		    mode->output_size_y == interval_enum->height) {
>> -			if (interval_index == interval_enum->index)
>> -				break;
>> -
>> -			interval_index++;
>> -		}
>> -	}
>> -
>> -	if (mode_index == ARRAY_SIZE(ov8865_modes))
>> -		return -EINVAL;
>> -
>> -	interval_enum->interval = mode->frame_interval;
>> -
>> -	return 0;
>> -}
>> -
>>  static void
>>  __ov8865_get_pad_crop(struct ov8865_sensor *sensor,
>>  		      struct v4l2_subdev_state *state, unsigned int pad,
>> @@ -2870,7 +2828,6 @@ static const struct v4l2_subdev_pad_ops ov8865_subdev_pad_ops = {
>>  	.get_fmt		= ov8865_get_fmt,
>>  	.set_fmt		= ov8865_set_fmt,
>>  	.enum_frame_size	= ov8865_enum_frame_size,
>> -	.enum_frame_interval	= ov8865_enum_frame_interval,
>>  	.get_selection		= ov8865_get_selection,
>>  	.set_selection		= ov8865_get_selection,
>>  };
