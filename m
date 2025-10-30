Return-Path: <linux-media+bounces-45996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6949C1F589
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 10:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 942A14E9000
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD5E342170;
	Thu, 30 Oct 2025 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkUPRZzm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA1C1DF742
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 09:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817149; cv=none; b=mRDfG/RkraUUJI+k8uJK2EOTjF7t318qgzxEWe210R9ryEqnT6BWCgiQX5mByfKGGj9S5Ju4LwajAxLdbmCyaokSRM0SEBiCwzUzsdj2jDw0Q+1FRBV6HUUd4V0IzNTblzhnZ0C6aAaQHAZ3FC/gKGXIvmeDaS66X3XX1MrZt9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817149; c=relaxed/simple;
	bh=lsJrna+6v8B5ycy8lWZ140CQsYRFyXUXZV/1T6CbUmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoiPzDlax1Ipk8YdzUFN5P+MrraPqp+9zxgrQz49IYO4xZDCyNEUK7WmrsIRV5Ycamw+ofuGgbofUi1TtfL+iTKqtpHiSIgxns8W63v1IBrxZFu5CGfBQS7jvfzZ1s/EE7b5OVlkufvNGrW99tfR/16wnJoZwvP+m8iuIhlXSlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkUPRZzm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761817147; x=1793353147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lsJrna+6v8B5ycy8lWZ140CQsYRFyXUXZV/1T6CbUmE=;
  b=ZkUPRZzm7g3ffdWtkkvHu5BmUc8FnuY6uC2qcwb6Mqyek5PgH+DMK0gT
   LuIGnI0CEFuQhsZFx+D2APBeJL6Nvv3kZebkJk0ap2sF+6p0hj/Tzzvju
   6LauktlLEjnWLNvjqVIRRms+FFNK3yB8xvY3128IOgKKBhv1RjD54ApNX
   dcK10TVq/LG5MBWtgYLI2s4d+18qULG5clEKd0RS8G9jXn0QwqHloa26s
   1HZbxCL8obuXWH0KWrfScqazDpMj6HKXPLY6CC3mvXJOzVXCySVj61caP
   JOZ79SFMbQL6SpaBjRzfrC4CbBR3wOmAkpQXahe6TnxqQpypY4MNUBf5T
   Q==;
X-CSE-ConnectionGUID: hi29gpy/QUy+bLDfK4bZyg==
X-CSE-MsgGUID: SAj46yIXT1KLSNbeOV26iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63986677"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="63986677"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 02:39:07 -0700
X-CSE-ConnectionGUID: Lz51S/11QiefE5DysvUfyw==
X-CSE-MsgGUID: S/SDhnCfTzKq3HdDz8orKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="186353329"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.176])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 02:39:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E6A18121E1E;
	Thu, 30 Oct 2025 11:39:02 +0200 (EET)
Date: Thu, 30 Oct 2025 11:39:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCHv2] media: v4l2-event: keep place in event list when
 combining events
Message-ID: <aQMyNttmOOVCBRym@kekkonen.localdomain>
References: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
 <aQMl32qFeMNmG598@kekkonen.localdomain>
 <79f4a4f2-a7b9-4ee6-af29-6e9970d2ed7a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79f4a4f2-a7b9-4ee6-af29-6e9970d2ed7a@kernel.org>

Hi Hans,

On Thu, Oct 30, 2025 at 10:07:49AM +0100, Hans Verkuil wrote:
> On 10/30/25 09:46, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Oct 10, 2025 at 01:35:02PM +0200, Hans Verkuil wrote:
> >> When subscribing to an event a fixed circular buffer of N (N >= 1) events
> >> is allocated for that file handle.
> >>
> >> New events of the same type are added to that buffer and eventually the
> >> oldest event is removed from the buffer when VIDIOC_DQEVENT is called.
> >>
> >> If the circular buffer is full, then the event framework will
> >> merge the two oldest events (what 'merge' means is event type
> >> specific).
> >>
> >> So far, so good.
> >>
> >> There is also a per-filehandle list of pending events for all event
> >> types. VIDIOC_DQEVENT always dequeues the oldest of that event list,
> >> and that event is removed from the corresponding circular buffer.
> >>
> >> The problem occurs when the circular buffer is full and a new event
> >> arrives. Then the two oldest events are merged, but instead of
> >> keeping the position in the list of pending events, the merged
> >> event is added to the *end* of the list of pending events.
> >>
> >> So if a lot of events are generated, then events can continually
> >> be pushed to the end of the list of pending events, and so are never
> >> or much later dequeued by the application.
> >>
> >> Effectively this is a denial-of-service situation were the
> >> event is never seen by the application even though there are
> >> actually a lot of events.
> >>
> >> So if you subscribe to events from control A and B, then
> >> change control A, then change control B, then change control A
> >> again, and now call VIDIOC_DQEVENT, you will get the event from
> >> control B followed by A, even though A was changed first.
> >>
> >> This patch keeps the oldest event in its place in the 'pending
> >> events' list rather then moving it to the end, and in the test
> >> above you will now receive the event from control A first.
> > 
> > Typically events are queued faster than they're generated, it is an
> 
> You mean 'dequeued' instead of 'queued'?
> 
> > exception when they are not. The application certainly won't work very well
> > if it consumes events slower than they're produced, whether or not the
> > ordering of events fits for the use case.
> 
> The problem isn't the application, the problem is that with the current
> code events never reach the application, they can be continuously pushed
> back to the end of the queue. This is not theory, it's how I discovered
> something was wrong. Some events were delayed by seconds.
> 
> > For instance, for frame sync events, the latest event is more relevant than
> > than earlier such events and the latest event should be kept instead of an
> > earlier event. I wouldn't change this, or alternatively I'd make it
> > dependent on the event type, but in I wonder if that's worth the
> > complexity.
> 
> This might be an option. Another option is to extend struct v4l2_event_subscription:
> a flag that says how to handle this specific case (drop the oldest event or
> update the contents of the oldest event), and a field to set the size of the
> queue for that event.
> 
> Right now the number of events for a (type, id) tuple is set by the driver,
> but for situations like this it can be useful to be able to configure it by
> the application.
> 
> It would certainly help if I can configure this for the specific use-case I am
> dealing with.

Sounds good to me, implementation-wise. But to benefit from that,
applications would need to set the flag. If that's enough, then we don't
need e.g. defaults per event type (and don't need another flag).

-- 
Sakari Ailus

