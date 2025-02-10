Return-Path: <linux-media+bounces-25869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F521A2E4DA
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 08:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 076F6167CF6
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 07:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990161BBBC6;
	Mon, 10 Feb 2025 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAmCdaXC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B2199E80;
	Mon, 10 Feb 2025 07:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170822; cv=none; b=sYFAx0fO7Zblp73RpWuUda5/hoCtJRzBf27TrbkepRBxUIFu2Qqs79P7m+dNUcS7dBSAzFPfzZrKcayGygjaUdvnfSSPycAEd5/wYC5OJs8ye6PkaipcUXWr7db9tIkY3T2qfsxa94H0N/s02ogRNQCR2EyIDhSuO8MOxAk6cLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170822; c=relaxed/simple;
	bh=Xl3BMLyDGUAanmjjk+KC91tfVRhpWXzxatEBHOqYqgA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kniqJgilZ6NOHHSC9MKNe1mq4QPCrXmeno7oQu+p+XRE2h0ndY2kZLkddlTfuvQvp4WxdgWddFlj99pVi+K6nYCnrCSAuaEc0SRmCjseMqbCde2xmI1CHZtl3sCdNOQPFyLjdWBEyFunwHBPT7Pf0nqnxln2NdjH5L+IZJb7+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAmCdaXC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B145BC4CED1;
	Mon, 10 Feb 2025 07:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739170821;
	bh=Xl3BMLyDGUAanmjjk+KC91tfVRhpWXzxatEBHOqYqgA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DAmCdaXCUmboIE/ETNDWXRKXYYb2emgJl4jZrrjAdnnsaxk3GDjfjnQSPd6pdfgap
	 XPspRb+hQYHhTJ4gfIgyN7ISYeaT2QRV4T4/35u6lKby5Xxckepk6P7gw6Ong0A7vx
	 cVJ6PMDa/jy9vnx9+nPtKsk9a4Mw0aRCqLLJfC4oQ48Iuf7sZNGcWGFW+2xfAxlgYn
	 CF9tubWhDbk2SciRn/t+n8ek+NrfuIPE/N33FbLAwA+wW2ZT3Lx1dUGDxKZMhWVnEQ
	 emm1DeWpMiTDbWOMP4eGHma66v4wTKuMIohJdMDkSxvuJP3+IKpZc7x+hScctiSZMb
	 cXyqpkzv+bHag==
Date: Mon, 10 Feb 2025 08:00:16 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: Media committers model postponed to 6.14 - Was: Re: [PATCH v3
 0/3] Document the new media-committer's model
Message-ID: <20250210080016.475d0518@foz.lan>
In-Reply-To: <d22d2f35-bf04-4d0c-a94c-70dcc08a945e@xs4all.nl>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
	<b0843e80-c46c-4344-b9f1-1d3b57dd2bbe@xs4all.nl>
	<20241203081958.6c186835@foz.lan>
	<20241203112209.GR10736@pendragon.ideasonboard.com>
	<20241203140712.57daa65f@foz.lan>
	<20241209091548.165e5152@foz.lan>
	<d22d2f35-bf04-4d0c-a94c-70dcc08a945e@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 7 Feb 2025 12:54:52 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 09/12/2024 09:15, Mauro Carvalho Chehab wrote:
> > Em Tue, 3 Dec 2024 14:07:12 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> >   
> >>
> >> The idea is to gradually open media-committers to more people, as each
> >> phase succeeds, addressing infra, procedures, etc.
> >>
> >> My rough idea is to do:
> >>
> >> - Phase 0.99: beta testers;
> >> - Phase 1 is to invite people that regularly submit PRs;
> >> - Phase 2 is to invite other active maintainers;
> >> - Phase 3 (or 2?, TBD) to open for non-maintainers.
> >>
> >> We shouldn't rush it, as there are a lot to be done before opening it
> >> broadly. So, I would say that:
> >> - phase 0.99 would start in -rc2 (if things go well during this week); 
> >> - phase 1 may still happen on this merge window, but as there will be
> >>   only a few weeks between -rc2 and -rc6, and people usually get
> >>   holidays in Dec/Jan, it is more likely that it will start for
> >>   6.14-rc1, again if we didn't notice big issues on phase 0.99.
> >>
> >>   We should wait at least for a couple of releases on phase 1,
> >>   again to cleanup process and fine-tune infra. If things go well, 
> >>   we can move to phase 2.  
> > 
> > After some discussions with Hans, we decided to postpone the
> > beta testers phase to the next kernel cycle. There are a couple of
> > reasons for that:
> > 
> > - This should give us more time to come up with a final version of 
> >   the media-committers documentation and agreement;  
> 
> Where are we with this? I haven't seen any updates since this post.
> 
> Personally, I think the CI is ready for more committers, so it would be
> nice if we can get some experience with that.

IMO, there are still some pending issues.

We still need to reach a consensus about what media maintainers will do.
I have to confess that discussing last time was painful due to some
arguments going too personal to my taste. Anyway, discussing it during
the end of the year was not a good idea as people (including myself) were
busy completing their yearly tasks. Also, people were taking vacations.

At the end of the last year, I finally rewrote the scripts I use on my
workflow. I'd like to test them during this cycle and see how it
behaves. 

While doing that, I noticed that we really need to have something like
margebot to help our workflow. From my side, I'd like to have one separate
MR per each separate patch series, as this makes easier to document the
main changes that the media subsystem is merging. I hope to test them more
during this Kernel cycle to be sure that everything is in place.

While using my scripts, I ended having 4 or 5 pending MRs at
media-committers. As we want a clean history without being bloated with
merges from temp trees/branches, we need to have some automation to help
basing the commits on the top of the branches.

The idea is to have margebot enabled there, meaning that committers
may delegate patches to margebot and let it automatically place patches
on the top of the branches. However, margebot has currently a problem:
it mangles with committer's metadata. Ricardo have been working upstream
and they are reaching a consensus about how to support preserving
committer data with margebot. IMO, we need that before having more
committers.

Finally, we need to have useful data to prepare changelog summary
upstream. In the past, as we were reviewing everything, it was easier
to identify the core changes (besides fixes/cleanups). With a
multicommitter's model, we need to rely on what committers will be
providing us. The idea I've been playing with, and that's what I
ended implementing on last submission(*), is to generate it based on
what each merge metadata contains.

(*) Yet, the level of information there were very inconsistent.
We need to do better during this cycle.

> Regards,
> 
> 	Hans
> 
> > 
> > - This would also work better with regards to end of year's vacations,
> >   as they'll be affecting at least 2/3 -rc versions. Plus, we all have
> >   things to finish before such vacations. So, better to start fresh next
> >   year;
> > 
> > - Media CI still had issues with a patch series I submitted, as it picked
> >   the wrong baseline, causing CI to not test two patches that were
> >   applied on the top of media-committers/next branch. This was fixed
> >   by Ricardo, but it means that we may still need to polish CI before
> >   granting more people righs there.
> > 
> > With that, if we want to start the media committers for 6.14, we should
> > aim to close review this document by -rc6, or, at most, -rc7, getting 
> > the patches merged during the next merge window.
> > 
> > Regard
> > 
> > Thanks,
> > Mauro
> >   
> 



Thanks,
Mauro

