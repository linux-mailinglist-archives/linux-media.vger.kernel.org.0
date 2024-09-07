Return-Path: <linux-media+bounces-17881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BCB97041A
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 22:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB9B282E5C
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 20:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F5D16848F;
	Sat,  7 Sep 2024 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0cpOvR6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A776166312
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725741812; cv=none; b=THhS1KOQQ5xnP4K+k66fM3cudPa36lIETSWUnWulF2Aj3duOWncfA8FWhd2hfrlr8X8Xi8dQl/l5yVpA6c3KJAqV5vldZeeoMPAG1xneJmA6Rmkbk/5Tte1yaP+Aw/gaxUrIXaGyAv+9aurchmFuRen0OOTxI9G37BiOpaDs/dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725741812; c=relaxed/simple;
	bh=MzdjgNqBQlyGtmWg7kwc2Z6a4xbvcyHFWqwto31E+jI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yn+SCmylhiGGuD1+b13/Ko6xMthDbI64SXSwx+zUpNpT3wA3Qywn2xkLj6FDpQSlbbsAYXDT0BarQngyUwBQJUh71tQh0Qx8dCpR1AROJ8VSUypHL7etVZ+Me97yGfHhs+mU7kA90RfvFwFO9aOTblC74KI57N7s8+YEpDa3UkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0cpOvR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4F4C4CEC2;
	Sat,  7 Sep 2024 20:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725741811;
	bh=MzdjgNqBQlyGtmWg7kwc2Z6a4xbvcyHFWqwto31E+jI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z0cpOvR6oXkTxH2x9vgcl3AI+V9p8JOibuNhslvm13VQ/u1G+s3srSw0D3mPotsna
	 ALXwH6gHMiVAe2hSkfO4wLcpw3Qunx30T1W7l70JZ3ZtXD1Bmn/SSUT3a34OrNrUZD
	 iJQC6BYQZb/t8JDf2NFlRM77F2NZG7ZhaQ0ifrjsLGvRtrQYOPLlLWQQuEdl5le+t5
	 wjIAR7UigtcrmYSsVqQ53RHx7A5r48tIkjzxlCYSS+hblPk2+7KNl8hdB62bYuybRt
	 M/k8RhpL1ev2PwaGBQazPqUiRb9THTXyW8YroI7Gx1Bo6obCb7IP24USO8GlpJc/hG
	 9tLpQgFdu6Upw==
Date: Sat, 7 Sep 2024 22:43:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori
 Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar
 <devarsht@ti.com>, r-donadkar@ti.com, Kieran Bingham
 <kieran.bingham@ideasonboard.com>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
Message-ID: <20240907224324.7fe941a2@foz.lan>
In-Reply-To: <20240906180439.GA12915@pendragon.ideasonboard.com>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
	<20240906101141.451db4f4@foz.lan>
	<20240906103658.updwgahyisda5yid@basti-XPS-13-9310>
	<20240906131030.6880e5f5@foz.lan>
	<20240906132959.GC27086@pendragon.ideasonboard.com>
	<20240906194257.58902baf@foz.lan>
	<20240906180439.GA12915@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 6 Sep 2024 21:04:39 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> (CC'ing Kieran, for a question below)
> 
> First of all, I'd like to say that I think we agree on more points than
> may be apparent from the conversation. I believe this new process will
> lower the administrative burden on everybody, which should also come as
> a relief.
> 
> On Fri, Sep 06, 2024 at 07:43:10PM +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 6 Sep 2024 16:29:59 +0300 Laurent Pinchart escreveu:  
> > > On Fri, Sep 06, 2024 at 01:10:30PM +0200, Mauro Carvalho Chehab wrote:  
> > > > Em Fri, 6 Sep 2024 12:36:58 +0200 Sebastian Fricke escreveu:    
> > > > > On 06.09.2024 10:11, Mauro Carvalho Chehab wrote:    
> > > > > > Em Thu, 5 Sep 2024 09:16:27 +0200 Hans Verkuil escreveu:
> > > > > >      
> > > > ...    
> > > > > > 1. All committers shall use a common procedure for all merges.
> > > > > >
> > > > > >   This is easy said than done. So, IMO, it is needed some common scripts
> > > > > >   to be used by all committers. On my tests when merging two PRs there,
> > > > > >   those seems to be the minimal set of scripts that are needed:
> > > > > >
> > > > > >   a) script to create a new topic branch at linux-media/users/<user>
> > > > > >      The input parameter is the message-ID, e. g. something like:
> > > > > >
> > > > > >	create_media_staging_topic <topic_name> <message_id>
> > > > > >
> > > > > >      (eventually with an extra parameter with the name of the tree)
> > > > > >
> > > > > >      It shall use patchwork REST interface to get the patches - or at least
> > > > > >      to check if all patches are there (and then use b4).
> > > > > >
> > > > > >      such script needs to work with a single patch, a patch series and a
> > > > > >      pull request.
> > > > > >
> > > > > >      the message ID of every patch, including the PR should be stored at
> > > > > >      the MR, as this will be needed to later update patchwork.    
> > > 
> > > I'm sure individual committers will want to optimize their workflow
> > > using scripts, and possibly share them, but what's wrong with simply
> > > using b4 ? With -l it will add a link to lore, so the message ID will be
> > > available.
> > > 
> > > I'd rather first focus on what we want to see included in commit
> > > messages, and then on how to make sure it gets there.  
> > 
> > It is not just running b4. There's the need of preparing a MR message that
> > matches the content of patch 0, very likely with the message IDs of patches
> > and PRs, and check if everything is in place on patchwork, as this is the 
> > main tool to track the pending queue. Surely b4 can be called on such script.  
> 
> Is that needed, or can we rely on the Link: tag of individual patches to
> find the corresponding patch in patchwork ?

Only if all patches get links, which is not the case. Patches received
via pull requests won't have, and people may still forget o use -l option.

That's why we need a script. It can be a simple as calling b4 with -l for
normal patches, but it would likely need to store PR message IDs somewhere
too, for merges done via PRs. We'll still have those even after
multi-commiters, for people that opt to not be a committer and for certain
types of patches like uAPI, core and more complex changes.

See, the problem is that there will be a time gap between submitting a
topic branch, wait for CI to run, create a MR, wait for CI to run and
finally merge the patch.

> 
> > It doesn't need to be complex, but it should automate the basic steps that
> > all committers will use.
> >    
> > > > > >
> > > > > >   b) once gitlab CI runs, there are two possible outcomes: patches may
> > > > > >      pass or not. If they pass, a MR will be created and eventually be
> > > > > >      merged.
> > > > > >
> > > > > >      Either merged or not (because something failed or the patches require
> > > > > >      more work), the patchwork status of the patch require changes to
> > > > > >      reflect what happened. IMO, another script is needed to update the
> > > > > >      patch/patch series/PR on patchwork on a consistent way.
> > > > > >
> > > > > >      This is actually a *big* gap we have here. I have a script that
> > > > > >      manually check patchwork status and the gap is huge. currently,
> > > > > >      there are 73 patches that seems to be merged, but patchwork was not
> > > > > >      updated.
> > > > > >
> > > > > >      From what I noticed, some PR submitters almost never update patchwork
> > > > > >      after the merges.      
> > > > > 
> > > > > Interesting I thought that is how it should be? I mean if I send a PR,
> > > > > the one taking the PR must decide whether he wants to pull it, so the
> > > > > decision whether the set is accepted should be on the one pulling the
> > > > > changes and not on the one pushing them. Right?    
> > > > 
> > > > Yes, but you still need to update previous attempts to submit the
> > > > work. So, let's see a patch series at v9 got a PR. It is up to you
> > > > to cleanup everything on patchwork from v1 to v8.    
> > > 
> > > That should be done before though, when v2 is submitted, v1 should be
> > > marked as superseded.   
> > 
> > Agreed. Still most of the ones sending PRs those days don't do that.
> >   
> > > Isn't there a patchwork bot that can help with this ?   
> > 
> > As far as I'm aware, no.  
> 
> Kieran, aren't you running such a bot for libcamera ?
> 
> > > It's not perfect in the sense that it doesn't always match new
> > > versions with previous ones, but if it can lower the manual burden by
> > > even 80%, it's a big win.
> > >   
> > > > Now, the committer handing PR for v9 should be in charge of updating
> > > > the status of it and the patches that belong to it, once the patch
> > > > is merged or once he takes a decision otherwise.    
> > > 
> > > Today most authors don't have a patchwork account, so they can't update
> > > the status themselves. The responsibility mostly falls on you and Hans.  
> > 
> > The responsibility is for the ones that submit PRs. Unfortunately, this
> > is a process that it is not working right now. 
> > 
> > See, if you're reviewing a v2 of a patch series, you know that v1 is
> > obsolete. It should be easy to run a script that would take the v1
> > patch series and update patchwork to mark all v1 patches obsoleted.  
> 
> In many cases that could be automated, but sometimes locating the
> previous version automatically won't work. There will likely be some
> amount of manual work. Tooling could help.

I have a tool that could be used as basis. It is hint based and test
some conditions. Not perfect, but picks several cases. It worked fine
when I was the only one committing patches, as I had a better idea
about what it was merged, but now, with Hans and I, it is very hard
to detect false positives. Yet, it could serve as basis for a check
inside the committer's script.

> 
> > > I'm fine with moving this to committers, which will make your life
> > > easier. The patchwork update when merging a branch should ideally be
> > > done automatically by the gitlab instance. If we have lore links in the
> > > commit messages, that sounds doable.  
> > 
> > With multi-committer, it won't be possible anymore for Hans and I do
> > do such updates, as the workflow will be handled by the committers.
> > 
> > So, all committers will need to cleanup patch status on patchwork.  
> 
> As I wrote above, that's fine with me, and hopefully that will also make
> your life easier (unless you tell me you enjoy updating patchwork
> manually :-)).
> 
> > > > > >
> > > > > >      So another script to solve this gap is needed, doing updates on all
> > > > > >      patches that were picked by the first script. Something like:      
> > > > > 
> > > > > Shouldn't the update happen after the MR has been created instead,
> > > > > because only after running the CI we know whether the tests fail or
> > > > > pass? From what you say above it sounds like the first script merely
> > > > > prepares a topic branch to be tested.    
> > > > 
> > > > the first script I mentioned prepares and pushes the topic branch. The
> > > > patchwork update script (the second one) can be used on several parts
> > > > of the workflow:
> > > > 
> > > > - before MR: if the committer decides to not merge the changes, because
> > > >   it didn't pass on his review;
> > > > - after MR pipeline failures;
> > > > - after MR being merged: once it reaches media-staging master.
> > > >     
> > > > > >      update_patchwork_from_topic <topic_name> <new_status>
> > > > > >
> > > > > >      This would likely need to use some logic to pick the message IDs
> > > > > >      of the patch inside the MR.
> > > > > >
> > > > > >      Such script could also check for previous versions of the patch
> > > > > >      and for identical patches (it is somewhat common to receive identical
> > > > > >      patches with trivial fixes from different developers).
> > > > > >
> > > > > >   Someone needs to work on such script, as otherwise the multi committers
> > > > > >   model may fail, and we risk needing to return back to the current model.      
> > > > > 
> > > > > Just my personal thought: This sounds a bit extreme to me, I mean we are
> > > > > currently in the first test run as preparation for the Media-summit
> > > > > where we actually want to discuss policies and further requirements.    
> > > > 
> > > > What I'm saying is that multiple-committers model will only work if
> > > > all committers follow a common procedure (still variants between
> > > > committers is possible, provided that the minimal set is followed).
> > > > 
> > > > If this doesn't happens, maintainers may be forced to do rebases and other
> > > > manual fixes, with will actually make life worse for everyone. That's
> > > > what I want to avoid by having a common set of scripts for the very basic
> > > > tasks: create a topic branch for CI to test and update patchwork.    
> > > 
> > > The issues you've listed above are about updating status of patches in
> > > patchwork. That's important (or otherwise we should drop patchwork if we
> > > think it's not important, but I don't think that's the case), but I
> > > hardly see how missing updates to patchwork would call for a rebase :-)  
> > 
> > The need for rebase typically won't be due to patchwork[1], but to
> > broken processes to validate patches that may happen if the patches
> > don't reach first a tree under linux-media/users; if someone uses a wrong
> > version of compliance utils; if it has a broken topic branch, etc.
> > E. g. it may happen if the agreed process isn't be followed to the
> > letter.  
> 
> I think we all agree on the need of a clearly documented and simple to
> understand process.
> 
> > [1] Still, rebases might still be needed if the developer is not taking
> >     enough care on patchwork. See, if a developer sends a patch X with a
> >     change, and some days/weeks later another developer sends a patch Y
> >     identical to X, except for the author (and eventually description), 
> >     if patch Y is merged, there will be a need to drop it and pick X, to
> >     properly give credits to the right person.  
> 
> No, that doesn't call for a rebase. If we really want to credit patch X
> in the git history, we can revert Y and apply X. In most cases the
> author of patch X will not mind that Y got applied.

I'd say it depends. For trivial changes, this could be ok, as patches X 
and Y could be independently produced. But a more complex patch that could
be considered plagiarism, I would do a rebase.
> 
> > > There's a need to make sure that what lands in the shared tree is
> > > proper, and for that we need a clearly documented procedure. At this
> > > point I don't think it requires a committer tool script, even if in the
> > > future developing such a tool could help.
> > >   
> > > > > > 2. The mailbomb script that notifies when a patch is merged at media-stage
> > > > > >    we're using right now doesn't work with well with multiple committers.
> > > > > >
> > > > > >    Right now, the tree at linuxtv runs it, but it might end sending patches
> > > > > >    to the author and to linuxtv-commits ML that reached upstream from other
> > > > > >    trees. It has some logic to prevent that, but it is not bulletproof.
> > > > > >
> > > > > >    A replacement script is needed. Perhaps this can be executed together
> > > > > >    with the patchwork script (1B) at the committer's machine.    
> > > 
> > > This could possibly be done with 'b4 ty'.  
> > 
> > Call b4 ty after having patches merged at media staging tree works for me. 
> > Again placing it on a script that would for instance call pwclient and
> > b4 ty afterwards sounds the right thing to do.
> >   
> > > Another option is to rely on patchwork notifications instead. If a patch is 
> > > marked as merged, the notification e-mail sounds enough to notify the
> > > submitter.  
> > 
> > Patchwork notification e-mails is about patch reviews, being optional.
> > Most authors won't create accounts at patchwork, but are interested only
> > at the final result. "b4 ty" or similar sounds more appropriate to me.  
> 
> Does patchwork send notification to the author if they don't have an
> account ?

No. Even if the author has an account, notifications are opt-in.

> > Also, having such patches c/c to linuxtv-commits help maintainers,
> > committers and developers to keep track with tree updates.  
> 
> Who uses linuxtv-commits, and for what purpose ? I know I never look at
> it, but I'm interested in hearing if anyone uses it.

Currently, there are 42 people subscribed to it, receiving regular
updates. That's twice the number of people that will go to the media 
summit, so I suspect it is popular among developers and other people
interested on tracking the subsystem changes.

Also, authors receive e-mails from their own patches via the same
logic used by the mailing list, and people may still look at the
mailman archives when needed.

In my case, I use, when I suspect something wrong might have happened.
> 
> > > > The bar for sending stuff to drivers/staging is lower than for
> > > > drivers/media. According with Kernel's documentation at
> > > > Documentation/process/2.Process.rst:
> > > > 
> > > > 	"Current rules require that drivers contributed to staging
> > > > 	 must, at a minimum, compile properly."
> > > > 
> > > > We actually try to be better than that, but still when new stuff is
> > > > added to staging, while we try to also ensure no static code checkers
> > > > would fail, we may need to relax the rules, as it is not uncommon to
> > > > receive drivers that need extra care to follow Kernel coding style
> > > > there.    
> > > 
> > > Why can't we tell the submitter to fix the warnings first ? Especially
> > > if we can point them to a CI report, that would seem the best course of
> > > action to me. drivers/staging/ is meant for code that need more time to
> > > be considered stable enough for the kernel. The stabilization doesn't
> > > happen by magic, it requires someone actively working on it. If the
> > > submitter can't bother to fix the warnings, it doesn't forebode anything
> > > good and wouldn't make me confident that the code would ever get out of
> > > staging (other than simply being deleted).  
> > 
> > Surely we can ask fixes, but sometimes the driver is in so bad shape
> > that it may take some time, specially when it is a driver that came
> > from a developer without Linux upstream development experience. That
> > happened, for instance, when we merged lirc drivers, several USB non-uvc
> > camera drivers, atomisp, etc.
> > 
> > So, I'd say this will happen case by case, but, from the media CI PoV, 
> > an option to relax the checks for stuff under drivers/staging is needed.  
> 
> We *may* decide to accept a new driver that comes with warnings, but
> that would be a rare operation. Subsequent commits for the driver should
> not introduce new warnings.

Nobody (including me) wants to add drivers with warnings, but we still
accept them when really needed. So, from CI PoV, support for it is
needed, as it should be a discretionary decision for drivers/staging.

New warnings may appear naturally with either toolchain updates or with
changes that will reveal existing issues.

> > > > > > 4. We need to have some sort of "honour code": if undesired behavior
> > > > > >    is noticed, maintainers may temporarily (or permanently) revoke
> > > > > >    committer rights.      
> > > > > 
> > > > > That sounds like something to discuss on the media summit,     
> > > > 
> > > > Sure. That's why I'm asking to explicitly add it to the topics to be
> > > > discussed there ;-)
> > > > 
> > > > It would be nice if someone could come up with a proposal for 
> > > > it, although the discussions of such proposal should likely happen via 
> > > > email.
> > > > 
> > > > Also, the ones to be added there likely need to explicitly ack with
> > > > such code before being added to gitlab's permission group.    
> > > 
> > > This sounds fairly straightforward, I think we'll easily agree on rules.  
> > 
> > Sure, but a document with those and an explicit ack sounds an important
> > measure to avoid potential future problems.  
> 
> Yes, it will be explained in a public document.
> 
> > > > 5. The procedure for fixes wil remain the same. We'll have already enough
> > > >    things to make it work. Let's not add fixes complexity just yet.
> > > >    Depending on how well the new multi-committers experimental model
> > > >    works, we may think using it for fixes as well.    
> > > 
> > > I think this last point should still be discussed in Vienna. I want to
> > > design a clear workflow that covers -next and -fixes. I'm fine if we
> > > decide to then implement part of the workflow only as an initial step,
> > > if there are good enough reasons to do so.  
> > 
> > I don't see any need. There will be enough things for discussion there
> > just for -next, which is where 99% of the patches sit.
> > 
> > Handling -fixes require a different procedure, as maintainers need to
> > prepare an special PR to send them. Also, it is up to the maintainers 
> > to decide to either accept a patch as fixes or postpone to next,
> > as sometimes it is not a black and white decision if a patch belongs
> > to -fixes or if they will be postponed to the next merge week.
> > 
> > For instance, at -rc7, we usually postpone more complex fixes to
> > the merge window, as it is usually not a good idea to do last minute 
> > complex changes. If a committer write a fix patch during -rc7 and get
> > it merged, but the maintainers decide to postpone to the merge window,
> > the fix branch will require rebase.  
> 
> -next and -fixes are not independent. Even if they are handled through
> separate tree and processes, they need to take each other into account,
> as the -fixes branch may need to be back-merged in -next from time to
> time, and patches should never be applied to both -fixes and -next. We
> therefore need to agree on a process that will cover both. It doesn't
> mean -fixes will be handled through the shared tree right away if we
> decide there are good reasons not to do so.

Nothing changes on that regards, as we'll keep following upstream
best practices for -fixes, e. g.:

1) Fixes should be submitted to maintainers via PR;

2) Committers shall not merge patches that went to -fix inside -next.
   The maintainers will merge them from a -rc kernel that contains
   them, if needed.

Thanks,
Mauro

