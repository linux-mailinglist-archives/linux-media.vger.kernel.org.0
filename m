Return-Path: <linux-media+bounces-29133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA0A77834
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD1D1692DD
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB691EFFAB;
	Tue,  1 Apr 2025 09:55:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A5CA4B
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501331; cv=none; b=FczQOrGP/7KG1BPg7j55MGW2VTaeC8TgZ1dIMPzldl963hstaFR33OvqIDoj7a+ChHw+S/gL9kD6nt3RxG3EdSd41BXcf6L4+5wb5ngak0Cg4JCRJzzk+/ZppNeSs46Vb+xpqibjc3CWV9J9Qfc7huHuvQ/23rBghJ1bh4T8IEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501331; c=relaxed/simple;
	bh=GrxqzYWgp6VqMfngthBks5smmL++uBaOXDzRQE3as8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhtD8yzA8wcdZAWPJCGgl9UzPj61ry8SSTlvbcfrd/q1nZVubPS1VvNlHYt/hSFsiW0SwV9yUW8Um81iR5hFF0FTkIQfNtifaOx5RTxb/3bmVQW2HWyoU0U/epudq/TcW8L2lcoIB6XaM4ywSs6jt7Dm80l44o8+fz0xMumKxcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3800C4CEE4;
	Tue,  1 Apr 2025 09:55:29 +0000 (UTC)
Message-ID: <b12f7202-d718-4fab-8c13-1815e1a1789f@xs4all.nl>
Date: Tue, 1 Apr 2025 11:55:28 +0200
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
 <6750a726-d02f-4da8-83ae-6badedcf35f7@xs4all.nl>
 <20250325-dynamic-sexy-bobcat-0b7d69@houat>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250325-dynamic-sexy-bobcat-0b7d69@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2025 15:16, Maxime Ripard wrote:
> Hi Hans,
> 
> Sorry, it took a while.
> 
> On Tue, Jul 02, 2024 at 06:01:41PM +0200, Hans Verkuil wrote:
>> On 02/07/2024 16:22, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Jul 01, 2024 at 10:29:55AM GMT, Hans Verkuil wrote:
>>>> Hi Maxime,
>>>>
>>>> On 28/06/2024 10:50, Maxime Ripard wrote:
>>>>> Hi Hans,
>>>>>
>>>>> I've been playing with the unicam driver and the TC358743 HDMI -> CSI
>>>>> bridge recently.
>>>>>
>>>>> The program I was testing it with had a (arguably suboptimal) pattern
>>>>> where it would (in a non-blocking way):
>>>>>
>>>>> In a loop:
>>>>>   - set EDID
>>>>>   - In a loop:
>>>>>     - call query_dv_timings
>>>>>     - if we have a timing matching the mode we expect:
>>>>>       - break the loop
>>>>>
>>>>>   - Call s_dv_timings
>>>>>   - Call s_fmt
>>>>>   - Call reqbufs
>>>>>   - Query and Queue all requested buffers
>>>>>   - Call streamon
>>>>>   - In a loop:
>>>>>     - Dequeue the events
>>>>>     - If there's a resolution change:
>>>>>       - Call streamoff
>>>>>       - Call reqbufs with 0 buffers to clear all buffers
>>>>>       - Restart the entire sequence
>>>>>     - Dequeue a buffer
>>>>>     - Queue it again
>>>>>
>>>>> This works mostly fine, but when trying to capture the boot of a device
>>>>> connected on the other end, I'm always getting at some point an
>>>>> resolution change event in the very first iteration.
>>>>>
>>>>> The event itself looks fine: there's no remaining events at any point,
>>>>> the sequence is correct, etc. However, this puts the s_edid call super
>>>>> close to streamoff and the next s_edid call.
>>>>>
>>>>> And it looks like the tc358743 driver doesn't like that very much and
>>>>> the HPD pin ends up in the wrong state on the next iteration: both the
>>>>> driver itself and the device at the other reports the hotplug pin as
>>>>> being low, and thus, not connected.
>>>>>
>>>>> I'm not entirely sure what is the reason, but I suspect a race in:
>>>>> https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/i2c/tc358743.c#L403
>>>>>
>>>>> Possibly due to the 100ms delay?
>>>>>
>>>>> I've attached a kernel log with debug logs from both v4l2 and the driver
>>>>> enabled.
>>
>> The relevant part is here:
>>
>> [  149.457319] Starting new Test
>> [  149.460387] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blocks 2
>> [  149.460396] tc358743 10-000f: tc358743_disable_edid:
>>
>> HPD is pulled low here.
>>
>> [  149.486259] tc358743 10-000f: tc358743_enable_edid:
>> [  149.486268] tc358743 10-000f: tc358743_enable_interrupts: cable connected = 1
>>
>> Here the delayed work is started.
>>
>> [  149.488760] video0: VIDIOC_S_EDID
>> [  149.495353] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.00 (1650x750)
>>
>> But here the tc358743 accepts a query_dv_timings call, even though the source
>> should have stopped transmitting because the HPD went low.
>>
>> [  149.502929] video0: VIDIOC_QUERY_DV_TIMINGS
>>
>> ...
>>
>> [  149.555039] Starting new Test
>>
>> And the new test started within 100 ms of the previous test, so we never saw the
>> tc358743_delayed_work_enable_hotplug call that pulls the HPD high.
>>
>> [  149.558153] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blocks 2
>> [  149.558163] tc358743 10-000f: tc358743_disable_edid:
>>
>> HPD is pulled low here.
>>
>> [  149.584032] tc358743 10-000f: tc358743_enable_edid:
>> [  149.584041] tc358743 10-000f: tc358743_enable_interrupts: cable connected = 1
>> [  149.586526] video0: VIDIOC_S_EDID
>> [  149.587052] tc358743 10-000f: tc358743_get_detected_timings: no valid signal
>> [  149.587057] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
>> [  149.687340] tc358743 10-000f: tc358743_delayed_work_enable_hotplug:
>>
>> HPD is pulled high here (about 100 ms later).
>>
>> I think the solution might be ensure that tc358743_get_detected_timings()
>> returns -ENOLINK if the HPD is low. So add:
>>
>> 	if (!(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0))
>> 		return -ENOLINK;
> 
> This fixes the issue indeed.
> 
> I still can't wrap my head around what the race condition leading to HPD
> always being low is exactly. I tried to write a commit log and just failed :)
> 
> Can you send that patch with my Tested-by, or explain it some more?

I posted a patch with your Tested-by.

Please check that it is OK.

Regards,

	Hans

> 
> Thanks again,
> Maxime


