Return-Path: <linux-media+bounces-17829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ECE96FD42
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 23:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA25FB22147
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 21:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2CF157A41;
	Fri,  6 Sep 2024 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q8uLSI01"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0DD47F46
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 21:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725657783; cv=none; b=Csb6orgW/UWxeTY3OlCpZtbsVgVIxnIueFFD5QdHicHMEQsYLBbhcSRtVvKaIiIKBmPmN3oOsEdpJTzzuW0nx81ouBVTcGKlnuGHvLr36Hk1aAc6AD8o1upZkBVf7eygtbee7NfKu2eUFCuffVEF9t250FoCvcUfO92mbld4xmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725657783; c=relaxed/simple;
	bh=TDcpyf2up2SfJXyOIK2W/OZVaSP031SOzP/EJgQyFUI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=A8vtTWbCilrhn62o332H5CdMPSfVLMyTy/+clMes0rTmlHAxm2hQfHgsp2xX7nNL+LxAh3kkwWM88sojc5GVV2Vc1Jm6fGTrDZ60T1rNsScd1ZZA3XwT99hwztf0BpKtTLr4k3X8lQt+uVeTAhB+2lFsQ5AifnYlpYG9qw91yI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q8uLSI01; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C862160;
	Fri,  6 Sep 2024 23:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725657702;
	bh=TDcpyf2up2SfJXyOIK2W/OZVaSP031SOzP/EJgQyFUI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q8uLSI01SfT2yZB/1BwM+iV5XpZKBk8nPueo822+XftErsoteHSKZxje11JUKJxNE
	 dkGMBpI2EGkcg8bXHoJeBFKSeTBDdUOcS2FlIXcVZWNZla9CmvDZDXhGXYbU5GtgWv
	 lz0zHEHkntiaCAg3NqQHA+ZhRPJqAtmdm72ZXdPo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240906180439.GA12915@pendragon.ideasonboard.com>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl> <20240906101141.451db4f4@foz.lan> <20240906103658.updwgahyisda5yid@basti-XPS-13-9310> <20240906131030.6880e5f5@foz.lan> <20240906132959.GC27086@pendragon.ideasonboard.com> <20240906194257.58902baf@foz.lan> <20240906180439.GA12915@pendragon.ideasonboard.com>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Ricardo Ribalda <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>, Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Fri, 06 Sep 2024 22:22:54 +0100
Message-ID: <172565777429.289188.13008941216744694473@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2024-09-06 19:04:39)
> Hi Mauro,
>=20
> (CC'ing Kieran, for a question below)
>=20
> First of all, I'd like to say that I think we agree on more points than
> may be apparent from the conversation. I believe this new process will
> lower the administrative burden on everybody, which should also come as
> a relief.
>=20
> On Fri, Sep 06, 2024 at 07:43:10PM +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 6 Sep 2024 16:29:59 +0300 Laurent Pinchart escreveu:
> > > On Fri, Sep 06, 2024 at 01:10:30PM +0200, Mauro Carvalho Chehab wrote:
> > > > Em Fri, 6 Sep 2024 12:36:58 +0200 Sebastian Fricke escreveu: =20
> > > > > On 06.09.2024 10:11, Mauro Carvalho Chehab wrote: =20
> > > > > > Em Thu, 5 Sep 2024 09:16:27 +0200 Hans Verkuil escreveu:
> > > > > >   =20
> > > > ... =20
> > > > > > 1. All committers shall use a common procedure for all merges.
> > > > > >
> > > > > >   This is easy said than done. So, IMO, it is needed some commo=
n scripts
> > > > > >   to be used by all committers. On my tests when merging two PR=
s there,
> > > > > >   those seems to be the minimal set of scripts that are needed:
> > > > > >
> > > > > >   a) script to create a new topic branch at linux-media/users/<=
user>
> > > > > >      The input parameter is the message-ID, e. g. something lik=
e:
> > > > > >
> > > > > >       create_media_staging_topic <topic_name> <message_id>
> > > > > >
> > > > > >      (eventually with an extra parameter with the name of the t=
ree)
> > > > > >
> > > > > >      It shall use patchwork REST interface to get the patches -=
 or at least
> > > > > >      to check if all patches are there (and then use b4).
> > > > > >
> > > > > >      such script needs to work with a single patch, a patch ser=
ies and a
> > > > > >      pull request.
> > > > > >
> > > > > >      the message ID of every patch, including the PR should be =
stored at
> > > > > >      the MR, as this will be needed to later update patchwork. =
=20
> > >=20
> > > I'm sure individual committers will want to optimize their workflow
> > > using scripts, and possibly share them, but what's wrong with simply
> > > using b4 ? With -l it will add a link to lore, so the message ID will=
 be
> > > available.
> > >=20
> > > I'd rather first focus on what we want to see included in commit
> > > messages, and then on how to make sure it gets there.
> >=20
> > It is not just running b4. There's the need of preparing a MR message t=
hat
> > matches the content of patch 0, very likely with the message IDs of pat=
ches
> > and PRs, and check if everything is in place on patchwork, as this is t=
he=20
> > main tool to track the pending queue. Surely b4 can be called on such s=
cript.
>=20
> Is that needed, or can we rely on the Link: tag of individual patches to
> find the corresponding patch in patchwork ?
>=20
> > It doesn't need to be complex, but it should automate the basic steps t=
hat
> > all committers will use.
> > =20
> > > > > >
> > > > > >   b) once gitlab CI runs, there are two possible outcomes: patc=
hes may
> > > > > >      pass or not. If they pass, a MR will be created and eventu=
ally be
> > > > > >      merged.
> > > > > >
> > > > > >      Either merged or not (because something failed or the patc=
hes require
> > > > > >      more work), the patchwork status of the patch require chan=
ges to
> > > > > >      reflect what happened. IMO, another script is needed to up=
date the
> > > > > >      patch/patch series/PR on patchwork on a consistent way.
> > > > > >
> > > > > >      This is actually a *big* gap we have here. I have a script=
 that
> > > > > >      manually check patchwork status and the gap is huge. curre=
ntly,
> > > > > >      there are 73 patches that seems to be merged, but patchwor=
k was not
> > > > > >      updated.
> > > > > >
> > > > > >      From what I noticed, some PR submitters almost never updat=
e patchwork
> > > > > >      after the merges.   =20
> > > > >=20
> > > > > Interesting I thought that is how it should be? I mean if I send =
a PR,
> > > > > the one taking the PR must decide whether he wants to pull it, so=
 the
> > > > > decision whether the set is accepted should be on the one pulling=
 the
> > > > > changes and not on the one pushing them. Right? =20
> > > >=20
> > > > Yes, but you still need to update previous attempts to submit the
> > > > work. So, let's see a patch series at v9 got a PR. It is up to you
> > > > to cleanup everything on patchwork from v1 to v8. =20
> > >=20
> > > That should be done before though, when v2 is submitted, v1 should be
> > > marked as superseded.=20
> >=20
> > Agreed. Still most of the ones sending PRs those days don't do that.
> >=20
> > > Isn't there a patchwork bot that can help with this ?=20
> >=20
> > As far as I'm aware, no.
>=20
> Kieran, aren't you running such a bot for libcamera ?

Yes, but I find it a bit hit-and-miss for superseeding and haven't checked =
through or
updated it lately. It's still running somewhat daily though, and it
catches patches being merged quite well - but it's just based on commit
title/subject.

It's derived from the kernel patchwork bot:

 - https://korg.docs.kernel.org/patchwork/pwbot.html
 - https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/=
tree/git-patchwork-bot.py

--
Kieran


> > > It's not perfect in the sense that it doesn't always match new
> > > versions with previous ones, but if it can lower the manual burden by
> > > even 80%, it's a big win.
> > >=20
> > > > Now, the committer handing PR for v9 should be in charge of updating
> > > > the status of it and the patches that belong to it, once the patch
> > > > is merged or once he takes a decision otherwise. =20
> > >=20
> > > Today most authors don't have a patchwork account, so they can't upda=
te
> > > the status themselves. The responsibility mostly falls on you and Han=
s.
> >=20
> > The responsibility is for the ones that submit PRs. Unfortunately, this
> > is a process that it is not working right now.=20
> >=20
> > See, if you're reviewing a v2 of a patch series, you know that v1 is
> > obsolete. It should be easy to run a script that would take the v1
> > patch series and update patchwork to mark all v1 patches obsoleted.
>=20
> In many cases that could be automated, but sometimes locating the
> previous version automatically won't work. There will likely be some
> amount of manual work. Tooling could help.
>=20
> > > I'm fine with moving this to committers, which will make your life
> > > easier. The patchwork update when merging a branch should ideally be
> > > done automatically by the gitlab instance. If we have lore links in t=
he
> > > commit messages, that sounds doable.
> >=20
> > With multi-committer, it won't be possible anymore for Hans and I do
> > do such updates, as the workflow will be handled by the committers.
> >=20
> > So, all committers will need to cleanup patch status on patchwork.
>=20
> As I wrote above, that's fine with me, and hopefully that will also make
> your life easier (unless you tell me you enjoy updating patchwork
> manually :-)).
>=20
> > > > > >
> > > > > >      So another script to solve this gap is needed, doing updat=
es on all
> > > > > >      patches that were picked by the first script. Something li=
ke:   =20
> > > > >=20
> > > > > Shouldn't the update happen after the MR has been created instead,
> > > > > because only after running the CI we know whether the tests fail =
or
> > > > > pass? From what you say above it sounds like the first script mer=
ely
> > > > > prepares a topic branch to be tested. =20
> > > >=20
> > > > the first script I mentioned prepares and pushes the topic branch. =
The
> > > > patchwork update script (the second one) can be used on several par=
ts
> > > > of the workflow:
> > > >=20
> > > > - before MR: if the committer decides to not merge the changes, bec=
ause
> > > >   it didn't pass on his review;
> > > > - after MR pipeline failures;
> > > > - after MR being merged: once it reaches media-staging master.
> > > >  =20
> > > > > >      update_patchwork_from_topic <topic_name> <new_status>
> > > > > >
> > > > > >      This would likely need to use some logic to pick the messa=
ge IDs
> > > > > >      of the patch inside the MR.
> > > > > >
> > > > > >      Such script could also check for previous versions of the =
patch
> > > > > >      and for identical patches (it is somewhat common to receiv=
e identical
> > > > > >      patches with trivial fixes from different developers).
> > > > > >
> > > > > >   Someone needs to work on such script, as otherwise the multi =
committers
> > > > > >   model may fail, and we risk needing to return back to the cur=
rent model.   =20
> > > > >=20
> > > > > Just my personal thought: This sounds a bit extreme to me, I mean=
 we are
> > > > > currently in the first test run as preparation for the Media-summ=
it
> > > > > where we actually want to discuss policies and further requiremen=
ts. =20
> > > >=20
> > > > What I'm saying is that multiple-committers model will only work if
> > > > all committers follow a common procedure (still variants between
> > > > committers is possible, provided that the minimal set is followed).
> > > >=20
> > > > If this doesn't happens, maintainers may be forced to do rebases an=
d other
> > > > manual fixes, with will actually make life worse for everyone. That=
's
> > > > what I want to avoid by having a common set of scripts for the very=
 basic
> > > > tasks: create a topic branch for CI to test and update patchwork.  =

> > >=20
> > > The issues you've listed above are about updating status of patches in
> > > patchwork. That's important (or otherwise we should drop patchwork if=
 we
> > > think it's not important, but I don't think that's the case), but I
> > > hardly see how missing updates to patchwork would call for a rebase :=
-)
> >=20
> > The need for rebase typically won't be due to patchwork[1], but to
> > broken processes to validate patches that may happen if the patches
> > don't reach first a tree under linux-media/users; if someone uses a wro=
ng
> > version of compliance utils; if it has a broken topic branch, etc.
> > E. g. it may happen if the agreed process isn't be followed to the
> > letter.
>=20
> I think we all agree on the need of a clearly documented and simple to
> understand process.
>=20
> > [1] Still, rebases might still be needed if the developer is not taking
> >     enough care on patchwork. See, if a developer sends a patch X with a
> >     change, and some days/weeks later another developer sends a patch Y
> >     identical to X, except for the author (and eventually description),=
=20
> >     if patch Y is merged, there will be a need to drop it and pick X, to
> >     properly give credits to the right person.
>=20
> No, that doesn't call for a rebase. If we really want to credit patch X
> in the git history, we can revert Y and apply X. In most cases the
> author of patch X will not mind that Y got applied.
>=20
> > > There's a need to make sure that what lands in the shared tree is
> > > proper, and for that we need a clearly documented procedure. At this
> > > point I don't think it requires a committer tool script, even if in t=
he
> > > future developing such a tool could help.
> > >=20
> > > > > > 2. The mailbomb script that notifies when a patch is merged at =
media-stage
> > > > > >    we're using right now doesn't work with well with multiple c=
ommitters.
> > > > > >
> > > > > >    Right now, the tree at linuxtv runs it, but it might end sen=
ding patches
> > > > > >    to the author and to linuxtv-commits ML that reached upstrea=
m from other
> > > > > >    trees. It has some logic to prevent that, but it is not bull=
etproof.
> > > > > >
> > > > > >    A replacement script is needed. Perhaps this can be executed=
 together
> > > > > >    with the patchwork script (1B) at the committer's machine.  =

> > >=20
> > > This could possibly be done with 'b4 ty'.
> >=20
> > Call b4 ty after having patches merged at media staging tree works for =
me.=20
> > Again placing it on a script that would for instance call pwclient and
> > b4 ty afterwards sounds the right thing to do.
> >=20
> > > Another option is to rely on patchwork notifications instead. If a pa=
tch is=20
> > > marked as merged, the notification e-mail sounds enough to notify the
> > > submitter.
> >=20
> > Patchwork notification e-mails is about patch reviews, being optional.
> > Most authors won't create accounts at patchwork, but are interested only
> > at the final result. "b4 ty" or similar sounds more appropriate to me.
>=20
> Does patchwork send notification to the author if they don't have an
> account ?
>=20
> > Also, having such patches c/c to linuxtv-commits help maintainers,
> > committers and developers to keep track with tree updates.
>=20
> Who uses linuxtv-commits, and for what purpose ? I know I never look at
> it, but I'm interested in hearing if anyone uses it.
>=20
> > > > The bar for sending stuff to drivers/staging is lower than for
> > > > drivers/media. According with Kernel's documentation at
> > > > Documentation/process/2.Process.rst:
> > > >=20
> > > >   "Current rules require that drivers contributed to staging
> > > >    must, at a minimum, compile properly."
> > > >=20
> > > > We actually try to be better than that, but still when new stuff is
> > > > added to staging, while we try to also ensure no static code checke=
rs
> > > > would fail, we may need to relax the rules, as it is not uncommon to
> > > > receive drivers that need extra care to follow Kernel coding style
> > > > there. =20
> > >=20
> > > Why can't we tell the submitter to fix the warnings first ? Especially
> > > if we can point them to a CI report, that would seem the best course =
of
> > > action to me. drivers/staging/ is meant for code that need more time =
to
> > > be considered stable enough for the kernel. The stabilization doesn't
> > > happen by magic, it requires someone actively working on it. If the
> > > submitter can't bother to fix the warnings, it doesn't forebode anyth=
ing
> > > good and wouldn't make me confident that the code would ever get out =
of
> > > staging (other than simply being deleted).
> >=20
> > Surely we can ask fixes, but sometimes the driver is in so bad shape
> > that it may take some time, specially when it is a driver that came
> > from a developer without Linux upstream development experience. That
> > happened, for instance, when we merged lirc drivers, several USB non-uvc
> > camera drivers, atomisp, etc.
> >=20
> > So, I'd say this will happen case by case, but, from the media CI PoV, =

> > an option to relax the checks for stuff under drivers/staging is needed.
>=20
> We *may* decide to accept a new driver that comes with warnings, but
> that would be a rare operation. Subsequent commits for the driver should
> not introduce new warnings.
>=20
> > > > > > 4. We need to have some sort of "honour code": if undesired beh=
avior
> > > > > >    is noticed, maintainers may temporarily (or permanently) rev=
oke
> > > > > >    committer rights.   =20
> > > > >=20
> > > > > That sounds like something to discuss on the media summit,  =20
> > > >=20
> > > > Sure. That's why I'm asking to explicitly add it to the topics to be
> > > > discussed there ;-)
> > > >=20
> > > > It would be nice if someone could come up with a proposal for=20
> > > > it, although the discussions of such proposal should likely happen =
via=20
> > > > email.
> > > >=20
> > > > Also, the ones to be added there likely need to explicitly ack with
> > > > such code before being added to gitlab's permission group. =20
> > >=20
> > > This sounds fairly straightforward, I think we'll easily agree on rul=
es.
> >=20
> > Sure, but a document with those and an explicit ack sounds an important
> > measure to avoid potential future problems.
>=20
> Yes, it will be explained in a public document.
>=20
> > > > 5. The procedure for fixes wil remain the same. We'll have already =
enough
> > > >    things to make it work. Let's not add fixes complexity just yet.
> > > >    Depending on how well the new multi-committers experimental model
> > > >    works, we may think using it for fixes as well. =20
> > >=20
> > > I think this last point should still be discussed in Vienna. I want to
> > > design a clear workflow that covers -next and -fixes. I'm fine if we
> > > decide to then implement part of the workflow only as an initial step,
> > > if there are good enough reasons to do so.
> >=20
> > I don't see any need. There will be enough things for discussion there
> > just for -next, which is where 99% of the patches sit.
> >=20
> > Handling -fixes require a different procedure, as maintainers need to
> > prepare an special PR to send them. Also, it is up to the maintainers=20
> > to decide to either accept a patch as fixes or postpone to next,
> > as sometimes it is not a black and white decision if a patch belongs
> > to -fixes or if they will be postponed to the next merge week.
> >=20
> > For instance, at -rc7, we usually postpone more complex fixes to
> > the merge window, as it is usually not a good idea to do last minute=20
> > complex changes. If a committer write a fix patch during -rc7 and get
> > it merged, but the maintainers decide to postpone to the merge window,
> > the fix branch will require rebase.
>=20
> -next and -fixes are not independent. Even if they are handled through
> separate tree and processes, they need to take each other into account,
> as the -fixes branch may need to be back-merged in -next from time to
> time, and patches should never be applied to both -fixes and -next. We
> therefore need to agree on a process that will cover both. It doesn't
> mean -fixes will be handled through the shared tree right away if we
> decide there are good reasons not to do so.
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

