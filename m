Return-Path: <linux-media+bounces-17780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CD996F559
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51DE81C222FF
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 13:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A075C1CE710;
	Fri,  6 Sep 2024 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l1hKZqlv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369D1CE6F7
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725629408; cv=none; b=DU2pQUghlC3NKdp9DCkA7z/wm+3tXbJ/Ej6GzAHaxgVY4qdx1BkKqLdZNcQc9duH5MZZ6oMGNGoay/m7GdM0428vosO545ALXa5JgUsteBK5TOiUtsJSPhaVd7AcamwlLE6cSoGL0dhch3ydHl3j2wGnPYbZLHCEUU3yjvYq++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725629408; c=relaxed/simple;
	bh=AyXeqRiN87ahsYrqjB6cOzrmLW3GudaX7C4lhuF7dBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TY9I1NCJ8PGsfShgYh72oeUMUbLgbcn3cKKb4hFGxTSsj+6lFJzjqq/C+q5sFirANnjSvUhg6zvekGr4FCvNtsawJSqpy5cFpubhsD+heXpY830OZYPyLeKR+XzfaE41alXIvaFPvfUXL1ozzCxdiOLVwoNj4N34vYf3LPVX5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l1hKZqlv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50A55824;
	Fri,  6 Sep 2024 15:28:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725629327;
	bh=AyXeqRiN87ahsYrqjB6cOzrmLW3GudaX7C4lhuF7dBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1hKZqlv8ZbTJOweRIKeSOAKnc/5whyV76J1We/3sFhqxh3nDtVms+NHd1QRRcrHi
	 htOvf97JqnLLCjT6llCjFxsMMMDqE9MtQNkV5Jm4xW+PXm/ynJEaLmO/5i3NKPHmpc
	 i0IGMpOksfAxDstmLwexpCNFK/3U+j6PoKdoIgc0=
Date: Fri, 6 Sep 2024 16:29:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
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
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
Message-ID: <20240906132959.GC27086@pendragon.ideasonboard.com>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
 <20240906101141.451db4f4@foz.lan>
 <20240906103658.updwgahyisda5yid@basti-XPS-13-9310>
 <20240906131030.6880e5f5@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240906131030.6880e5f5@foz.lan>

On Fri, Sep 06, 2024 at 01:10:30PM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 6 Sep 2024 12:36:58 +0200 Sebastian Fricke escreveu:
> > On 06.09.2024 10:11, Mauro Carvalho Chehab wrote:
> > > Em Thu, 5 Sep 2024 09:16:27 +0200 Hans Verkuil escreveu:
> > >  
> ...
> > > 1. All committers shall use a common procedure for all merges.
> > >
> > >   This is easy said than done. So, IMO, it is needed some common scripts
> > >   to be used by all committers. On my tests when merging two PRs there,
> > >   those seems to be the minimal set of scripts that are needed:
> > >
> > >   a) script to create a new topic branch at linux-media/users/<user>
> > >      The input parameter is the message-ID, e. g. something like:
> > >
> > >	create_media_staging_topic <topic_name> <message_id>
> > >
> > >      (eventually with an extra parameter with the name of the tree)
> > >
> > >      It shall use patchwork REST interface to get the patches - or at least
> > >      to check if all patches are there (and then use b4).
> > >
> > >      such script needs to work with a single patch, a patch series and a
> > >      pull request.
> > >
> > >      the message ID of every patch, including the PR should be stored at
> > >      the MR, as this will be needed to later update patchwork.

I'm sure individual committers will want to optimize their workflow
using scripts, and possibly share them, but what's wrong with simply
using b4 ? With -l it will add a link to lore, so the message ID will be
available.

I'd rather first focus on what we want to see included in commit
messages, and then on how to make sure it gets there.

> > >
> > >   b) once gitlab CI runs, there are two possible outcomes: patches may
> > >      pass or not. If they pass, a MR will be created and eventually be
> > >      merged.
> > >
> > >      Either merged or not (because something failed or the patches require
> > >      more work), the patchwork status of the patch require changes to
> > >      reflect what happened. IMO, another script is needed to update the
> > >      patch/patch series/PR on patchwork on a consistent way.
> > >
> > >      This is actually a *big* gap we have here. I have a script that
> > >      manually check patchwork status and the gap is huge. currently,
> > >      there are 73 patches that seems to be merged, but patchwork was not
> > >      updated.
> > >
> > >      From what I noticed, some PR submitters almost never update patchwork
> > >      after the merges.  
> > 
> > Interesting I thought that is how it should be? I mean if I send a PR,
> > the one taking the PR must decide whether he wants to pull it, so the
> > decision whether the set is accepted should be on the one pulling the
> > changes and not on the one pushing them. Right?
> 
> Yes, but you still need to update previous attempts to submit the
> work. So, let's see a patch series at v9 got a PR. It is up to you
> to cleanup everything on patchwork from v1 to v8.

That should be done before though, when v2 is submitted, v1 should be
marked as superseded. Isn't there a patchwork bot that can help with
this ? It's not perfect in the sense that it doesn't always match new
versions with previous ones, but if it can lower the manual burden by
even 80%, it's a big win.

> Now, the committer handing PR for v9 should be in charge of updating
> the status of it and the patches that belong to it, once the patch
> is merged or once he takes a decision otherwise.

Today most authors don't have a patchwork account, so they can't update
the status themselves. The responsibility mostly falls on you and Hans.
I'm fine with moving this to committers, which will make your life
easier. The patchwork update when merging a branch should ideally be
done automatically by the gitlab instance. If we have lore links in the
commit messages, that sounds doable.

> > >
> > >      So another script to solve this gap is needed, doing updates on all
> > >      patches that were picked by the first script. Something like:  
> > 
> > Shouldn't the update happen after the MR has been created instead,
> > because only after running the CI we know whether the tests fail or
> > pass? From what you say above it sounds like the first script merely
> > prepares a topic branch to be tested.
> 
> the first script I mentioned prepares and pushes the topic branch. The
> patchwork update script (the second one) can be used on several parts
> of the workflow:
> 
> - before MR: if the committer decides to not merge the changes, because
>   it didn't pass on his review;
> - after MR pipeline failures;
> - after MR being merged: once it reaches media-staging master.
> 
> > >      update_patchwork_from_topic <topic_name> <new_status>
> > >
> > >      This would likely need to use some logic to pick the message IDs
> > >      of the patch inside the MR.
> > >
> > >      Such script could also check for previous versions of the patch
> > >      and for identical patches (it is somewhat common to receive identical
> > >      patches with trivial fixes from different developers).
> > >
> > >   Someone needs to work on such script, as otherwise the multi committers
> > >   model may fail, and we risk needing to return back to the current model.  
> > 
> > Just my personal thought: This sounds a bit extreme to me, I mean we are
> > currently in the first test run as preparation for the Media-summit
> > where we actually want to discuss policies and further requirements.
> 
> What I'm saying is that multiple-committers model will only work if
> all committers follow a common procedure (still variants between
> committers is possible, provided that the minimal set is followed).
> 
> If this doesn't happens, maintainers may be forced to do rebases and other
> manual fixes, with will actually make life worse for everyone. That's
> what I want to avoid by having a common set of scripts for the very basic
> tasks: create a topic branch for CI to test and update patchwork.

The issues you've listed above are about updating status of patches in
patchwork. That's important (or otherwise we should drop patchwork if we
think it's not important, but I don't think that's the case), but I
hardly see how missing updates to patchwork would call for a rebase :-)

There's a need to make sure that what lands in the shared tree is
proper, and for that we need a clearly documented procedure. At this
point I don't think it requires a committer tool script, even if in the
future developing such a tool could help.

> > > 2. The mailbomb script that notifies when a patch is merged at media-stage
> > >    we're using right now doesn't work with well with multiple committers.
> > >
> > >    Right now, the tree at linuxtv runs it, but it might end sending patches
> > >    to the author and to linuxtv-commits ML that reached upstream from other
> > >    trees. It has some logic to prevent that, but it is not bulletproof.
> > >
> > >    A replacement script is needed. Perhaps this can be executed together
> > >    with the patchwork script (1B) at the committer's machine.

This could possibly be done with 'b4 ty'. Another option is to rely on
patchwork notifications instead. If a patch is marked as merged, the
notification e-mail sounds enough to notify the submitter.

> > > 3. Staging require different rules, as smatch/spatch/sparse/checkpatch
> > >    warnings and errors can be acceptable.  
> > 
> > I thought that we came to a consensus that only warnings are acceptable?
> > If we accept errors in the staging but not in media master, does that
> > mean that we ought to send patches to the media staging tree then?
> > I'd vote for only allowing patches without errors into the staging tree
> > and in the worst case add a list with acceptable errors.
> 
> No, you got me wrong. By staging, I'm referring to drivers/staging/
> not to the multi-committers tree.

Can we please rename the shared tree ? media-staging creates confusion
with drivers/staging/media/.

> The bar for sending stuff to drivers/staging is lower than for
> drivers/media. According with Kernel's documentation at
> Documentation/process/2.Process.rst:
> 
> 	"Current rules require that drivers contributed to staging
> 	 must, at a minimum, compile properly."
> 
> We actually try to be better than that, but still when new stuff is
> added to staging, while we try to also ensure no static code checkers
> would fail, we may need to relax the rules, as it is not uncommon to
> receive drivers that need extra care to follow Kernel coding style
> there.

Why can't we tell the submitter to fix the warnings first ? Especially
if we can point them to a CI report, that would seem the best course of
action to me. drivers/staging/ is meant for code that need more time to
be considered stable enough for the kernel. The stabilization doesn't
happen by magic, it requires someone actively working on it. If the
submitter can't bother to fix the warnings, it doesn't forebode anything
good and wouldn't make me confident that the code would ever get out of
staging (other than simply being deleted).

> > > 4. We need to have some sort of "honour code": if undesired behavior
> > >    is noticed, maintainers may temporarily (or permanently) revoke
> > >    committer rights.  
> > 
> > That sounds like something to discuss on the media summit, 
> 
> Sure. That's why I'm asking to explicitly add it to the topics to be
> discussed there ;-)
> 
> It would be nice if someone could come up with a proposal for 
> it, although the discussions of such proposal should likely happen via 
> email.
> 
> Also, the ones to be added there likely need to explicitly ack with
> such code before being added to gitlab's permission group.

This sounds fairly straightforward, I think we'll easily agree on rules.

> > revoking
> > commit rights shouldn't be hard as you just have to remove push rights
> > for that GitLab tree.
> 
> Technically yes, but in practice this is usually very hard, as we're
> dealing with people that will very likely be very unhappy of getting banned.

Why would that make it hard to remove push rights ?

-- 
Regards,

Laurent Pinchart

