Return-Path: <linux-media+bounces-12085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A58D1A93
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 14:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE7011C2246A
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D7616D337;
	Tue, 28 May 2024 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a+8kVL/1"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8071753;
	Tue, 28 May 2024 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897848; cv=none; b=hIUVMOKhPGQej/FWhHyLAIdK1J9Cn+fQ/XqVmL1RrKBXJ3+EhgB7U1EpdEDY//30O6J28yPw4PtmR8PH6ybNXOU5DpJmvZEnCOO4hBOsh2O7LtnfusrTYr6JzXRwQVF07YR4jE7aDYoq7A+FGP80ffUNEyFV9y5WsJJTGiG1btc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897848; c=relaxed/simple;
	bh=4Ge7JY7ImMa7q9IWrwIynuBy3wbZER4TVhCPOcJVMUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzxFlviGQbwRfWUK16N/Ngonl25SBiDKKAZUeW7vf2ciu8ReM6CJOLoDTF5JCcJebxkzcD2XJwF9mwLQyNSUoJKmpBxsSAqRONf2KPpeOgZBdmcCgrPxLzuHAAT3TggKmu21eigeTVSJ7cjqfvxWcagSdZTX8Cb8ipkqS2sAv6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a+8kVL/1; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716897845;
	bh=4Ge7JY7ImMa7q9IWrwIynuBy3wbZER4TVhCPOcJVMUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a+8kVL/1AnBdLfcK72sAD6H82pUvktcZEGpZKH57wplS47VeFJcfSYF+Frqhd6TjE
	 K0gTasPiu+XE+xjeCZA/QocXMLlh7PFM4ex1PNNAanMnUCrDRDBbMzBra0pOk04DRj
	 FYnV6V8w8Z9g5NCid1I/nnX+Y+HIPThv8S4EafJakIDufuj4mfw7k/A/O/ehNv30dJ
	 TuOD5PJl2ToHMgA6FjxuvvFj3rnVdGfKTc4jyOv/2Xsqlr4au17dOXHpPcqjVqIZaX
	 VqYoBgiNglBunsOQXq1VlKTMmpxxoS3XvBO7PE2fdL1Ayp4ofaAEmyh5KBq5ynmPC5
	 faLTHXP8z0jtQ==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9F68A378042B;
	Tue, 28 May 2024 12:04:04 +0000 (UTC)
Message-ID: <0a3c796c-2149-42a3-92d6-d45a0ccc78f0@collabora.com>
Date: Tue, 28 May 2024 14:04:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: staging: max96712: Add support for MAX96724
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
References: <20240527133410.1690169-1-niklas.soderlund+renesas@ragnatech.se>
 <4f3ea360-f17f-4a91-bbdc-08caebb977a7@collabora.com>
 <20240528093750.GA420934@ragnatech.se>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240528093750.GA420934@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/28/24 11:37 AM, Niklas Söderlund wrote:
> Hi Julien,
> 
> On 2024-05-28 10:04:37 +0200, Julien Massot wrote:
>> Hi Niklas,
>>
>> On 5/27/24 3:34 PM, Niklas Söderlund wrote:
>>> The MAX96724 is almost identical to the MAX96712 and can be supported by
>>> the same driver, add support for it.
>>>
>>> For the staging driver which only supports patter generation the big
>>> difference is that the datasheet (rev 4) for MAX96724 do not describe
>>> the DEBUG_EXTRA register, which is at offset 0x0009 on MAX96712. It's
>>> not clear if this register is removed or moved to a different offset.
>>> What is known is writing to register 0x0009 have no effect on MAX96724.
>>>
>>> This makes it impossible to increase the test pattern clock frequency
>>> from 25 MHz to 75Mhz on MAX96724. To be able to get a stable test
>>> pattern the DPLL frequency have to be increase instead to compensate for
>>> this. The frequency selected is found by experimentation as the MAX96724
>>> datasheet is much sparser then what's available for MAX96712.
>>
>> There is a specific User Guide for this chip[1] (under NDA) which describes
>> the test pattern
>> clock frequency.
>>
>> | Debug Extra 0x9 [1:0] | PATGEN_CLK_SRC (0x1dc [7]) | PCLK Frequency |
>> |                       |       Pipe 0               |                |
>> |-----------------------|----------------------------|----------------|
>> | 00                    | x                          | 25  MHz        |
>> | 01                    | x                          | 75  MHz        |
>> | 1x                    | 0                          | 150 MHz        |
>> | 1x                    | 1 (default)                | 375 MHz        |
> 
> The same table exists in the MAX96712 users guide, which I do have.
> 
> The issue is that the datasheet for MAX96724 I found online do not list
> the Debug Extra (0x9) register that is present on MAX96712. If you have
> access to the full MAX96724 documentation could you check if it contains
> the Debug Extra register and at which offset it is?
No the Debug Extra register is not listed in the datasheet (rev4).
Only in the User Guide and the Windows GUI.
> 
> I if treat MAX96724 as it is documented for MAX96712 I get an
> unstable/distorted test pattern on MAX96724.
Ok better to not write this register then :) there might be a reason 
this register disappeared
from the datasheet.
> 
>>
>>
>> PATGEN_CLK_SRC
>> Pipe 0 0x1dc
>> Pipe 1 0x1fc
>> Pipe 2 0x21c
>> Pipe 3 0x23c
>>
>>
>> The document also mention that "This internal Pclk is NOT related to the
>> MIPI CSI
>> port clock rate" so increasing the dpll should not increase the pattern
>> generation
>> clock.
>>
>> Perhaps increasing the DPLL allows to transmit more data on the CSI port
>> because the pattern
>> generator is running at a higher clock rate than what we expect.
> 
> That is possible. I only have the limited register information found
> online for MAX96724, so I can't compare the setup with MAX96712. But my
> suspicion is that the test pattern clock is running slower on MAX96724
> without the DEBUG_EXTRA write.
> 
> For MAX96712 the reset default value for DEBUG_EXTRA is 0x00, which if
> this is also true for MAX96724 means the test pattern clock is running
> at 25Mhz.
> 
> This fits with my observations. As without an increased DPLL I do get
> frames, most only contain zero or a few line. But some contains 80+% of
> the image. There is little distortion in color on each line, but there
> are lines missing.
> 
> For example on the check pattern generation. The square "corners" lines
> up perfectly, and the squares are the correct width, but not the correct
> height, most of them are too short. I'm just happy I found a way to
> generate a stable pattern on both devices from the documentation I have.
> 
> This driver is in staging as it only supports pattern generation and not
> the GMSL side. My use-case is to have a video source to test the video
> capture pipeline on Renesas SoCs where both MAX96712 and MAX96724 are in
> use.
> 
>>
>> Best regards,
>> Julien
>>
>> [1]: GMSL2_Customers_MAX96724 User Guide (rev2)
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> ---
>>>    drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
>>>    1 file changed, 21 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
>>> index ea67bcf69c9d..69a0a6a16cf9 100644
>>> --- a/drivers/staging/media/max96712/max96712.c
>>> +++ b/drivers/staging/media/max96712/max96712.c
>>> @@ -17,8 +17,10 @@
>>>    #include <media/v4l2-subdev.h>
>>>    #define MAX96712_ID 0x20
>>> +#define MAX96724_ID 0xA7
These identifiers seems incorrect
#define MAX96712_ID 0xA0 (also valid for MAX96712B)
#define MAX96724_ID 0xA2
#define MAX96724F_ID 0xA3
#define MAX96724R_ID 0xA4


>>>    #define MAX96712_DPLL_FREQ 1000
>>> +#define MAX96724_DPLL_FREQ 1200
>>>    enum max96712_pattern {
>>>    	MAX96712_PATTERN_CHECKERBOARD = 0,
>>> @@ -31,6 +33,7 @@ struct max96712_priv {
>>>    	struct gpio_desc *gpiod_pwdn;
>>>    	bool cphy;
>>> +	bool max96724;
>>>    	struct v4l2_mbus_config_mipi_csi2 mipi;
>>>    	struct v4l2_subdev sd;
>>> @@ -120,6 +123,7 @@ static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
>>>    static void max96712_mipi_configure(struct max96712_priv *priv)
>>>    {
>>> +	unsigned int dpll_freq;
>>>    	unsigned int i;
>>>    	u8 phy5 = 0;
>>> @@ -152,10 +156,11 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
>>>    	max96712_write(priv, 0x8a5, phy5);
>>>    	/* Set link frequency for PHY0 and PHY1. */
>>> +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
>>>    	max96712_update_bits(priv, 0x415, 0x3f,
>>> -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
>>> +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
>>>    	max96712_update_bits(priv, 0x418, 0x3f,
>>> -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
>>> +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
>>>    	/* Enable PHY0 and PHY1 */
>>>    	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
>>> @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>>>    	}
>>>    	/* PCLK 75MHz. */
>>> -	max96712_write(priv, 0x0009, 0x01);
>>> +	if (!priv->max96724)
>>> +		max96712_write(priv, 0x0009, 0x01);
>>>    	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
>>>    	max96712_write_bulk_value(priv, 0x1052, 0, 3);
>>> @@ -290,6 +296,7 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
>>>    static int max96712_v4l2_register(struct max96712_priv *priv)
>>>    {
>>> +	unsigned int dpll_freq;
>>>    	long pixel_rate;
>>>    	int ret;
>>> @@ -303,7 +310,8 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
>>>    	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
>>>    	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
>>>    	 */
>>> -	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
>>> +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
>>> +	pixel_rate = dpll_freq / priv->mipi.num_data_lanes * 1000000;
>>>    	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
>>>    			  pixel_rate, pixel_rate, 1, pixel_rate);
>>> @@ -419,8 +427,15 @@ static int max96712_probe(struct i2c_client *client)
>>>    	if (priv->gpiod_pwdn)
>>>    		usleep_range(4000, 5000);
>>> -	if (max96712_read(priv, 0x4a) != MAX96712_ID)
>>> +	switch (max96712_read(priv, 0x4a)) {
0x4a is a VDDCMP register you should read 0xd instead (DEV_ID)
switch (max96712_read(priv, 0xd)) {

>>> +	case MAX96712_ID:
>>> +		break;
>>> +	case MAX96724_ID:
>>> +		priv->max96724 = true;
>>> +		break;
>>> +	default:
>>>    		return -ENODEV;
>>> +	}
>>>    	max96712_reset(priv);
>>> @@ -444,6 +459,7 @@ static void max96712_remove(struct i2c_client *client)
>>>    static const struct of_device_id max96712_of_table[] = {
>>>    	{ .compatible = "maxim,max96712" },
>>> +	{ .compatible = "maxim,max96724" },
>>>    	{ /* sentinel */ },
>>>    };
>>>    MODULE_DEVICE_TABLE(of, max96712_of_table);
>>
>> -- 
Best Regards,
Julien

