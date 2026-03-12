Return-Path: <linux-media+bounces-55520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMpLACf5smmLRAAAu9opvQ
	(envelope-from <linux-media+bounces-55520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:34:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC427694D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD7BA3090EE4
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 17:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793EA3EFD3C;
	Thu, 12 Mar 2026 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j6GY/2mY"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C9937B011
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336804; cv=none; b=gXYrQMC/ZyZ7c/y2LtjAQsZIt7FWAbm570xDG6xEYNdtH8SZq+zjdjRln3WDvIFueMuBSf/qWk3VZtRYpxpJhs09UAxbSHsRqDsHcqZsmO59ncLAzDjVyXBnaSe9Q4Zoxumb4Lyn4RaAcbMObH5WdKjhzOreoWJ9YeMj/DY6QZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336804; c=relaxed/simple;
	bh=C1Zu8SpmPZvVsUc1f8ts2YF2WmRUMmbx6+d/z1qOUDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAET49QdCXnYLGKGRU2GP04t4xExKuN17tkBJpxEIKHBBGIzjJZUrWlRyLFBkIRN6G9ag3Ijix6nS03DkiAcoFlDGNvw/NntgN588NA7lCC/Z+u/xuvM8XkcFkJ0O+outfdHPy5kGdsnwnBPDWEXhGU2P8cxo8uNdmUjPAeV6D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j6GY/2mY; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <b1b73235-5ea6-409e-977d-2221aa8d6595@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773336790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkTSJWWsmsroNNf+L3475xvbdYeLrc6UBPWq1ds1CRc=;
	b=j6GY/2mYIeut6F1lEa5dup+ZL/V4GPVAfZuK3B4qV14KLmBeknE4MJP7VWvvO4EVSNdSdV
	TQ33v0ggMOrs5jlHaqdi+x8rAdxOE0usKjGWFQGBSSi9GZxiT6jwZQJt840/JlD5/W+S1i
	476V7eX7gDitfvJ5NDK/AwD9pTj1a4A=
Date: Thu, 12 Mar 2026 13:33:00 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: uvcvideo: Fix deadlock if uvc_status_stop is
 called from async_ctrl.work
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>
References: <20260310222259.1202061-1-sean.anderson@linux.dev>
 <CANiDSCsa5mLGGarqKVgZ8aS1m6_7VSwT7ps1ZZwb9a8hk-kkQw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CANiDSCsa5mLGGarqKVgZ8aS1m6_7VSwT7ps1ZZwb9a8hk-kkQw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-55520-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: 4CEC427694D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

On 3/11/26 12:06, Ricardo Ribalda wrote:
> Hi Sean
> 
> Thanks for the patch. In your original report you mentioned that you
> could repro with qv4l2 and changing a control.
> May I assume that it was while the camera was not streaming and the
> control was a "slow" controp (zoom, focus)... Can you give more some
> more details?

Yes. A minimal reproducer is

$ v4l2-ctl -c focus_absolute=500
$ v4l2-ctl -c focus_absolute=500
(hangs)

I believe the reason guvcview does not have this issue is because it
continuously displays camera output, keeping the refcount above one,
whereas qv4l2ctrl 

> I have tested your change with 3 threads running:
> 
> 1 # while true; do yavta --capture=3 /dev/video0; sleep 1;done
> 2 #  while true; do yavta -w "0x00980900 64" /dev/video0; yavta -w
> "0x00980900 0" /dev/video0; done
> 3 /sys/bus/usb/devices/3-6 # while true; do echo 1 > authorized; sleep
> 3; echo 0 > authorized; sleep 3 ; done
> 
> And I have not seen any freeze. So that is good :), But I also could
> not repro without your patch :P.
> 
> Anyway I agree with the lockdep report that we introduced a bug when
> uvc_status_stop can be called from the async work, So we must fix it.
> 
> 
> On Tue, 10 Mar 2026 at 23:23, Sean Anderson <sean.anderson@linux.dev> wrote:
>>
>> If a UVC camera has an asynchronous control, uvc_status_stop may be
>> called from async_ctrl.work:
>>
>> uvc_ctrl_status_event_work()
>>     uvc_ctrl_status_event()
>>         uvc_ctrl_clear_handle()
>>             uvc_pm_put()
>>                 uvc_status_put()
>>                     uvc_status_stop()
>>                         cancel_work_sync()
>>
>> This will cause a deadlock, since cancel_work_sync will wait for
>> uvc_ctrl_status_event_work to complete before returning.
>>
>> Fix this by returning early from uvc_status_stop if we are currently in
>> the work function. flush_status now remains false until uvc_status_start
>> is called again, ensuring that uvc_ctrl_status_event_work won't resubmit
>> the URB.
>>
> Tested-by: Ricardo Ribalda <ribalda@chromium.org>
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Your patch is very similar to what I sent some time ago (I did not
> have the cancel_work_sync() in uvc_status_start())

This could probably be downgraded to flush_work() (along with the first
cancel_work_sync in uvc_status_stop).

> You can see the old discussion:
> https://lore.kernel.org/all/Y6sAO7URJpSIulye@pendragon.ideasonboard.com/
> 
> For now, I am only ack the patch because I want to ensure the locking
> is working as expected and need to re-read the old threads.
> It would be great if Hans or Laurent also take a look at this.
> 
> Thanks again
> 
> 
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
>>         if (!dev->int_urb)
>>                 return 0;
>>
>> +       /*
>> +        * If the work called uvc_status_stop it may still be running. Wait for
>> +        * it to finish before we submit the urb.
>> +        */
>> +       cancel_work_sync(&dev->async_ctrl.work);
>> +
>> +       /* Clear the flush status if we were previously stopped */
>> +       smp_store_release(&dev->flush_status, false);
>>         return usb_submit_urb(dev->int_urb, flags);
>>  }
>>
>> @@ -336,6 +344,14 @@ static void uvc_status_stop(struct uvc_device *dev)
>>          */
>>         smp_store_release(&dev->flush_status, true);
>>
>> +       /*
>> +        * We will deadlock if we are currently in the work function.
>> +        * Fortunately, we know that the URB is already dead and that no
>> +        * further work can be queued, so there's nothing left for us to do.
>> +        */
>> +       if (current_work() == &w->work)
>> +               return;
>> +
>>         /*
>>          * Cancel any pending asynchronous work. If any status event was queued,
>>          * process it synchronously.
>> @@ -354,15 +370,6 @@ static void uvc_status_stop(struct uvc_device *dev)
>>          */
>>         if (cancel_work_sync(&w->work))
>>                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
>> -
>> -       /*
>> -        * From this point, there are no events on the queue and the status URB
>> -        * is dead. No events will be queued until uvc_status_start() is called.
>> -        * The barrier is needed to make sure that flush_status is visible to
>> -        * uvc_ctrl_status_event_work() when uvc_status_start() will be called
>> -        * again.
>> -        */
>> -       smp_store_release(&dev->flush_status, false);
>>  }
>>
>>  int uvc_status_resume(struct uvc_device *dev)
>> --
>> 2.35.1.1320.gc452695387.dirty
>>
> 
> 

