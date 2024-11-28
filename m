Return-Path: <linux-media+bounces-22246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7129DBC60
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C649128164B
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 19:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9C51C1F1C;
	Thu, 28 Nov 2024 19:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rE2R1gY+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BFA2CAB;
	Thu, 28 Nov 2024 19:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732820843; cv=none; b=gJfP55Gv3Yt5mVGQ0b3Zt8bf0q5skzYftkGVqngQfRfvuY4kKgEXj25VNyQPk0G++F2IkIOsVmmAGWx7jIny+M2hq6D0ZDj7BwbhE13Nc62QiKHLqFzkBNQomtBr8WpoAgaHpE9hc8eqXsSq73xlsaQMo5wEKoijJxSRIZGYn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732820843; c=relaxed/simple;
	bh=iPWl00cmy65aQXRSlQM/pa3s4vZBSf7ExQQPBg1K17I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t57gevoS9THM22wYTuYSF/+LuCo+6gMqugJ/YF/i1NZDOJ4KXMXkq9qWVbT4FkxIkrZO0PU1qvidzN0TQ7i5Qakw115luRx42JhGw32570o+ZPU1QvF6nshIWgvSzCn4H+jhvCqI3BhNxUT3P3+gePtClhgs8yTyL4WG3sgFyNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rE2R1gY+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACB6F526;
	Thu, 28 Nov 2024 20:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732820814;
	bh=iPWl00cmy65aQXRSlQM/pa3s4vZBSf7ExQQPBg1K17I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rE2R1gY+7FRoxlZpC+bhImNCX0tL2fhHgzg0pDVwenEF0/gnjDZ9+RI2J2XXDoLaT
	 3aDwEN2baKLWvvBPL74ZygAG31MdhfrXTShxM2Y4y6ma+AyqyThRAbgWP1eDCIBqJs
	 Vy98zMq4TytKVP0sFCZtv17rK8WjP//YGBGot6kg=
Date: Thu, 28 Nov 2024 21:07:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241128190707.GA13852@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
 <20241127132515.GH31095@pendragon.ideasonboard.com>
 <20241128191543.289f0d84@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128191543.289f0d84@foz.lan>

On Thu, Nov 28, 2024 at 07:15:43PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 27 Nov 2024 15:25:15 +0200 Laurent Pinchart escreveu:
> 
> > > > I think this goes a bit backward, and mixes things up a bit. On the
> > > > mixing side, the expectation of timely reviews comes from maintainer
> > > > status. Having commit rights is orthogonal to that.
> > > > 
> > > > The goal of direct commit access is to speed up maintenance, to get
> > > > patches reviewed and merged quicker. Are we saying here that if someone
> > > > has commit rights they will lose them if they take too long to review
> > > > code ? That would then slow down maintenance even more, which seems
> > > > counterproductive.  
> > > 
> > > Someone with commit rights is also a maintainer, since that's how you
> > > gain the trust to get those rights. If you do a poor job of reviewing
> > > patches relevant for you as maintainer, then you loose that trust.  
> > 
> > This is I think the point where our expectations are the least aligned.
> > I'm considering "committer" based on what is done in drm-misc. A
> > committer is essentially a developer who has demonstrated they can
> > follow a documented process to push their own patches. They are given
> > push access as a shortcut, which frees time for the subsystem
> > maintainers who don't have to pick patches manually from the list (or
> > handle pull requests). That's the official side of it. The barrier to
> > entry is intentionally kept very low to ensure that committers won't
> > decide to use the legacy workflow due to expectations of additional work
> > load. Committers are not required or even asked to take any extra work.
> > It's still a win-win situation: subsystem maintainers have less work,
> > and committers can get their patches upstream more easily.
> > 
> > Then there's the other "secret" goal: through handing out committer
> > rights, the maintainers hoped that a subset of the committers would
> > become more involved, grow more knowledge about the subsystem, pick up
> > third party patches, review or cross-review code, ... And that worked,
> > DRM has grown an active community of developers who go beyond their
> > personal needs and help with maintenance more broadly. Dave and Sima
> > deliberately decided to favour the carrot over the stick, and I think
> > the events that followed proved it was the right decision.
> > 
> > This is what I would like to see replicated in the media subsystem. Even
> > if a committer only handles the single driver they're interested in and
> > push their own patches, it's still a win for everybody involved. By
> > making the barrier to entry low, we will make it possible for people who
> > would have been scared of volunteering to become part of the community,
> > and over time handle more responsibilities. Setting a higher barrier to
> > entry will scare those people away. Even myself, if I'm expected to do
> > more than what I do today to get commit rights, I won't request them.
> > Everybody will lose, I will have to keep sending pull requests, and you
> > will have to keep handling them. Both of us will lose time that we could
> > otherwise use for reviews or other tasks beneficial to the subsystem.
> > 
> > More importantly than the exact wording, it's the core principle of the
> > committers model that we need to agree on. If we don't have the same
> > expectations it will clearly not work.
> 
> The reality on media is *very* different from DRM. With DRM, most

We're designing a process for the future, it's up to us to design what
we want to achieve.

> drivers have multiple developers working on it, and the more important
> drivers typically have dozens of committers. The vast majority of such

There are a few corporate-backed drivers that have bigger teams, but
apart from that, it's not as well staffed as you seem to imply.

> committers aren't listed at MAINTAINERS file for the drm drivers they
> commit patches.
> 
> On media, there's usually just one person that maintains the driver
> who will become a committer if they want.
> 
> Right now, my expectation is that *all* committers will also be
> a maintainer, e. g. they'll all be listed at MAINTAINERS file,
> being responsible by one or more driver.
> 
> Besides that, the multi-committers will replace the current
> sub-maintainers workflow.
> 
> We also need to do a slow start to ensure that media-ci, patchwork,
> CI integration with patchwork, etc will work properly.
> 
> With that in mind, every committer has duties of reviewing other
> developer's patches submitted for the drivers that they're listed as
> a maintainer at the MAINTAINERS file entries.

I'm sorry but that's not a multi-committer model, it's a co-maintenance
model. If that's what you really want we can reopen the discussion and
start anew, but I don't think it's a good idea.

As I said before, if it increases my work load, I don't want commit
rights. I'll keep sending pull requests, you'll have to keep processing
them, and patches will be merged slower. It will be a lose-lose
situation for everybody, you, me, contributors and users.

Starting with a situation where we are understaffed and trying to solve
it by putting more work on the few people who currently keep the
subsystem alive doesn't sound like a winning strategy. 

> > > >> +If you are doing such tasks and have become a valued developer, an
> > > >> +existing committer can nominate you to the media subsystem maintainers.  
> > > > 
> > > > https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request:
> > > > 
> > > > "Maintainers and committers should encourage contributors to request
> > > > commit rights, especially junior contributors tend to underestimate
> > > > their skills."  
> > > 
> > > In drm is it the contributors that request commit rights? Or is it those
> > > who already have commit rights that invite others? Currently the plan for
> > > the media subsystem is the second method. Although that might change in the
> > > future, of course.  
> > 
> > The process is documented in
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request.
> > It requires explicit action from the candidate, as they have to create a
> > gitlab.fdo account, and request commit access by fiing an issue in
> > gitlab. You can see the issue template at
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new?issue[title]=Request%20for%20Commit%20Rights&issuable_template=commit_access,
> > which is roughly speaking the equivalent of the mail template in this
> > document. In practice, as mentioned in the documentation, people often
> > underestimate their skills and lack confidence to ask for committer
> > access. That's why the documentation states that maintainers and
> > committers should encourage contributors to request access.
> > 
> > I like that model because it requires an explicit action from the
> > contributor to show that they have an interest, and it also makes it
> > possible for people to request access without having been nominated. It
> > doesn't mean that access will be automatically granted, there are still
> > acceptance criteria, and it's a maintainer decision at the end of the
> > day.
> > 
> > Stating as done in this patch that an existing committer can nominate
> > someone implies that contributors have to wait until they get notified
> > they can join The Chosen Few. It's not very welcoming, and given how
> > busy everybody is, valuable contributors may need to wait for longer
> > than they should before someone thinks about nominating them.
> > 
> > I wouldn't expect a change of wording to result in any practical change
> > in the process, it is only about being more inclusive and welcoming in
> > the document. If we want to create a vibrant community, people should
> > feel not just welcome, but also desired and valued.
> 
> The model we're implementing is that the action of becoming a
> committer will also have a step where the contributor will show
> that they have an interest.
> 
> Yet, right now the goal is to implement the model starting with
> active media maintainers.
> 
> Once we get there, and after a couple of kernel releases to test
> that everything is working as expected, we may aim to carefully
> expand it.

-- 
Regards,

Laurent Pinchart

