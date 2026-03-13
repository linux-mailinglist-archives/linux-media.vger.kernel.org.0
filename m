Return-Path: <linux-media+bounces-55759-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMS1NnNNtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55759-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:46:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A3228846C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07D4630F5C83
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEA03CF052;
	Fri, 13 Mar 2026 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MWhrVck6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABC3CF02F;
	Fri, 13 Mar 2026 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423921; cv=none; b=p8UuPhjzT/9PtUtfzXnXVG61DKnrxM7Pb/jLCEc6l7rPM2P7aRR0cxZAb1J1XNOVF4NExli4mGNZ+TyXIqE0aGoc94V6izOBGXNhFcqzMYFQosWqzMpxLJqwcUZsx2XwoTwsSUaz6EdCdspQ0BMu348dM6bCc0BjfaIM+w+aJ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423921; c=relaxed/simple;
	bh=0rTfE3mYr6Mpa4MDq+zILXMHGMeM4a0Hchbu1CsUrFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auTnTUAgGF5SWQ0tGyrsWQDryQbdF7+cqixFe5EYdCb5fCvWLLoAQ8LPp8pLicwSyvjXWob1CZ8mdJjW1pgdnM9ln1egiuILaTpRCZqj6Hy1VTpNvNQd4+1Xsa2RaxPrnwn9BWGtIcU/f0uO/epjyqZn2wEzu3l7Hvq9pAWiT/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MWhrVck6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [88.128.88.5])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 00BF6E70;
	Fri, 13 Mar 2026 18:44:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773423847;
	bh=0rTfE3mYr6Mpa4MDq+zILXMHGMeM4a0Hchbu1CsUrFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWhrVck6orwaeC7sqH//rtBOyHCGVMpOVwZUtQLUQszHCkQGSt+CetOqFJZMbWI3p
	 c8cz7rgYzajmiXQRfdPPYfWhrgYl1SMRPDkk4sxSx3HqE0c/Wl0ycfIR6YsglyAFbQ
	 WI1gBzvVVZ0nN0sCX1yq8d8Dqe8xCtxpuRfNz524=
Date: Fri, 13 Mar 2026 18:45:14 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH] media: uvcvideo: Fix deadlock if uvc_status_stop is
 called from async_ctrl.work
Message-ID: <20260313174514.GC672609@killaraus.ideasonboard.com>
References: <20260310222259.1202061-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310222259.1202061-1-sean.anderson@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55759-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 45A3228846C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 06:22:59PM -0400, Sean Anderson wrote:
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
>  drivers/media/usb/uvc/uvc_status.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 231cfee8e7c2c..2a23606c7f4c6 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -316,6 +316,14 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>  	if (!dev->int_urb)
>  		return 0;
>  
> +	/*
> +	 * If the work called uvc_status_stop it may still be running. Wait for
> +	 * it to finish before we submit the urb.

I don't like this much. The code is becoming really convoluted and hard
to follow. Would there be a way to solve the issue with a broader
refactoring that would simplify the implementation ?

> +	 */
> +	cancel_work_sync(&dev->async_ctrl.work);
> +
> +	/* Clear the flush status if we were previously stopped */

s/stopped/stopped./

> +	smp_store_release(&dev->flush_status, false);

Add a blank line here.

>  	return usb_submit_urb(dev->int_urb, flags);
>  }
>  
> @@ -336,6 +344,14 @@ static void uvc_status_stop(struct uvc_device *dev)
>  	 */
>  	smp_store_release(&dev->flush_status, true);
>  
> +	/*
> +	 * We will deadlock if we are currently in the work function.
> +	 * Fortunately, we know that the URB is already dead and that no

The URB hasn't been killed, at has just completed and not been
resubmitted. I'd write

	/*
	 * If we are called from the event work function, the URB is guaranteed
	 * to not be in flight as it has completed and has not been resubmitted.
	 * There's no need to cancel the work (which would deadlock), or to kill
	 * the URB.
	 */

> +	 * further work can be queued, so there's nothing left for us to do.
> +	 */
> +	if (current_work() == &w->work)
> +		return;
> +
>  	/*
>  	 * Cancel any pending asynchronous work. If any status event was queued,
>  	 * process it synchronously.
> @@ -354,15 +370,6 @@ static void uvc_status_stop(struct uvc_device *dev)
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

