Return-Path: <linux-media+bounces-56777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONYACqXSwWk9XAQAu9opvQ
	(envelope-from <linux-media+bounces-56777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 00:54:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32C2FF173
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 00:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CADD2305F3D1
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 23:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A80381B06;
	Mon, 23 Mar 2026 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J5A2fJRz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEFD2C2374;
	Mon, 23 Mar 2026 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774309970; cv=none; b=LxFkXiMaJpqiOa32MCcV+1DmR/azOSy0qnGwS7OABgnXLBIRJmTi7ghMx3f/Q3OgrNSix5ReWcx2MmuBo/ZNO9gSIrMfZ6pKy7lx08ZJM7uGbI7ZjCetM841td8d0hEs4JIHRPCfFixkRxkbENxbheB2M2Jy7CixO8itV7/ZnFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774309970; c=relaxed/simple;
	bh=8NOTqTm6GBIgnbyNEwFerZ3BM38VpLsHMWVyEESeMCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP/kScQY8+G1hGG4F2R9VSseUqO+YYz83onscBysvB1hUKzbBut22RPKmMF9IQxAgsXTFN4dyiN5RwG1ubvFBI0+gWo2EEvdhhc4zn0WhS8U4r+KEm6xzRmAJ7KykgK5ca6miqvO76hHYdf8tquz09L3nkyYBJAqNdTyaEJf2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J5A2fJRz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BF436741;
	Tue, 24 Mar 2026 00:51:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774309889;
	bh=8NOTqTm6GBIgnbyNEwFerZ3BM38VpLsHMWVyEESeMCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5A2fJRzbzJmX9kWnxnS7mWlTBHodzO5TC4GaB77vQJTPW9J8vtD9XsjrmObjE+IO
	 ll35RCSljDWVVh9iL8zZdDB1qhmbLrxt0CkHxx4SR0CU+28pES1mLdgMjUpjRkeTPT
	 bQi9HdUs1Y8Yb6srFearv8IEJGBwV0rQqZRwhgTs=
Date: Tue, 24 Mar 2026 01:52:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v2] media: uvcvideo: Fix deadlock if uvc_status_stop is
 called from async_ctrl.work
Message-ID: <20260323235245.GB2334070@killaraus.ideasonboard.com>
References: <20260316155823.1855434-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316155823.1855434-1-sean.anderson@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56777-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 7C32C2FF173
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sean,

Thank you for the patch.

On Mon, Mar 16, 2026 at 11:58:22AM -0400, Sean Anderson wrote:
> If a UVC camera has an asynchronous control, uvc_status_stop may be
> called from async_ctrl.work:
> 
> uvc_ctrl_status_event_work()
>     uvc_ctrl_status_event()
>         uvc_ctrl_clear_handle()
> 	    uvc_pm_put()
> 	        uvc_status_put()
> 		    uvc_status_stop()
> 		        cancel_work_sync()
> 
> This will cause a deadlock, since cancel_work_sync will wait for
> uvc_ctrl_status_event_work to complete before returning.
> 
> Fix this by returning early from uvc_status_stop if we are currently in
> the work function. flush_status now remains false until uvc_status_start
> is called again, ensuring that uvc_ctrl_status_event_work won't resubmit
> the URB.
> 
> Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")
> Closes: https://lore.kernel.org/all/6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev/
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - Update comments with review feedback
> - Use flush_work instead of cancel_work_sync since the work should never
>   be rescheduled.
> 
>  drivers/media/usb/uvc/uvc_status.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 231cfee8e7c2c..ea45b11642e59 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -316,6 +316,15 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>  	if (!dev->int_urb)
>  		return 0;
>  
> +	/*
> +	 * If the work called uvc_status_stop it may still be running. Wait for
> +	 * it to finish before we submit the urb.
> +	 */
> +	flush_work(&dev->async_ctrl.work);

I assume the only way this can happen is for uvc_status_start() to run
after the uvc_status_put() call in

uvc_ctrl_status_event_work()
    uvc_ctrl_status_event()
        uvc_ctrl_clear_handle()
	    uvc_pm_put()
	        uvc_status_put()

returns. Is that right ? If so I'd like to capture that better in the
comment, as I have a feeling we'll need to revisit this code at some
point.

	/*
	 * If the previous uvc_status_stop() call was from the async work, the
	 * work may still be running. Wait for it to finish before we submit the
	 * urb.
	 */

And if that's not correct, there's something I don't get and a better
comment is even more important :-)

If the above change is fine, I can update the comment when applying, and

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This being said, I wonder if we could have a simpler implementation if
we always stopped the work and URB when the last userspace user goes
away, instead of keeping the device active until we get the asynchronous
control notification.

> +
> +	/* Clear the flush status if we were previously stopped. */
> +	smp_store_release(&dev->flush_status, false);
> +
>  	return usb_submit_urb(dev->int_urb, flags);
>  }
>  
> @@ -336,6 +345,15 @@ static void uvc_status_stop(struct uvc_device *dev)
>  	 */
>  	smp_store_release(&dev->flush_status, true);
>  
> +	/*
> +	 * If we are called from the event work function, the URB is guaranteed
> +	 * to not be in flight as it has completed and has not been resubmitted.
> +	 * There's no need to cancel the work (which would deadlock), or to kill
> +	 * the URB.
> +	 */
> +	if (current_work() == &w->work)
> +		return;
> +
>  	/*
>  	 * Cancel any pending asynchronous work. If any status event was queued,
>  	 * process it synchronously.
> @@ -354,15 +372,6 @@ static void uvc_status_stop(struct uvc_device *dev)
>  	 */
>  	if (cancel_work_sync(&w->work))
>  		uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> -
> -	/*
> -	 * From this point, there are no events on the queue and the status URB
> -	 * is dead. No events will be queued until uvc_status_start() is called.
> -	 * The barrier is needed to make sure that flush_status is visible to
> -	 * uvc_ctrl_status_event_work() when uvc_status_start() will be called
> -	 * again.
> -	 */
> -	smp_store_release(&dev->flush_status, false);
>  }
>  
>  int uvc_status_resume(struct uvc_device *dev)

-- 
Regards,

Laurent Pinchart

