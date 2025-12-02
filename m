Return-Path: <linux-media+bounces-48056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BF8C9AA6B
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 09:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A75E4E34FF
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 08:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78F4221FD0;
	Tue,  2 Dec 2025 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AUfyxH/N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5A1F151C
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663477; cv=none; b=mVkQ3ERDq8NDvE6GjW+tZsyG5wMrYLxJue5H8etD4rf8q7rx67MMM2OTDgF1P8+AgE7cCa+ZzT+Pt420aSj9CxhUNi/RWSt9qG+cjxTw10SUFNpMfy0gm6sb/dIRRf6GNdgyxAbpL2mMJhtRC9MJuqtMDxhvJxxy9xKCDXkjE9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663477; c=relaxed/simple;
	bh=yiK8IbF0A2rLpW7EitX5f1ZxAtax7cASgpiGBK360WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dei3FWW/m9GwOmFTnUjxTpHsf5WErv2WacD8BhYTcaHb4s8INnisUD7mjJgUIRNviM+XPMCdZ/xEiXgElZ0plZ6mGPVyvSPRbGU+oYyoemOJZB224PIZAjmtf5VrKNMWesdTtPMMH+YmEk9uwibCRhw0GgUf0ax6mzLqg+sqvI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AUfyxH/N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (113x43x203x98.ap113.ftth.arteria-hikari.net [113.43.203.98])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F2C1CB5;
	Tue,  2 Dec 2025 09:15:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764663337;
	bh=yiK8IbF0A2rLpW7EitX5f1ZxAtax7cASgpiGBK360WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUfyxH/Nm3/rcn0wqyQnO5ua8bumU7IvXQrcGyvPgJ4QS9YGI1QTACWIQniHYLqS/
	 2l+BRUdZ1c3ohBmQEFKnNKV9czh7NAig1uOVQIpXzD52homQwP+7cBqk8IAEV9MJmC
	 ZIIULsQt/V4akK5/JTbXZ1gi2IRCS/5KwYdSex5o=
Date: Tue, 2 Dec 2025 17:17:31 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCHv2] media: v4l2-event: keep place in event list when
 combining events
Message-ID: <20251202081731.GB18267@pendragon.ideasonboard.com>
References: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
 <aQMl32qFeMNmG598@kekkonen.localdomain>
 <79f4a4f2-a7b9-4ee6-af29-6e9970d2ed7a@kernel.org>
 <aQMyNttmOOVCBRym@kekkonen.localdomain>
 <20251201154646.GB32430@pendragon.ideasonboard.com>
 <c1fe9d2e-1a2c-4ba2-b188-343b34a15e7b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c1fe9d2e-1a2c-4ba2-b188-343b34a15e7b@kernel.org>

On Tue, Dec 02, 2025 at 08:40:43AM +0100, Hans Verkuil wrote:
> On 01/12/2025 16:46, Laurent Pinchart wrote:
> > On Thu, Oct 30, 2025 at 11:39:02AM +0200, Sakari Ailus wrote:
> >> On Thu, Oct 30, 2025 at 10:07:49AM +0100, Hans Verkuil wrote:
> >>> On 10/30/25 09:46, Sakari Ailus wrote:
> >>>> On Fri, Oct 10, 2025 at 01:35:02PM +0200, Hans Verkuil wrote:
> >>>>> When subscribing to an event a fixed circular buffer of N (N >= 1) events
> >>>>> is allocated for that file handle.
> >>>>>
> >>>>> New events of the same type are added to that buffer and eventually the
> >>>>> oldest event is removed from the buffer when VIDIOC_DQEVENT is called.
> >>>>>
> >>>>> If the circular buffer is full, then the event framework will
> >>>>> merge the two oldest events (what 'merge' means is event type
> >>>>> specific).
> >>>>>
> >>>>> So far, so good.
> >>>>>
> >>>>> There is also a per-filehandle list of pending events for all event
> >>>>> types. VIDIOC_DQEVENT always dequeues the oldest of that event list,
> >>>>> and that event is removed from the corresponding circular buffer.
> >>>>>
> >>>>> The problem occurs when the circular buffer is full and a new event
> >>>>> arrives. Then the two oldest events are merged, but instead of
> >>>>> keeping the position in the list of pending events, the merged
> >>>>> event is added to the *end* of the list of pending events.
> >>>>>
> >>>>> So if a lot of events are generated, then events can continually
> >>>>> be pushed to the end of the list of pending events, and so are never
> >>>>> or much later dequeued by the application.
> >>>>>
> >>>>> Effectively this is a denial-of-service situation were the
> >>>>> event is never seen by the application even though there are
> >>>>> actually a lot of events.
> >>>>>
> >>>>> So if you subscribe to events from control A and B, then
> >>>>> change control A, then change control B, then change control A
> >>>>> again, and now call VIDIOC_DQEVENT, you will get the event from
> >>>>> control B followed by A, even though A was changed first.
> >>>>>
> >>>>> This patch keeps the oldest event in its place in the 'pending
> >>>>> events' list rather then moving it to the end, and in the test
> >>>>> above you will now receive the event from control A first.
> >>>>
> >>>> Typically events are queued faster than they're generated, it is an
> >>>
> >>> You mean 'dequeued' instead of 'queued'?
> >>>
> >>>> exception when they are not. The application certainly won't work very well
> >>>> if it consumes events slower than they're produced, whether or not the
> >>>> ordering of events fits for the use case.
> >>>
> >>> The problem isn't the application, the problem is that with the current
> >>> code events never reach the application, they can be continuously pushed
> >>> back to the end of the queue. This is not theory, it's how I discovered
> >>> something was wrong. Some events were delayed by seconds.
> > 
> > But that's still related to applications not dequeuing events fast
> > enough, isn't it ? If there's enough space in the events queue for new
> > events, would the problem still occur ?
> > 
> >>>> For instance, for frame sync events, the latest event is more relevant than
> >>>> than earlier such events and the latest event should be kept instead of an
> >>>> earlier event.
> > 
> > Sure, but I don't think this patch prevents that, does it ? When merging
> > frame sync events we can drop the older event and keep the newer one
> > while storing the newer event in the position of the old one in the
> > queue, can't we ?
> > 
> >>>> I wouldn't change this, or alternatively I'd make it
> >>>> dependent on the event type, but in I wonder if that's worth the
> >>>> complexity.
> >>>
> >>> This might be an option. Another option is to extend struct v4l2_event_subscription:
> >>> a flag that says how to handle this specific case (drop the oldest event or
> >>> update the contents of the oldest event), and a field to set the size of the
> >>> queue for that event.
> > 
> > Unless I'm missing something, this problem seems solvable without having
> > to increase the completexity of the UAPI.
> > 
> >>> Right now the number of events for a (type, id) tuple is set by the driver,
> >>> but for situations like this it can be useful to be able to configure it by
> >>> the application.
> >>>
> >>> It would certainly help if I can configure this for the specific use-case I am
> >>> dealing with.
> >>
> >> Sounds good to me, implementation-wise. But to benefit from that,
> >> applications would need to set the flag. If that's enough, then we don't
> >> need e.g. defaults per event type (and don't need another flag).
> 
> I plan to rework this, once I find some more time. Allowing userspace to set the
> size of the event queue will help a lot, and that's actually a trivial change.

That probably makes sense. I'd be interested in knowing more about your
use cases when you'll have time.

> In the end it comes down to what to do when a new event arrives and the queue is
> full: do you want to drop the oldest event or the new event? That depends on
> what event it is. Allowing the driver to make that choice would be nice.

For which event types do you envision a driver would prefer dropping the
newest event ?

-- 
Regards,

Laurent Pinchart

