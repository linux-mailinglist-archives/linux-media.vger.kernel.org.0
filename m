Return-Path: <linux-media+bounces-22282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2849DBE7E
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 02:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03B30281BB7
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 01:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C98C13D25E;
	Fri, 29 Nov 2024 01:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOOY2EO7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992631386DA;
	Fri, 29 Nov 2024 01:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732845463; cv=none; b=hx3beEfq1SlnOreD2yr4kYisVUGVr5M6isN8LYG4L+Br2RIBUeXHKWkkwHswhi46gbEdyAuQnb2jvEIv8OJCF9519k34X1Yfs0W9H6yx1FvU9y6SS4Ren7IVhmkG4IlZo2fZoXwRlB97MNuJAQ6hIGsdr/O2q8gUA3lzy1Uzx5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732845463; c=relaxed/simple;
	bh=GuB/tPiu//kfsH0MRwdBMD52t+zy1C5lzKryJ3hoDAw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=snoBPEzYJRTC0Eg8E19PcbCSlAQgm1wItmwoDpHjQN4d/Wq6nfO/aLrktqdejw1uAFygd3aMX0mvG0Ma7s3QMUL4UH7jVHNR8rgr+mXJ68QR+EI6NUOGXDef1+VOMEdFE3ZzP83qxt+rYH9GqAmZ8IVMxbQv0QeVtrc7pZqlWcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOOY2EO7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF55C4CECE;
	Fri, 29 Nov 2024 01:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732845463;
	bh=GuB/tPiu//kfsH0MRwdBMD52t+zy1C5lzKryJ3hoDAw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oOOY2EO7Ws+1iuEUZt1wGYP6m0wVntzxqL2ErDldYRm2pGomgvLvE5owPc0WrGwMl
	 7xq+ELbuk8h17QjJJhgDjJzKwvScke5zeAWRg3RqZYs11baBEvFRODgC/LUj1H0M8i
	 2iINy0EctTPh4sUq8yWw/ZELDSjwRHQ3cD4KtoMjS1jpp+MrmhNGxLZFzHI2L0mF9j
	 bL0rrqVg4Nn+8QblFyP0rwcaBMRFtYxacrFH+gjAyh8K3OAOSOiJWLQjGvZYWCJoKm
	 nCNOKgRbLUHTUGntnpwqMWwAQTn7Mb4ApzG9nQyPqavJswv4jZx6DJ+ikyTotrciAm
	 awejajoO9Q6Xg==
Date: Fri, 29 Nov 2024 02:57:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241129025738.0e21fe12@foz.lan>
In-Reply-To: <87v7w76od3.fsf@intel.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<20241127103948.501b5a05@foz.lan>
	<20241127111901.GG31095@pendragon.ideasonboard.com>
	<CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
	<87iks7wqi3.fsf@intel.com>
	<20241128194758.7d2e7656@foz.lan>
	<87v7w76od3.fsf@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 28 Nov 2024 23:27:04 +0200
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Thu, 28 Nov 2024, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > We used to have a low bar for entry on our past multi-committers
> > model (back in 2005-2007). It was a disaster, as one of the
> > committer did very evil things. He was blocked, but that didn't
> > prevent some of us to be threatened with physical violence - and 
> > some people even reported death threats.  
> 
> While I understand the hesitation, I don't think it's fair towards
> potential future collaborators to distrust them based on a bad actor
> from nearly 20 years ago.

It is not about distrust; it is a matter of start slow and on a
more controlled way.

> >> Frankly, I'm not fond of the invite-only model. You need to be careful
> >> to not lose transparency.  
> >
> > The intent is to be as transparent as possible without violating regulations
> > like GPDR.  
> 
> I have no idea how GDPR would be relevant here. We don't collect data,
> other than what's in git.

People may opt to not discuss publicly about denied requests
or about losing commit rights.

> >> I think it's also important to define merge criteria. A set of rules by
> >> which a committer can commit. And it's not really about technical
> >> checkboxes. For example, in drm it really boils down to two things: at
> >> least two people have been involved, and there are no open issues.  
> >
> > That's the same criteria we're aiming for. We'll start without
> > two people reviewing, as there won't be enough committers at the  
> 
> It's not two reviewers for us either; it's typically author+reviewer and
> either author or reviewer commits. Two sets of eyeballs in total.

Ah, OK. Yeah, that's the model we're implementing.

> > beginning for that, but maintainers may revert/rebase the tree in
> > case they don't agree with changes.  
> 
> Not sure if you really mean it, but saying it like that doesn't really
> breed trust, IMO. Sure, there have been patches merged to i915 that I
> didn't "agree" with. But bad enough to warrant a revert? Very few and
> far between, and always for clear and concrete reasons rather than
> anything subjective.
> 
> Side note, we don't do rebases in the development branches.

On our model, the development tree is at:
	https://linuxtv.org/git/media.git

We won't be rebasing it (except in case of emergencies).

Yet, at least while we're experiencing with the new model, we
reserve the right of doing rebases at the media-committer.git tree in case 
something bad happens with the tree.

> > Currently, for most of the drivers, the number of committers per driver
> > is equal to the number of maintainers for the same driver.  
> 
> FWIW, I think that pretty much matches how it was for most drivers in
> drm before the committer model.
> 
> > So, on this stage, we're aiming on get maintainers commit rights,
> > starting with the ones that are long time contributors and regularly
> > participate at the media summits.
> >
> > Once the "slow start" phase finishes, we can review the process and
> > start thinking on getting more developers and committers.  
> 
> Just saying, it's easier to convince people to become committers with no
> strings attached than (co-)maintainers with a bunch of responsibilities,
> such as review or travel obligations.

We know.

Thanks,
Mauro

