Return-Path: <linux-media+bounces-55767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI6WLzhctGklmQAAu9opvQ
	(envelope-from <linux-media+bounces-55767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:49:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093C288F2F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 763C23033D4D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BDB367F5B;
	Fri, 13 Mar 2026 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HZDex5k+"
X-Original-To: linux-media@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FFE305962
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 18:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773427744; cv=none; b=GK5GJa7CdsRZL5F8mY4D7KFXSdDtnpOXVDCYULX5kz3IWPjsapcofjSM+E5wPHHhkuIP+7zdQdLsSN96mr2i9tLcJXNWfZRuWRvW9gKB/S0AtKLec31rjwK6LjBItxyqaQusQA3TcDDGtzYDD0ehTrgXuvUIzrMt78k+/D/gmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773427744; c=relaxed/simple;
	bh=v2X+nxy4xm/MsnpqQQZF2fQ2w5SX/j7/HVR41g3RF74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DoeRo9YmWX2vfnkDdYH+1WQjJTiAP5Bh63dQ867WcrQlztySdETZT5a+MbC7A5T2otCm0CvNhHWWeMPN+gV8VY9876/B3s85PQzrTrWtxrfny1SEN25IYs6VSAdQGUJBmRqGuNaEppl/jN3f++ytlooDu0WlTMgC7xTyPlhzFrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HZDex5k+; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <04c8029a-8636-4757-b997-e115f466b42f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773427740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPNBm3NzEpEpK8jen0jXpttSvDTYMj8/pyUDJOc2iSw=;
	b=HZDex5k+ixmjDlHibuZXDO6NLTj2Cnd56WwRcshoq4UqPb1ixulVpsQ+GNeLW0jomknX+r
	6Z8iB0BvxXR6z3A/EVsf/3bAaeS6/CiCqHsRv3/hy1KSi2odu2SX/zN/m1XSzOmNIMpo2Q
	F7tDmWq2Uj2+iwZDIqzxLVWB1ECGZS0=
Date: Fri, 13 Mar 2026 14:48:50 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: uvcvideo: Fix deadlock if uvc_status_stop is
 called from async_ctrl.work
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
References: <20260310222259.1202061-1-sean.anderson@linux.dev>
 <20260313174514.GC672609@killaraus.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260313174514.GC672609@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55767-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.anderson@linux.dev,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6093C288F2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 13:45, Laurent Pinchart wrote:
> On Tue, Mar 10, 2026 at 06:22:59PM -0400, Sean Anderson wrote:
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
>>  drivers/media/usb/uvc/uvc_status.c | 25 ++++++++++++++++---------
>>  1 file changed, 16 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
>> index 231cfee8e7c2c..2a23606c7f4c6 100644
>> --- a/drivers/media/usb/uvc/uvc_status.c
>> +++ b/drivers/media/usb/uvc/uvc_status.c
>> @@ -316,6 +316,14 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>>  	if (!dev->int_urb)
>>  		return 0;
>>  
>> +	/*
>> +	 * If the work called uvc_status_stop it may still be running. Wait for
>> +	 * it to finish before we submit the urb.
> 
> I don't like this much. The code is becoming really convoluted and hard
> to follow. Would there be a way to solve the issue with a broader
> refactoring that would simplify the implementation ?

I don't think so. The complexity is fundamental to how the URB and work
schedule each other and that there are multiple opportunities for one to
"resurrect" the other.

As noted on the other reply, I think this call can be loosened to a
flush_work.

>> +	 */
>> +	cancel_work_sync(&dev->async_ctrl.work);
>> +
>> +	/* Clear the flush status if we were previously stopped */
> 
> s/stopped/stopped./
> 
>> +	smp_store_release(&dev->flush_status, false);
> 
> Add a blank line here.
> 
>>  	return usb_submit_urb(dev->int_urb, flags);
>>  }
>>  
>> @@ -336,6 +344,14 @@ static void uvc_status_stop(struct uvc_device *dev)
>>  	 */
>>  	smp_store_release(&dev->flush_status, true);
>>  
>> +	/*
>> +	 * We will deadlock if we are currently in the work function.
>> +	 * Fortunately, we know that the URB is already dead and that no
> 
> The URB hasn't been killed, at has just completed and not been
> resubmitted.

That's why I said "dead" and not "killed" :)

> I'd write
> 
> 	/*
> 	 * If we are called from the event work function, the URB is guaranteed
> 	 * to not be in flight as it has completed and has not been resubmitted.
> 	 * There's no need to cancel the work (which would deadlock), or to kill
> 	 * the URB.
> 	 */

Fine by me

>> +	 * further work can be queued, so there's nothing left for us to do.
>> +	 */
>> +	if (current_work() == &w->work)
>> +		return;
>> +
>>  	/*
>>  	 * Cancel any pending asynchronous work. If any status event was queued,
>>  	 * process it synchronously.
>> @@ -354,15 +370,6 @@ static void uvc_status_stop(struct uvc_device *dev)
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

