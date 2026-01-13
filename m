Return-Path: <linux-media+bounces-50530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C11D17910
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8F02302CA00
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B83389DFA;
	Tue, 13 Jan 2026 09:15:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out2.tele.net (rmisp-mx-out2.tele.net [194.208.23.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCD6389475;
	Tue, 13 Jan 2026 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295710; cv=none; b=FyEfV4sEHukxfHf+F6xSZ1qOVcRG6vy3QQ0nvmrnaGmGdmFBgm/Xy5Yhlt2Xj1uw8vtBZSPE56XFwUSEK+/oBtNwcMf/WGBBF3G32vC+hSjDB9twCxRdasY2xSjtVH7519a9k40cRqenMVZLeVXnKCuDFhYQ127sW7FI0qmEl1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295710; c=relaxed/simple;
	bh=O4Qpy5B7lwVnt3ddGls9FXndTqJkqO3iFyLaT5+kbW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=td0to7UUwHH8jzW7/yGneapmSIfdQorYElG40ybtTdyKlsuMUqbNxtT1XkL41mfGprvmE7bcmLAHpV5KRpTmUEgjNYnq2+p6wxsNthUziapjRDgBzp7ceXQu5WDsamO35VD9+QrZD3RSJOex//gPLEuX3NRdVc57/Di7r2drJPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out2.tele.net (Postfix) with ESMTPA id 743C610E3CAC;
	Tue, 13 Jan 2026 10:06:42 +0100 (CET)
Message-ID: <f2e77bb5-957e-4751-8304-d9fb94927417@emfend.at>
Date: Tue, 13 Jan 2026 10:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] media: i2c: add Himax HM1246 image sensor driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hao Yao <hao.yao@intel.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 bsp-development.geo@leica-geosystems.com
References: <20260112-hm1246-v7-0-fee8587f2808@emfend.at>
 <20260112-hm1246-v7-2-fee8587f2808@emfend.at>
 <aWVFE-Y5HRi_XZRE@smile.fi.intel.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <aWVFE-Y5HRi_XZRE@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andy,

thanks a lot for feedback.

Am 12.01.2026 um 20:01 schrieb Andy Shevchenko:
> On Mon, Jan 12, 2026 at 03:49:33PM +0100, Matthias Fend wrote:
>> Add a V4L2 sub-device driver for Himax HM1246 image sensor.
>>
>> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
>> array size of 1296 x 976. It is programmable through an I2C interface and
>> connected via parallel bus.
>>
>> The sensor has an internal ISP with a complete image processing pipeline
>> including control loops. However, this driver uses the sensor in raw mode
>> and the entire ISP is bypassed.
> 
> ...
> 
>> +struct hm1246_mode {
>> +	u32 codes[4];
>> +	u32 clocks_per_pixel;
> 
>> +	u32 top;
>> +	u32 left;
>> +	u32 width;
>> +	u32 height;
> 
> Why not use struct v4l2_rect?

Valid question. I would save something in six places, but add something 
in about 27 others. Because of this ratio, I opted for the current way.

> 
>> +	u32 hts;
>> +	u32 vts_min;
>> +	const struct hm1246_reg_list reg_list;
>> +};
> 
> ...
> 
>> +static int hm1246_set_format(struct v4l2_subdev *sd,
>> +			     struct v4l2_subdev_state *state,
>> +			     struct v4l2_subdev_format *fmt)
>> +{
>> +	struct hm1246 *hm1246 = to_hm1246(sd);
>> +	struct v4l2_mbus_framefmt *mbus_fmt;
>> +	struct v4l2_rect *crop;
>> +	const struct hm1246_mode *mode;
>> +
>> +	mode = hm1246_find_mode_by_mbus_code(hm1246, fmt->format.code);
>> +	if (IS_ERR(mode))
>> +		mode = &hm1246_modes[0];
>> +
>> +	crop = v4l2_subdev_state_get_crop(state, 0);
> 
>> +	crop->top = mode->top;
>> +	crop->left = mode->left;
>> +	crop->width = mode->width;
>> +	crop->height = mode->height;
> 
> With the above done this becomes a one-liner:
> 
> 	*crop = mode.<rect>; // <rect> is whatever name for the embedded field
> 
>> +	hm1246_update_pad_format(hm1246, mode, &fmt->format);
>> +	mbus_fmt = v4l2_subdev_state_get_format(state, 0);
>> +	*mbus_fmt = fmt->format;
>> +
>> +	return 0;
>> +}
> 
> ...
> 
>> +static int hm1246_get_selection(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *state,
>> +				struct v4l2_subdev_selection *sel)
>> +{
>> +	const struct v4l2_mbus_framefmt *format;
>> +	const struct hm1246_mode *mode;
>> +
>> +	format = v4l2_subdev_state_get_format(state, 0);
>> +	mode = v4l2_find_nearest_size(hm1246_modes, ARRAY_SIZE(hm1246_modes),
>> +				      width, height, format->width,
>> +				      format->height);
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
>> +		return 0;
>> +
>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
>> +		sel->r.top = 0;
>> +		sel->r.left = 0;
>> +		sel->r.width = HM1246_NATIVE_WIDTH;
>> +		sel->r.height = HM1246_NATIVE_HEIGHT;
>> +		return 0;
>> +
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> 
>> +		sel->r.top = mode->top;
>> +		sel->r.left = mode->left;
>> +		sel->r.width = mode->width;
>> +		sel->r.height = mode->height;
> 
> Seems in the same way here.
> 
>> +		return 0;
>> +	}
> 
>> +	return -EINVAL;
> 
> Why not making it a default case?

I prefer it when the return statement is at the end of the function. Do 
you see a problem here?

> 
>> +}
> 
> ...
> 
>> +	hm1246->reset_gpio =
>> +		devm_gpiod_get_optional(hm1246->dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(hm1246->reset_gpio))
>> +		return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->reset_gpio),
>> +				     "failed to get reset GPIO\n");
> 
> Can it be GPIO reset driver used instead? (Note, it's made agnostic now.)

That would probably be possible, but I currently don't see any advantage 
for I2C image sensors. If I understand correctly, you would first have 
to define a reset controller that could then be used in the sensor – 
instead of simply specifying the GPIO directly.
The advantage of being able to share the reset line with other 
components probably doesn't make sense for these sensors in most cases. 
That's perhaps also the reason why it hasn't been used before.

Maybe the media maintainers have an opinion on this?

Thanks
  ~Matthias

> 


