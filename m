Return-Path: <linux-media+bounces-22541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6229E1D1B
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 14:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92CD8283526
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 13:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179111F4704;
	Tue,  3 Dec 2024 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4GXuiUO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C391EE03D;
	Tue,  3 Dec 2024 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733231239; cv=none; b=tacwTI5MfgeBypNz0xji1PHr1zv+fQXNGUmAcJgFwGvVi9WaC+Q9GFC55si9t1kRb8gk8xAxuN2z6dlFDGlMiYYHodo10wNThwIQs3XWGO3IyljPVuKGGoZ8O/WgVTirdj6OyFGbG1s8tlSmm7pp0Evj0ek7W+KZVs6ba4gjEBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733231239; c=relaxed/simple;
	bh=nBqtovQP67JSM9MJxax389v7WGawj+GxFUiHn7+fRz8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYAGkdVLuEFPOnEiYX2hPnBj8+VD/Qo6Nj66GL1vzSGk+jbblGMEwWJYb67fAPedy3ypCB5ic0e2/nj9AHvlqKsmB/wdLHGgBb9wejMEzMKToW98A8DYBrFxJ5L9P8uTRBDv5sVeHE5stIsYZnklUfc8wIUSYfCDdlqfhvdUDtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4GXuiUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A545C4CECF;
	Tue,  3 Dec 2024 13:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733231236;
	bh=nBqtovQP67JSM9MJxax389v7WGawj+GxFUiHn7+fRz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b4GXuiUOJP+z2PLHpo1PMILKVjvdmouR0XQzWM4ynguWJF+I301XUKCWoyq1RMch4
	 yabH9gGtQxZHH1UuC3zkLrZJ0zNrsqEOsqIUlo7vgQWOP2G44d3X+CSMKGG+s9zCeY
	 I7zYK0d35vzYk+ol7L5wzH5s6UksAzdXLUXFbbSVhBYRmY1RpcVrPR3MNER8ZwK8nh
	 +/FQrShaIyCngnCSfcwfCBJGSdxsGecEcmtnZ017g+hFH+epPTueSV5Q8UKGPLGx4M
	 5aVwrWOavxzPk4KzDgf5B/JPCY20T9G0ypjLH2ouvzSjS6jVXEscmJlcp9E0camc8q
	 zgVHIBgOG5LUA==
Date: Tue, 3 Dec 2024 14:07:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Document the new media-committer's model
Message-ID: <20241203140712.57daa65f@foz.lan>
In-Reply-To: <20241203112209.GR10736@pendragon.ideasonboard.com>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
	<b0843e80-c46c-4344-b9f1-1d3b57dd2bbe@xs4all.nl>
	<20241203081958.6c186835@foz.lan>
	<20241203112209.GR10736@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 3 Dec 2024 13:22:09 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Tue, Dec 03, 2024 at 08:19:58AM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 2 Dec 2024 16:03:45 +0100 Hans Verkuil escreveu:  
> > > On 02/12/2024 10:26, Mauro Carvalho Chehab wrote:  
> > > > The media subsystem used to have a multi-commiter's model in the
> > > > past, but things didn't go well on that time, and we had to move to
> > > > a centralized model.
> > > > 
> > > > As the community has evolved, and as there are now new policies in
> > > > place like CoC, let's experiment with a multi-committers again.
> > > > 
> > > > The model we're using was inspired by the DRM multi-committers
> > > > model. Yet, media subsystem is different on several aspects, so the
> > > > model is not exactly the same.
> > > > 
> > > > The implementation will be in phases. For this phase, the goal is that 
> > > > all committers will be people listed at MAINTAINERS.
> > > > 
> > > > On this series,:
> > > > 
> > > > patch 1: updates the  media maintainer's entry profile and adds the
> > > > workflow that will be used with the new model. While here, it also
> > > > adds a missing "P:" tag at the MAINTAINERS file, pointing to it;
> > > > 
> > > > patch 2: adds a new document focused at the new maintainers
> > > > process. Its target is for developers that will be granted with
> > > > commit rights at the new media-maintainers.git tree. It also
> > > > contains a reference tag addition to kernel.org PGP chain
> > > > at process/maintainer-pgp-guide.rst.
> > > > 
> > > > patch 3: make documents cleared about maintainership duties.    
> > > 
> > > At least from my perspective, v3 is close to being ready and I hope
> > > that v4 will be good enough to be merged.
> > > 
> > > That said, what is missing in all this is that there is nothing here
> > > that explains why you would want to become a media committer. It is all
> > > very dry stuff, lots of 'shall's, and 'rights' and 'trust' and obligations,
> > > but nothing about the satisfaction you get when you get the responsibility
> > > of a part of the kernel and being able to guide the development of that
> > > area.
> > > 
> > > It's good enough to get the multi-committer process off the ground, but
> > > it definitely needs more work to make it more inviting to become a media
> > > committer. Because right now it is as dry as dust.  
> > 
> > Agreed. We focused on getting a document describing what it is expected
> > by committers, in order to start with the model. My view is that it works
> > fine for such purpose. I also feel that we're close to the final document.
> > 
> > I'm sending today a v4 addressing the comments since last review.
> > 
> > Once we get people that are already interested and ready to be on board,
> > and we know that the model and infrastructure works properly, we may implement
> > a phase 2 focusing on allowing more committers. For such purpose, we need to 
> > document the benefits/satisfaction of becoming a new committer. Depending how
> > it goes, either on phase 2 or on phase 3, we can change the model from 
> > invitation-only to volunteer-requests.  
> 
> What's phase 3 ?

The idea is to gradually open media-committers to more people, as each
phase succeeds, addressing infra, procedures, etc.

My rough idea is to do:

- Phase 0.99: beta testers;
- Phase 1 is to invite people that regularly submit PRs;
- Phase 2 is to invite other active maintainers;
- Phase 3 (or 2?, TBD) to open for non-maintainers.

We shouldn't rush it, as there are a lot to be done before opening it
broadly. So, I would say that:
- phase 0.99 would start in -rc2 (if things go well during this week); 
- phase 1 may still happen on this merge window, but as there will be
  only a few weeks between -rc2 and -rc6, and people usually get
  holidays in Dec/Jan, it is more likely that it will start for
  6.14-rc1, again if we didn't notice big issues on phase 0.99.

  We should wait at least for a couple of releases on phase 1,
  again to cleanup process and fine-tune infra. If things go well, 
  we can move to phase 2.

Thanks,
Mauro

