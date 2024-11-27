Return-Path: <linux-media+bounces-22194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9F9DAA79
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 16:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44666282463
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 15:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E611FF7CC;
	Wed, 27 Nov 2024 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+30bC/m"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F481F9EC7;
	Wed, 27 Nov 2024 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732720171; cv=none; b=d3rNo3hDNCDUxH/TJaKZ7eO2BNjFqidhTFPmLksIx6DyfB8VMGmOyEVPYCuevyXNKXgf7i1iQDsKhc9HaGXhvdrlVwrCE7YpkTFgqYAbqd3RdgI8+v/zl1Tki0DGvEih350GuMNIFNA1VxNrRtlerQlqxZishjY04PcRerB3Llw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732720171; c=relaxed/simple;
	bh=ZuWs0anHicqiJCVtddeplrti1Zr/c0pz9pCi5G7MTN8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NWFGcg1VAVq3P6umXlJVmqSnR3lRudcZqDc4FuBSHILaTSCv5snhRDHz8nUA8rhFyK9usX2O3kt+bJPBC+e5KieU8VCs7HgLl8Es2ZdhhMsntuI1wnx1QzLwQBlZtq75aqhNwTJVSLOXW9bbPTprMQLpCoiItRLxQ2IaVF0ws+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+30bC/m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD34C4CECC;
	Wed, 27 Nov 2024 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732720171;
	bh=ZuWs0anHicqiJCVtddeplrti1Zr/c0pz9pCi5G7MTN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k+30bC/m48b0TX3SmCnnNFny2EVvRCdnVFtcoHJkkNTam2A7lHQmGNiBz7c2iB9wl
	 lgdWnXxvOgAozD6uFp8rcS6V5S5pTmUHH6c770rPHp1bvIrWf+YuwroXiv93ebvlig
	 IBFyUZMP1dAWbcMV9VVeADK7HLvhoDPZ8wpJsWyPXZe7uIXaHEiQ3z+c5SBWHQeHB6
	 XhDtFa/bOgkEZpYp5wT/tgqHyHn5T2iwsAxon1VoT9Mk/apUH/jIZoaaBqcbRVxk2x
	 eKXYnWnN3XLEdFojzNRGCQWqhvLluzWsmBbbglOCBejKVFK1iEwTPYrUTXrhfqTnnT
	 KKtH10GHj6b3Q==
Date: Wed, 27 Nov 2024 16:09:23 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241127160923.7eca17d1@sal.lan>
In-Reply-To: <20241127133938.GI31095@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<20241127103948.501b5a05@foz.lan>
	<20241127124629.704809f1@foz.lan>
	<20241127133938.GI31095@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 27 Nov 2024 15:39:38 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Wed, Nov 27, 2024 at 12:54:15PM +0100, Mauro Carvalho Chehab wrote:
> > Em Wed, 27 Nov 2024 10:39:48 +0100 Mauro Carvalho Chehab escreveu:
> >   
> > > > This workflow doesn't apply to patch submitters who are not allowed to
> > > > send pull requests and who don't have direct commit access. I thought
> > > > these submitters are the main audience of this document. In that case, I
> > > > think moving the next section that explains the e-mail workflow before
> > > > the "Media development workflow" section (which should likely be renamed
> > > > to make it clear that it is about merging patches, not developing them)
> > > > would be best. The "Review Cadence" section could also be folded in
> > > > there, to give a full view of what a submitter can expect.
> > > > 
> > > > This would also have the advantage of introducing the linuvtv.org
> > > > patchwork instance, which you reference above. Documents are more
> > > > readable when they introduce concepts first before using them.    
> > > 
> > > Will try to do such change at v2.  
> > 
> > Actually, both workflows (a) and (b) apply to the ones that can't
> > send pull requests or push at media-committers.git:
> > 
> > ---
> > 
> > a. Normal workflow: patches are handled by subsystem maintainers::
> > 
> >      +------+   +---------+   +-------+   +-----------------------+   +---------+
> >      |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|
> >      +------+   +---------+   |request|   |in media-committers.git|   +---------+
> >                               +-------+   +-----------------------+
> > 
> >    For this workflow, pull requests can be generated by a committer,
> >    a previous committer, subsystem maintainers or by a couple of trusted
> >    long-time contributors. If you are not in such group, please don't submit
> >    pull requests, as they will likely be ignored.
> > 
> > b. Committers' workflow: patches are handled by media committers::
> > 
> >      +------+   +---------+   +--------------------+   +-----------+   +---------+
> >      |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
> >      +------+   +---------+   |media-committers.git|   |approval   |   +---------+
> >                               +--------------------+   +-----------+
> > 
> > ---
> > 
> > No matter who sent an e-mail, this will be picked by patchwork and either
> > be part of a PR or a MR, depending on who picked it.  
> 
> Today the "normal" workflow for contributors who don't send pull
> requests is that you or Hans will pick their patches from the list.

True, but we've been following process (b) since the last merge window: we
are generating merges at the media-committers.git. As we're maintainers, 
the "maintainers approval" step is also handled by us, by the one that
submitted the MR, after checking the media-ci results.

> That's why I mentioned that neither of the above workflows apply there.
> Now, if we consider that you and Hans will keep doing that for some
> patches, and merge them using the committers workflow (where you would
> handle both steps of merging in the shared tree and giving the
> maintainer approval), it's true that the normal workflow would be one of
> the two above.

Yes, that's the case.

> Looking at the pull requests sent to the list over the past twelve
> months, we have
> 
>      32 Sakari Ailus
>      24 Hans Verkuil
>      22 Laurent Pinchart
>      21 Sebastian Fricke
>       7 Sean Young
>       7 Hans de Goede
>       4 Stanimir Varbanov
>       1 Shuah Khan
> 
> I expect people in that list to get commit rights either from the very
> beginning or very soon after. The committer workflow (if we consider it
> as including how you and Hans will continue picking patches from the
> list) will be the new norm. how about flipping things and listing it as
> a), and then name b) the "Pull request workflow" instead of the "Normal
> workflow" ? I would even go as far as proposing documenting the pull
> request workflow as legacy.

Renaming from Normal work flow to Pull request workflow makes sense.

The pull request workflow won't be legacy. Even with major contributors
using the new workflow for "normal work", pull requests will still be
generated for API changes.

Regards,
Mauro

