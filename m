Return-Path: <linux-media+bounces-15626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F20009429ED
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD8F0285559
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5A01A8C19;
	Wed, 31 Jul 2024 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0E+pVF6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4118CBE2;
	Wed, 31 Jul 2024 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722416802; cv=none; b=TnAEhuvTlMV+drnUVnZV+CbIMAWN+S41H2tTMlA6m+AbAvNt5sQ4gydQjlRHd6Vjnx5KX2gO7uXXvYAuozUDVE5s8C0vuT+axZXCATOLRfVbrk1U9vfM2DsacYBPjmC+FQRutRrTbS2TyfCfIPSRhA1kaUBCM14RMxNrOU5j7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722416802; c=relaxed/simple;
	bh=ANu6zm1rnCnNMCrY5o/zlNBkWWaq05kV5ZeRvYWg8Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BW1Sj70Xw21WcQEvXJVce5J8GhXcrid6umWFprLyPxAaPnZjZL1U20kw4bsVt2m6jsxW722evEdUmZ6hfSlKRoROajlUW9zMHj+lQZRM3vXW/RLpwhkEWOs52+VE58k1L8n/L+f9A3MzmKejSLsh5S9vPBh4O1xdCXVPXlSlTks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0E+pVF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4869DC116B1;
	Wed, 31 Jul 2024 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722416802;
	bh=ANu6zm1rnCnNMCrY5o/zlNBkWWaq05kV5ZeRvYWg8Qc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n0E+pVF6iRFGAM/fFPULZeXkBJMlBb70WWTvzboJMetoTqCn89ICtmYeYHJKa+NaM
	 st5hweJgfPgmvqH8GeQjmjK5/V4TWQWqfgTzwO3HCiDDd0NbSdIjyY6y+mAATky1Gv
	 d70a0uOaLvQrJsspCTkWMrTI6dyo8kJTpDN71tbztZAcAZRXSCh49UQSS2Y0SjlXVE
	 WwS2M9lkGZUpSFgYC7Yb5dAZli5G/bi9y5HFcTVaoiEgbMyEQA5w0gPaaNVMYnTpnd
	 pddzUSb8S3LeoLEM/y78/xIxG8Z+nABOPubd5LZZUgzyMLfnlMHLcgT3ORjJJ368AY
	 zomqVBcMhOM6Q==
Message-ID: <c4f697d7-16a0-46d2-be34-45f6a8efaec8@kernel.org>
Date: Wed, 31 Jul 2024 11:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 stable@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
 <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org>
 <ZqijVf68ZQuFGKhU@kekkonen.localdomain>
 <729280cd-557f-43ba-b1a6-8d319977ca82@kernel.org>
 <20240730091011.GL300@pendragon.ideasonboard.com>
 <cefc0b19-f065-4023-a536-56b2762ac967@ideasonboard.com>
 <172241654546.392292.16164306008596010671@ping.linuxembedded.co.uk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <172241654546.392292.16164306008596010671@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2024 11:02, Kieran Bingham wrote:
> Quoting Umang Jain (2024-07-31 06:41:35)
>> Hi all,
>>
>> On 30/07/24 2:40 pm, Laurent Pinchart wrote:
>>> On Tue, Jul 30, 2024 at 10:42:01AM +0200, Krzysztof Kozlowski wrote:
>>>> On 30/07/2024 10:24, Sakari Ailus wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On Mon, Jul 29, 2024 at 04:09:39PM +0200, Krzysztof Kozlowski wrote:
>>>>>> On 29/07/2024 13:04, Umang Jain wrote:
>>>>>>> Rectify the logical value of reset-gpio so that it is set to
>>>>>>> 0 (disabled) during power-on and to 1 (enabled) during power-off.
>>>>>>>
>>>>>>> Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
>>>>>>> time to make sure it starts off in reset.
>>>>>>>
>>>>>>> Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
>>>>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>>>>>> ---
>>>>>>>   drivers/media/i2c/imx335.c | 8 ++++----
>>>>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>> This will break all the users, so no. At least not without mentioning
>>>>>> ABI break and some sort of investigating how customers or users are
>>>>>> affected.
>>>>> I know the original authors aren't using the driver anymore and it took
>>>>> quite a bit of time until others started to contribute to it so I suspect
>>>>> the driver hasn't been in use for that long. There are no instances of the
>>>>> device in the in-kernel DTS either.
>>>>>
>>>>> Any DTS author should have also noticed the issue but of course there's a
>>>>> risk someone could have just changed the polarity and not bothered to chech
>>>>> what it was supposed to be.
>>>>>
>>>>> I agree the commit message should be more vocal about the effects on
>>>>> existing DTS.
>>>> I can imagine that all users (out of tree, in this case) inverted
>>>> polarity in DTS based on what's implemented. You could go with some
>>>> trivial hack, like I did for one of codecs - see 738455858a2d ("ASoC:
>>>> codecs: wsa881x: Use proper shutdown GPIO polarity"), but I remember
>>>> Mark Brown rejected similar commit for newer drivers.
>>> I don't think there's any out-of-tree user, because when we started
>>> using the recently driver, it required lots of fixes to even work at
>>> all. I'll let Kieran and Umang comment on that, I haven't follow the
>>> development in details.
>>
>> indeed, initially we had to put up fixes like :
>>
>> 14a60786d72e ("media: imx335: Set reserved register to default value")
>> 81495a59baeba ("media: imx335: Fix active area height discrepency")
>>
>> to make the sensor work properly on our platforms. Only after that we 
>> had a base to support more capabilities on the sensor (multiple lanes 
>> support, flips, TPG etc.)
> 
> I would also add that we had to provide control for the regulators to be
> able to power the device as well in fea91ee73b7c ("media: i2c: imx335:
> Enable regulator supplies").

Hm? That's not a proof of anything. Supplies are often turned on by default.

> 
> Given the driver was posted from Intel, I would have anticipated perhaps
> the driver was in fact only actually tested by Intel on ACPI platforms -
> yet with no ACPI table registered in the driver - even that could likely
> be considered broken.

Nope, that does not work like that. Their platforms and such sensors are
often used on DT based boards. Not mentioning even PRP0001.

> 
> Based on that I have a high confidence that there are no current users
> of this driver (except us).

Nope, wrong conclusions, not that many arguments.



Best regards,
Krzysztof


