Return-Path: <linux-media+bounces-18610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55B987174
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84749281C11
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0483A1AE85E;
	Thu, 26 Sep 2024 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MsSx/x/9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD01AD413
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346295; cv=none; b=fr9d4n7EFKq4eJbw3puBhjAVeeA1WB9ox3LoPq4vyxly6OP9DWeas8mMS+mLbYZdfnII9sq8mq37MDxrVlAu3C9/868yNoZKmDoENBpEIkihA3izfym1lTaTlbPZn1XTBO1egE4MwRsh4dTGvGRyiY3BZ55/i3H3s5TDpT9h/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346295; c=relaxed/simple;
	bh=oLKLKOsr4cEnGPeFK0gxCK5x4CNQ44B0Ql3ITrg32x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIxoMOm7Cfu8C/qEs0re5sCp6BZO9sDtM271Po/eIG83jGocBKY+2Qs0Y86/sV3vWN5+fWuBD9PjDnnWskXvcGcKZjLJKd6lX1lhCjlnEDAROPqV0gQ06cS58RIwsfV1x2w7Kulmy+A3/p7GwX1IfUSGPPt7I44w8eF+jjdw6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MsSx/x/9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91FB5169;
	Thu, 26 Sep 2024 12:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727346202;
	bh=oLKLKOsr4cEnGPeFK0gxCK5x4CNQ44B0Ql3ITrg32x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsSx/x/9VcU5RExNZzbK1q9QDklchr5euWQWw8wzjlMqX/WQZWLHwGr3T6lrzrtJP
	 +n1viLD0vpKSmqbaym714escAhdDa4psfyA1fjU4ZGws1a1ZIgBhcIEVRQJRTrF64I
	 +/3qUi3IZWZD87+BmW6Su/M8URxOETGcS/VVcrSI=
Date: Thu, 26 Sep 2024 13:24:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240926102448.GA21788@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240925195843.GK30399@pendragon.ideasonboard.com>
 <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
 <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
 <20240926121914.69b47a50@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240926121914.69b47a50@foz.lan>

On Thu, Sep 26, 2024 at 12:19:14PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 26 Sep 2024 09:30:34 +0000
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > > >>> Can you refresh my memory which processes need more work?  
> > > >>
> > > >> I have the same doubt. As discussed during the summit, Hans and I had some
> > > >> discussions yesterday, to address a few details. For both of us the process
> > > >> sounds well defined.
> > > >>
> > > >> From my personal notes, this will be the new process:
> > > >>
> > > >> - committers will merge patches at media-committers.git tree at fdo,
> > > >>   provided that they'll follow the rules defined on a committers agreement
> > > >>   and (partially?) enforced by media-ci checks;
> > > >> - core committers follow the same rules, with a broader privilege of
> > > >>   changing kernel API/ABI;
> > > >> - committers will ensure that patchwork will reflect the review process of
> > > >>   the patches;
> > > >> - maintainers will double-check if everything is ok and, if ok, merge the
> > > >>   changes at linuxtv.org. We intend to rename the tree there to "media.git",
> > > >>   being the main tree to be used for development;
> > > >> - pull requests will keep using the same process as currently. The only
> > > >>   change is that the media-stage.git tree will be renamed to "media.git";
> > > >> - maintainers will periodically send patches upstream.
> > > >>
> > > >> The media-commiters.git tree at fdo might be rebased if needed; the 
> > > >> media.git tree at linuxtv.org is stable. A large effort will be taken to
> > > >> avoid rebasing it.
> > > >>
> > > >> We may need some helper scripts and/or use pwclient to keep patchwork
> > > >> updated after committers reviews.  
> > > > 
> > > > What will happen if we update the status of patches in patchwork when
> > > > merging them to the fdo tree, and the tree is later rebased to drop
> > > > commits ? Will the person rebasing handle updating patchwork to move the
> > > > patches back from accepted to a different status ?  
> > > 
> > > That should be the responsibility of the person doing the rebase. I think
> > > that's what is done today as well in the rare cases we rebase.  
> > 
> > Sounds reasonable. I'd also like to avoid rebases as much as possible.
> > 
> > Do we have a list of cases where a rebase would be needed? A license issue
> > or a missing Sob line, perhaps?
> 
> No, and I don't think we can write a rule to cover such cases. The only rule
> is that it is up to maintainers to decide to do a rebase or not, and this
> will be done case by case.
> 
> With regards to the cases you mentioned, it is almost surely that license 
> issues will call for a rebase. The same may apply up to some point for 
> missing/refused SoBs from authors, co-developers and from the committers.
> 
> Yet, I would expect that a more common case is if someone touches the code
> and another committer/developer/author nacks with such changes.
> 
> So, for instance, suppose you maintain driver A. Some other committer
> may end merging a patch for driver A without your ack. Depending on the
> patch that could be OK (trivial/doc changes, bugs with bug fixes that
> are available for some time, etc).
> 
> Yet, even if the committer did an honest handling of the patch, you may 
> still disagree or want some changes at the original patch. On such cases, 
> the maintainers may decide to drop the changes and do a normal review
> process. They may otherwise request a patch on the top of the applied
> one to address the pointed issues.

Let's do a revert in that case, and keep rebases for cases where having
content in the git history causes issues other than bisection problems.

I'd argue that even a missing SoB may not be a cause for rebase if it's
an accident, but that's not worth debating because CI will make sure
this never happens.

> There is also worse case scenarios, like a committer violating the
> committer's agreement.

I'm fine with rebases if someone gets rogue and merges malicious code,
or commits with insults in the commit message. I don't foresee that
happening regularly, if ever.

-- 
Regards,

Laurent Pinchart

