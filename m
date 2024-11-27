Return-Path: <linux-media+bounces-22186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16399DA86E
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 14:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6472616612A
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AA51FCF55;
	Wed, 27 Nov 2024 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QBkgsbQQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FD1FAC5F;
	Wed, 27 Nov 2024 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732713937; cv=none; b=JNsZqRQvydypToNwS9FXQGjtF5q4Hs+i+GSLMZram/k34fcM1iHA+rJ7B0tH4/nMDCPoDMHMqJizOXiumZdj453J8eu6LwFaG2xdRVRbulcMFGZNZ83ScfgcRwZTAByFYaHGc0tBYPxONVBhtETrjBfI4+GMNe1J42eUpMgBXDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732713937; c=relaxed/simple;
	bh=d+CD6S5kOs/bH+83qgQ0Rfqp862ML78mdoCGI05nb2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hY7MmtBrXdweHKnycKcup3VfbAYDx/PFZOjx/ctG9SPPuI+C3Q/uMX7Y+/43UwkDoRkjJTSGvdC1frEsjPLt+g+n9yJ94zgO7yMNcsYq2wzIulBFmnuGJMvOqZrMZuZLD6dAkwzJEwgqIvNXpQH5zJ7wz/qfHuTBOUlTv3Y3Cyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QBkgsbQQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07099792;
	Wed, 27 Nov 2024 14:25:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732713903;
	bh=d+CD6S5kOs/bH+83qgQ0Rfqp862ML78mdoCGI05nb2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QBkgsbQQWBaC9b4B/s3dHnAgViJV8YhZ4VvlPL/DCJpNeNwbCidj2KUkX58fk5BZW
	 uxoczowC0YOgTXfJJd4vrIlgWQmCpmCJ8esQjDu0x6K8rN2OlWKz5isP3LC2ROUsTf
	 vlSFKiXr9F2SkoMiybT66W6XyqG7ZXiYaJiolFgU=
Date: Wed, 27 Nov 2024 15:25:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241127132515.GH31095@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>

Hi Hans,

On Wed, Nov 27, 2024 at 12:59:58PM +0100, Hans Verkuil wrote:
> Hi Laurent,
> 
> Thank you for your constructive feedback! In my reply I didn't comment on your
> trivial changes like grammar/spelling, unless otherwise noted I'm OK with those.

Some of the points you raised are also discussed in the other part of
the mail thread. I'll elaborate here on the ones that are unique, and
just mention for the other ones that we can discuss them in my reply to
Mauro to avoid splitting the discussion.

> On 26/11/2024 16:19, Laurent Pinchart wrote:
> > Hi Mauro and Hans,
> > 
> > On Mon, Nov 25, 2024 at 02:28:58PM +0100, Mauro Carvalho Chehab wrote:
> >> As the media subsystem will experiment with a multi-committers model,
> >> update the Maintainer's entry profile to the new rules, and add a file
> >> documenting the process to become a committer and to maintain such
> >> rights.
> >>
> >> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
> >> ---
> >>  Documentation/driver-api/media/index.rst      |   1 +
> >>  .../media/maintainer-entry-profile.rst        | 193 ++++++++++----
> >>  .../driver-api/media/media-committer.rst      | 252 ++++++++++++++++++
> >>  .../process/maintainer-pgp-guide.rst          |   2 +
> >>  4 files changed, 398 insertions(+), 50 deletions(-)
> >>  create mode 100644 Documentation/driver-api/media/media-committer.rst
> >>
> >> diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
> >> index d5593182a3f9..d0c725fcbc67 100644
> >> --- a/Documentation/driver-api/media/index.rst
> >> +++ b/Documentation/driver-api/media/index.rst
> >> @@ -26,6 +26,7 @@ Documentation/userspace-api/media/index.rst
> >>      :numbered:
> >>  
> >>      maintainer-entry-profile
> >> +    media-committer
> >>  
> >>      v4l2-core
> >>      dtv-core
> >> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> >> index ffc712a5f632..90c6c0d9cf17 100644
> >> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> >> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> >> @@ -27,19 +27,128 @@ It covers, mainly, the contents of those directories:
> >>  Both media userspace and Kernel APIs are documented and the documentation
> >>  must be kept in sync with the API changes. It means that all patches that
> >>  add new features to the subsystem must also bring changes to the
> >> -corresponding API files.
> >> +corresponding API documentation files.
> > 
> > I would have split this kind of small changes to a separate patch to
> > make reviews easier, but that's not a big deal.
> > 
> >>  
> >> -Due to the size and wide scope of the media subsystem, media's
> >> -maintainership model is to have sub-maintainers that have a broad
> >> -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> >> -task to review the patches, providing feedback to users if the patches are
> >> +Due to the size and wide scope of the media subsystem, the media's
> >> +maintainership model is to have committers that have a broad knowledge of
> >> +a specific aspect of the subsystem. It is the committers' task to
> >> +review the patches, providing feedback to users if the patches are
> >>  following the subsystem rules and are properly using the media kernel and
> >>  userspace APIs.
> > 
> > This sounds really like a maintainer definition. I won't bikeshed too
> > much on the wording though, we will always be able to adjust it later to
> > reflect the reality of the situation as it evolves. I do like the
> > removal of the "sub-maintainer" term though, as I've always found it
> > demeaning.
> 
> Yeah, that was never a great name.
> 
> >>  
> >> -Patches for the media subsystem must be sent to the media mailing list
> >> -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> >> -HTML will be automatically rejected by the mail server. It could be wise
> >> -to also copy the sub-maintainer(s).
> >> +Media committers
> >> +----------------
> >> +
> >> +In the media subsystem, there are experienced developers that can commit
> > 
> > s/that/who/
> > s/commit/push/ to standardize the vocabulary (below you use "upload" to
> > mean the same thing)
> > 
> >> +patches directly on a development tree. These developers are called
> > 
> > s/on a/to the/
> > 
> >> +Media committers and are divided into the following categories:
> >> +
> >> +- Committers: responsible for one or more drivers within the media subsystem.
> >> +  They can upload changes to the tree that do not affect the core or ABI.
> > 
> > s/upload/push/
> > 
> >> +
> >> +- Core committers: responsible for part of the media core. They are typically
> >> +  responsible for one or more drivers within the media subsystem, but, besides
> >> +  that, they can also merge patches that change the code common to multiple
> >> +  drivers, including the kernel internal API/ABI.
> > 
> > I would write "API" only here. Neither the kernel internal API nor its
> > internal ABI are stable, and given that lack of stability, the ABI
> > concept doesn't really apply within the kernel.
> 
> I agree.
> 
> >> +
> >> +- Subsystem maintainers: responsible for the subsystem as a whole, with
> >> +  access to the entire subsystem.
> >> +
> >> +  Only subsystem maintainers can change the userspace API/ABI.
> > 
> > This can give the impression that only subsystem maintainers are allowed
> > to work on the API. I would write
> > 
> >   Only subsystem maintainers change push changes that affect the userspace
> >   API/ABI.
> 
> change push changes -> can push changes
> 
> >> +
> >> +Media committers shall explicitly agree with the Kernel development process
> > 
> > Do we have to capitalize "Kernel" everywhere ? There are way more
> > occurrences of "kernel" than "Kernel" in Documentation/ (even excluding
> > the lower case occurrences in e-mail addresses, file paths, ...).
> 
> Personally I prefer lower case as well. Not a big deal for me, but it is
> certainly more consistent with how it is commonly written.
> 
> >> +as described at Documentation/process/index.rst and to the Kernel
> >> +development rules inside the Kernel documentation, including its code of
> >> +conduct.
> > 
> > That's expected of all kernel developers, but I don't object reiterating
> > it here.
> > 
> >> +
> >> +More details about media committers can be found here:
> > 
> > Maybe "about media commiters' roles and responsibilities" would be more
> > accurate, the document doesn't include information about the committers
> > themselves.
> 
> That's indeed better.
> 
> > 
> > s/here:/at/
> > 
> >> +Documentation/driver-api/media/media-committer.rst.
> > 
> > Should this be a RST link ?
> > 
> >> +
> >> +Media development tree
> >> +----------------------
> >> +
> >> +The main development tree used by the media subsystem is hosted at LinuxTV.org,
> >> +where we also maintain news about the subsystem, wiki pages and a patchwork
> >> +instance where we track patches though their lifetime.
> >> +
> >> +The main tree used by media developers is at:
> >> +
> >> +https://git.linuxtv.org/media.git/
> > 
> > I think the multi-committers tree should be upgraded to main development
> > tree status, but that's a separate issue that I'm fine discussing
> > separately, and also delaying for a few kernel releases until we iron
> > out the rough edges of the process.
> 
> Something to discuss in a year or so.
> 
> >> +
> >> +.. _Media development workflow:
> >> +
> >> +Media development workflow
> >> +++++++++++++++++++++++++++
> >> +
> >> +All changes for the media subsystem must be sent first as e-mails to the
> >> +media mailing list, as plain text only e-mail to:
> >> +
> >> +  `https://subspace.kernel.org/vger.kernel.org.html <linux-media@vger.kernel.org>`_
> >> +
> >> +Emails with HTML will be automatically rejected by the mail server.
> >> +It could be wise to also copy the media committer(s). You should use
> >> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
> >> +Please always copy driver's authors and maintainers.
> > 
> > Instead of duplicating a tiny part of the patch submission process, I
> > would link to the appropriate documentation.
> 
> Makes sense.
> 
> > 
> > [1] (see below)
> > 
> >> +
> >> +Such patches needed to be based against a public branch or tag as follows:
> > 
> > s/needed/need/
> > 
> >> +
> >> +1. new Kernel releases:
> > 
> > s/new/New/
> > 
> > What does that mean though ? It's not very clear.
> > 
> >> +
> >> +   Those need to be based at the ``next`` branch of that media.git tree
> >> +
> >> +2. During Kernel release development cycle, patches fixing bugs on a -rc
> >> +   kernel should preferably be against the latest -rc1 Kernel. If they
> >> +   require a previously-applied change, they need to be against the ``fixes``
> >> +   branch;
> >> +
> >> +3. Patches against an already released kernel should preferably be  against
> >> +   the latest released Kernel. If they require a previously-applied
> >> +   change, they need to be against ``fixes``.
> > 
> > If I were a new contributor I think I would have trouble understand this
> > to be honest. I won't push hard for a rework of this section, as I
> > expect it will change after the multi-committer tree becomes the main
> > way to get patches merged. We can then update the documentation.
> 
> I wonder if this shouldn't be rewritten completely, e.g. something like this:
> 
> 1) By default patches are against the ``next`` branch of that media.git tree.
> 
> 2) Patches that need to fix bugs in the -rcX kernel should preferably be
>    against the latest -rc kernel.
> 
> Is there really anything else? These two cases are all I use in practice.

I've replied to Mauro on this particular point, and I think it would be
clearer to split patches as features (not fixes), fixes for a released
kernel, fixes for an unreleased kernel. Let's discuss that there.

> >> +
> >> +All patches with fixes shall have:
> >> +   - a ``Fixes:`` tag pointing to the first commit that introduced the bug;
> >> +   - a ``Cc: stable@vger.kernel.org``
> >> +
> >> +Patches that were fixing bugs reported by someone else shall have:
> >> +  - a ``Reported-by`` tag immediately followed by a ``Closes`` tag.
> > 
> > There's been a recent discussion about not including a Reported-by tag
> > without asking permission from the reporter, due to privacy reasons (in
> > particular for bugs reported to https://bugzilla.kernel.org/, as by
> > default the e-mail address of the reporter is not public). As the
> > Reported-by and Closes tags are not specific to the media tree, I would
> > drop this paragraph, otherwise we will have to duplicate a relatively
> > large amount of information related to privacy. You can link to the
> > relevant documentation instead, but I wouldn't even do that as it's
> > really not media-specific.
> 
> I agree. Note that I tend to ask first for permission, unless I know the
> reporter is a kernel contributor already, or is otherwise active in the open
> source world and so the email is public already.
> 
> >> +
> >> +Patches that change API/ABI shall require patches to update documentation
> > 
> > s/require patches to //
> > 
> >> +accordingly at the same patch series.
> > 
> > s/at the/in the/
> > 
> >> +
> >> +See Documentation/process/index.rst for more details about e-mail submission.
> > 
> > This could be moved up to [1].
> > 
> >> +
> >> +Once a patch is submitted, it may follow either one of the workflows
> >> +below:
> > 
> > "of the following workflows"
> > 
> >> +
> >> +a. Normal workflow: patches are handled by subsystem maintainers::
> >> +
> >> +     +------+   +---------+   +-------+   +-------------------+   +---------+
> >> +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge  |-->|media.git|
> >> +     +------+   +---------+   |request|   |at media-committers|   +---------+
> >> +                              +-------+   +-------------------+
> > 
> > This makes it look like the pull request originates from patchwork.
> > 
> > s/at /in /
> > 
> > I would also add .git to media-committers to make it clear it's a git
> > tree.
> > 
> > (I still think the tree name is too long and not very appropriate, but
> > that's a different question)
> > 
> >> +
> >> +   For this workflow, pull requests can be generated by a committer,
> >> +   a previous committer, subsystem maintainers or by a couple of trusted
> >> +   long-time contributors. If you are not in such group, please don't submit
> >> +   pull requests, as they will likely be ignored.
> >> +
> >> +b. Committers' workflow: patches are handled by media committers::
> >> +
> >> +     +------+   +---------+   +-------------------+   +-----------+   +---------+
> >> +     |e-mail|-->|patchwork|-->|committers merge   |-->|maintainers|-->|media.git|
> >> +     +------+   +---------+   |at media-committers|   |approval   |   +---------+
> >> +                              +-------------------+   +-----------+
> >> +
> >> +When patches are merged at patchwork and when merged at media-committers,
> > 
> > We don't "merge" patches in patchwork. You could write "When patches are
> > picked by patchwork" for instance.
> > 
> >> +CI bots will check for errors and may provide e-mail feedback about
> >> +patch problems. When this happens, the e-mail author must fix them
> > 
> > s/e-mail author/patch author/ ? Or possibly better, "patch submitter" as
> > that person may not be the author.
> > 
> >> +and send another version of the patch.
> >> +
> >> +Patches will only be moved to the next stage in those two workflows if they
> >> +don't fail on CI or if there are false-positives at the CI reports.
> > 
> > s/at the/in the/
> > 
> >> +
> > 
> > This workflow doesn't apply to patch submitters who are not allowed to
> > send pull requests and who don't have direct commit access. I thought
> > these submitters are the main audience of this document. In that case, I
> > think moving the next section that explains the e-mail workflow before
> > the "Media development workflow" section (which should likely be renamed
> > to make it clear that it is about merging patches, not developing them)
> > would be best. The "Review Cadence" section could also be folded in
> > there, to give a full view of what a submitter can expect.
> > 
> > This would also have the advantage of introducing the linuvtv.org
> > patchwork instance, which you reference above. Documents are more
> > readable when they introduce concepts first before using them.
> 
> I think that's a good idea.
> 
> >> +Failures during e-mail submission
> >> ++++++++++++++++++++++++++++++++++
> >>  
> >>  Media's workflow is heavily based on Patchwork, meaning that, once a patch
> >>  is submitted, the e-mail will first be accepted by the mailing list
> >> @@ -47,51 +156,36 @@ server, and, after a while, it should appear at:
> >>  
> >>     - https://patchwork.linuxtv.org/project/linux-media/list/
> >>  
> >> -If it doesn't automatically appear there after a few minutes, then
> >> +If it doesn't automatically appear there after some time [2]_, then
> >>  probably something went wrong on your submission. Please check if the
> >> -email is in plain text\ [2]_ only and if your emailer is not mangling
> >> +email is in plain text\ [3]_ only and if your emailer is not mangling
> >>  whitespaces before complaining or submitting them again.
> >>  
> >> -You can check if the mailing list server accepted your patch, by looking at:
> >> +To troubleshoot problems, you should first check if the mailing list
> >> +server has accepted your patch, by looking at:
> >>  
> >>     - https://lore.kernel.org/linux-media/
> >>  
> >> -.. [2] If your email contains HTML, the mailing list server will simply
> >> +If the patch is there and not at patchwork, it is likely that your e-mailer
> >> +mangled the patch. Patchwork internally has a logic that checks if the
> >> +received e-mail contain a valid patch. Any whitespace and new line
> >> +breakages mangling the patch won't be recognized by patchwork, thus such
> >> +patch will be rejected.
> >> +
> >> +.. [2] It usually takes a few minutes for the patch to arrive, but
> >> +       the e-mail server is busy, so it may take up to a few hours
> > 
> > s/is busy/may be busy/
> > 
> >> +       for a patch to be handled by the mail server and by the patchwork
> >> +       instance.
> > 
> > "for a patch to be recorded by patchwork."
> > 
> >> +
> >> +.. [3] If your email contains HTML, the mailing list server will simply
> >>         drop it, without any further notice.
> > 
> > These changes too could have been split to a separate cleanup patch, to
> > make the crux of this patch easier to review.
> > 
> >>  
> >> +Subsystem maintainers
> >> +---------------------
> >>  
> >> -Media maintainers
> >> -+++++++++++++++++
> >> -
> >> -At the media subsystem, we have a group of senior developers that
> >> -are responsible for doing the code reviews at the drivers (also known as
> >> -sub-maintainers), and another senior developer responsible for the
> >> -subsystem as a whole. For core changes, whenever possible, multiple
> >> -media maintainers do the review.
> >> -
> >> -The media maintainers that work on specific areas of the subsystem are:
> >> -
> >> -- Remote Controllers (infrared):
> >> -    Sean Young <sean@mess.org>
> >> -
> >> -- HDMI CEC:
> >> -    Hans Verkuil <hverkuil@xs4all.nl>
> >> -
> >> -- Media controller drivers:
> >> -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> -
> >> -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
> >> -    Sakari Ailus <sakari.ailus@linux.intel.com>
> >> -
> >> -- V4L2 drivers and core V4L2 frameworks:
> >> -    Hans Verkuil <hverkuil@xs4all.nl>
> > 
> > We're losing that information, isn't it valuable ?
> 
> That's a good point. I think we still want to keep this information. Although
> this list should probably be moved to...

As replied to Mauro, I'm also fine with this information being conveyed
through MAINTAINERS.

> >> -
> >> -The subsystem maintainer is:
> >> -  Mauro Carvalho Chehab <mchehab@kernel.org>
> >> -
> >> -Media maintainers may delegate a patch to other media maintainers as needed.
> >> -On such case, checkpatch's ``delegate`` field indicates who's currently
> >> -responsible for reviewing a patch.
> >> +The subsystem maintainers are:
> >> +  Mauro Carvalho Chehab <mchehab@kernel.org> and
> >> +  Hans Verkuil <hverkuil@xs4all.nl>
> 
> ...here.
> 
> > 
> > If you don't intend on this being rendered as a list, it should be
> > 
> > The subsystem maintainers are Mauro Carvalho Chehab <mchehab@kernel.org> and
> > Hans Verkuil <hverkuil@xs4all.nl>.
> > 
> > Otherwise,
> > 
> > The subsystem maintainers are:
> > 
> > - Mauro Carvalho Chehab <mchehab@kernel.org>
> > - Hans Verkuil <hverkuil@xs4all.nl>
> > 
> > 
> > Shouldn't MAINTAINERS be updated at the same time ?
> 
> Good point, I posted a patch.
> 
> >>  
> >>  Submit Checklist Addendum
> >>  -------------------------
> >> @@ -108,17 +202,14 @@ implementing the media APIs:
> >>  ====================	=======================================================
> >>  Type			Tool
> >>  ====================	=======================================================
> >> -V4L2 drivers\ [3]_	``v4l2-compliance``
> >> +V4L2 drivers\ [4]_	``v4l2-compliance``
> >>  V4L2 virtual drivers	``contrib/test/test-media``
> >>  CEC drivers		``cec-compliance``
> >>  ====================	=======================================================
> >>  
> >> -.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
> >> +.. [4] The ``v4l2-compliance`` also covers the media controller usage inside
> >>         V4L2 drivers.
> >>  
> >> -Other compilance tools are under development to check other parts of the
> >> -subsystem.
> >> -
> >>  Those tests need to pass before the patches go upstream.
> >>  
> >>  Also, please notice that we build the Kernel with::
> >> @@ -134,6 +225,8 @@ Where the check script is::
> >>  Be sure to not introduce new warnings on your patches without a
> >>  very good reason.
> >>  
> >> +Please see `Media development workflow`_ for e-mail submission rules.
> >> +
> > 
> > These hunks too could have been split to a cleanup patch before the main
> > changes.
> > 
> >>  Style Cleanup Patches
> >>  +++++++++++++++++++++
> >>  
> >> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
> >> new file mode 100644
> >> index 000000000000..27b85a37fb2b
> >> --- /dev/null
> >> +++ b/Documentation/driver-api/media/media-committer.rst
> >> @@ -0,0 +1,252 @@
> >> +Media committers
> >> +================
> >> +
> >> +What is a media committer?
> >> +--------------------------
> >> +
> >> +A media committer is a developer who can apply patches from other developers
> > 
> > Here too we could standardize to "push" instead of "apply".
> > 
> >> +and their own patches at the
> > 
> > s/at the/to the/
> > 
> > I would simply write "who can push commits to the ...".
> > 
> >> +`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_
> >> +tree.
> >> +
> >> +It is a media committer's duty to ensure that their entries at the MAINTAINERS
> > 
> > s/at the/in the/
> > 
> >> +file will be kept updated, and that submitted patches for files for which
> > 
> > s/will be kept update/are kept up-to-date/
> > 
> >> +they are listed as maintainers are timely reviewed at the mailing list,
> > 
> > s/at the/on the/
> > 
> >> +not waiting in patchwork as ``New`` for more than one Kernel merge cycle,
> >> +and, if accepted, applying them at the media committer's tree.
> > 
> > I think this goes a bit backward, and mixes things up a bit. On the
> > mixing side, the expectation of timely reviews comes from maintainer
> > status. Having commit rights is orthogonal to that.
> > 
> > The goal of direct commit access is to speed up maintenance, to get
> > patches reviewed and merged quicker. Are we saying here that if someone
> > has commit rights they will lose them if they take too long to review
> > code ? That would then slow down maintenance even more, which seems
> > counterproductive.
> 
> Someone with commit rights is also a maintainer, since that's how you
> gain the trust to get those rights. If you do a poor job of reviewing
> patches relevant for you as maintainer, then you loose that trust.

This is I think the point where our expectations are the least aligned.
I'm considering "committer" based on what is done in drm-misc. A
committer is essentially a developer who has demonstrated they can
follow a documented process to push their own patches. They are given
push access as a shortcut, which frees time for the subsystem
maintainers who don't have to pick patches manually from the list (or
handle pull requests). That's the official side of it. The barrier to
entry is intentionally kept very low to ensure that committers won't
decide to use the legacy workflow due to expectations of additional work
load. Committers are not required or even asked to take any extra work.
It's still a win-win situation: subsystem maintainers have less work,
and committers can get their patches upstream more easily.

Then there's the other "secret" goal: through handing out committer
rights, the maintainers hoped that a subset of the committers would
become more involved, grow more knowledge about the subsystem, pick up
third party patches, review or cross-review code, ... And that worked,
DRM has grown an active community of developers who go beyond their
personal needs and help with maintenance more broadly. Dave and Sima
deliberately decided to favour the carrot over the stick, and I think
the events that followed proved it was the right decision.

This is what I would like to see replicated in the media subsystem. Even
if a committer only handles the single driver they're interested in and
push their own patches, it's still a win for everybody involved. By
making the barrier to entry low, we will make it possible for people who
would have been scared of volunteering to become part of the community,
and over time handle more responsibilities. Setting a higher barrier to
entry will scare those people away. Even myself, if I'm expected to do
more than what I do today to get commit rights, I won't request them.
Everybody will lose, I will have to keep sending pull requests, and you
will have to keep handling them. Both of us will lose time that we could
otherwise use for reviews or other tasks beneficial to the subsystem.

More importantly than the exact wording, it's the core principle of the
committers model that we need to agree on. If we don't have the same
expectations it will clearly not work.

> And if you simply don't have the time anymore for that, then perhaps
> you need to look for a co-maintainer or just stop being a maintainer for
> that area. A good example of that is actually the uvc driver. In that case
> the solution was adding a co-maintainer.
> 
> > Also, while one can be recognized as a maintainer for multiple drivers
> > or parts of the kernel, there's a single committer status. You can't
> > revoke committer status of a particular driver only.
> 
> The committer status is a sign that you are trusted. Part of that is timely
> patch review. Or admit that you won't have the time/resources to do that job
> and look for a co-maintainer or even give up maintainership of some areas.
> 
> That said, perhaps the text should change a bit:
> 
> "not waiting in patchwork as ``New`` for more than one Kernel merge cycle" ->
> "ideally not waiting in patchwork as ``New`` for more than one Kernel merge cycle"
> 
> We all have patches in patchwork that are much older than that, for one reason
> or another, but if this happens all the time, then you have a problem.
> 
> >> +
> >> +This privilege is granted with some expectation of responsibility:
> > 
> > "Privilege" sounds a bit like lord and serf.
> 
> How about 'These commit rights are granted'?

I recommended "rights" to Mauro as well, sounds good.

> >> +committers are people who care about the Linux Kernel as a whole and
> >> +about the Linux media subsystem and want to help its development. It
> >> +is also based on a trust relationship between the rest of the committers,
> >> +maintainers and the LinuxTV community.
> > 
> > Who is "the LinuxTV community" ?
> 
> "linux kernel media community"?

Also discussed in the other part of the thread.

> >> +
> >> +As such, a media committer is not just someone who is capable of creating
> >> +code, but someone who has demonstrated their ability to collaborate
> >> +with the team, get the most knowledgeable people to review code,
> >> +contribute high-quality code, and follow through to fix issues (in code
> >> +or tests).
> >> +
> >> +.. Note::
> >> +
> >> +   1. If a patch introduced a regression, then it is the media committer's
> > 
> > s/introduced/introduces/
> > 
> >> +      responsibility to correct that as soon as possible. Typically the
> >> +      patch is either reverted, or an additional patch is committed that
> >> +      fixes the regression;
> >> +   2. if patches are fixing bugs against already released Kernels, including
> >> +      the reverts above mentioned, the media committer shall add the needed
> >> +      tags.  Please see :ref:`Media development workflow` for more details.
> > 
> > s/  Please/ Please/
> > 
> >> +   3. all patches should be properly reviewed at
> >> +      linux-media@vger.kernel.org before being merged at the
> > 
> > s/at the/in the/
> > 
> >> +      media-committers tree or submitted on pull requests.
> > 
> > This is a fundamental rule that belongs to the development workflow in
> > my opinion.
> > 
> >> +
> >> +Becoming a media committer
> >> +--------------------------
> >> +
> >> +The most important aspect of volunteering to be a committer is that you will
> >> +be able to review and approve other people's changes, so we are looking for
> > 
> > Everybody is able to review patches (rather, everybody is allowed to
> > review patches, the ability is a different matter).
> > 
> >> +whether we think you will be good at doing that.
> > 
> > I've been told that "whether" should also come with a "or" clause. You
> > can write "whether or not we think ...".
> 
> How about this:
> 
> "The most important aspect of volunteering to be a committer is that you have
> demonstrated the ability to give good code reviews."

Grammatically speaking that sounds correct, but I don't think it's the
most important part :-) It depends on how we define the committers
model, as discussed above.

> >> +
> >> +As such, potential committers must earn enough credibility and trust from the
> >> +LinuxTV community. To do that, developers shall be familiar with the open
> 
> We should probably search for "LinuxTV community" and replace it with "linux kernel
> media community". "LinuxTV" is fairly meaningless to me, it's just the name of our
> internet domain, but otherwise it doesn't feel like a community.

I think it would indeed make sense to focus on the subsystem name in the
kernel documentation.

> An alternative name might be "media developers"?
> 
> >> +source model and have been active at the Linux Kernel community for some time,
> > 
> > s/at the/in the/
> > 
> >> +and, in particular, with the media subsystem.
> > 
> > s/with the/in the/
> > 
> >> +
> >> +So, in addition to actually making the code changes, you are basically
> >> +demonstrating your:
> >> +
> >> +- commitment to the project;
> >> +- ability to collaborate with the team and communicate well;
> >> +- understand of how upstream and the LinuxTV community  works
> > 
> > s/  works/ work/
> > 
> >> +  (policies, processes for testing, code review, ...)
> >> +- reasonable knowledge about:
> >> +
> >> +  - the Kernel development process:
> >> +    Documentation/process/index.rst
> >> +
> >> +  - the Media development profile:
> >> +    Documentation/driver-api/media/maintainer-entry-profile.rst
> >> +
> >> +- understanding of the projects' code base and coding style;
> >> +- ability to provide feedback to the patch authors;
> >> +- ability to judge when a patch might be ready for review and to submit;
> >> +- ability to write good code (last but certainly not least).
> >> +
> >> +It is also desirable that developers that intend to become committers
> >> +make a best effort to attend the yearly Linux Media Summit, typically
> >> +co-located with another Linux conference.
> > 
> > I would say that "are encouraged to attend" instead of "make a best
> > effort to attend". Also, how will this scale when we'll have a few
> > dozen committers ? Typically the media summit is capped to 20 attendees
> > or less.
> 
> If we have that many committers, then we can afford a larger room and we
> probably would have to start charging some contributions as well. But
> that would be a luxury problem :-) It's a bridge we can cross when we
> get there.

Also tied to how we define committers, and discussed in the other part
of the thread.

> Note that I am fine with "are encouraged to attend". I think that's a good
> phrase.
> 
> >> +
> >> +If you are doing such tasks and have become a valued developer, an
> >> +existing committer can nominate you to the media subsystem maintainers.
> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request:
> > 
> > "Maintainers and committers should encourage contributors to request
> > commit rights, especially junior contributors tend to underestimate
> > their skills."
> 
> In drm is it the contributors that request commit rights? Or is it those
> who already have commit rights that invite others? Currently the plan for
> the media subsystem is the second method. Although that might change in the
> future, of course.

The process is documented in
https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request.
It requires explicit action from the candidate, as they have to create a
gitlab.fdo account, and request commit access by fiing an issue in
gitlab. You can see the issue template at
https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new?issue[title]=Request%20for%20Commit%20Rights&issuable_template=commit_access,
which is roughly speaking the equivalent of the mail template in this
document. In practice, as mentioned in the documentation, people often
underestimate their skills and lack confidence to ask for committer
access. That's why the documentation states that maintainers and
committers should encourage contributors to request access.

I like that model because it requires an explicit action from the
contributor to show that they have an interest, and it also makes it
possible for people to request access without having been nominated. It
doesn't mean that access will be automatically granted, there are still
acceptance criteria, and it's a maintainer decision at the end of the
day.

Stating as done in this patch that an existing committer can nominate
someone implies that contributors have to wait until they get notified
they can join The Chosen Few. It's not very welcoming, and given how
busy everybody is, valuable contributors may need to wait for longer
than they should before someone thinks about nominating them.

I wouldn't expect a change of wording to result in any practical change
in the process, it is only about being more inclusive and welcoming in
the document. If we want to create a vibrant community, people should
feel not just welcome, but also desired and valued.

> So since existing committers invite others, I'm not sure this is needed.
> 
> >> +
> >> +The ultimate responsibility for accepting a nominated committer is up to
> >> +the subsystem's maintainers. The committers must earn a trust relationship
> >> +with all subsystem maintainers, as, by granting you commit rights, they will
> >> +be delegating part of their maintenance tasks.
> >> +
> >> +Due to that, to become a committer or a core committer, a consensus between
> >> +all subsystem maintainers is required, as they all need to trust a developer
> >> +well enough to be delegated the responsibility to maintain part of the code
> >> +and to properly review patches from third parties, in a timely manner and
> >> +keeping the status of the reviewed code at https://patchwork.linuxtv.org
> >> +updated.
> >> +
> >> +.. Note::
> >> +
> >> +   In order to preserve the developers that could have their commit rights
> > 
> > Do you mean "protect" instead of "preserve" ? Or maybe "preserve/protect
> > the privacy of" ?
> 
> That last one is a good phrase, I like it.
> 
> > s/that/who/
> > s/their // (in the granted case, they don't have commit rights yet)
> > 
> >> +   granted or denied as well as the subsystem maintainers who have the
> > 
> > "granted, denied or removed" ?
> 
> Yes.
> 
> >> +   task to accept or deny commit rights, all communication related to
> 
> Same here.
> 
> >> +   nominating a committer, preserving commit rights or leaving such function
> >> +   should happen in private as much as possible.
> >> +
> >> +Media committer's agreement
> >> +---------------------------
> >> +
> >> +Once a nominated committer is accepted by all subsystem maintainers,
> >> +they will ask if the developer is interested in the nomination and discuss
> >> +what area(s) of the media subsystem the committer will be responsible for.
> >> +
> >> +Once the developer accepts being a committer, the new committer shall
> >> +explicitly accept the Kernel development policies described under its
> >> +Documentation/, and, in particular to the rules on this document, by writing
> >> +an e-mail to media-committers@linuxtv.org, with a declaration of intent
> >> +following the model below::
> >> +
> >> +   I, John Doe, would like to change my status to: Committer
> >> +
> >> +   I intend to actively develop the XYZ driver, send fixes to drivers
> >> +   that I can test, reviewing patches and merging trivial fixes
> >> +   for the subsystem, ...
> > 
> > "Merging trivial fixes for the subsystem" bothers me. I don't think it
> > needs to be a requirement for committers. This is a maintainer's
> > responsibility. If people want to help with that that's great, but
> > making it a requirement isn't. Or did you mean this as an example ?
> > 
> > We shouldn't expect committers to handle a higher workload than what
> > they do as driver maintainers who submit patches by e-mail or send pull
> > requests. Giving commit rights will lower the effort to get patches in,
> > and I think it's fair to ask for keeping patchwork up-to-date in return,
> > but that's about it.
> 
> The idea was to make it explicit that they can review and merge trivial
> fixes for the subsystem as a whole (so outside the direct area that they
> maintain), but that is certainly optional.
> 
> How about:
> 
> ", and optionally reviewing patches and merging trivial fixes in other
> areas of the subsystem,"
> 
> Still a bit clunky, though. Suggestions are welcome.

This is also discussed in the other part of the mail thread. I think
it's now clear that this particular wording was just an example, stating
so explicitly would address my concern.

> >> +
> >> +Followed by a formal declaration of agreement with the Kernel development
> >> +rules, signed with a PGP key cross signed by other Kernel and media
> > 
> > s/PGP/GPG/ (same thing in practice, but let's advocate for free
> > software)
> > 
> >> +developers. Such declaration shall be::
> > 
> > I find the GPG signature requirement to be borderline ridiculous. The
> > first message you're giving to committers is that you distrust them so
> > much that you want them to sign an agreement with their blood
> > (figuratively speaking). I don't think it's a very good approach to
> > community building, nor does it bring any advantage to anyone.
> 
> I kind of agree with Laurent here. Is the media-committers mailinglist
> publicly archived somewhere? I think it is sufficient if this is posted
> to a publicly archived mailinglist. That could be linux-media, I would be
> fine with that. But media-committers would be more appropriate, but only
> if it is archived somewhere.
> 
> If we want a GPG key, what would we do with it anyway?
> 
> >> +
> >> +   I hereby declare that I agree with the Kernel development rules described at:
> >> +
> >> +   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
> >> +
> >> +   and to the Linux Kernel development process rules.
> >> +
> >> +   I agree to the Code of Conduct as documented here:
> > 
> > s/here:/in/
> > 
> >> +   Documentation/process/code-of-conduct.rst
> > 
> > You use an http link for meda-commiter.rst and a file path for
> > code-of-conduct.rst. RST links for both would be more consistent, but if
> > the goal is to paste the text in an e-mail, you can also use http links
> > or file paths for both.
> > 
> >> +
> >> +   I am aware that I can, at any point of time, retire. In that case, I will
> >> +   send an e-mail to notify the subsystem maintainers for them to revoke my
> >> +   commit rights.
> >> +
> >> +   I am aware that the Kernel development rules change over time.
> >> +   By doing a new commit, I understand that I agree with the rules in effect
> > 
> > What does "doing a new commit" mean here ? Sending a patch to the list ?
> > Pushing it to the shared tree ? I assume the latter given the text
> > below, it could be clarified here.
> > 
> >> +   at the time of the commit.
> >> +
> >> +For more details about PGP sign, please read
> >> +Documentation/process/maintainer-pgp-guide.rst and
> >> +:ref:`kernel_org_trust_repository`.
> >> +
> >> +In case the kernel development process changes, by merging new commits at the
> 
> Should this be "kernel media development"?
> 
> > 
> > s/at the/in the/
> > 
> >> +`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
> > 
> > s/media-committers/media-committers tree/
> > 
> >> +the media committer implicitly declares that the agreement with the latest
> > 
> > s/that the/their/
> > 
> >> +version of the documented process and to the contents of this file.
> > 
> > s/to the contents // ("latest version" applies to both "the documented
> > process" and "this file")
> > 
> > This is problematic, as we can't expect people to check for changes in
> > this file every time they push something. Changes to this file should be
> > announced to all committers, with a reasonable review period.
> 
> "Any changes to the kernel media development process will be announced in
> the media-committers mailinglist with a reasonable review period. All
> committers are automatically subscribed to that mailinglist."

Good improvement. Automatic subscription to the mailing list for
announcements is a good idea. We should try to keep the list relatively
low volume then, it shouldn't be used to discuss technical issues for
instance, but only to manage the process.

I've added more comments in the other part of the mail thread, let's
discuss it there.

> >> +
> >> +Core committers
> >> +---------------
> >> +
> >> +As described in Documentation/driver-api/media/maintainer-entry-profile.rst
> > 
> > RST link here too.
> > 
> >> +a committer may be granted with additional privileges to also be able to
> > 
> > s/privileges/rights/
> > 
> > (same below)
> > 
> >> +change a core file and/or media subsystem's Kernel API/ABI. The extent of
> > 
> > Drop "/ABI" as above.
> > 
> >> +the core committer's additional privileges will be detailed by the subsystem
> >> +maintainers when they nominate a core committer.
> >> +
> >> +Existing committers may become core committers and vice versa. Such
> >> +decisions will be taken in consensus between the subsystem maintainers.
> >> +
> >> +Media committers rules
> >> +----------------------
> >> +
> >> +Media committers shall ensure that merged patches will not break any existing
> >> +drivers. If it breaks, fixup or revert patches shall be merged as soon as
> > 
> > How do they ensure that ? I would prefer mentioning a best effort here,
> > as it's practically not possible to ensure this (until we have CI
> > covering all the drivers in the subsystem, which is not a reasonable
> > target).
> 
> Good point.
> 
> >> +possible, aiming to be merged at the same Kernel cycle the bug is reported.
> >> +
> >> +Media committers shall behave accordingly to the permissions granted by
> > 
> > s/permissions/rights/ (we never use "permission" anywhere else)
> > 
> >> +the subsystem maintainers, specially with regards of the scope of changes
> >> +they may apply directly at the media-committers tree. Such scope can
> >> +change overtime on a mutual greement between media committers and
> > 
> > s/overtime/over time/
> > s/greement/agreement/
> > 
> >> +maintainers.
> >> +
> >> +As described at :ref:`Media development workflow`, there are workflows.
> > 
> > s/at /in /
> > 
> >> +For the committers' workflow, the following rules apply:
> >> +
> >> +- Each merged patch shall pass CI tests;
> >> +
> >> +- Media committers shall request reviews from other committers were
> > 
> > We shouldn't limit this to "other committers". When making changes to a
> > driver that is not maintained by any committer (for instance when making
> > tree-wide changes), the person in the best position to review the
> > changes is the driver maintainer or author. I would extend this to "from
> > third parties", or "from other developers".
> 
> Yes, 'developers' is better.
> 
> > 
> >> +  applicable, i.e. because those committers have more knowledge about
> 
> Same here.
> 
> >> +  some areas that are changed by a patch;
> >> +
> >> +- No other media committer would be against the proposed changes.
> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html#merge-criteria:
> > 
> > "There must not be open issues or unresolved or conflicting feedback
> > from anyone. Clear them up first. Defer to maintainers as needed."
> > 
> > That's better than restricting the conflicts to committers. If there are
> > open issues, the patches should not be merged through the shared tree.
> 
> Nice, good wordsmithing!

I'll pass the praise to the drm-misc architects :-)

> >> +
> >> +Patches that do not fall under the committer's workflow criteria will follow
> >> +the normal workflow as described at :ref:`Media development workflow`.
> >> +
> >> +Only a subsystem maintainer can override such rules.
> >> +
> >> +All media committers shall ensure that patchwork will reflect the current
> >> +status, e.g. patches shall be delegated to the media committer who is
> >> +handling them and the patch status shall be updated according to these rules:
> >> +
> >> +- ``Under review``: Used if the patch requires a second opinion
> >> +  or when it is part of a pull request;
> >> +- ``Accepted``: Once a patch is merged at the multi-committer tree.
> > 
> > s/at the/in the/
> > 
> >> +- ``Superseded``: There is a newer version of the patch posted in the
> > 
> > s/in the/to the/
> > 
> >> +  mailing list.
> >> +- ``Duplicated``: There was another patch doing the same thing from someone
> >> +  else that was accepted.
> >> +- ``Not Applicable``: Use for patch series that are not merged at media.git
> >> +  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
> >> +  linux-media mailing list.
> >> +
> >> +If the committer decides not to merge it, then reply by email to patch
> >> +authors, explaining why it is not merged, and patchwork shall be updated
> >> +accordingly with either:
> >> +
> >> +- ``Changes Requested``: if a new revision was requested;
> >> +- ``Rejected``: if the proposed change won't be merged upstream.
> > 
> > There are tools to ease updating the status of a patch, could you
> > document or at least mention them ?
> 
> I think that is out-of-scope. It certainly could be added as a follow-up
> patch.

It doesn't necessarily have to be done here, but if we expect committers
to keep patchwork up-to-date (and I'm fine with that expectation), then
I think we need to point every new committer to resources that will help
them with that task. I'd like for instance to create a macro in my mail
client (mutt) to update the status of a series, which would require
using a patchwork client that can locate patchwork entries based on
msgid. I expect something to exist, and it would be nice if I didn't
have to do the research (unless I'm the first one to want this of
course).

> >> +
> >> +If a media committer decides to retire, it is the committer's duty to
> >> +notify the subsystem maintainers about that decision.
> >> +
> >> +Maintaining media committer status
> >> +----------------------------------
> >> +
> >> +A community of committers working together to move the Linux Kernel
> >> +forward is essential to creating successful projects that are rewarding
> >> +to work on. If there are problems or disagreements within the community,
> >> +they can usually be solved through healthy discussion and debate.
> >> +
> >> +In the unhappy event that a media committer continues to disregard good
> >> +citizenship (or actively disrupts the project), we may need to revoke
> > 
> > That's very, very vague, surprisingly vague even from someone who raised
> > many concerns about the kernel code of conduct being vague.
> 
> I suspect that this phrasing is copied from another project. Mauro, can you
> confirm that?
> 
> I think it is extremely difficult to give explicit guidance here.
> 
> >> +that person's status. In such cases, if someone suggests the revocation with
> >> +a good reason, other developers may second the motion. The final decision
> >> +is taken by the subsystem maintainers. As the decision to become a media
> > 
> > What does "seconding the motion" bring, if the decision lies solely in
> > maintainers ?
> 
> I think the intent here is that, other than in extreme circumstances, it shouldn't
> be a unilateral decision from the subsystem maintainers. Multiple media committers
> should agree with it.
> 
> But perhaps it would be better to replace this with:
> 
> "In such cases, if someone suggests the revocation with a good reason, then after
> discussing this among the media committers, the final decision is taken by the
> subsystem maintainers."

Something like that sounds better. I've also mentioned other options for
improvements in the other part of the mail thread.

> I really hope we will never end up in a situation like this, since that's going
> to be painful regardless of what procedure you choose.

I'm quite confident we won't. Nevertheless, it's a good idea to be
prepared and establish rules already.

> >> +committer comes from a consensus between subsystem maintainers, a single
> >> +subsystem maintainer not trusting the media committer anymore is enough to
> >> +revoke committer's privileges.
> >> +
> >> +If a committer is inactive for more than a couple of Kernel cycles,
> >> +maintainers will try to reach you via e-mail. If not possible, they may
> >> +revoke your committer privileges and update MAINTAINERS file entries
> >> +accordingly. If you wish to resume contributing later on, then contact
> >> +the subsystem maintainers to ask if your rights can be restored.
> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request:
> > 
> > "Committers are encouraged to request their commit rights get removed
> > when they no longer contribute to the project. Commit rights may be
> > automatically revoked after a year of inactivity (no commits or
> > reviews). Commit rights will be reinstated when they come back to the
> > project."
> 
> Yes, that's better. I also realized that the mention of updating the MAINTAINERS
> makes no sense since that does not contain media committer status.

Mauro preferred the original version, so I'll let the two of you debate
this :-)

> >> +
> >> +A previous committer that had his commit rights revoked can keep contributing
> > 
> > s/his/their/
> > 
> >> +to the subsystem via the normal e-mail workflow as documented at the
> >> +:ref:`Media development workflow`.
> >> +
> >> +References
> >> +----------
> >> +
> >> +Much of this was inspired by/copied from the committer policies of:
> >> +
> >> +- `Chromium <https://chromium.googlesource.com/chromium/src/+/main/docs/contributing.md>`_;
> >> +- `WebKit <http://www.google.com/url?q=http%3A%2F%2Fwebkit.org%2Fcoding%2Fcommit-review-policy.html&sa=D&sntz=1&usg=AFrqEze4W4Lvbhue4Bywqgbv-N5J66kQgA>`_;
> > 
> > Google tracks us enough without using google URLs.
> > 
> >> +- `Mozilla <http://www.google.com/url?q=http%3A%2F%2Fwww.mozilla.org%2Fhacking%2Fcommitter%2F&sa=D&sntz=1&usg=AFrqEzecK7iiXqV30jKibNmmMtzHwtYRTg>`_.
> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html
> > would also have been a good source of inspiration. That's the only large
> > multi-committer workflow today in the kernel, and it has proven its
> > value. The explicit acceptance criteria in particular are very good.
> > Quoting the document, it says
> > 
> > "Commit rights will be granted to anyone who requests them and fulfills
> > the below criteria:"
> > 
> > That's how we build an inclusive community, it feels way more welcoming
> > than saying that maintainers will discuss in private and grant
> > privileges to underlings if it pleases them (even if the effect is the
> > same in practice, it's still a maintainer decision).
> 
> The main difference here is that in drm developers can ask for commit rights,
> whereas for the media subsystem they are invited by existing media committers.
> 
> The drm model is absolutely more inclusive, and I hope we can end up there
> eventually. But for now I think we need more work on both the procedures and
> the media-ci workflow.

As mentioned on the other part of the mail thread, I think it's
absolutely fine to start small and grow at a pace we are comfortable
with. I also think it's important for this document to be inclusive from
the very beginning in its wording to give the image of a welcoming
community. It's not about any fundamental change to the rules, I think
we mostly agree on them (with the open question of a committer's duties,
but that's orthogonal to the process of becoming a committer).

> Even with just two sub-maintainers committing patches it took quite a long time
> to find and fix all the bugs/issues we encountered. At this point we are
> definitely not ready to implement a drm model.
> 
> This document just starts this process, it will change and be improved over time,
> but we need this in place before we can start adding more committers.

I'm quite confident we can reach a consensus in a reasonable amount of
time. Not in time for -rc1 (I haven't seen feedback from Sean, Sakari,
Sebastian or Ricardo yet, and I'd like to know their opinions), but
possibly still in time to grant commit rights before the next linux-next
freeze period.

> >> +
> >> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
> >> index f5277993b195..795ef8d89271 100644
> >> --- a/Documentation/process/maintainer-pgp-guide.rst
> >> +++ b/Documentation/process/maintainer-pgp-guide.rst
> >> @@ -903,6 +903,8 @@ the new default in GnuPG v2). To set it, add (or modify) the
> >>  
> >>      trust-model tofu+pgp
> >>  
> >> +.. _kernel_org_trust_repository:
> >> +
> >>  Using the kernel.org web of trust repository
> >>  --------------------------------------------
> >>  

-- 
Regards,

Laurent Pinchart

