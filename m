Return-Path: <linux-media+bounces-37111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD1AFCC16
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C961425197
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C572E0B6E;
	Tue,  8 Jul 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3Qgeq3L"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259512E0B47;
	Tue,  8 Jul 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981180; cv=none; b=rP7izSrWecof3XQ9zxSZCjyhUOEIL21vDoNQP+RLlLsamo+zvYcGHC5st45cLRCqC/KB5ZxeE5/NZDkw0sUd7TYegKNnE4uBLdb5Hotnr4ywwBR+PJSNY/Bchtx04Lkqz1l5fzwVaeKKInGsL5yXIT9+QhWhrZvYtpHx2ILiX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981180; c=relaxed/simple;
	bh=KGSD01mWAGQp3+osKCuSaDthkiML4R0p0SOrxBh53Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCvF86nG7NGv2X/vC0Yng+GkWwaDQsANTGn66FhHXZ2Zl9olyobva+JP9m+UU9PhC6Bc9QlvNC3rZgrXOJPhuhrS3HcGUQQ6AebyCoiBuuOiif+sAric8qYqPW1mEYjvoqfh+PGB4MRW4XFejGyhqtFWYRYy/9SYJU1I6usy/qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3Qgeq3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EBFC4CEF6;
	Tue,  8 Jul 2025 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751981180;
	bh=KGSD01mWAGQp3+osKCuSaDthkiML4R0p0SOrxBh53Xg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p3Qgeq3LFVe51rLV9n6i3lQUCy7GBVuzP2sNNp+Ly5fVT9Sv30IpnSqdU1ku2LWXa
	 fS/z01KYL8Tg2jO2NeRAUbIem2lKClyD4+WKXPXRFqIZ6PkmAFzRnGf7MO8l/pOA8O
	 Qq3FHwJ2FxP0v5nO6JggqmjJpJFzuYmPcka1N8HGLBTW29Ehpx5LAF/ReupVVXfpC+
	 jgj/wwOQS514OueZ+6jEdt06wvImz1JrhxbefelprFWC3tUGukCE9qLSXc7Pi2MzoJ
	 nRIwYroR9bMeKK3ZmQdiAEK2YRv/UfCqPOoHTKbjj1cntxNT+jxnipRq3sZZ0FnD1u
	 +F2RdNOCrSJ4g==
Message-ID: <550105c6-1520-4f2b-ae4f-0f135a8f3b5f@kernel.org>
Date: Tue, 8 Jul 2025 15:26:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: add ov2735 image sensor driver
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250708102604.29261-1-hardevsinh.palaniya@siliconsignals.io>
 <20250708102604.29261-3-hardevsinh.palaniya@siliconsignals.io>
 <ca6d8433-6ce7-46a9-8c16-11845f87402b@kernel.org>
 <PN3P287MB35199F4D8EA9F384660A337DFF4EA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <PN3P287MB35199F4D8EA9F384660A337DFF4EA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/07/2025 13:28, Hardevsinh Palaniya wrote:
>> On 08/07/2025 12:25, Hardevsinh Palaniya wrote:
>>> +
>>> +static const struct v4l2_subdev_ops ov2735_subdev_ops = {
>>> +     .video = &ov2735_video_ops,
>>> +     .pad = &ov2735_pad_ops,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_internal_ops ov2735_internal_ops = {
>>> +     .init_state = ov2735_init_state,
>>> +};
>>> +
>>> +static int ov2735_power_on(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct ov2735 *ov2735 = to_ov2735(sd);
>>> +     unsigned long delay_us;
>>> +     int ret;
>>> +
>>> +     gpiod_set_value_cansleep(ov2735->pwdn_gpio, 0);
>>
>> So you power up here...
>>
>>> +     fsleep(3000);
>>> +
>>> +     ret = regulator_bulk_enable(ARRAY_SIZE(ov2735_supply_name),
>>> +                                 ov2735->supplies);
>>> +     if (ret) {
>>> +             dev_err(ov2735->dev, "failed to enable regulators\n");
>>> +             return ret;
>>> +     }
>>> +
>>> +     gpiod_set_value_cansleep(ov2735->pwdn_gpio, 1);
>>
>> And here you power down your device. This makes no sense... unless this
>> is not a power down GPIO.
>  
> In Datasheet 
> Power-up sequence:
> 
> 	  |--------------------------------------
> avdd  ----|
> 	   <-t1->
> 		|--------------------------------
> dovdd  ---------|
> 		  <-T2->
> 			|--------------------------
> dvdd  ------------------|
> 			 <-T3->
>           |---------------------|
> pwdn -----|			|-------------------

So that is not really a typical power down pin and this should be
explained clearly in property description. It rather feels like power-on
pin, which you need to pull for some time to boot the process and later
the supplies are keeping it on.

Best regards,
Krzysztof

