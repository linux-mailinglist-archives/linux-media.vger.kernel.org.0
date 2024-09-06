Return-Path: <linux-media+bounces-17760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD9996F271
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 13:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11FD61F21D01
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 11:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57EF1CB150;
	Fri,  6 Sep 2024 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urPze1YR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D69B1C9ECA
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725621038; cv=none; b=GUlQQwNpAvaYqVlkERQhEONryTJsdE7fImyNcvnVOX9v7DtabWAUBjzm0hQ2wEqchc8u8Um+lj5E8uRarp3B0DNTsOPHzsLh6netjo1DC6QevSuhQLAjd/NyHLLjss/GV4GhtpU5zaFZUwDhHJ24nCXzV82ZyOq+Vi3xnBWUL/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725621038; c=relaxed/simple;
	bh=QLRwqq3/wyH1aDLYTR7BaauW4lF+sD+CFVWSQFtqQbo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aeHYum0YL/ugYjCRAfKVdYyuG5Ez7AazSUfZOkHnhCZd6Ml7bI5gbNO5wAHWdexB0V+7RPrWpUPi47caTnuOA+OMeJUt3sJEDdTWW7iFDnsu7ArSc73CroEyKbEuvAWTOySjvaSPzrDMGXI3D52PpYaFHbHVvZapV3fsoHxi//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=urPze1YR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAA6C4CEC4;
	Fri,  6 Sep 2024 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725621037;
	bh=QLRwqq3/wyH1aDLYTR7BaauW4lF+sD+CFVWSQFtqQbo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=urPze1YRuRywXwNHd8whWLABb78c0vqrSHL0IBVOSBOzVuR02S6BBdpKU5mMXKL9m
	 m6KWs0O1PmD3smyN+utbRDTzFBWoAqPAoilZox3cAlViq9DI225TXq1mPdIMV7Lhfd
	 E1saB+a6JLo0V5Vd1QEPosFJz6eGImbzc62dVp+E792zNzQb0L/F8Z5uVREZpWTgYm
	 elv2kxmg5DN1zsja+Pgxcim+eFPcc445OCWXJtF9gJjxQYhZ+Xw13tCCJQNaZ6NYqL
	 UpX4+rNh7ew1EyZ5MnpFdtB7tiB2Zom3UTMJ/YjS1dw6vmovcssYZgcanXSxdTjBhh
	 2z4GEvyae80zQ==
Date: Fri, 6 Sep 2024 13:10:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori
 Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar
 <devarsht@ti.com>, r-donadkar@ti.com
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
Message-ID: <20240906131030.6880e5f5@foz.lan>
In-Reply-To: <20240906103658.updwgahyisda5yid@basti-XPS-13-9310>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
	<20240906101141.451db4f4@foz.lan>
	<20240906103658.updwgahyisda5yid@basti-XPS-13-9310>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 6 Sep 2024 12:36:58 +0200
Sebastian Fricke <sebastian.fricke@collabora.com> escreveu:

> Hey Mauro,
> 
> On 06.09.2024 10:11, Mauro Carvalho Chehab wrote:
> >Em Thu, 5 Sep 2024 09:16:27 +0200
> >Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >  
...
> >1. All committers shall use a common procedure for all merges.
> >
> >   This is easy said than done. So, IMO, it is needed some common scripts
> >   to be used by all committers. On my tests when merging two PRs there,
> >   those seems to be the minimal set of scripts that are needed:
> >
> >   a) script to create a new topic branch at linux-media/users/<user>
> >      The input parameter is the message-ID, e. g. something like:
> >
> >	create_media_staging_topic <topic_name> <message_id>
> >
> >      (eventually with an extra parameter with the name of the tree)
> >
> >      It shall use patchwork REST interface to get the patches - or at least
> >      to check if all patches are there (and then use b4).
> >
> >      such script needs to work with a single patch, a patch series and a
> >      pull request.
> >
> >      the message ID of every patch, including the PR should be stored at
> >      the MR, as this will be needed to later update patchwork.
> >
> >   b) once gitlab CI runs, there are two possible outcomes: patches may
> >      pass or not. If they pass, a MR will be created and eventually be
> >      merged.
> >
> >      Either merged or not (because something failed or the patches require
> >      more work), the patchwork status of the patch require changes to
> >      reflect what happened. IMO, another script is needed to update the
> >      patch/patch series/PR on patchwork on a consistent way.
> >
> >      This is actually a *big* gap we have here. I have a script that
> >      manually check patchwork status and the gap is huge. currently,
> >      there are 73 patches that seems to be merged, but patchwork was not
> >      updated.
> >
> >      From what I noticed, some PR submitters almost never update patchwork
> >      after the merges.  
> 
> Interesting I thought that is how it should be? I mean if I send a PR,
> the one taking the PR must decide whether he wants to pull it, so the
> decision whether the set is accepted should be on the one pulling the
> changes and not on the one pushing them. Right?

Yes, but you still need to update previous attempts to submit the
work. So, let's see a patch series at v9 got a PR. It is up to you
to cleanup everything on patchwork from v1 to v8.

Now, the committer handing PR for v9 should be in charge of updating
the status of it and the patches that belong to it, once the patch
is merged or once he takes a decision otherwise.

> >
> >      So another script to solve this gap is needed, doing updates on all
> >      patches that were picked by the first script. Something like:  
> 
> Shouldn't the update happen after the MR has been created instead,
> because only after running the CI we know whether the tests fail or
> pass? From what you say above it sounds like the first script merely
> prepares a topic branch to be tested.

the first script I mentioned prepares and pushes the topic branch. The
patchwork update script (the second one) can be used on several parts
of the workflow:

- before MR: if the committer decides to not merge the changes, because
  it didn't pass on his review;
- after MR pipeline failures;
- after MR being merged: once it reaches media-staging master.

> >      update_patchwork_from_topic <topic_name> <new_status>
> >
> >      This would likely need to use some logic to pick the message IDs
> >      of the patch inside the MR.
> >
> >      Such script could also check for previous versions of the patch
> >      and for identical patches (it is somewhat common to receive identical
> >      patches with trivial fixes from different developers).
> >
> >   Someone needs to work on such script, as otherwise the multi committers
> >   model may fail, and we risk needing to return back to the current model.  
> 
> Just my personal thought: This sounds a bit extreme to me, I mean we are
> currently in the first test run as preparation for the Media-summit
> where we actually want to discuss policies and further requirements.

What I'm saying is that multiple-committers model will only work if
all committers follow a common procedure (still variants between
committers is possible, provided that the minimal set is followed).

If this doesn't happens, maintainers may be forced to do rebases and other
manual fixes, with will actually make life worse for everyone. That's
what I want to avoid by having a common set of scripts for the very basic
tasks: create a topic branch for CI to test and update patchwork.

> >2. The mailbomb script that notifies when a patch is merged at media-stage
> >   we're using right now doesn't work with well with multiple committers.
> >
> >   Right now, the tree at linuxtv runs it, but it might end sending patches
> >   to the author and to linuxtv-commits ML that reached upstream from other
> >   trees. It has some logic to prevent that, but it is not bulletproof.
> >
> >   A replacement script is needed. Perhaps this can be executed together
> >   with the patchwork script (1B) at the committer's machine.
> >
> >3. Staging require different rules, as smatch/spatch/sparse/checkpatch
> >   warnings and errors can be acceptable.  
> 
> I thought that we came to a consensus that only warnings are acceptable?
> If we accept errors in the staging but not in media master, does that
> mean that we ought to send patches to the media staging tree then?
> I'd vote for only allowing patches without errors into the staging tree
> and in the worst case add a list with acceptable errors.

No, you got me wrong. By staging, I'm referring to drivers/staging/
not to the multi-committers tree.

The bar for sending stuff to drivers/staging is lower than for
drivers/media. According with Kernel's documentation at
Documentation/process/2.Process.rst:

	"Current rules require that drivers contributed to staging
	 must, at a minimum, compile properly."

We actually try to be better than that, but still when new stuff is
added to staging, while we try to also ensure no static code checkers
would fail, we may need to relax the rules, as it is not uncommon to
receive drivers that need extra care to follow Kernel coding style
there.

> >4. We need to have some sort of "honour code": if undesired behavior
> >   is noticed, maintainers may temporarily (or permanently) revoke
> >   committer rights.  
> 
> That sounds like something to discuss on the media summit, 

Sure. That's why I'm asking to explicitly add it to the topics to be
discussed there ;-)

It would be nice if someone could come up with a proposal for 
it, although the discussions of such proposal should likely happen via 
email.

Also, the ones to be added there likely need to explicitly ack with
such code before being added to gitlab's permission group.

> revoking
> commit rights shouldn't be hard as you just have to remove push rights
> for that GitLab tree.

Technically yes, but in practice this is usually very hard, as we're
dealing with people that will very likely be very unhappy of getting banned.

Thanks,
Mauro

