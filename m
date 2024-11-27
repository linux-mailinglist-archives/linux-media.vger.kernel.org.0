Return-Path: <linux-media+bounces-22195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 092FB9DACC8
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 18:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 927222821DD
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 17:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C322010E8;
	Wed, 27 Nov 2024 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A9fwf9Ub"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D71F9EDC;
	Wed, 27 Nov 2024 17:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732730383; cv=none; b=mysrJlaw4MZL6G0YOQ1J3dN6DsQleogJeN37oTGMSiUQX5nbShm4WOCEFKuIsztj+e3T3vZkUn0pmd0xeMMz8iQz5w6NDKJk5zlhtIkdaB1EBswdJPyAlvugtf6d7pkXJUMOPxYY1oemyjoh1AEYyL86mMNllmHHdYsN8qZxlGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732730383; c=relaxed/simple;
	bh=RXNxyxBpGXpGgg17BVRBF+StkiICtLDNa4Qra1sN+6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lbs9dXoexWu7xAGh94CnRlU9h96VhcdWYlKwcinQkmrCUxNTuups6vHYw5wIIRPYzaYaipSh+6/m48vUTws0J5cgAKWJjvsYvnOX0uwsCqFvO6E+jjc373FmX2jbpSz59EETltcAOnuYY1DIqwCMNZUqYDukh8qvSHJQeYDotfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A9fwf9Ub; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8402778C;
	Wed, 27 Nov 2024 18:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732730354;
	bh=RXNxyxBpGXpGgg17BVRBF+StkiICtLDNa4Qra1sN+6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9fwf9Ub1cQm5UxIUWylxhnOXcgShjapC2U8RfcO96D50PUxukVaEZfQL2bWyyZLC
	 3EUDK2+DUmN2RYwrv64hWF3DmIp3Bg3Wt6HCm+/oyxs9e+90yBg7Kg4aS7uvr1sMxN
	 KQeaPkQHvsU2ECn17VwG3L077lyQPIMUcMtx5c/c=
Date: Wed, 27 Nov 2024 19:59:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241127175926.GA13800@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <20241127103948.501b5a05@foz.lan>
 <20241127124629.704809f1@foz.lan>
 <20241127133938.GI31095@pendragon.ideasonboard.com>
 <20241127160923.7eca17d1@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127160923.7eca17d1@sal.lan>

On Wed, Nov 27, 2024 at 04:09:23PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 27 Nov 2024 15:39:38 +0200 Laurent Pinchart escreveu:
> > On Wed, Nov 27, 2024 at 12:54:15PM +0100, Mauro Carvalho Chehab wrote:
> > > Em Wed, 27 Nov 2024 10:39:48 +0100 Mauro Carvalho Chehab escreveu:
> > >   
> > > > > This workflow doesn't apply to patch submitters who are not allowed to
> > > > > send pull requests and who don't have direct commit access. I thought
> > > > > these submitters are the main audience of this document. In that case, I
> > > > > think moving the next section that explains the e-mail workflow before
> > > > > the "Media development workflow" section (which should likely be renamed
> > > > > to make it clear that it is about merging patches, not developing them)
> > > > > would be best. The "Review Cadence" section could also be folded in
> > > > > there, to give a full view of what a submitter can expect.
> > > > > 
> > > > > This would also have the advantage of introducing the linuvtv.org
> > > > > patchwork instance, which you reference above. Documents are more
> > > > > readable when they introduce concepts first before using them.    
> > > > 
> > > > Will try to do such change at v2.  
> > > 
> > > Actually, both workflows (a) and (b) apply to the ones that can't
> > > send pull requests or push at media-committers.git:
> > > 
> > > ---
> > > 
> > > a. Normal workflow: patches are handled by subsystem maintainers::
> > > 
> > >      +------+   +---------+   +-------+   +-----------------------+   +---------+
> > >      |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|
> > >      +------+   +---------+   |request|   |in media-committers.git|   +---------+
> > >                               +-------+   +-----------------------+
> > > 
> > >    For this workflow, pull requests can be generated by a committer,
> > >    a previous committer, subsystem maintainers or by a couple of trusted
> > >    long-time contributors. If you are not in such group, please don't submit
> > >    pull requests, as they will likely be ignored.
> > > 
> > > b. Committers' workflow: patches are handled by media committers::
> > > 
> > >      +------+   +---------+   +--------------------+   +-----------+   +---------+
> > >      |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
> > >      +------+   +---------+   |media-committers.git|   |approval   |   +---------+
> > >                               +--------------------+   +-----------+
> > > 
> > > ---
> > > 
> > > No matter who sent an e-mail, this will be picked by patchwork and either
> > > be part of a PR or a MR, depending on who picked it.  
> > 
> > Today the "normal" workflow for contributors who don't send pull
> > requests is that you or Hans will pick their patches from the list.
> 
> True, but we've been following process (b) since the last merge window: we
> are generating merges at the media-committers.git. As we're maintainers, 
> the "maintainers approval" step is also handled by us, by the one that
> submitted the MR, after checking the media-ci results.
> 
> > That's why I mentioned that neither of the above workflows apply there.
> > Now, if we consider that you and Hans will keep doing that for some
> > patches, and merge them using the committers workflow (where you would
> > handle both steps of merging in the shared tree and giving the
> > maintainer approval), it's true that the normal workflow would be one of
> > the two above.
> 
> Yes, that's the case.
> 
> > Looking at the pull requests sent to the list over the past twelve
> > months, we have
> > 
> >      32 Sakari Ailus
> >      24 Hans Verkuil
> >      22 Laurent Pinchart
> >      21 Sebastian Fricke
> >       7 Sean Young
> >       7 Hans de Goede
> >       4 Stanimir Varbanov
> >       1 Shuah Khan
> > 
> > I expect people in that list to get commit rights either from the very
> > beginning or very soon after. The committer workflow (if we consider it
> > as including how you and Hans will continue picking patches from the
> > list) will be the new norm. how about flipping things and listing it as
> > a), and then name b) the "Pull request workflow" instead of the "Normal
> > workflow" ? I would even go as far as proposing documenting the pull
> > request workflow as legacy.
> 
> Renaming from Normal work flow to Pull request workflow makes sense.
> 
> The pull request workflow won't be legacy. Even with major contributors
> using the new workflow for "normal work", pull requests will still be
> generated for API changes.

OK, let's not mark it as deprecated, we can just rename it to "Pull
request workflow". I'd still prefer to list it as b) but won't make that
a casus belli.

-- 
Regards,

Laurent Pinchart

