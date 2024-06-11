Return-Path: <linux-media+bounces-12948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E6903BBC
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 14:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B86282E43
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 12:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BB417C207;
	Tue, 11 Jun 2024 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEDYT2tb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D607717623D;
	Tue, 11 Jun 2024 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108261; cv=none; b=Jxc0zyu+s65/0p/UXpS/hyo9ljV1eZszth/stLVWtpewCm4onl2G654aGgd17/Q7B4TK0qMbnZJEPNNQlpsyQES1CLyGTxiBUjOEvKMLBKH3AM5PfE98JYpDF/y/mFhH9Q1+1S0kTzVakosAAHvAx42oohtebCsqMyxJ2EYhxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108261; c=relaxed/simple;
	bh=lD+xZdtN9+A0GrqGIt01G1JE+hzrjUZBwbKw4SzUmtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McWuqa1kUINBY5jenovKdnTgT8sa/Sdj7JRo0EQVkXbAUSj8hquZ6yKJOy9arJI5Xk34YORZ0GG8G69yUpPMITi8NrUitwKhRm9HJmDipea/q3kZnjthjlON/6OeO8K1ijwXNGU6obuxWI2hmikDE6LfdHLYVE7lem0jHXYmqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEDYT2tb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D30CC2BD10;
	Tue, 11 Jun 2024 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718108260;
	bh=lD+xZdtN9+A0GrqGIt01G1JE+hzrjUZBwbKw4SzUmtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QEDYT2tbQ7ZXrL1NFFirij5a5s8USfJEfLI4WDrLqzuLLtbeCE6qjHPMpzxbQ428h
	 Dr33RAbMJrTvbmada5znOqdMkIziVquJngbKDdLRwRH0Z9uxckFHtxQONgEiTAYk0t
	 LlRsIvfnptZaVxbHznuYHPAu7bl2A77zAtCxUFVoYML36jIEyRQAX1cMoBe8z46DRL
	 JLvmdXijK8A9m27u+4n5Wc2Q/A4HgXpUJc/0Bwtm4ChwWARQSEuT/804qUpsg9F7YQ
	 v9VxsLP8P8SyD+UXthUlHo9gx28TMGZA5YXvmXdiooJ3fY9x2B+frugmlD/4tR40RA
	 PFmESO87rvOcQ==
Message-ID: <4fd73e81-4573-4e1c-9623-c2f7f153d43a@kernel.org>
Date: Tue, 11 Jun 2024 14:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: vgxy61: Add legacy compatible string
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-3-benjamin.mugnier@foss.st.com>
 <b4de42ba-d884-44b1-9f0e-12f5818c6781@kernel.org>
 <ZmgIiaqJy1tWL4Yz@kekkonen.localdomain>
 <b7514285-7a05-4874-a0fd-59ef16d5bce1@kernel.org>
 <458f8b1c-d750-424c-99dd-d31fde036314@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <458f8b1c-d750-424c-99dd-d31fde036314@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2024 13:57, Benjamin Mugnier wrote:
> Hi Sakari and Krzysztof,
> 
> On 6/11/24 10:38, Krzysztof Kozlowski wrote:
>> On 11/06/2024 10:19, Sakari Ailus wrote:
>>> Hi Krzysztof,
>>>
>>> On Tue, Jun 11, 2024 at 08:47:25AM +0200, Krzysztof Kozlowski wrote:
>>>> On 10/06/2024 17:08, Benjamin Mugnier wrote:
>>>>> As the driver has been renamed from 'st-vgxy61' to 'vgxy61', its
>>>>> compatible string has been updated to reflect this change. Therefore old
>>>>> device trees will not work anymore.
>>>>> Add the old driver name as another compatible name to handle the
>>>>> retro compatibility.
>>>>>
>>>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>>> ---
>>>>>  drivers/media/i2c/vgxy61.c | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
>>>>> index 30378e962016..ca3b43608dad 100644
>>>>> --- a/drivers/media/i2c/vgxy61.c
>>>>> +++ b/drivers/media/i2c/vgxy61.c
>>>>> @@ -1867,6 +1867,11 @@ static void vgxy61_remove(struct i2c_client *client)
>>>>>  }
>>>>>  
>>>>>  static const struct of_device_id vgxy61_dt_ids[] = {
>>>>> +	{ .compatible = "st,vgxy61" },
>>>>> +	/*
>>>>> +	 * Previously the driver was named 'st-vgxy61' instead of simply
>>>>> +	 * 'vgxy61', keep it for retrocompatibility purposes.
>>>>
>>>> NAK.
>>>
>>> Is that because the comment says "driver" rather than "device"?
>>>
> 
> You're correct, I'll replace all occurrences for the series.
> 
>>> Please try to express clearer what you'd expect from the patch author.
>>
>> There is almost never a need to rename compatible or add new compatible
>> matching existing one. There are exceptions, like development or work in
>> progress with no users at all (and really no users!).
>>
>> The commit did not provide any rationale for binding change.
>>
>> Additionally, it does not make any sense. There is no point in doing it
>> at all. No benefit.
>>
> 
> Thanks, here is a draft of a new commit message for v2 highlighting the
> rationale :
> 
> The previous binding 'st,st-vgxy61' did not reflect the actual device
> name : vgxy61 (and not st-vgxy61 as ST is the vendor prefix), and was
> changed to 'st,vgxy61'.

That's not really a reason to change binding.

> Still some device trees uses the old binding. This commit adds back the
> 'st,vgxy61' binding in addition to the new one to ensure retro
> compatibility.

"Adds back"? This means it was there but was removed, so please document
it with commit references.

> 
> Will this be ok for you ? Tell me your thoughts.

It seems you are making some changes assuming there is some error to be
fixed, but there is none. Compatible is just some unique string, so the
original compatible, although unfortunate, is okay and must not be
changed. I already explained that adding new compatibles for such cases
is only for exceptions. Is this exception? No. You provided no rationale
to make it an exception.

Best regards,
Krzysztof


