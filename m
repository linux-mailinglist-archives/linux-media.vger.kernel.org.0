Return-Path: <linux-media+bounces-45993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D33C1F0DB
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D862040485E
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C0733B955;
	Thu, 30 Oct 2025 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4L2jwQ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BFB2EA749
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813991; cv=none; b=gJE45s0vxL5+/CTPap4pvCbuTYbghJaGZgsdmmibnF6dSBkScDAN/I0hfEr2k0uEjH0mmeS+A2mPFzHjw+dVP7MOcpnX1RBMuEGwZkcqdFp5XjFFtW7evgjom/NGnaRu8w9MV8yLtkvmpIlNr1MEj1QfwOiZ8lAmheTyQWj3MKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813991; c=relaxed/simple;
	bh=s/w6yc2NNN992X1bqasQnOrHlBhdhYUwutGNFgdtt6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDW+FLKc6bBgu/Q06rCZOyg9pC4V6N2pMxdf/bo98BILj9/K+xTMxSndv+c9pYQRAMEOiSjdbZIHb9ysK5Rfan685kj27/PUIERfnlEcKrfsHvxepiI+U6VhQ9UBWWJedINhpRx6Adm8RLuW2urJYq/aiRSj2oM/H6eSuC2+Bic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4L2jwQ/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761813990; x=1793349990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/w6yc2NNN992X1bqasQnOrHlBhdhYUwutGNFgdtt6Q=;
  b=D4L2jwQ/G1Sk0U+Uf3hh2U0NiivuSR0pa/4AbABEqQJ78OZIZzAtSdEz
   zBXQhpR6geVDszsnQeuVQNDz+TQLnYNmMlL7ly4giW14ClRqcMiTdanYl
   Bck5g0H3bw2HfHg5YQCms9CKJLBne1JKCBCgBtSsGqaM++3a31k0wKe2D
   Fv9EnQgiMSSq2rarFtkjKULScYd3vV/pm5K8YCx9CROz4Htip2qUqUBVy
   KaTvXpPSSRSenI4nEC4i7PqiRuaGIWMYQa9ViSX5Nm92S0LkzJQDNTMD1
   6h5lbTvZFkPEtAQ5EKDbCgoCJQabrFMdHUpLduxHHf7yQ9FQrJFmuvVW4
   g==;
X-CSE-ConnectionGUID: Jya59tsISr+ybfdHCriVVA==
X-CSE-MsgGUID: 4OuxUFBGQK+AJoZd+PjZrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75398137"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="75398137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:46:29 -0700
X-CSE-ConnectionGUID: hp942hJHToy4T/HvU39mgQ==
X-CSE-MsgGUID: KHTjV/ZAS4y0/N26wVWBWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="209478177"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.176])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:46:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DD7891206DE;
	Thu, 30 Oct 2025 10:46:23 +0200 (EET)
Date: Thu, 30 Oct 2025 10:46:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCHv2] media: v4l2-event: keep place in event list when
 combining events
Message-ID: <aQMl32qFeMNmG598@kekkonen.localdomain>
References: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>

Hi Hans,

On Fri, Oct 10, 2025 at 01:35:02PM +0200, Hans Verkuil wrote:
> When subscribing to an event a fixed circular buffer of N (N >= 1) events
> is allocated for that file handle.
> 
> New events of the same type are added to that buffer and eventually the
> oldest event is removed from the buffer when VIDIOC_DQEVENT is called.
> 
> If the circular buffer is full, then the event framework will
> merge the two oldest events (what 'merge' means is event type
> specific).
> 
> So far, so good.
> 
> There is also a per-filehandle list of pending events for all event
> types. VIDIOC_DQEVENT always dequeues the oldest of that event list,
> and that event is removed from the corresponding circular buffer.
> 
> The problem occurs when the circular buffer is full and a new event
> arrives. Then the two oldest events are merged, but instead of
> keeping the position in the list of pending events, the merged
> event is added to the *end* of the list of pending events.
> 
> So if a lot of events are generated, then events can continually
> be pushed to the end of the list of pending events, and so are never
> or much later dequeued by the application.
> 
> Effectively this is a denial-of-service situation were the
> event is never seen by the application even though there are
> actually a lot of events.
> 
> So if you subscribe to events from control A and B, then
> change control A, then change control B, then change control A
> again, and now call VIDIOC_DQEVENT, you will get the event from
> control B followed by A, even though A was changed first.
> 
> This patch keeps the oldest event in its place in the 'pending
> events' list rather then moving it to the end, and in the test
> above you will now receive the event from control A first.

Typically events are queued faster than they're generated, it is an
exception when they are not. The application certainly won't work very well
if it consumes events slower than they're produced, whether or not the
ordering of events fits for the use case.

For instance, for frame sync events, the latest event is more relevant than
than earlier such events and the latest event should be kept instead of an
earlier event. I wouldn't change this, or alternatively I'd make it
dependent on the event type, but in I wonder if that's worth the
complexity.

> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Fixes: c53c2549333b ("[media] v4l2-event: Add v4l2_subscribed_event_ops")
> Cc: <stable@vger.kernel.org>
> ---
> Changes since v1:
> - fh->sequence was not incremented when replacing an event. Just drop that
>   change and keep the original code (i.e. incrementing the sequence counter
>   at the beginning).
> ---
>  drivers/media/v4l2-core/v4l2-event.c | 59 +++++++++++++++++++++-------
>  1 file changed, 44 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
> index 3898ff7edddb..919cdd46a2c2 100644
> --- a/drivers/media/v4l2-core/v4l2-event.c
> +++ b/drivers/media/v4l2-core/v4l2-event.c
> @@ -104,7 +104,6 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>  {
>  	struct v4l2_subscribed_event *sev;
>  	struct v4l2_kevent *kev;
> -	bool copy_payload = true;
> 
>  	/* Are we subscribed? */
>  	sev = v4l2_event_subscribed(fh, ev->type, ev->id);
> @@ -116,29 +115,59 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
> 
>  	/* Do we have any free events? */
>  	if (sev->in_use == sev->elems) {
> -		/* no, remove the oldest one */
> -		kev = sev->events + sev_pos(sev, 0);
> -		list_del(&kev->list);
> -		sev->in_use--;
> -		sev->first = sev_pos(sev, 1);
> -		fh->navailable--;
> +		/*
> +		 * No, so we have to make space.
> +		 *
> +		 * This is a bit tricky: the easy solution is to drop the oldest
> +		 * event from the fh->available list and add the new one to
> +		 * the end of the list. However, that can lead to situation
> +		 * were, if there are a lot of events, the oldest event keeps
> +		 * being removed before it can be dequeued by the application.
> +		 * Effectively this is a denial-of-service situation were the
> +		 * event is never seen by the application even though there are
> +		 * actually a lot of events.
> +		 *
> +		 * So instead we take care to keep the oldest event in its
> +		 * place, and instead either replace the event content with
> +		 * the new event (if sev->elems == 1) or merge the 2nd oldest
> +		 * event with the oldest event.
> +		 */
> +		struct v4l2_kevent *oldest = sev->events + sev_pos(sev, 0);
> +		struct v4l2_kevent *second_oldest;
> +
>  		if (sev->elems == 1) {
>  			if (sev->ops && sev->ops->replace) {
> -				sev->ops->replace(&kev->event, ev);
> -				copy_payload = false;
> +				/* Replace the oldest event with the new event */
> +				sev->ops->replace(&oldest->event, ev);
> +			} else {
> +				oldest->event.u = ev->u;
>  			}
> -		} else if (sev->ops && sev->ops->merge) {
> -			struct v4l2_kevent *second_oldest =
> -				sev->events + sev_pos(sev, 0);
> -			sev->ops->merge(&kev->event, &second_oldest->event);
> +			wake_up_all(&fh->wait);
> +			return;
>  		}
> +		second_oldest = sev->events + sev_pos(sev, 1);
> +		if (sev->ops && sev->ops->merge) {
> +			/* Merge the oldest event with the 2nd oldest event */
> +			sev->ops->merge(&oldest->event, &second_oldest->event);
> +		}
> +
> +		/*
> +		 * Replace the oldest event with the second oldest event in the
> +		 * event list.
> +		 */
> +		second_oldest->event.sequence = oldest->event.sequence;
> +		second_oldest->ts = oldest->ts;
> +		list_del(&second_oldest->list);
> +		list_replace_init(&oldest->list, &second_oldest->list);
> +		sev->first = sev_pos(sev, 1);
> +		sev->in_use--;
> +		fh->navailable--;
>  	}
> 
>  	/* Take one and fill it. */
>  	kev = sev->events + sev_pos(sev, sev->in_use);
>  	kev->event.type = ev->type;
> -	if (copy_payload)
> -		kev->event.u = ev->u;
> +	kev->event.u = ev->u;
>  	kev->event.id = ev->id;
>  	kev->ts = ts;
>  	kev->event.sequence = fh->sequence;

-- 
Kind regards,

Sakari Ailus

