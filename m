Return-Path: <linux-media+bounces-30216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 678E2A894B7
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A993A7A30A1
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A77275856;
	Tue, 15 Apr 2025 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qghrMtQQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CA510F2
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701505; cv=none; b=d9Aa3GLqdZoycJYiHnnQqlaXMCu+80GpN5hmlqt94mdNYpUqc9cngo9RuMe34xH4HzcCJJdhAqWmi+V5O1Fi05RbHo8MYZfIN3HgT6frVJJC9VETgM6QMZ1LTo23xsKPHMW3+TzahQ7ET1FzorH9y3icGKUAnPZzqZolPhHB9s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701505; c=relaxed/simple;
	bh=l9c8IuksmZQ7wrPoH+1G9P49LEPp0MUgxokx8HFWnhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2EN0PQL9Sl+/65rFKzXmGkgjNrTJfYVUcTZeGd9HWa+WVsR/4LbMXs30XbiMjUwmzHmRduWlShI0FuibjZ2HK360Px4F1Y0WIS4AUTHml/Tvlu1AcnI6mcpE/FSuDn6ECI/dlImB5qyaad6UGuwH6XTSm9dBo3hs1O4fmSiHQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qghrMtQQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91D01725;
	Tue, 15 Apr 2025 09:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744701379;
	bh=l9c8IuksmZQ7wrPoH+1G9P49LEPp0MUgxokx8HFWnhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qghrMtQQl0QFYS67CVRglJyh4YxdpMftwbFYrw3TdQkPeCSWaaIJp8jzegfB3y+Ap
	 KwxkT/7wM5UukwdYglOND70xkbmE3J2J8+aUFFy4d7UH5ixbQd7aZYLz/g0thiHrrM
	 hz3xUzTaCzEOn3hbCJKd2rmB1fuyBztLOy1AhWv4=
Date: Tue, 15 Apr 2025 10:18:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Plowman <david.plowman@raspberrypi.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250415071820.GH15367@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <CAHW6GYK2o8G=ANe8H=Mpx08gF39otqrtwzKbHW+vXaQcPjuUAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHW6GYK2o8G=ANe8H=Mpx08gF39otqrtwzKbHW+vXaQcPjuUAA@mail.gmail.com>

Hi David,

On Tue, Mar 25, 2025 at 01:46:58PM +0000, David Plowman wrote:
> Hi Laurent
> 
> Thanks for the announcement and yes, Naush and I are planning to attend. I
> certainly fancy a couple of days in Nice, soaking up the atmosphere on the
> Promenade des Anglais! (don't tell my employer)

I realized I haven't replied to acknowledge your registration, so here's
the official confirmation. We will be happy to see you and Naush in
Nice. Thank you for submitting discussion topics, we will publish the
agenda draft close to the event.

> Some topics we'd like to cover:
> 
> 1. Bayer re-processing.
> 
> Yes, we've talked about this a number of times before. On this occasion I'd
> like to agree an outline approach that is sufficient for us to go away and
> implement something. It doesn't have to be perfect and complete, but it has
> to be enough to produce some working code that we broadly think is in the
> right direction. It should take us significantly closer to having some code
> that we can consider rolling out to Pi users.
> 
> 2. Startup frames.
> 
> Another old chestnut! I'm not really sure why it got stuck, it doesn't even
> seem to me like it should be all that controversial. It would be nice to be
> able to help Pi users on lower-spec devices by not allocating memory
> buffers that they don't have space for!
> 
> (For those who aren't familiar with this topic, the problem is that
> pipelines, ours included, may want to "swallow" a few frames when they
> start, and need to allocate extra camera buffers to do this. We'd rather
> the application buffers were used for this purpose, but it means those
> early requests would have to be flagged as "startup" aka. "do not use
> me" frames.)
> 
> 3. Per-frame controls.
> 
> We did a complete implementation for the Pi platform back in 2022, I'm sure
> some of you will recall. We'd really like to advance this again with a view
> to having something that we can give to Raspberry Pi users. I realise it
> may interact with work that was going on to split out the controls from the
> request queue, is that a topic that needs addressing?
> 
> Looking forward to seeing everyone there!
> 
> Thanks
> David
> 
> 
> On Tue, 25 Mar 2025 at 10:28, Laurent Pinchart wrote:
> 
> > Hello everybody,
> >
> > Another year, another libcamera workshop. After the previous editions in
> > Paris, Brussels and Vienna, we will organize the next workshop in Nice
> > on Friday the 16th of May. The event will be hosted by Embedded Recipes
> > ([1]) as part of their workshops day ([2]).
> >
> > This year, our workshop will be colocated with the Pipewire workshop on
> > the same day and at the same venue (but a different room), to facilitate
> > discussions about topics that span libcamera and Pipewire. The Linux
> > Media Summit will also be organized in a nearby location on Tuesday the
> > 13th ([3]).
> >
> > If you would like to attend, please register your interest by replying
> > to this e-mail, and indicate if you have any discussion topics you would
> > like to include in the schedule. We will draft and circulate an agenda
> > in the next few weeks after receiving topic proposals. If registrations
> > exceed our capacity, priority will be given based on topic submissions.
> >
> > The event will be free of charge for attendees.
> >
> > [1] https://embedded-recipes.org/2025/
> > [2] https://embedded-recipes.org/2025/workshops/
> > [3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl

-- 
Regards,

Laurent Pinchart

