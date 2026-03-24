Return-Path: <linux-media+bounces-56898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAsEN+zNwmkBmQQAu9opvQ
	(envelope-from <linux-media+bounces-56898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:46:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DA31A3DB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2BED308C5EF
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0637D407587;
	Tue, 24 Mar 2026 17:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jv4m2hq1"
X-Original-To: linux-media@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E8391E55
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373942; cv=none; b=s4kVmAdEbEFtGF2dX0B9EwswR8NW2r6wCKKzk6vHdwfxzHobcupBkuz89tyMpBy2qC+rHmwvZ3eZWTRUWyDKi+ftO0ka2lliXIPGh3nZx534+GFY5nQo2hwJbqfSoVWmGLeikcxFGYbnjMzHNUtrpEKnXNb62ur8wibCoTR5dBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373942; c=relaxed/simple;
	bh=IcNNDe+XYtEBIp+hho7GUHo3w47rVfDLGspiKGm97yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5DNImsXLnyw/msOqpxwEHMdw9OnbRbaWu7NL7POFFJNTLQDlolkn6GU4nuvZJTFY0LkbFbzYYWaoe5WanAnY5QzvNVyuoVAdh6fQPiMJVREbEGlaSRs9NECPZojq0qKv1B0K+WOSPs8m0O8JBaLxvfY11pwLkZJPAFpSRBMzhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jv4m2hq1; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <6d1ac9cc-a7ff-4a1f-9ed0-000917a2cf8c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774373928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2YiHvoSUKETtWzYTs243lZWQyH4LE6HdwfRDfombfc=;
	b=Jv4m2hq1QT2Pb//kxdy++mb9mLZeEV1qAPmqphAqQo/wzJtccMiqAKe25CgP2OOuxG2HO6
	sCHTcb2dPPKT8+qaK1c03Vf5YvUT61JYsG8JRbaAZQ57cED1NTDpR8ftOo3gK1eFQFR7FC
	HVo89iiLZx8LNZBrIA+0BqiuZ8/5Jfw=
Date: Tue, 24 Mar 2026 13:38:45 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] media: uvcvideo: Fix deadlock if uvc_status_stop is
 called from async_ctrl.work
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
References: <20260316155823.1855434-1-sean.anderson@linux.dev>
 <20260323235245.GB2334070@killaraus.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260323235245.GB2334070@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56898-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.anderson@linux.dev,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 180DA31A3DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 19:52, Laurent Pinchart wrote:
> Hi Sean,
> 
> Thank you for the patch.
> 
> On Mon, Mar 16, 2026 at 11:58:22AM -0400, Sean Anderson wrote:
>> If a UVC camera has an asynchronous control, uvc_status_stop may be
>> called from async_ctrl.work:
>> 
>> uvc_ctrl_status_event_work()
>>     uvc_ctrl_status_event()
>>         uvc_ctrl_clear_handle()
>> 	    uvc_pm_put()
>> 	        uvc_status_put()
>> 		    uvc_status_stop()
>> 		        cancel_work_sync()
>> 
>> This will cause a deadlock, since cancel_work_sync will wait for
>> uvc_ctrl_status_event_work to complete before returning.
>> 
>> Fix this by returning early from uvc_status_stop if we are currently in
>> the work function. flush_status now remains false until uvc_status_start
>> is called again, ensuring that uvc_ctrl_status_event_work won't resubmit
>> the URB.
>> 
>> Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")
>> Closes: https://lore.kernel.org/all/6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev/
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>> Changes in v2:
>> - Update comments with review feedback
>> - Use flush_work instead of cancel_work_sync since the work should never
>>   be rescheduled.
>> 
>>  drivers/media/usb/uvc/uvc_status.c | 27 ++++++++++++++++++---------
>>  1 file changed, 18 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
>> index 231cfee8e7c2c..ea45b11642e59 100644
>> --- a/drivers/media/usb/uvc/uvc_status.c
>> +++ b/drivers/media/usb/uvc/uvc_status.c
>> @@ -316,6 +316,15 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>>  	if (!dev->int_urb)
>>  		return 0;
>>  
>> +	/*
>> +	 * If the work called uvc_status_stop it may still be running. Wait for
>> +	 * it to finish before we submit the urb.
>> +	 */
>> +	flush_work(&dev->async_ctrl.work);
> 
> I assume the only way this can happen is for uvc_status_start() to run
> after the uvc_status_put() call in
> 
> uvc_ctrl_status_event_work()
>     uvc_ctrl_status_event()
>         uvc_ctrl_clear_handle()
> 	    uvc_pm_put()
> 	        uvc_status_put()
> 
> returns. Is that right ? If so I'd like to capture that better in the
> comment, as I have a feeling we'll need to revisit this code at some
> point.
> 
> 	/*
> 	 * If the previous uvc_status_stop() call was from the async work, the
> 	 * work may still be running. Wait for it to finish before we submit the
> 	 * urb.
> 	 */
> 
> And if that's not correct, there's something I don't get and a better
> comment is even more important :-)
> 
> If the above change is fine, I can update the comment when applying, and
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Fine by me

> This being said, I wonder if we could have a simpler implementation if
> we always stopped the work and URB when the last userspace user goes
> away, instead of keeping the device active until we get the asynchronous
> control notification.
> 
>> +
>> +	/* Clear the flush status if we were previously stopped. */
>> +	smp_store_release(&dev->flush_status, false);
>> +
>>  	return usb_submit_urb(dev->int_urb, flags);
>>  }
>>  
>> @@ -336,6 +345,15 @@ static void uvc_status_stop(struct uvc_device *dev)
>>  	 */
>>  	smp_store_release(&dev->flush_status, true);
>>  
>> +	/*
>> +	 * If we are called from the event work function, the URB is guaranteed
>> +	 * to not be in flight as it has completed and has not been resubmitted.
>> +	 * There's no need to cancel the work (which would deadlock), or to kill
>> +	 * the URB.
>> +	 */
>> +	if (current_work() == &w->work)
>> +		return;
>> +
>>  	/*
>>  	 * Cancel any pending asynchronous work. If any status event was queued,
>>  	 * process it synchronously.
>> @@ -354,15 +372,6 @@ static void uvc_status_stop(struct uvc_device *dev)
>>  	 */
>>  	if (cancel_work_sync(&w->work))
>>  		uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
>> -
>> -	/*
>> -	 * From this point, there are no events on the queue and the status URB
>> -	 * is dead. No events will be queued until uvc_status_start() is called.
>> -	 * The barrier is needed to make sure that flush_status is visible to
>> -	 * uvc_ctrl_status_event_work() when uvc_status_start() will be called
>> -	 * again.
>> -	 */
>> -	smp_store_release(&dev->flush_status, false);
>>  }
>>  
>>  int uvc_status_resume(struct uvc_device *dev)
> 


