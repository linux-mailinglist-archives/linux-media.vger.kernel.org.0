Return-Path: <linux-media+bounces-22243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA59DBC15
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 19:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA3C163D81
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 18:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E0D1BD9D2;
	Thu, 28 Nov 2024 18:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuuxC9Bl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990C0219FC;
	Thu, 28 Nov 2024 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732817748; cv=none; b=heQbX4YbxItz8YAfA7kAcawCKolgnip3fzSG7IhTTydO1HRMUpFubwVldSpi/+nrOwasFR9/3+EOgs5tRrN7X4Ktz7jV2Yz1pyNs5a9JZwS8dDwW1ZHLtZ+i4MCKp4P74mD1rG/6tMSYNrUVKn1BHIERdb01a6MA2wkhAlB6V0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732817748; c=relaxed/simple;
	bh=Eu9FwrAWUKsyE6upa7JN4vuD23D3xn+45MhvwxN8S58=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iodIyO75z0r7/lEjhb62iIh/fa8utb19108T92zz2uDoo2cH8erQP8CjQnWqKVU6zaEBjPHwsDwV+tPHoQSsN36MF4ggqljRDCl+L+vr5lvVQi6sAVUInnn4tUxG0wLzyzkicz5GbercDa1qMCB4yObUHhFQnpydYwmc96cSuGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuuxC9Bl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8693FC4CECE;
	Thu, 28 Nov 2024 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732817748;
	bh=Eu9FwrAWUKsyE6upa7JN4vuD23D3xn+45MhvwxN8S58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NuuxC9Bltht6kUhzKhC3ijBBeXzq66Ovo0eDmoGPz8IOiZ+TtjnkkckVKezh6WcpH
	 cWgygv9zKYSyaFhk1RMtSTkxqsPHBeVJa0A1HY2kxEV6Z/qypYlGURqzNoWkEekEkF
	 lewOVTa4+Y/acShBRt9wL0PNhwx3JfYtG2MfyHCpBw9eCrriCC/G5g+7KNy8i0guqT
	 ePLA13LJWRjcOiBlQqNxn4fkZTSN0o8ZcKyMNMhXLKtfWhwueFPXzRFlO+lMAqUJCh
	 5/vKjEqOX94UkmFjuY3dMSYdfp3C2YaRWNWQ1NkI4bjwMSgCKVKrkytbGL20i++6Hy
	 y69oTYue69L9w==
Date: Thu, 28 Nov 2024 19:15:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241128191543.289f0d84@foz.lan>
In-Reply-To: <20241127132515.GH31095@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
	<20241127132515.GH31095@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 27 Nov 2024 15:25:15 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > > I think this goes a bit backward, and mixes things up a bit. On the
> > > mixing side, the expectation of timely reviews comes from maintainer
> > > status. Having commit rights is orthogonal to that.
> > > 
> > > The goal of direct commit access is to speed up maintenance, to get
> > > patches reviewed and merged quicker. Are we saying here that if someone
> > > has commit rights they will lose them if they take too long to review
> > > code ? That would then slow down maintenance even more, which seems
> > > counterproductive.  
> > 
> > Someone with commit rights is also a maintainer, since that's how you
> > gain the trust to get those rights. If you do a poor job of reviewing
> > patches relevant for you as maintainer, then you loose that trust.  
> 
> This is I think the point where our expectations are the least aligned.
> I'm considering "committer" based on what is done in drm-misc. A
> committer is essentially a developer who has demonstrated they can
> follow a documented process to push their own patches. They are given
> push access as a shortcut, which frees time for the subsystem
> maintainers who don't have to pick patches manually from the list (or
> handle pull requests). That's the official side of it. The barrier to
> entry is intentionally kept very low to ensure that committers won't
> decide to use the legacy workflow due to expectations of additional work
> load. Committers are not required or even asked to take any extra work.
> It's still a win-win situation: subsystem maintainers have less work,
> and committers can get their patches upstream more easily.
> 
> Then there's the other "secret" goal: through handing out committer
> rights, the maintainers hoped that a subset of the committers would
> become more involved, grow more knowledge about the subsystem, pick up
> third party patches, review or cross-review code, ... And that worked,
> DRM has grown an active community of developers who go beyond their
> personal needs and help with maintenance more broadly. Dave and Sima
> deliberately decided to favour the carrot over the stick, and I think
> the events that followed proved it was the right decision.
> 
> This is what I would like to see replicated in the media subsystem. Even
> if a committer only handles the single driver they're interested in and
> push their own patches, it's still a win for everybody involved. By
> making the barrier to entry low, we will make it possible for people who
> would have been scared of volunteering to become part of the community,
> and over time handle more responsibilities. Setting a higher barrier to
> entry will scare those people away. Even myself, if I'm expected to do
> more than what I do today to get commit rights, I won't request them.
> Everybody will lose, I will have to keep sending pull requests, and you
> will have to keep handling them. Both of us will lose time that we could
> otherwise use for reviews or other tasks beneficial to the subsystem.
> 
> More importantly than the exact wording, it's the core principle of the
> committers model that we need to agree on. If we don't have the same
> expectations it will clearly not work.

The reality on media is *very* different from DRM. With DRM, most
drivers have multiple developers working on it, and the more important
drivers typically have dozens of committers. The vast majority of such
committers aren't listed at MAINTAINERS file for the drm drivers they
commit patches.

On media, there's usually just one person that maintains the driver
who will become a committer if they want.

Right now, my expectation is that *all* committers will also be
a maintainer, e. g. they'll all be listed at MAINTAINERS file,
being responsible by one or more driver.

Besides that, the multi-committers will replace the current
sub-maintainers workflow.

We also need to do a slow start to ensure that media-ci, patchwork,
CI integration with patchwork, etc will work properly.

With that in mind, every committer has duties of reviewing other
developer's patches submitted for the drivers that they're listed as
a maintainer at the MAINTAINERS file entries.

> > >> +If you are doing such tasks and have become a valued developer, an
> > >> +existing committer can nominate you to the media subsystem maintainers.  
> > > 
> > > https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request:
> > > 
> > > "Maintainers and committers should encourage contributors to request
> > > commit rights, especially junior contributors tend to underestimate
> > > their skills."  
> > 
> > In drm is it the contributors that request commit rights? Or is it those
> > who already have commit rights that invite others? Currently the plan for
> > the media subsystem is the second method. Although that might change in the
> > future, of course.  
> 
> The process is documented in
> https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request.
> It requires explicit action from the candidate, as they have to create a
> gitlab.fdo account, and request commit access by fiing an issue in
> gitlab. You can see the issue template at
> https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new?issue[title]=Request%20for%20Commit%20Rights&issuable_template=commit_access,
> which is roughly speaking the equivalent of the mail template in this
> document. In practice, as mentioned in the documentation, people often
> underestimate their skills and lack confidence to ask for committer
> access. That's why the documentation states that maintainers and
> committers should encourage contributors to request access.
> 
> I like that model because it requires an explicit action from the
> contributor to show that they have an interest, and it also makes it
> possible for people to request access without having been nominated. It
> doesn't mean that access will be automatically granted, there are still
> acceptance criteria, and it's a maintainer decision at the end of the
> day.
> 
> Stating as done in this patch that an existing committer can nominate
> someone implies that contributors have to wait until they get notified
> they can join The Chosen Few. It's not very welcoming, and given how
> busy everybody is, valuable contributors may need to wait for longer
> than they should before someone thinks about nominating them.
> 
> I wouldn't expect a change of wording to result in any practical change
> in the process, it is only about being more inclusive and welcoming in
> the document. If we want to create a vibrant community, people should
> feel not just welcome, but also desired and valued.

The model we're implementing is that the action of becoming a
committer will also have a step where the contributor will show
that they have an interest.

Yet, right now the goal is to implement the model starting with
active media maintainers.

Once we get there, and after a couple of kernel releases to test
that everything is working as expected, we may aim to carefully
expand it.

Thanks,
Mauro

