Return-Path: <linux-media+bounces-14545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D923892430B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 18:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F71728A0FA
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 16:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3CC1BC098;
	Tue,  2 Jul 2024 16:01:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A2D1BB6BC
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719936104; cv=none; b=i8+PjTtx8BT/xjQ7jOShI1mTWqF1LHdK6OosvMBw8W99UgjgkXY/xyXbvFsiA5wTcsQl8eNWtOwjO923xUiCV79+k+Viya9h47yP/Ko/SQAD1QTFHXCnk8bq4nDzh4KMArQpaRh/ouEBJ7GolWA7C52VgC7BROPdXyacRJ6RtCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719936104; c=relaxed/simple;
	bh=yBz2VxunumbGuvH25wU4rJavxlofif3Af5P+Fr0JJag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/PFSLyD9BQcIn0Khk+/cWHYcSNNdr6sCqpeH7wby7UK/lcNpCNGVc1kKwH9iOmLwEE6tYblJGWSUnA2+8KlLcTaGLl9OXUGBGmP6HRmyz3MXicJC0/pIKwt8uXijhL8j+hrMdS0TfBap2RbU996VwJrVIX9MTK/NWqFYh50U3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1504C116B1;
	Tue,  2 Jul 2024 16:01:42 +0000 (UTC)
Message-ID: <6750a726-d02f-4da8-83ae-6badedcf35f7@xs4all.nl>
Date: Tue, 2 Jul 2024 18:01:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tc358743 EDID / hotplug bug?
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-media@vger.kernel.org
References: <20240628-stoic-bettong-of-fortitude-e25611@houat>
 <f780e747-0159-48d5-aef9-2ed324feeae2@xs4all.nl>
 <20240702-certain-lion-of-focus-692c12@houat>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240702-certain-lion-of-focus-692c12@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2024 16:22, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jul 01, 2024 at 10:29:55AM GMT, Hans Verkuil wrote:
>> Hi Maxime,
>>
>> On 28/06/2024 10:50, Maxime Ripard wrote:
>>> Hi Hans,
>>>
>>> I've been playing with the unicam driver and the TC358743 HDMI -> CSI
>>> bridge recently.
>>>
>>> The program I was testing it with had a (arguably suboptimal) pattern
>>> where it would (in a non-blocking way):
>>>
>>> In a loop:
>>>   - set EDID
>>>   - In a loop:
>>>     - call query_dv_timings
>>>     - if we have a timing matching the mode we expect:
>>>       - break the loop
>>>
>>>   - Call s_dv_timings
>>>   - Call s_fmt
>>>   - Call reqbufs
>>>   - Query and Queue all requested buffers
>>>   - Call streamon
>>>   - In a loop:
>>>     - Dequeue the events
>>>     - If there's a resolution change:
>>>       - Call streamoff
>>>       - Call reqbufs with 0 buffers to clear all buffers
>>>       - Restart the entire sequence
>>>     - Dequeue a buffer
>>>     - Queue it again
>>>
>>> This works mostly fine, but when trying to capture the boot of a device
>>> connected on the other end, I'm always getting at some point an
>>> resolution change event in the very first iteration.
>>>
>>> The event itself looks fine: there's no remaining events at any point,
>>> the sequence is correct, etc. However, this puts the s_edid call super
>>> close to streamoff and the next s_edid call.
>>>
>>> And it looks like the tc358743 driver doesn't like that very much and
>>> the HPD pin ends up in the wrong state on the next iteration: both the
>>> driver itself and the device at the other reports the hotplug pin as
>>> being low, and thus, not connected.
>>>
>>> I'm not entirely sure what is the reason, but I suspect a race in:
>>> https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/i2c/tc358743.c#L403
>>>
>>> Possibly due to the 100ms delay?
>>>
>>> I've attached a kernel log with debug logs from both v4l2 and the driver
>>> enabled.

The relevant part is here:

[  149.457319] Starting new Test
[  149.460387] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blocks 2
[  149.460396] tc358743 10-000f: tc358743_disable_edid:

HPD is pulled low here.

[  149.486259] tc358743 10-000f: tc358743_enable_edid:
[  149.486268] tc358743 10-000f: tc358743_enable_interrupts: cable connected = 1

Here the delayed work is started.

[  149.488760] video0: VIDIOC_S_EDID
[  149.495353] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.00 (1650x750)

But here the tc358743 accepts a query_dv_timings call, even though the source
should have stopped transmitting because the HPD went low.

[  149.502929] video0: VIDIOC_QUERY_DV_TIMINGS

...

[  149.555039] Starting new Test

And the new test started within 100 ms of the previous test, so we never saw the
tc358743_delayed_work_enable_hotplug call that pulls the HPD high.

[  149.558153] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blocks 2
[  149.558163] tc358743 10-000f: tc358743_disable_edid:

HPD is pulled low here.

[  149.584032] tc358743 10-000f: tc358743_enable_edid:
[  149.584041] tc358743 10-000f: tc358743_enable_interrupts: cable connected = 1
[  149.586526] video0: VIDIOC_S_EDID
[  149.587052] tc358743 10-000f: tc358743_get_detected_timings: no valid signal
[  149.587057] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  149.687340] tc358743 10-000f: tc358743_delayed_work_enable_hotplug:

HPD is pulled high here (about 100 ms later).

I think the solution might be ensure that tc358743_get_detected_timings()
returns -ENOLINK if the HPD is low. So add:

	if (!(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0))
		return -ENOLINK;

Regards,

	Hans

>>
>> You forgot to attach the logs :-)
> 
> Of course I did :)
> 
> It should be attached this time
> 
>> I don't off-hand see a race condition.
> 
> Yeah, me neither. The code looked sane to me, hence that mail.
> 
>> But there is an important thing to remember: the HPD is only pulled
>> high if the 5V line from the source is also high. I.e., if no source
>> is detected, then the HPD remains low.
>>
>> I don't think you state what the source device is, but make sure it
>> has 5V high. If it is low, or it toggles the 5V for some reason, then
>> that might be related to the problem. But without logs it is hard to
>> tell.
> 
> It's a RaspberryPi. I was looking at the register and it doesn't detect
> HPD being high, but I'll try to see if I can find a testpoint to read
> the level.
> 
> Maxime


