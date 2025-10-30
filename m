Return-Path: <linux-media+bounces-45994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE1C1F308
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 10:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 280DE4E88B3
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BA333FE34;
	Thu, 30 Oct 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdaeAOnm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6111A3BD7
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761815273; cv=none; b=BKl3d7agaFbKyAGGz7qLvJD4wnm6T8ZyOd/r1QogA3ExvcICMeJoj0FdhhT2nXb/Y/js2Qr6fyW/Thtu2NlGbYOC6NwuqykBinzfb+mMdoIAM7DSDnDp5Uy+Dcmnjnnhfr9Go5XqpaDiCAGP4UoBdSA8pQjnzoaNQ3qEUYIm8Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761815273; c=relaxed/simple;
	bh=oYHczn1kG3Wmq73zyOVLWGVVdLzG+vTRX2b8237ROPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NC642qE+AtEpCXcbcOfXBFgbudHcPAeqiFLIojCI7zRz9Fq+H1dd1E7FCktGMFZgwacr89RltrYoouDHiFUy20ojj3LIzeunJvN//TS80Sfh4/5podNKKnBEpZ5X0x+F9tmuRw4OuMHbpzfqLvolN/oAW9sAM6kGSejXxciBFIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdaeAOnm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65773C4CEF1;
	Thu, 30 Oct 2025 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761815272;
	bh=oYHczn1kG3Wmq73zyOVLWGVVdLzG+vTRX2b8237ROPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BdaeAOnm0fqTFImuM8PLuj5xf4fK8hLVcJobzRnsVcCTQYm9zmCYJOtEybFWAh85q
	 XFjrVOBTqbxhW75/4JYXQQRr5SZ17ohp1WDTtA7tgsqNf/nTTGeeSpk+yqm6diZGV9
	 cJp8qahFhZb0BUXJrcFOmH1yPmtHpiygfiz3+wkb4SF/I1TcksHyfk6bEg/DH/mQkw
	 VxBNvLEIe69iUsmLjVSo1bkJCZmL8EyndHb4F0Y0zVgA6K7qDdPiOUW19w7cGCzV+F
	 mcivEs4BtCtVGmf7wm9PzlIiGLH3KA+Fa1Q8j7vtBD1oJSHghMy2aRnhFBhMlKf+dg
	 ES5D+CdEFipCw==
Message-ID: <79f4a4f2-a7b9-4ee6-af29-6e9970d2ed7a@kernel.org>
Date: Thu, 30 Oct 2025 10:07:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] media: v4l2-event: keep place in event list when
 combining events
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
 <aQMl32qFeMNmG598@kekkonen.localdomain>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <aQMl32qFeMNmG598@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/25 09:46, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Oct 10, 2025 at 01:35:02PM +0200, Hans Verkuil wrote:
>> When subscribing to an event a fixed circular buffer of N (N >= 1) events
>> is allocated for that file handle.
>>
>> New events of the same type are added to that buffer and eventually the
>> oldest event is removed from the buffer when VIDIOC_DQEVENT is called.
>>
>> If the circular buffer is full, then the event framework will
>> merge the two oldest events (what 'merge' means is event type
>> specific).
>>
>> So far, so good.
>>
>> There is also a per-filehandle list of pending events for all event
>> types. VIDIOC_DQEVENT always dequeues the oldest of that event list,
>> and that event is removed from the corresponding circular buffer.
>>
>> The problem occurs when the circular buffer is full and a new event
>> arrives. Then the two oldest events are merged, but instead of
>> keeping the position in the list of pending events, the merged
>> event is added to the *end* of the list of pending events.
>>
>> So if a lot of events are generated, then events can continually
>> be pushed to the end of the list of pending events, and so are never
>> or much later dequeued by the application.
>>
>> Effectively this is a denial-of-service situation were the
>> event is never seen by the application even though there are
>> actually a lot of events.
>>
>> So if you subscribe to events from control A and B, then
>> change control A, then change control B, then change control A
>> again, and now call VIDIOC_DQEVENT, you will get the event from
>> control B followed by A, even though A was changed first.
>>
>> This patch keeps the oldest event in its place in the 'pending
>> events' list rather then moving it to the end, and in the test
>> above you will now receive the event from control A first.
> 
> Typically events are queued faster than they're generated, it is an

You mean 'dequeued' instead of 'queued'?

> exception when they are not. The application certainly won't work very well
> if it consumes events slower than they're produced, whether or not the
> ordering of events fits for the use case.

The problem isn't the application, the problem is that with the current
code events never reach the application, they can be continuously pushed
back to the end of the queue. This is not theory, it's how I discovered
something was wrong. Some events were delayed by seconds.

> For instance, for frame sync events, the latest event is more relevant than
> than earlier such events and the latest event should be kept instead of an
> earlier event. I wouldn't change this, or alternatively I'd make it
> dependent on the event type, but in I wonder if that's worth the
> complexity.

This might be an option. Another option is to extend struct v4l2_event_subscription:
a flag that says how to handle this specific case (drop the oldest event or
update the contents of the oldest event), and a field to set the size of the
queue for that event.

Right now the number of events for a (type, id) tuple is set by the driver,
but for situations like this it can be useful to be able to configure it by
the application.

It would certainly help if I can configure this for the specific use-case I am
dealing with.

Regards,

	Hans

> 
>>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> Fixes: c53c2549333b ("[media] v4l2-event: Add v4l2_subscribed_event_ops")
>> Cc: <stable@vger.kernel.org>
>> ---
>> Changes since v1:
>> - fh->sequence was not incremented when replacing an event. Just drop that
>>   change and keep the original code (i.e. incrementing the sequence counter
>>   at the beginning).
>> ---
>>  drivers/media/v4l2-core/v4l2-event.c | 59 +++++++++++++++++++++-------
>>  1 file changed, 44 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>> index 3898ff7edddb..919cdd46a2c2 100644
>> --- a/drivers/media/v4l2-core/v4l2-event.c
>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>> @@ -104,7 +104,6 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>  {
>>  	struct v4l2_subscribed_event *sev;
>>  	struct v4l2_kevent *kev;
>> -	bool copy_payload = true;
>>
>>  	/* Are we subscribed? */
>>  	sev = v4l2_event_subscribed(fh, ev->type, ev->id);
>> @@ -116,29 +115,59 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>
>>  	/* Do we have any free events? */
>>  	if (sev->in_use == sev->elems) {
>> -		/* no, remove the oldest one */
>> -		kev = sev->events + sev_pos(sev, 0);
>> -		list_del(&kev->list);
>> -		sev->in_use--;
>> -		sev->first = sev_pos(sev, 1);
>> -		fh->navailable--;
>> +		/*
>> +		 * No, so we have to make space.
>> +		 *
>> +		 * This is a bit tricky: the easy solution is to drop the oldest
>> +		 * event from the fh->available list and add the new one to
>> +		 * the end of the list. However, that can lead to situation
>> +		 * were, if there are a lot of events, the oldest event keeps
>> +		 * being removed before it can be dequeued by the application.
>> +		 * Effectively this is a denial-of-service situation were the
>> +		 * event is never seen by the application even though there are
>> +		 * actually a lot of events.
>> +		 *
>> +		 * So instead we take care to keep the oldest event in its
>> +		 * place, and instead either replace the event content with
>> +		 * the new event (if sev->elems == 1) or merge the 2nd oldest
>> +		 * event with the oldest event.
>> +		 */
>> +		struct v4l2_kevent *oldest = sev->events + sev_pos(sev, 0);
>> +		struct v4l2_kevent *second_oldest;
>> +
>>  		if (sev->elems == 1) {
>>  			if (sev->ops && sev->ops->replace) {
>> -				sev->ops->replace(&kev->event, ev);
>> -				copy_payload = false;
>> +				/* Replace the oldest event with the new event */
>> +				sev->ops->replace(&oldest->event, ev);
>> +			} else {
>> +				oldest->event.u = ev->u;
>>  			}
>> -		} else if (sev->ops && sev->ops->merge) {
>> -			struct v4l2_kevent *second_oldest =
>> -				sev->events + sev_pos(sev, 0);
>> -			sev->ops->merge(&kev->event, &second_oldest->event);
>> +			wake_up_all(&fh->wait);
>> +			return;
>>  		}
>> +		second_oldest = sev->events + sev_pos(sev, 1);
>> +		if (sev->ops && sev->ops->merge) {
>> +			/* Merge the oldest event with the 2nd oldest event */
>> +			sev->ops->merge(&oldest->event, &second_oldest->event);
>> +		}
>> +
>> +		/*
>> +		 * Replace the oldest event with the second oldest event in the
>> +		 * event list.
>> +		 */
>> +		second_oldest->event.sequence = oldest->event.sequence;
>> +		second_oldest->ts = oldest->ts;
>> +		list_del(&second_oldest->list);
>> +		list_replace_init(&oldest->list, &second_oldest->list);
>> +		sev->first = sev_pos(sev, 1);
>> +		sev->in_use--;
>> +		fh->navailable--;
>>  	}
>>
>>  	/* Take one and fill it. */
>>  	kev = sev->events + sev_pos(sev, sev->in_use);
>>  	kev->event.type = ev->type;
>> -	if (copy_payload)
>> -		kev->event.u = ev->u;
>> +	kev->event.u = ev->u;
>>  	kev->event.id = ev->id;
>>  	kev->ts = ts;
>>  	kev->event.sequence = fh->sequence;
> 


