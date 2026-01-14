Return-Path: <linux-media+bounces-50660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01603D1D8A9
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED2063008767
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A4C3803CF;
	Wed, 14 Jan 2026 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUM/39XN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6226F2A6
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383052; cv=none; b=geZaOL5+g8x2HCjEF4HBjSeb0TPq7ROJv+bnTKi61HKjcP9n18VQyVIyxErh78q/1Pg7w+nlbAbhDVL6f4cmhhxbgcqQHEDh5zqYQBXncUEVi09pmgQv+J3J0AwBKZ37t3NvCxH6T9TlvyDlA2zpLkHj3L5PvSUJiu3Wg98b5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383052; c=relaxed/simple;
	bh=cMZNCHhQgixaAJW7WZQrZh9PoXRFNtaUJFE0UKCy74Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFXP9640N6D74rS2myAQvSgqp6IqfiZD7AeGTaD5PeBecrlbehsv1UzIqONk8TOKwSdsD9kU6XJcZrJ87wj47Byfy18PnzMf0fUv7fEV5AqizirJL1iYW8ik1/riuOeSud5DsFHPXoKeeWMul2mAhWRTPQcrTkUkIX0CVQpVDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUM/39XN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2B3C4CEF7;
	Wed, 14 Jan 2026 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768383052;
	bh=cMZNCHhQgixaAJW7WZQrZh9PoXRFNtaUJFE0UKCy74Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iUM/39XNaXevu3Qv1FiF1RF2G7XSBxMcW3mYbpL9/Bg85q9hPa6gChg/i5bsw/ZGL
	 +0c2EurncrZfX0bAafhNOd45I1ZCGupZVGYHbx7mV3Jys1b9YELa1ZLXKXUSP1hIuR
	 yos+kV5WF3grZZtK+pwbeelKr19ZtWOwyl7Qp0195G+zMr9Fh+DzHM/ykZ7s9Hj3AB
	 ssAVRlEur6NPI6jV5FSk8uw0cCo+RgQe7bxQyZbgCxwsDtKmzd22KFswV/2ObiUhnt
	 zhDitZFP7UIdRPTcLo3zSFyid1kzBUtxHRFfnrJ0SJCn8wYienBYqDhYJ2QZFfdTLG
	 wHd+0u0e7zf9w==
Message-ID: <61fe8284-9933-482d-80d2-8fe3b87d5ab7@kernel.org>
Date: Wed, 14 Jan 2026 10:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: ov01a10: Fix test pattern assignment
To: Bingbu Cao <bingbu.cao@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>, mehdi.djait@intel.com
References: <20260113082512.102779-1-sakari.ailus@linux.intel.com>
 <988fe458-da1d-4042-92fa-8e1b80e09d5e@kernel.org>
 <a6768fbf-9efb-9fbd-75c1-c6ed5710931c@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <a6768fbf-9efb-9fbd-75c1-c6ed5710931c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

On 14-Jan-26 04:13, Bingbu Cao wrote:
> Hans,
> 
> On 1/13/26 6:42 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 13-Jan-26 09:25, Sakari Ailus wrote:
>>> The test patterns of the test pattern menu control start from 1 whereas
>>> register values start from 0. Fix this.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>> This goes on top of my recent ov01a10 series.
>>>
>>>  drivers/media/i2c/ov01a10.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
>>> index 3dbc77430e0e..0a66d8974974 100644
>>> --- a/drivers/media/i2c/ov01a10.c
>>> +++ b/drivers/media/i2c/ov01a10.c
>>> @@ -319,7 +319,7 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
>>>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
>>>  {
>>>  	if (pattern)
>>> -		pattern |= OV01A10_TEST_PATTERN_ENABLE;
>>> +		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
>>
>> Nack, copy paste of my reply to Bingbu's email where this change was requested:
>>
>> This was "pattern - 1" in the original v1 patch-set, the - 1 is dropped
>> deliberately c2 because testing has shown that there is no difference
>> between writing "0 | OV01A10_TEST_PATTERN_ENABLE" vs
>> "1 | OV01A10_TEST_PATTERN_ENABLE" to the register.
> 
> Hans,
> 
> Thanks for the explanation.
> 
> From the specification, color bar type1 is not same type2, type1 is a
> standard color bar, type2 is a top-bottom darker color bar, type3 is
> right-left darker one.
> 
> Mehdi, did you confirm the description in specification is wrong?

Yes Mehdi did confirm this, see:

https://lore.kernel.org/linux-media/jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m/

Here is a table of register values ( + OV01A10_TEST_PATTERN_ENABLE) + test-pattern
seen in testing:

0: Standard Color Bar
1: Standard Color Bar
2: Left-Right Darker Color Bar
3: Bottom-Top Darker Color Bar

Regards,

Hans




