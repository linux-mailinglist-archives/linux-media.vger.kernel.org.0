Return-Path: <linux-media+bounces-44258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF94BD25CA
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C5BF3498E1
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 09:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A20246797;
	Mon, 13 Oct 2025 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4rvBTiV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32572142E83
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348901; cv=none; b=tgls5Ih2rjcT6DGv1Yuu8ZJMDThu00fVzuXbtyfW7zuqBj+9zF66jFHqyA4ZYlaJwK6yYYv7HnEw+Fn8Kk8HTVf3zmUi6uYtI2e3azVOvyIiPd9sBoUgi/3hPgoX8dC8pxcl/ej0kkEe1mx2EvrGAdvdWweU/bgzkKtTzLMTJV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348901; c=relaxed/simple;
	bh=vWkLnK68GISPKoe2aDj0sdOZayBqEW0tBuSj9RFkyEU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=izM3EnhRugSSG3Jxci+zzOSzESMkYDAMG90+7td2ARVIfgEpWfqztT4e31BHNAmUcUcuoPju2bXgqINXF3BzESytlQgMGAHsDWh56K+Jes7BtlVEXYHxsBU8pdnvH10zRtSkEb2zAvgiR3EExkJ0KN2jIlrKihl68hk3RNu7roE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4rvBTiV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8D3C4CEE7;
	Mon, 13 Oct 2025 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760348900;
	bh=vWkLnK68GISPKoe2aDj0sdOZayBqEW0tBuSj9RFkyEU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=d4rvBTiVnGxFXwiqd1JO5g36+O7HvhQVILDUuPGMwlAGxRX8Wpki1X3ufm3/reMlZ
	 UF9cEb3eTfxj0FaOKa19DRK6xVhQXJeHdce9E7M112vqRll/VIO1Gr6Ob0HJt/ec/v
	 uur9Wmn3cjqgRhhebEXD5nS+ntw6oxDe0s51PF9fj08nqDz9p4sYZeDhtbx4a2SOOZ
	 MpkPA5sX2QNItk+1CdYjlW/dPx0bvwb8jE7tZGOpVGSYj0bfElsssWV2wN870hz+L+
	 HgzoMGJ4Gy3JDSGn0ea2lp7Nu/fKj3uWutc6JFNTugreNCjrdlPcf/9pD78hBG8kon
	 6wGqMA20BDZvw==
Message-ID: <677c7826-43f1-43fb-a288-57af49a2aa98@kernel.org>
Date: Mon, 13 Oct 2025 11:48:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv2] media: v4l2-event: keep place in event list when
 combining events
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2025 13:35, Hans Verkuil wrote:
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

FYI: The same issue is present in the cec subsystem. Far less likely to be
a problem for that subsystem, but I'm working on a patch for that as well.

Regards,

	Hans

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


