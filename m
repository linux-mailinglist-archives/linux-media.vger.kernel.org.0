Return-Path: <linux-media+bounces-55274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBf5HvGbsGnwlAIAu9opvQ
	(envelope-from <linux-media+bounces-55274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:32:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA343258EFF
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F74330AD9E9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE613A3E6A;
	Tue, 10 Mar 2026 22:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W/u9QQWk"
X-Original-To: linux-media@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA1140DFAA
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181927; cv=none; b=G47NUbXlcNum2qtvgLpiugPX3CaGNdYDu0riv5xkynJLEzQDm0+3YLPPsrQnrkzerdJqakqzB26ZZkD5s4S++y8yQwQuKVxV9KNMDtzkdgu3ddLZDqP3U9xCa2eWS+quQxBEeOBamUCJBzB0vDG5OAGQjKl6GF6TB0mi5CXx/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181927; c=relaxed/simple;
	bh=nCg+f0Ir6nq1atsLP/nsyl/0EfHnr5HJe3XImmUMm80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gE7Bo1JLoSK8hAqTypl8B1mHHmxq24gz5x8d2nsyINYtT9Oi3cxaUpqeQHXEBD/rfdFkP9qNngTiu10EuBoFWxduGD4jA971U77R/6yDnSByu5L+hQSstF89iCZfc7aqPzHqKlJ8tYk3RXdRKtnpA6WrUoo6UxC2J547zEyJrL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W/u9QQWk; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <c370c0b0-5741-44b0-9f34-34f344504d51@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773181914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IyLfIQxPvnSedK9kxLfC8cNGtJC+e8gFg6CxxaAUpKs=;
	b=W/u9QQWkiMKY212DJYhc4mNg95s2YFRJMWY248WGOxV5eT8hiydA67VOwtWWXS6SRd7ifA
	Qb69xG+51/ypT/XwRZZ5DhNmRcmSJpxekklG4xL/Ox5BdSpM/7NJxQomilqBKYqApWBH6Q
	0vGTnvi3pM9k//z79cRqH0v0oad9mJo=
Date: Tue, 10 Mar 2026 18:31:46 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] uvc_status_stop hangs if called from async_ctrl.work
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev>
 <fba86ac0-e13e-4c54-9515-c091b24f9f80@linux.dev>
 <CANiDSCtLj-N+M+JmP3C_y=vNtSy-UN7XtkXaZ=dLN6f0kd7rYg@mail.gmail.com>
 <d5793f17-61cf-42be-b2fe-7d1549310989@linux.dev>
 <CANiDSCt4dkbXQ7TJpvL-1e5er571rRq0ofnO0SRU9SsEXUrhYA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CANiDSCt4dkbXQ7TJpvL-1e5er571rRq0ofnO0SRU9SsEXUrhYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: CA343258EFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55274-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.anderson@linux.dev,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Action: no action

On 3/10/26 18:08, Ricardo Ribalda wrote:
> Hi Sean
> 
> On Tue, 10 Mar 2026 at 22:23, Sean Anderson <sean.anderson@linux.dev> wrote:
>>
>> On 3/10/26 16:56, Ricardo Ribalda wrote:
>> > Hi Sean
>> >
>> > Thanks for the report.
>> >
>> > I have not been able to repro with qv4l2 on my computer :(.
>> >
>> > Could you try if this patch works for you? Not saying that it is
>> > beautiful patch, or the way to do it.... but it will let me know if I
>> > am looking in the right place.
>> >
>> >
>> > diff --git a/drivers/media/usb/uvc/uvc_status.c
>> > b/drivers/media/usb/uvc/uvc_status.c
>> > index 231cfee8e7c2..cca2aed162c3 100644
>> > --- a/drivers/media/usb/uvc/uvc_status.c
>> > +++ b/drivers/media/usb/uvc/uvc_status.c
>> > @@ -340,7 +340,9 @@ static void uvc_status_stop(struct uvc_device *dev)
>> >          * Cancel any pending asynchronous work. If any status event was queued,
>> >          * process it synchronously.
>> >          */
>> > -       if (cancel_work_sync(&w->work))
>> > +       if (&w->work == current_work())
>> > +               cancel_work(&w->work);
>> > +       else if (cancel_work_sync(&w->work))
>> >                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
>> >
>> >         /* Kill the urb. */
>> > @@ -352,7 +354,7 @@ static void uvc_status_stop(struct uvc_device *dev)
>> >          * cancelled before returning or it could then race with a future
>> >          * uvc_status_start() call.
>> >          */
>> > -       if (cancel_work_sync(&w->work))
>> > +       if (&w->work != current_work() && cancel_work_sync(&w->work))
>> >                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
>> >
>> >         /*
>>
>> I don't think this works since the urb will be rescheduled as flush_status
>> is set to false again. However, the following patch works for me:
> 
> It does not work, in the sense that the urb is re submited... but if
> would have confirmed the rootcause of the lockdep. But you have
> already proven that with your patch, which I think is correct :).
> Thanks for that
> 
> Can you resend it as a proper patch?
> 
> You probably want to add:
> Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")

Done.

> I will try to review with extra care and a big cup of tea tomorrow morning.
> 
> Thanks!
> 
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
>>
>> The first cancel_work_sync also seems superfluous to me, since we have to cancel
>> again anyway.
> 
> It has been a while since we did this, but I believe that since we did
> not use locks, the only way to guarantee the event queue was flushed
> and the URB was killed was to have the double cancel_work() in that
> order.

Oh, I see because we could have something like

CPU A                             CPU B
================================= =======================
uvc_ctrl_status_event_work
    smp_load_acqure(flush_status)
                                  uvc_status_stop()
                                      smp_store_release()
                                      usb_kill_urb()
                                      cancel_work_sync()
    usb_submit_urb()

--Sean

