Return-Path: <linux-media+bounces-36179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEC8AECE54
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 17:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFD3B1892CEE
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 15:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7C4230264;
	Sun, 29 Jun 2025 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWXV2Qpc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDECF6FB9
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751210938; cv=none; b=aLILei03oSoi0XzIRIZmVNkCWgPMLz0a34Mg4gC1xXjURaMoyexaSc2nY0cr47Zm9/qbnasBFay8PZtY+2BRN2/SXu9t0xNKHxwR68iaucIJ5VQispAYsy0YYQ/xHRvlVkRUZ4dNIjWkXMGUPZNcmsnxOpNjv2HLKAo+CsKuvnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751210938; c=relaxed/simple;
	bh=4UvkGdf5K7sGGFMG2NkYH9lxo3gP8BlNzbnwN3HYG/M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=q9uYI96x2SIwgl5eSKZz7BjI3r5f9K6L53hcR62odNEiYTNL0npsW7HebpXLfUKXlEJ3NA+6LBiXhVv1RQvUiwSgm1T6XLxFSelD7E+M3Ls4gQfgVvIWv2W/0R2FT9BoQVqbU7z1VgjCk27fLtRdW/A0rCIsZASEdrxSoM/zS6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWXV2Qpc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D565C4CEEB;
	Sun, 29 Jun 2025 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751210937;
	bh=4UvkGdf5K7sGGFMG2NkYH9lxo3gP8BlNzbnwN3HYG/M=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=GWXV2Qpcj2mJBIo/59LsiQ7736tc5yxZVv3olF1j2cEhjPP9niTL4TWH7u4xN/KiY
	 z8xaOrYN/j2UMDlGeIJT+dBZToqMlagTtYZKIX5yrpPzyM5vfyyafsHDNnqPVqwKED
	 YamRkwDPcqyxTfNpsXfGg89X5PEl99qtbwQtS8VNsaPfdC/LMRwD3IguQZvUPt96tw
	 C4E6JwyqSbHQmQM9k9on2Qn94cydxFX8lQ/LajWkALcJClp0ksFIs87ZkoECB5cLmv
	 QO1qJ7APEwUAB1GfdubJaa9ptqX91Wu/xAg98AlWkdAQa3p2E+ujIcQLrnrnHVjHrT
	 DXd/XFhLR7ZGw==
Message-ID: <f0c66067-00d9-4f2d-bfb0-776ca2ebd09b@kernel.org>
Date: Sun, 29 Jun 2025 17:28:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v2 09/12] media: mt9m114: Fix scaler bypass mode
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mathis Foerst <mathis.foerst@mt.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-10-hansg@kernel.org>
 <20250603124814.GF27361@pendragon.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250603124814.GF27361@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3-Jun-25 2:48 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Sat, May 31, 2025 at 06:31:44PM +0200, Hans de Goede wrote:
>> As indicated by the comment in mt9m114_ifp_set_fmt():
>>
>> 	/* If the output format is RAW10, bypass the scaler. */
>> 	if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
>> 		...
>>
>> The intend of the driver is that the scalar is bypassed when the ISP
>> source/output pad's pixel-format is set to MEDIA_BUS_FMT_SGRBG10_1X10.
>>
>> This patch makes 2 changes which are required to get this to work properly:
>>
>> 1. Set the MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE bit in
>>    the MT9M114_CAM_OUTPUT_FORMAT register.
> 
> Does that bit actually make a difference ? It's documented as only being
> effective when MT9M114_CAM_OUTPUT_FORMAT_BT656_ENABLE is also set, and
> the driver never sets that.

I've just given not setting the bit a try and indeed setting the bit
is not necessary. I'll drop this for the next version.

>> 2. Disable cropping/composing by setting crop and compose selections on
>>    the ISP sink/input format to the format widthxheight @ 0x0.
>>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> ---
>> Changes in v2:
>> - When bypassing the scalar make ifp_get_selection() / ifp_set_selection()
>>   fill sel->r with a rectangle of (0,0)/wxh and return 0 instead of
>>   returning -EINVAL
>> ---
>>  drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++++-----
>>  1 file changed, 30 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>> index 7a1451006cfe..d954f2be8f0d 100644
>> --- a/drivers/media/i2c/mt9m114.c
>> +++ b/drivers/media/i2c/mt9m114.c
>> @@ -467,7 +467,8 @@ static const struct mt9m114_format_info mt9m114_format_infos[] = {
>>  		/* Keep the format compatible with the IFP sink pad last. */
>>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>  		.output_format = MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_RAWR10
>> -			| MT9M114_CAM_OUTPUT_FORMAT_FORMAT_BAYER,
>> +			| MT9M114_CAM_OUTPUT_FORMAT_FORMAT_BAYER
>> +			| MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE,
>>  		.flags = MT9M114_FMT_FLAG_PARALLEL | MT9M114_FMT_FLAG_CSI2,
>>  	}
>>  };
>> @@ -850,6 +851,7 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>>  	const struct v4l2_mbus_framefmt *format;
>>  	const struct v4l2_rect *crop;
>>  	const struct v4l2_rect *compose;
>> +	unsigned int border;
>>  	u64 output_format;
>>  	int ret = 0;
>>  
>> @@ -869,10 +871,12 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>>  	 * by demosaicing that are taken into account in the crop rectangle but
>>  	 * not in the hardware.
>>  	 */
> 
> The comment should be updated.

Ack.

>> +	border = (format->code == MEDIA_BUS_FMT_SGRBG10_1X10) ? 0 : 4;
> 
> No need for parentheses.

Ack.

>> +
>>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
>> -		  crop->left - 4, &ret);
>> +		  crop->left - border, &ret);
>>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
>> -		  crop->top - 4, &ret);
>> +		  crop->top - border, &ret);
>>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
>>  		  crop->width, &ret);
>>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
>> @@ -911,7 +915,8 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>>  			   MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_MASK |
>>  			   MT9M114_CAM_OUTPUT_FORMAT_FORMAT_MASK |
>>  			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_BYTES |
>> -			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE);
>> +			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE |
>> +			   MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE);
>>  	output_format |= info->output_format;
>>  
>>  	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
>> @@ -1810,6 +1815,7 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>>  {
>>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
>>  	struct v4l2_mbus_framefmt *format;
>> +	struct v4l2_rect *crop;
>>  
>>  	format = v4l2_subdev_state_get_format(state, fmt->pad);
>>  
>> @@ -1830,8 +1836,15 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>>  		format->code = info->code;
>>  
>>  		/* If the output format is RAW10, bypass the scaler. */
>> -		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
>> +		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
>>  			*format = *v4l2_subdev_state_get_format(state, 0);
>> +			crop = v4l2_subdev_state_get_crop(state, 0);
>> +			crop->left = 0;
>> +			crop->top = 0;
>> +			crop->width = format->width;
>> +			crop->height = format->height;
>> +			*v4l2_subdev_state_get_compose(state, 0) = *crop;
>> +		}
> 
> This one is annoying. Normally changing a format or selection rectangle
> in a subdev should only propagate the configuration downstream. Here
> you're modiying selection rectangles upstream of the source pad. I think
> we'll need to live with it, I don't really see a way around that. It's a
> non-standard behaviour though, and would require sensor-specific
> userspace to handle this right.
> 
> There's however one issue. When switching back from a raw output to a
> processed output, the crop and compose rectangles will remain the same,
> and will have values that are not valid for processed output as they
> won't have the 4 pixels border subtracted. I think you'll need to update
> them, but only when the source format actually changes. Setting the
> source format without modifying the media bus code should not result in
> the selection rectangles being reset.
> 
> All this needs to be explained in a comment in the code.

Ok, I'll modify the code to fixup the rectangles when the output-format
changes from MEDIA_BUS_FMT_SGRBG10_1X10 -> not MEDIA_BUS_FMT_SGRBG10_1X10.

And I'll add a comment explaining this.

Actually given the above comment it is best to split this change
into multiple patches, so for v3 I'm going to do as you request
but it will be split out a bit more.

>>  	}
>>  
>>  	fmt->format = *format;
>> @@ -1851,6 +1864,12 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
>>  	if (sel->pad != 0)
>>  		return -EINVAL;
>>  
>> +	/* Crop and compose cannot be changed when bypassing the scaler */
> 
> s/scaler/scaler./
> 
> Same below.

Ack.

>> +	if (v4l2_subdev_state_get_format(state, 1)->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
>> +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
>> +		return 0;
>> +	}
> 
> Instead of special-casing this, can you use a similar approach as in
> mt9m114_configure_ifp() and replace the 4 and 8 below with border and
> boarder * 2 (with an update to the comment too) ?

Ack, this is part of the splitting of this patch mentioned above.

> 
>> +
>>  	switch (sel->target) {
>>  	case V4L2_SEL_TGT_CROP:
>>  		sel->r = *v4l2_subdev_state_get_crop(state, 0);
>> @@ -1911,6 +1930,12 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
>>  	if (sel->pad != 0)
>>  		return -EINVAL;
>>  
>> +	/* Crop and compose cannot be changed when bypassing the scaler */
>> +	if (v4l2_subdev_state_get_format(state, 1)->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
>> +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
>> +		return 0;
>> +	}
> 
> Let's add a source_format variable to avoid duplicating the
> v4l2_subdev_state_get_format(), call, as we use the source format at the
> end of the function.

Ack.

Regards,

Hans


> 
>> +
>>  	format = v4l2_subdev_state_get_format(state, 0);
>>  	crop = v4l2_subdev_state_get_crop(state, 0);
>>  	compose = v4l2_subdev_state_get_compose(state, 0);
> 



