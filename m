Return-Path: <linux-media+bounces-41805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941B7B44FEF
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9BCD3AD063
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 07:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D677258ECA;
	Fri,  5 Sep 2025 07:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlYeVcXd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FF3AD2C;
	Fri,  5 Sep 2025 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757057707; cv=none; b=m7uHg4H5+70fNZ1mPddBU6MKjcL/ALbBGUST5jW7MWuH1Ihe5uxJ4eLn+m15QE44rCgbNKQPrdvQnLYXhK5Siq6S/ZO6y6mWMw9/6912DXKexi8Zln6+di9QALmapGeXrFPuH4gHpWCcTxZ4Tkrn2Vv+ahXY3xhZx/gD8FNZE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757057707; c=relaxed/simple;
	bh=EOPqr6ZVLOPhzztgKUphvR1K2RBLa6FRjsBJ+lJ5MQI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eN/ONpiWfcOUwAgftIZxTdSL39eCwBfekn1EnjJicHbfiV57YqJwj2vtsOqbOA/eMuJgXEgANT1jVE8RXQTcIehWHNHsgooR9ze2EYWSADfptbL4qR0N16itjgcf70DDhZtdtxqCPjusNZhfY3p6kKanqdWzcPqtRNuHMEnzSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlYeVcXd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DA7C4CEF1;
	Fri,  5 Sep 2025 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757057707;
	bh=EOPqr6ZVLOPhzztgKUphvR1K2RBLa6FRjsBJ+lJ5MQI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=nlYeVcXd3krgFEfHZm3GGyE2JgRucewc+onGD2kWqj2Hqv+J6/jxC8HXl9GHcXdtu
	 iroWoe+WxSyvetrRNvDxBeoX96pCfIoIHPXVSeqcd9asp5f5CKhdVjdsQuSv57hOQH
	 6669rXyQ7mHdqHvn+3WoTK2ei1uoT3ImBb7hd72kf+zonFpTPjNy8lao/Ba9kr0ODI
	 8kQpqpe4SEUx38cqcD9tBwgjjNn+U23Vben/8GWWQ8jx6qPd1qvrVz2ohErAnf8PFO
	 N38mq+DIxXhm5+4UzZEDcTtaGsn5pN7XqBsYpvSuZ4Cnue4vVkQis4fuPTWniD/F0s
	 i8PB2XSkLbx+A==
Message-ID: <02fa4a52-1daa-4d1a-9d38-e092b6c9ae13@kernel.org>
Date: Fri, 5 Sep 2025 09:35:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: az6007: fix out-of-bounds in az6007_i2c_xfer()
To: Jeongjun Park <aha310510@gmail.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, zhang_shurong@foxmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250421105555.34984-1-aha310510@gmail.com>
 <c4cf17bb-73cb-4e3b-9e61-8fd682b5e9ee@kernel.org>
 <CAO9qdTHJ9GrbqjtMKzgDhy+bvEmDc+Sn3VosYxuq5hJ9Z20-bA@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAO9qdTHJ9GrbqjtMKzgDhy+bvEmDc+Sn3VosYxuq5hJ9Z20-bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 13:07, Jeongjun Park wrote:
> Hi Hans,
> 
> Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>> Hi Jeongjun,
>>
>> On 21/04/2025 12:55, Jeongjun Park wrote:
>>> According to the previous commit 1047f9343011 ("media: az6007:
>>> Fix null-ptr-deref in az6007_i2c_xfer()"), msgs[i].len is user-controlled.
>>
>> Does this relate to syzbot reports? If so, please add a reference to that.
>>
>> As far as I can tell, you can get here only through /dev/i2c-X devices.
>>
> 
> Sorry, I seem to have forgotten to include the reported-by tag when
> sending the email. I'll add it in the next patch.
> 
> 
>>>
>>> In the previous commit, bounds checking was added because a null-ptr-deref
>>> bug occurs when msgs[i].buf and msgs[i].len are set to null. However, this
>>> leads to an out-of-bounds vuln for st->data when msgs[i].len is set to a
>>> large value.
>>>
>>> Therefore, code to check the maximum value of msgs[i].len needs to be added.
>>>
>>> Fixes: 1047f9343011 ("media: az6007: Fix null-ptr-deref in az6007_i2c_xfer()")
>>> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
>>> ---
>>>  drivers/media/usb/dvb-usb-v2/az6007.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
>>> index 65ef045b74ca..fba1b6c08dc7 100644
>>> --- a/drivers/media/usb/dvb-usb-v2/az6007.c
>>> +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
>>> @@ -788,7 +788,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>>>                       if (az6007_xfer_debug)
>>>                               printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
>>>                                      addr, msgs[i].len);
>>> -                     if (msgs[i].len < 1) {
>>> +                     if (msgs[i].len < 1 || msgs[i].len + 1 > sizeof(st->data)) {
>>>                               ret = -EIO;
>>>                               goto err;
>>>                       }
>>> @@ -806,7 +806,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>>>                       if (az6007_xfer_debug)
>>>                               printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
>>>                                      addr, msgs[i].len);
>>> -                     if (msgs[i].len < 1) {
>>> +                     if (msgs[i].len < 1 || msgs[i].len + 5 > sizeof(st->data)) {
>>>                               ret = -EIO;
>>>                               goto err;
>>>                       }
>>
>> I feel uncomfortable about this patch and similar patches that attempt to address this
>> in various other drivers as well.
>>
>> It's all rather ad-hoc. E.g. you fix the two places here, but not the case at line 778.
>>
>> I think the proper fix would be to modify __az6007_read/write and add an argument with the
>> size of the buffer, then let that function do the check. Rather than manually doing this
>> check at every call of those functions. Same for similar drivers.
>>
>> The approach taken in this patch is too fragile.
>>
> 
> You're right. Looking at it again, it seems more appropriate to fix
> __az6007_read/write.
> 
> https://lore.kernel.org/all/20250421125244.85640-1-aha310510@gmail.com/
> 
> I remember patching vulnerabilities I found in other drivers using the
> method Hans suggested. Is this the correct way to patch them?

Yes, that's probably the correct way.

Your patch for drivers/media/usb/dvb-usb/az6027.c has the same problem as this patch
for the az6007, so if you can provide an updated version of that patch as well, then
that will be great.

It's actually more complicated: az6007_i2c_xfer also has code that writes to st->data
before calling __az6007_write:

	for (j = 0; j < len; j++)
		st->data[j] = msgs[i].buf[j + 1];

So there we do need a check, we can't rely on __az6007_write to do that.

It's really messy code, perhaps __az6007_write/read should just receive the st pointer,
and the msgs[i].buf+offset pointer, and have it do the copying and checking against
sizeof(st->data). I think that's what dtv5100_i2c_msg does, so perhaps this is a good
template to use.

Regards,

	Hans

> 
>> Regards,
>>
>>         Hans
>>
>>
>>> --
>>>
>>
> 
> Regards,
> Jeongjun Park


