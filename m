Return-Path: <linux-media+bounces-22283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DCC9DBEAC
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 03:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F2A282227
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 02:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812C814F126;
	Fri, 29 Nov 2024 02:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gk7Rj3AO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA5642AA5;
	Fri, 29 Nov 2024 02:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732846916; cv=none; b=b2coK/YGIArXjgEfkLa9x/91wwwUc5pEtJEC306MM8olzuDYSdNKPvD1emr48qrLNr3O5djvBKLDVQBPrZpi1KAuZKc6T2orm+mDjL9p7pk7R7oWiJIiF9xeIk1REqLgdbHPjRqFGTevVYgrRtTTpCpGjJhSUwQ2zQ45qcEquug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732846916; c=relaxed/simple;
	bh=D2eNR7QoPIRfVwbCKv0vY6hJVxA4cBJQNFHhr6OqimA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sw7l7F2CxlpSsNXsa3xnnTIFB/oV6h1GV+ggJSarfMmpiUY2KAZUXd+gN7IjtKMtrKL9TuZNGXzRjTd56yx0mvU1etoSvVAcyTQcWSMTtQKaBgMVgvXq/jtTGJGMXsACv3OVr5JEiI1tcJxn2JZkTcU5pJEXq/6ZH1/8VGNH3+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gk7Rj3AO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E45C4CECE;
	Fri, 29 Nov 2024 02:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732846915;
	bh=D2eNR7QoPIRfVwbCKv0vY6hJVxA4cBJQNFHhr6OqimA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gk7Rj3AO0gPgtfeJWQnKvkIpcF+YaumdwyUH73X+JSf1vNvtIU4l0Ito6n68BhX+r
	 U8KGEJmCzp6f9t7okZyqgEhgYL9UqJMNCHkQKPQl1sm6XiecniQrCxVU248SD+fRjR
	 2dskdMCKA81ndm7SwcWodtSbGJreUV/t83TnC5SYLV9ETJUxO60ZHW2px26R2OQBrj
	 b7wN0ngtTaBas6duCzKD2JwkKJaUStR6Mvutqi5pIu9NazkZ7OChjuJtDSpJ4S61nc
	 He7wir4Yj8Qo4ux5zm3lbs7AYywGCkPma395VFPE7PS/XRYaB94ioGE2Qnwe3pPkXZ
	 oMOYG7zz1AIeQ==
Date: Fri, 29 Nov 2024 03:21:50 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241129032150.13f8aa35@foz.lan>
In-Reply-To: <CAKMK7uEJyTwSULjJ4Qv9vDtm5BkHwiFUSY=iihpHQMvE+a=6og@mail.gmail.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<20241127103948.501b5a05@foz.lan>
	<20241127111901.GG31095@pendragon.ideasonboard.com>
	<CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
	<87iks7wqi3.fsf@intel.com>
	<20241128194758.7d2e7656@foz.lan>
	<87v7w76od3.fsf@intel.com>
	<CAKMK7uEJyTwSULjJ4Qv9vDtm5BkHwiFUSY=iihpHQMvE+a=6og@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 28 Nov 2024 22:52:38 +0100
Simona Vetter <simona.vetter@ffwll.ch> escreveu:

> On Thu, 28 Nov 2024 at 22:27, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Thu, 28 Nov 2024, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:  
> > > We used to have a low bar for entry on our past multi-committers
> > > model (back in 2005-2007). It was a disaster, as one of the
> > > committer did very evil things. He was blocked, but that didn't
> > > prevent some of us to be threatened with physical violence - and
> > > some people even reported death threats.  
> >
> > While I understand the hesitation, I don't think it's fair towards
> > potential future collaborators to distrust them based on a bad actor
> > from nearly 20 years ago.  
> 
> Yeah this sounds a lot more like a CoC issue (which of course could
> result in a very swift removal of commit rights and suspend from all
> access to gitlab and mailing lists). Aside from reference the CoC
> we've left these things out of scope of the commit rights processes
> and merge criteria.
>
> My key takeaway over the last decade more of maintainering is that
> assuming that people want to do the right thing and building a process
> optimized for that works really well. And then handle the toxic people
> entirely separately through solid conduct enforcement.
>

Community has evolved and CoC may help, but it is still it is dozen
times more painful to remove grants than to not add rights for people
that aren't ready yet to become committers. 

The migration to the new model is already complex enough with experienced
people having troubles with the new CI engine and new process.
With just to people testing the new process, basically every time we 
committed something, we discovered one or more issues with the CI that 
would end denying merges and cause frustration and more work to
maintainers.

> > >> I think it's also important to define merge criteria. A set of rules by
> > >> which a committer can commit. And it's not really about technical
> > >> checkboxes. For example, in drm it really boils down to two things: at
> > >> least two people have been involved, and there are no open issues.  
> > >
> > > That's the same criteria we're aiming for. We'll start without
> > > two people reviewing, as there won't be enough committers at the  
> >
> > It's not two reviewers for us either; it's typically author+reviewer and
> > either author or reviewer commits. Two sets of eyeballs in total.
> >  
> > > beginning for that, but maintainers may revert/rebase the tree in
> > > case they don't agree with changes.  
> >
> > Not sure if you really mean it, but saying it like that doesn't really
> > breed trust, IMO. Sure, there have been patches merged to i915 that I
> > didn't "agree" with. But bad enough to warrant a revert? Very few and
> > far between, and always for clear and concrete reasons rather than
> > anything subjective.
> >
> > Side note, we don't do rebases in the development branches.  
> 
> Yeah, if I don't forget anything I remember a grand total of three
> rebases by maintainers, and this over 8 years or so of doing this:
> 
> - Someone pushed their entire development tree by accident. We
> obviously had to back that out and improved the tooling to catch these
> better.
> - Someone who pushed an entire pile of work (I think 30 patches or so)
> that missed the merge window into -fixes for a late -rc1.
> - Someone who lost trust with upstream maintainers because they
> refused to listen for way too long to engineering direction and
> consensus. The last big push of development work was backed out again.
> 
> There might have been some other things, but I think those were more
> maintainers screwing things up than committers pushing stuff, and on
> trees that are handled with the more classic group maintainer model.
> 
> It's really an extremely rare event that we rebase out patches.

Rebases should be rare, and we do avoid doing that, but it depends
on what happens and how the merged tree is tested. We hope that
the workflow we're implementing with CI testing everything will
prevent them, but we need to run it for a few kernel cycles to
be sure that what is there is good enough.

Regards,
Mauro

