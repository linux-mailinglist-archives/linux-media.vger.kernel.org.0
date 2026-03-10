Return-Path: <linux-media+bounces-55240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMSJCyqNsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:29:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A6425846C
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DC3C30E95F9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2A23EAC93;
	Tue, 10 Mar 2026 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HkHQPBTR"
X-Original-To: linux-media@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516CB3EBF28
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773177826; cv=none; b=WS/8CBh3ktkGqse1lFKZJA03sItjDpgpoiTYtfeY5iOmu+nGFi0WydZLdI0iVhfujzbCGrUAbOU2VYp2Yp+cEr4T3iurjKguhUeo3062OEonNfGLJbmFBbwwYkhHAF9KuYA8unv4cf3jrt3jlLrUlonJ8CrJ0RepzjLVARQVc3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773177826; c=relaxed/simple;
	bh=5x2B0VItY076mEw7SlJpcOMHnQIayXVrqVWyRDo5ea0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuxe4hcEes0jvkyNenzyz1dKKk9ENmQluv1M8OryXIBk2ZscqQj1ttTikwH4mdOyyuQAdum9mOFB/0la83MK6hhXzgHiXHS8T+M82LB22916txgi9iJd40ayt3fjNIb/ZlmsHkg/Ct+I4guc69lP1zQZY6zk8vEZX5jteKiX5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HkHQPBTR; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <d5793f17-61cf-42be-b2fe-7d1549310989@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773177816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8QUrrZbtBaw96JE4uwm78SaKmRtGD4luJCTiJ68oMc=;
	b=HkHQPBTRzF2lqrzJYkkUuOtuR4JhCckytHaKF8FjTv22skiI34h6A2p4k5ENsXvg1u6fLL
	CJv8jt0xQjBW8NeNHRk7mnzPaSAfRBWaJyc9lnjwNth3eoxZmsER76vybdsyfvuMAeZVH6
	7RPdiOJ95CJpLXBRY61eWO9bMiJ3Gm8=
Date: Tue, 10 Mar 2026 17:23:32 -0400
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CANiDSCtLj-N+M+JmP3C_y=vNtSy-UN7XtkXaZ=dLN6f0kd7rYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 75A6425846C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55240-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Action: no action

On 3/10/26 16:56, Ricardo Ribalda wrote:
> Hi Sean
> 
> Thanks for the report.
> 
> I have not been able to repro with qv4l2 on my computer :(.
> 
> Could you try if this patch works for you? Not saying that it is
> beautiful patch, or the way to do it.... but it will let me know if I
> am looking in the right place.
> 
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c
> b/drivers/media/usb/uvc/uvc_status.c
> index 231cfee8e7c2..cca2aed162c3 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -340,7 +340,9 @@ static void uvc_status_stop(struct uvc_device *dev)
>          * Cancel any pending asynchronous work. If any status event was queued,
>          * process it synchronously.
>          */
> -       if (cancel_work_sync(&w->work))
> +       if (&w->work == current_work())
> +               cancel_work(&w->work);
> +       else if (cancel_work_sync(&w->work))
>                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> 
>         /* Kill the urb. */
> @@ -352,7 +354,7 @@ static void uvc_status_stop(struct uvc_device *dev)
>          * cancelled before returning or it could then race with a future
>          * uvc_status_start() call.
>          */
> -       if (cancel_work_sync(&w->work))
> +       if (&w->work != current_work() && cancel_work_sync(&w->work))
>                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> 
>         /*

I don't think this works since the urb will be rescheduled as flush_status
is set to false again. However, the following patch works for me:

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 231cfee8e7c2c..2a23606c7f4c6 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -316,6 +316,14 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
        if (!dev->int_urb)
                return 0;
 
+       /*
+        * If the work called uvc_status_stop it may still be running. Wait for
+        * it to finish before we submit the urb.
+        */
+       cancel_work_sync(&dev->async_ctrl.work);
+
+       /* Clear the flush status if we were previously stopped */
+       smp_store_release(&dev->flush_status, false);
        return usb_submit_urb(dev->int_urb, flags);
 }
 
@@ -336,6 +344,14 @@ static void uvc_status_stop(struct uvc_device *dev)
         */
        smp_store_release(&dev->flush_status, true);
 
+       /*
+        * We will deadlock if we are currently in the work function.
+        * Fortunately, we know that the URB is already dead and that no
+        * further work can be queued, so there's nothing left for us to do.
+        */
+       if (current_work() == &w->work)
+               return;
+
        /*
         * Cancel any pending asynchronous work. If any status event was queued,
         * process it synchronously.
@@ -354,15 +370,6 @@ static void uvc_status_stop(struct uvc_device *dev)
         */
        if (cancel_work_sync(&w->work))
                uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
-
-       /*
-        * From this point, there are no events on the queue and the status URB
-        * is dead. No events will be queued until uvc_status_start() is called.
-        * The barrier is needed to make sure that flush_status is visible to
-        * uvc_ctrl_status_event_work() when uvc_status_start() will be called
-        * again.
-        */
-       smp_store_release(&dev->flush_status, false);
 }
 
 int uvc_status_resume(struct uvc_device *dev)
--

The first cancel_work_sync also seems superfluous to me, since we have to cancel
again anyway.

--Sean

