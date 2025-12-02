Return-Path: <linux-media+bounces-48019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A91C9A7E9
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F38343A62AC
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0232FE059;
	Tue,  2 Dec 2025 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3D653Dq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D276A3FF1
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661247; cv=none; b=j+VJCQucN/AT+91xAhlZEtfLXA0IARPX3k6tpSeBFbvPycCXkH3qdM9yye76P5zMVVVNXeIyov/zDrG2szjwHpjiAwC8k6ohUEHei+VkMD1NM2Urj4Z32VrRVdeb3yfqOKP6uvRruyrXdMcfvymOXebJg2smRkdkY/C8glxxito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661247; c=relaxed/simple;
	bh=BWl3Wyb39JP+eI9kf6mWZoSqRE/nXw1ixlSIuEmBDAY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bWB+LRfV9kNJLH9cXk22L2li2eSuHzUy1zCw+S7Su4MQWu72Tx4yuyoj+2ACGn0QC72anVmcTaDXSpMhQMbSSFCfdjZY7BIglIrvn5/pKnlV1e/ZNDgmB8FMHZW8JraeCLAh8/y3GvZlM4e8bFaqOfXCbFZFTZsi1P8A/xF/ID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3D653Dq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2137EC4CEF1;
	Tue,  2 Dec 2025 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661246;
	bh=BWl3Wyb39JP+eI9kf6mWZoSqRE/nXw1ixlSIuEmBDAY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=C3D653DqFG1ZoMZ0NzvNcslb5uV17T91yZ6fBLvRLu4exVkcTqkcNfuT/6EznOeDC
	 RKlSC4X9qr7oyMqFGmhO0H7lX8feGDrvLIXGFEGGu4X+FyfnmlhmHm2wQ1VD09uUFD
	 oLr6xMNBm+ZprPeb2E1Wk4tDMTkscyfg5+Lxt3FRPXfwQPI5D6h3egnJBmcI1LkiQy
	 WmkvGl6vu5YGskJefUkhEuUYbtAMaImRcSfPUDdGYXBsKJVIcFmQ+AjLwgCeURe2sE
	 zjFw2AFyxcKoOCqf8qJBCu55WhJ/63/f+SPoMx14rlzRRVAk3eeHkFxcgVkbMsJfi8
	 Y1vyCaGX2n/fw==
Message-ID: <c1fe9d2e-1a2c-4ba2-b188-343b34a15e7b@kernel.org>
Date: Tue, 2 Dec 2025 08:40:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv2] media: v4l2-event: keep place in event list when
 combining events
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
 <aQMl32qFeMNmG598@kekkonen.localdomain>
 <79f4a4f2-a7b9-4ee6-af29-6e9970d2ed7a@kernel.org>
 <aQMyNttmOOVCBRym@kekkonen.localdomain>
 <20251201154646.GB32430@pendragon.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20251201154646.GB32430@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2025 16:46, Laurent Pinchart wrote:
> On Thu, Oct 30, 2025 at 11:39:02AM +0200, Sakari Ailus wrote:
>> On Thu, Oct 30, 2025 at 10:07:49AM +0100, Hans Verkuil wrote:
>>> On 10/30/25 09:46, Sakari Ailus wrote:
>>>> On Fri, Oct 10, 2025 at 01:35:02PM +0200, Hans Verkuil wrote:
>>>>> When subscribing to an event a fixed circular buffer of N (N >= 1) events
>>>>> is allocated for that file handle.
>>>>>
>>>>> New events of the same type are added to that buffer and eventually the
>>>>> oldest event is removed from the buffer when VIDIOC_DQEVENT is called.
>>>>>
>>>>> If the circular buffer is full, then the event framework will
>>>>> merge the two oldest events (what 'merge' means is event type
>>>>> specific).
>>>>>
>>>>> So far, so good.
>>>>>
>>>>> There is also a per-filehandle list of pending events for all event
>>>>> types. VIDIOC_DQEVENT always dequeues the oldest of that event list,
>>>>> and that event is removed from the corresponding circular buffer.
>>>>>
>>>>> The problem occurs when the circular buffer is full and a new event
>>>>> arrives. Then the two oldest events are merged, but instead of
>>>>> keeping the position in the list of pending events, the merged
>>>>> event is added to the *end* of the list of pending events.
>>>>>
>>>>> So if a lot of events are generated, then events can continually
>>>>> be pushed to the end of the list of pending events, and so are never
>>>>> or much later dequeued by the application.
>>>>>
>>>>> Effectively this is a denial-of-service situation were the
>>>>> event is never seen by the application even though there are
>>>>> actually a lot of events.
>>>>>
>>>>> So if you subscribe to events from control A and B, then
>>>>> change control A, then change control B, then change control A
>>>>> again, and now call VIDIOC_DQEVENT, you will get the event from
>>>>> control B followed by A, even though A was changed first.
>>>>>
>>>>> This patch keeps the oldest event in its place in the 'pending
>>>>> events' list rather then moving it to the end, and in the test
>>>>> above you will now receive the event from control A first.
>>>>
>>>> Typically events are queued faster than they're generated, it is an
>>>
>>> You mean 'dequeued' instead of 'queued'?
>>>
>>>> exception when they are not. The application certainly won't work very well
>>>> if it consumes events slower than they're produced, whether or not the
>>>> ordering of events fits for the use case.
>>>
>>> The problem isn't the application, the problem is that with the current
>>> code events never reach the application, they can be continuously pushed
>>> back to the end of the queue. This is not theory, it's how I discovered
>>> something was wrong. Some events were delayed by seconds.
> 
> But that's still related to applications not dequeuing events fast
> enough, isn't it ? If there's enough space in the events queue for new
> events, would the problem still occur ?
> 
>>>> For instance, for frame sync events, the latest event is more relevant than
>>>> than earlier such events and the latest event should be kept instead of an
>>>> earlier event.
> 
> Sure, but I don't think this patch prevents that, does it ? When merging
> frame sync events we can drop the older event and keep the newer one
> while storing the newer event in the position of the old one in the
> queue, can't we ?
> 
>>>> I wouldn't change this, or alternatively I'd make it
>>>> dependent on the event type, but in I wonder if that's worth the
>>>> complexity.
>>>
>>> This might be an option. Another option is to extend struct v4l2_event_subscription:
>>> a flag that says how to handle this specific case (drop the oldest event or
>>> update the contents of the oldest event), and a field to set the size of the
>>> queue for that event.
> 
> Unless I'm missing something, this problem seems solvable without having
> to increase the completexity of the UAPI.
> 
>>> Right now the number of events for a (type, id) tuple is set by the driver,
>>> but for situations like this it can be useful to be able to configure it by
>>> the application.
>>>
>>> It would certainly help if I can configure this for the specific use-case I am
>>> dealing with.
>>
>> Sounds good to me, implementation-wise. But to benefit from that,
>> applications would need to set the flag. If that's enough, then we don't
>> need e.g. defaults per event type (and don't need another flag).
> 

I plan to rework this, once I find some more time. Allowing userspace to set the
size of the event queue will help a lot, and that's actually a trivial change.

In the end it comes down to what to do when a new event arrives and the queue is
full: do you want to drop the oldest event or the new event? That depends on
what event it is. Allowing the driver to make that choice would be nice.

Regards,

	Hans

