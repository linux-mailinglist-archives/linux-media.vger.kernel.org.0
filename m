Return-Path: <linux-media+bounces-15291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE693A1DE
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 15:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10AB3B22D8C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 13:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF40137C34;
	Tue, 23 Jul 2024 13:45:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B18F70
	for <linux-media@vger.kernel.org>; Tue, 23 Jul 2024 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721742352; cv=none; b=o7BlC8vMGkJqXZbgUlHI1LJutS9IDt60nY/MkaRCcp1aOGOoSMgNyOYsn4R7aC1i1Ck1auFIU9mVeG8Wc0cthsvkbZAf4CODNaSsXagcjvtvNZv93TLzxuA9+MZRnAlZgi4qghFHdeA2fuNf3MlHPJIfszKRfTv2GTeAiuiwjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721742352; c=relaxed/simple;
	bh=+CSUnUbzgTEme+eQh4R/7DBQnYCC0b9M7UM1kmU0I+U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hy4dMR1Q59bQmeBOdv1DyUHmViCvjc9MgRJHfJb4cA+U/N5lqjb/HaS7F/AvVjG07hQliJhIhqEjpCLBAFqqKwGDSOqC8OQlpGC9Y3KOLfy4Vnry72HdbWb7jysarj5Hrbf98xBZngQOxnyI2/XoQT6okDc5N1L+nnsSELcXyvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4532AC4AF0A;
	Tue, 23 Jul 2024 13:45:51 +0000 (UTC)
Message-ID: <1f64c683-5990-4847-9503-c31adf2e58cc@xs4all.nl>
Date: Tue, 23 Jul 2024 15:45:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can you make a new v4l-utils release?
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Gregor Jasny <gjasny@googlemail.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
References: <13a4e596-1854-44b0-842a-8f19f17fce15@xs4all.nl>
 <7de82157-adc9-4402-9e60-92aae885a776@googlemail.com>
 <d99db58e-876d-418d-b676-9b31637c254f@xs4all.nl>
 <2f710c72-a5dc-4d30-aeb2-9f9d3e921d49@xs4all.nl>
 <8c7f5c02-a725-4831-9ad8-d476f02bc529@xs4all.nl>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <8c7f5c02-a725-4831-9ad8-d476f02bc529@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Gregor,

On 22/07/2024 12:16, Hans Verkuil wrote:
> On 22/07/2024 11:16, Hans Verkuil wrote:
>> On 22/07/2024 10:28, Hans Verkuil wrote:
>>> On 19/07/2024 23:19, Gregor Jasny wrote:
>>>> Hello Hans,
>>>>
>>>> On 19.07.24 08:19, Hans Verkuil wrote:
>>>>> Hi Gregor,
>>>>>
>>>>> The last v4l-utils release is over half a year ago, and Nicolas would like to
>>>>> have a new release that includes the new v4l2-tracer utility.
>>>>>
>>>>> Do you have time to prepare a new release?
>>>>
>>>> I released and tagged 1.28.0.
>>>>
>>>> While preparing the updated Debian package I wondered if I could safely switch from Qt5 to Qt6. Do you see any blockers?
>>>
>>> Unfortunately, I just tested this and the colors are all wrong with Qt6.
>>>
>>> Also, qvidcap dumps core, even with Qt5.
>>
>> This I just fixed in commit f09b2c091d90228547433f11f94015b9ecfeff13.
>>
>> I believe that this has always been wrong, it just surfaced for the first
>> time due to other changes.
>>
>> Now that qvidcap works again I see that qvidcap produces the correct colors, but qv4l2
>> doesn't (that's with Qt6, Qt5 is fine).
>>
>> I'll try to find out what the difference is, hopefully it is easy.
> 
> Another commit fixing a crash: 60e4ac8949f034120c1c1820f210c7f70a85f2d9
> This too needs to be backported to the 1.28 branch.

Sorry, that was the wrong commit SHA (I looked in the wrong tree).

I now have a fix for Qt6 pushed (even though it is not perfect).

So please port the following three commits to the 1.28 branch:

f09b2c091d90 ("qvidcap: fix core dump")
e268a7229866 ("qv4l2: fix crash when disabling openGL")
69b3a7618cb5 ("qv4l2: always set m_haveFramebufferSRGB to false")

With those committed you can make a new release that should work with
Qt6.

Apologies for not noticing before that Qt6 qv4l2 support was broken.

Regards,

	Hans

> 
> Still looking at the openGL issues in qv4l2.
> 
> Regards,
> 
> 	Hans
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> I'm looking that the core dump issue, but Qt6 support probably needs to be
>>> disabled until I have time to figure out what is going on with the colors.
>>>
>>> I'll keep you updated.
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>
>>
> 


