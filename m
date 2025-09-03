Return-Path: <linux-media+bounces-41737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E0B42BEF
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 23:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E637A1BC76BE
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9285E2EB843;
	Wed,  3 Sep 2025 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0BNkr92"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9C2BE631;
	Wed,  3 Sep 2025 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756934946; cv=none; b=beVdOVkDsqmNOz576cTxTt60JpJQYMY9jOHQIzY6eH4V/4RBqDkOeQ9EJlNcLXqCJHeYm+JZVuNVy0p44fnly9OIxc2aSDw1i+ZUxZaf5rZoLv0LMdFdCrYtmLy+to6Q0aZzYYDOejt5H6M+eeWLqXKZ6mohrEwgRQgzazsT0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756934946; c=relaxed/simple;
	bh=7SVgbfVOoax32KdoDim4jvHnPooapvb5b2nR8ORrvU4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=f2QupVoXhzFRcO3pXQNhV7eMmnQr7pdptL8ea35OJ276tAS3fUf9wJzSggMYQjeiZManxyMwejZJtVRGXz/1bwLfApa2scUFln9fbj+kJtJUuKOJHEjjhE+rZaHQtW/+2lu8zIlbAJQCUe2FXcAqcT9hSNtAqiOgPTsQTk1hfBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0BNkr92; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16957C4CEF4;
	Wed,  3 Sep 2025 21:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756934945;
	bh=7SVgbfVOoax32KdoDim4jvHnPooapvb5b2nR8ORrvU4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=f0BNkr92T/TrVKvAAMDvQK7wbRg0H89K4vBRW5jYGLt2L51z9bT0YQe4J8P3IufHE
	 U+f33ouEOxsgUyHVEiekBUidCRqL9X2Mo532lkMaMbJKnTB4+O75npenAx+RKpnUbO
	 lnoxINPeV+9L8I2OZdOicwhB1UhlEOYc5gnn/C8AGyIa6NEgi8LG/dduUqunfmPrUV
	 QIf8wMOOGsBaP2jvus4Q+jFRjz38d43XWZJH69j4GylBTPD5ZNGnKlDPcp3LOLDFPA
	 z03WL/oVkMdSuor+8Fp5RxLKIAseho0lrQo//DjeLLaFevTEItRz3hxgDpSJxEG/x0
	 NZBA1Zp3obT0w==
Message-ID: <809eaabf-6ef0-4c86-91c9-cacc3c224bc9@kernel.org>
Date: Wed, 3 Sep 2025 23:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 00/11] media: adv7180: Improve the control over decoder
 power
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
 <80d191a0-d978-4909-a0f2-d25cd9757d55@kernel.org>
 <20250903143539.GA1207681@ragnatech.se>
Content-Language: en-US, nl
In-Reply-To: <20250903143539.GA1207681@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2025 16:35, Niklas Söderlund wrote:
> Hi Hans,
> 
> Thanks for your review effort!
> 
> On 2025-09-03 10:46:11 +0200, Hans Verkuil wrote:
>> On 28/08/2025 18:06, Niklas Söderlund wrote:
>>> Hello,
>>>
>>> This series started as an effort to fix issues with querystd. To do that
>>> it turned out the whole drivers design around how it controls the power
>>> to the video decoder block inside the chip had to be reworked. As a
>>> bonus this works removes the now deprecated .s_power callback from
>>> adv7180.
>>>
>>> The adv7180 drivers comes from a time before media controller and all
>>> operation callbacks are, more or less, designed around the concept that
>>> a video device is the only user-space facing API. In that world a vdev
>>> would attached the subdevice, call .s_power and then perform format
>>> configuration using the other operation callbacks and then start
>>> streaming with .s_stream. Needles to say this mode of operation don't
>>> work well with media controller where the subdevices itself have a
>>> user-space API exposed thru a subdev device.
>>>
>>> The initial problem I tried to solve (querystd) was that it stopped
>>> functioning as expected after the subdev had been used to stream once
>>> (.s_power(1), .s_power(0)). As it turns out different variants of the
>>> adv7180 device have different reset beaver for if its video decoder
>>> block is left running or powered off. On my device it was left running
>>> so querystd functioned the first time, but not after the video decoder
>>> had been switched off once by .s_power(0).
>>>
>>> I first tried to fix this by introducing proper PM handling in the
>>> driver to be able to remove the .s_power callback. I quickly learnt the
>>> power on/off logic happening in the driver had noting to do with
>>> controlling power to the chip itself, but to control if the chips video
>>> decoder block was turned off.
>>>
>>> When this block is powered on the device process video data, if there is
>>> a video source else it free runs. However when the block is turned off
>>> the device can still be configured, in fact some configuration requires
>>> it to be off.
>>>
>>> For this reason I dropped the effort to add proper PM handling and
>>> treated the decoder power as a stream on/off switch. I still think
>>> proper PM handling would be beneficial for this driver but to not
>>> explode this already large series I left that for another time. Solving
>>> the issue around .s_power will make that work easier as well as other
>>> task such as converting to the v4l2_subdev active state API.
>>>
>>> Patch 1/11 just moves code around to make the consecutive changes easier
>>> to read. Patch 2/11 fix a locking issues when suspending the device.
>>> Patch 3/11 and 4/11 improves the locking design to prepare to improve
>>> the driver.
>>>
>>> Patch 5/11 make sure the device controls are always programmed after the
>>> device have been reset, fixing a possible issue when the device where
>>> resumed from system sleep.
>>>
>>> Patches 6/11, 7/11 and 8/11 is the real change where the .s_power
>>> callback is reworked to fit the design of .s_stream instead.
>>>
>>> And finally patch 9/11, 10/11 and 11/11 removes programming of the
>>> device from operation callbacks and solves the issue with querystd.
>>>
>>> The work is tested on R-Car M2 together with a ADV7180 device.
>>>
>>> See individual patches for changelog.
>>
>> This series looks good to me, other than the one typo and the
>> control handler kAPI issue, but that can be done in a follow-up
>> series.
>>
>> If you want I can take this series, let me know.
> 
> Thanks for pointing out the improvement in the kAPI, I agree with it.  
> But as you point out I can do that in follow up work so I would be happy 
> if you would take this series. Can you correct the typo while applying, 
> or would you prefer I send an undated series?

I'll correct the typo.

Regards,

	Hans

> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Niklas Söderlund (11):
>>>   media: adv7180: Move adv7180_set_power() and init_device()
>>>   media: adv7180: Add missing lock in suspend callback
>>>   media: adv7180: Move state mutex handling outside init_device()
>>>   media: adv7180: Use v4l2-ctrls core to handle s_ctrl locking
>>>   media: adv7180: Setup controls every time the device is reset
>>>   media: adv7180: Power down decoder when configuring the device
>>>   media: adv7180: Split device initialization and reset
>>>   media: adv7180: Remove the s_power callback
>>>   media: adv7180: Do not write format to device in set_fmt
>>>   media: adv7180: Only validate format in s_std
>>>   media: adv7180: Only validate format in querystd
>>>
>>>  drivers/media/i2c/adv7180.c | 338 +++++++++++++++++++-----------------
>>>  1 file changed, 174 insertions(+), 164 deletions(-)
>>>
>>
> 


