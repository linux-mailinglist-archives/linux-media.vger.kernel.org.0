Return-Path: <linux-media+bounces-61128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG9bAyDdAWptlgEAu9opvQ
	(envelope-from <linux-media+bounces-61128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:44:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25550F331
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DEEB30B68C5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FEF3F23D2;
	Mon, 11 May 2026 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFAbHRwo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FCA3F7897;
	Mon, 11 May 2026 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506617; cv=none; b=iPv5MXANy0q2EpChwGZYA3VY3Y+OMI4J582AYZwgi1AxECIXttXkzalZtC1hRe/qfyvVi9cLvh+C89a95YVD+mlLOdqkJJVyOCkLLwBaNZbIW5sSRcucgeE+XCQMJP8fVhRbNMyRL07GIxv5WhhElN7JGarNv0DPaC0Gj7kUA6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506617; c=relaxed/simple;
	bh=tcHgAbR35E7v02HSUBT6AzwvqP6w6NbhdyW1EwzOy/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsoU9gQkojZYNj5fWbOhSozR6CXiUkwnWH9VRdiIK9ET4O0LN8C+ejLDJ/iK2XMi13O7yFk2QMQPc3cc9Nua7lEr9sI/ngo1hZgCxroMCeHCw4XsJwFNL2vBnBiTtez7vCZOfG3oiGUFf7p40csXLum4tRLbMp9evN1P7b+lvK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFAbHRwo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB275C2BCFA;
	Mon, 11 May 2026 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506617;
	bh=tcHgAbR35E7v02HSUBT6AzwvqP6w6NbhdyW1EwzOy/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uFAbHRwo1vG8AXcZn4oHVqFeR9rFLYrbZe8Evcf1Wvl7AcL46zYxG6vZhuAaBMdWn
	 lj/YlAAa++fUqTfwJ75DfBPTWIX2zF1ZrlOYF/EAGmtVDdbxuTc8Uo3djm/q34gxBO
	 r6gXZeVzfOVM8Dp8MBspKD67XuUTk7yyEFzp4D8vxPgoV4G4s2tcLB5F/B91CheP6r
	 JYrCmzOlqPZ1+NuhDO+GyK60g/cgoaLb5qWM180ekupBCqEz4vErxE75ZRsVjsKKfM
	 My8kS3kQTSN5+QQ88UsUVcurYYoQRNyLYR43bP5AZWPGupqxPdnGdClT1PmMVlhtDF
	 QnneeACZpfvow==
Message-ID: <f1ba0045-b3b0-4098-971c-5385644bf82e@kernel.org>
Date: Mon, 11 May 2026 15:36:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: Fix deadlock if uvc_status_stop is
 called from async_ctrl.work
To: Sean Anderson <sean.anderson@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>
References: <20260316155823.1855434-1-sean.anderson@linux.dev>
 <20260323235245.GB2334070@killaraus.ideasonboard.com>
 <6d1ac9cc-a7ff-4a1f-9ed0-000917a2cf8c@linux.dev>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <6d1ac9cc-a7ff-4a1f-9ed0-000917a2cf8c@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4E25550F331
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61128-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi,

On 24-Mar-26 18:38, Sean Anderson wrote:
> On 3/23/26 19:52, Laurent Pinchart wrote:
>> Hi Sean,
>>
>> Thank you for the patch.
>>
>> On Mon, Mar 16, 2026 at 11:58:22AM -0400, Sean Anderson wrote:
>>> If a UVC camera has an asynchronous control, uvc_status_stop may be
>>> called from async_ctrl.work:
>>>
>>> uvc_ctrl_status_event_work()
>>>     uvc_ctrl_status_event()
>>>         uvc_ctrl_clear_handle()
>>> 	    uvc_pm_put()
>>> 	        uvc_status_put()
>>> 		    uvc_status_stop()
>>> 		        cancel_work_sync()
>>>
>>> This will cause a deadlock, since cancel_work_sync will wait for
>>> uvc_ctrl_status_event_work to complete before returning.
>>>
>>> Fix this by returning early from uvc_status_stop if we are currently in
>>> the work function. flush_status now remains false until uvc_status_start
>>> is called again, ensuring that uvc_ctrl_status_event_work won't resubmit
>>> the URB.
>>>
>>> Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")
>>> Closes: https://lore.kernel.org/all/6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev/
>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>> ---
>>>
>>> Changes in v2:
>>> - Update comments with review feedback
>>> - Use flush_work instead of cancel_work_sync since the work should never
>>>   be rescheduled.
>>>
>>>  drivers/media/usb/uvc/uvc_status.c | 27 ++++++++++++++++++---------
>>>  1 file changed, 18 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
>>> index 231cfee8e7c2c..ea45b11642e59 100644
>>> --- a/drivers/media/usb/uvc/uvc_status.c
>>> +++ b/drivers/media/usb/uvc/uvc_status.c
>>> @@ -316,6 +316,15 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>>>  	if (!dev->int_urb)
>>>  		return 0;
>>>  
>>> +	/*
>>> +	 * If the work called uvc_status_stop it may still be running. Wait for
>>> +	 * it to finish before we submit the urb.
>>> +	 */
>>> +	flush_work(&dev->async_ctrl.work);
>>
>> I assume the only way this can happen is for uvc_status_start() to run
>> after the uvc_status_put() call in
>>
>> uvc_ctrl_status_event_work()
>>     uvc_ctrl_status_event()
>>         uvc_ctrl_clear_handle()
>> 	    uvc_pm_put()
>> 	        uvc_status_put()
>>
>> returns. Is that right ? If so I'd like to capture that better in the
>> comment, as I have a feeling we'll need to revisit this code at some
>> point.
>>
>> 	/*
>> 	 * If the previous uvc_status_stop() call was from the async work, the
>> 	 * work may still be running. Wait for it to finish before we submit the
>> 	 * urb.
>> 	 */
>>
>> And if that's not correct, there's something I don't get and a better
>> comment is even more important :-)
>>
>> If the above change is fine, I can update the comment when applying, and
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Fine by me

Thank you everyone.

I've merged this in my local uvc/for-next branch with Laurent's updated
comment and with Laurent's and Ricardo's Reviewed-by added.

I'll push this out to gitlab for CI later today.

Regards,

Hans




> 
>> This being said, I wonder if we could have a simpler implementation if
>> we always stopped the work and URB when the last userspace user goes
>> away, instead of keeping the device active until we get the asynchronous
>> control notification.
>>
>>> +
>>> +	/* Clear the flush status if we were previously stopped. */
>>> +	smp_store_release(&dev->flush_status, false);
>>> +
>>>  	return usb_submit_urb(dev->int_urb, flags);
>>>  }
>>>  
>>> @@ -336,6 +345,15 @@ static void uvc_status_stop(struct uvc_device *dev)
>>>  	 */
>>>  	smp_store_release(&dev->flush_status, true);
>>>  
>>> +	/*
>>> +	 * If we are called from the event work function, the URB is guaranteed
>>> +	 * to not be in flight as it has completed and has not been resubmitted.
>>> +	 * There's no need to cancel the work (which would deadlock), or to kill
>>> +	 * the URB.
>>> +	 */
>>> +	if (current_work() == &w->work)
>>> +		return;
>>> +
>>>  	/*
>>>  	 * Cancel any pending asynchronous work. If any status event was queued,
>>>  	 * process it synchronously.
>>> @@ -354,15 +372,6 @@ static void uvc_status_stop(struct uvc_device *dev)
>>>  	 */
>>>  	if (cancel_work_sync(&w->work))
>>>  		uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
>>> -
>>> -	/*
>>> -	 * From this point, there are no events on the queue and the status URB
>>> -	 * is dead. No events will be queued until uvc_status_start() is called.
>>> -	 * The barrier is needed to make sure that flush_status is visible to
>>> -	 * uvc_ctrl_status_event_work() when uvc_status_start() will be called
>>> -	 * again.
>>> -	 */
>>> -	smp_store_release(&dev->flush_status, false);
>>>  }
>>>  
>>>  int uvc_status_resume(struct uvc_device *dev)
>>
> 


