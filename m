Return-Path: <linux-media+bounces-47981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCBC98179
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DEDAC342BD5
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CAF332902;
	Mon,  1 Dec 2025 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XdeUoHWt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4433732D0F9
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764604030; cv=none; b=oE847jQ/+jS+2RKwrG/5bRG8IZDwpwbpDW4H1H6dA0UaBWaPoCwyHOAUvyKeYGmuICwVm97BrapcZtcVb3Iu4UyZ+mZO8TrED7Eh/3CTH8kCZtGEDPTywvi51nJJNfuFEVOZoCzAFvtlnP2uhh+WuMY1Q0rpM3axKUKb3Q6oN5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764604030; c=relaxed/simple;
	bh=N0+rgJWGb2CPxHLGLtmbJwyw2mauR/WPQ8omqsVP8yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWFYbxLn1sYGf2zcJwXpmB6PKbOsMcTuGyOYj4ysVpqCjjVRFuchnZQuNb8y0ombtjpeYlPk+7q7X0LO3pz4T3OONSBYBs3LXqR2jJxBLk5Dm07KMgjY1Dy0PdHMjB5T4pizinQxUzWLsqfLjPyA9jZr5YZ25AYygSS4xc2k16Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XdeUoHWt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (p9411226-ipngn12302marunouchi.tokyo.ocn.ne.jp [153.160.235.226])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7EB156DF;
	Mon,  1 Dec 2025 16:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764603893;
	bh=N0+rgJWGb2CPxHLGLtmbJwyw2mauR/WPQ8omqsVP8yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XdeUoHWtRGipNaeqDnHSExOu40p6F1Xdyf9nbXvwOXtqq5Rbv162JVnednjOTlgrv
	 rS8BNuK1GxYJmTFQGXJFyEcSmcF16zIUI4H+mcC/X98B4bVl/3rPAJqHfbVCMcsKjw
	 q03z4/p29CMUFRjun9rqTF+cf7LHpvmSj2jCQ8cc=
Date: Tue, 2 Dec 2025 00:46:46 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCHv2] media: v4l2-event: keep place in event list when
 combining events
Message-ID: <20251201154646.GB32430@pendragon.ideasonboard.com>
References: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
 <aQMl32qFeMNmG598@kekkonen.localdomain>
 <79f4a4f2-a7b9-4ee6-af29-6e9970d2ed7a@kernel.org>
 <aQMyNttmOOVCBRym@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aQMyNttmOOVCBRym@kekkonen.localdomain>

On Thu, Oct 30, 2025 at 11:39:02AM +0200, Sakari Ailus wrote:
> On Thu, Oct 30, 2025 at 10:07:49AM +0100, Hans Verkuil wrote:
> > On 10/30/25 09:46, Sakari Ailus wrote:
> > > On Fri, Oct 10, 2025 at 01:35:02PM +0200, Hans Verkuil wrote:
> > >> When subscribing to an event a fixed circular buffer of N (N >= 1) events
> > >> is allocated for that file handle.
> > >>
> > >> New events of the same type are added to that buffer and eventually the
> > >> oldest event is removed from the buffer when VIDIOC_DQEVENT is called.
> > >>
> > >> If the circular buffer is full, then the event framework will
> > >> merge the two oldest events (what 'merge' means is event type
> > >> specific).
> > >>
> > >> So far, so good.
> > >>
> > >> There is also a per-filehandle list of pending events for all event
> > >> types. VIDIOC_DQEVENT always dequeues the oldest of that event list,
> > >> and that event is removed from the corresponding circular buffer.
> > >>
> > >> The problem occurs when the circular buffer is full and a new event
> > >> arrives. Then the two oldest events are merged, but instead of
> > >> keeping the position in the list of pending events, the merged
> > >> event is added to the *end* of the list of pending events.
> > >>
> > >> So if a lot of events are generated, then events can continually
> > >> be pushed to the end of the list of pending events, and so are never
> > >> or much later dequeued by the application.
> > >>
> > >> Effectively this is a denial-of-service situation were the
> > >> event is never seen by the application even though there are
> > >> actually a lot of events.
> > >>
> > >> So if you subscribe to events from control A and B, then
> > >> change control A, then change control B, then change control A
> > >> again, and now call VIDIOC_DQEVENT, you will get the event from
> > >> control B followed by A, even though A was changed first.
> > >>
> > >> This patch keeps the oldest event in its place in the 'pending
> > >> events' list rather then moving it to the end, and in the test
> > >> above you will now receive the event from control A first.
> > > 
> > > Typically events are queued faster than they're generated, it is an
> > 
> > You mean 'dequeued' instead of 'queued'?
> > 
> > > exception when they are not. The application certainly won't work very well
> > > if it consumes events slower than they're produced, whether or not the
> > > ordering of events fits for the use case.
> > 
> > The problem isn't the application, the problem is that with the current
> > code events never reach the application, they can be continuously pushed
> > back to the end of the queue. This is not theory, it's how I discovered
> > something was wrong. Some events were delayed by seconds.

But that's still related to applications not dequeuing events fast
enough, isn't it ? If there's enough space in the events queue for new
events, would the problem still occur ?

> > > For instance, for frame sync events, the latest event is more relevant than
> > > than earlier such events and the latest event should be kept instead of an
> > > earlier event.

Sure, but I don't think this patch prevents that, does it ? When merging
frame sync events we can drop the older event and keep the newer one
while storing the newer event in the position of the old one in the
queue, can't we ?

> > > I wouldn't change this, or alternatively I'd make it
> > > dependent on the event type, but in I wonder if that's worth the
> > > complexity.
> > 
> > This might be an option. Another option is to extend struct v4l2_event_subscription:
> > a flag that says how to handle this specific case (drop the oldest event or
> > update the contents of the oldest event), and a field to set the size of the
> > queue for that event.

Unless I'm missing something, this problem seems solvable without having
to increase the completexity of the UAPI.

> > Right now the number of events for a (type, id) tuple is set by the driver,
> > but for situations like this it can be useful to be able to configure it by
> > the application.
> > 
> > It would certainly help if I can configure this for the specific use-case I am
> > dealing with.
> 
> Sounds good to me, implementation-wise. But to benefit from that,
> applications would need to set the flag. If that's enough, then we don't
> need e.g. defaults per event type (and don't need another flag).

-- 
Regards,

Laurent Pinchart

