Return-Path: <linux-media+bounces-22165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 904839DA6BA
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14A60162DFE
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A6D1F12E4;
	Wed, 27 Nov 2024 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c47n5dbl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E9F1EF0B1;
	Wed, 27 Nov 2024 11:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706361; cv=none; b=cA5cBD3I+Ul6MaxWktin8DB0atcz26T6WvDRHnEg6CvJdP0UKXi1F6wkOccWSSQXBNsMxJ4osuPxjkiXkJUpnwsJRqevlDxCW+tIZdmX7Hyo/8VjgMeTS8LS8+xLiAO9LrAsus28J52yVTV/J61Zd1W/2kDwjl4xNEg2xIMeUYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706361; c=relaxed/simple;
	bh=MSMzY7aCo3Gl8NwC7JEXt6IFM2jWklTO32CpLlWspYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X11Mucjo1QpaZyQfFFjKyNIg9d8n+1zqYW95Yp+ziJmQp5dCdK/8mmOahXrbC7Fh4Kwwbck230i6pH6wnTPDoT2A3Yyk7GArRUPnl2qh5qLs/eLV6OKfLWIdz+HkdFHRQLhlgMtFMIdigIQkSlVGZz9zwXwDv/pIxq1XV9XZ7UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c47n5dbl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23301842;
	Wed, 27 Nov 2024 12:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732706329;
	bh=MSMzY7aCo3Gl8NwC7JEXt6IFM2jWklTO32CpLlWspYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c47n5dblmVyAoaUST7EF29K1BUU3ftbX78iHHgL7Y8dAGrmROPD229n/19HpukMlY
	 lui48RxEmDoSv8CBBh+PDIlqV0Rv3glhUiM5RgeWedaapnxY1Xr6M8NuixIt9/hPsS
	 Mg6XNJTnFTL4cGQbDwTwg9w1GWW2lRwa9OcTjwOg=
Date: Wed, 27 Nov 2024 13:19:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241127111901.GG31095@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <20241127103948.501b5a05@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127103948.501b5a05@foz.lan>

On Wed, Nov 27, 2024 at 10:39:48AM +0100, Mauro Carvalho Chehab wrote:
> Em Tue, 26 Nov 2024 17:19:30 +0200 Laurent Pinchart escreveu:
> > On Mon, Nov 25, 2024 at 02:28:58PM +0100, Mauro Carvalho Chehab wrote:
> > > As the media subsystem will experiment with a multi-committers model,
> > > update the Maintainer's entry profile to the new rules, and add a file
> > > documenting the process to become a committer and to maintain such
> > > rights.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
> > > ---
> > >  Documentation/driver-api/media/index.rst      |   1 +
> > >  .../media/maintainer-entry-profile.rst        | 193 ++++++++++----
> > >  .../driver-api/media/media-committer.rst      | 252 ++++++++++++++++++
> > >  .../process/maintainer-pgp-guide.rst          |   2 +
> > >  4 files changed, 398 insertions(+), 50 deletions(-)
> > >  create mode 100644 Documentation/driver-api/media/media-committer.rst
> > > 
> > > diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
> > > index d5593182a3f9..d0c725fcbc67 100644
> > > --- a/Documentation/driver-api/media/index.rst
> > > +++ b/Documentation/driver-api/media/index.rst
> > > @@ -26,6 +26,7 @@ Documentation/userspace-api/media/index.rst
> > >      :numbered:
> > >  
> > >      maintainer-entry-profile
> > > +    media-committer
> > >  
> > >      v4l2-core
> > >      dtv-core
> > > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > index ffc712a5f632..90c6c0d9cf17 100644
> > > --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > @@ -27,19 +27,128 @@ It covers, mainly, the contents of those directories:
> > >  Both media userspace and Kernel APIs are documented and the documentation
> > >  must be kept in sync with the API changes. It means that all patches that
> > >  add new features to the subsystem must also bring changes to the
> > > -corresponding API files.
> > > +corresponding API documentation files.  
> > 
> > I would have split this kind of small changes to a separate patch to
> > make reviews easier, but that's not a big deal.
> > 
> > >  
> > > -Due to the size and wide scope of the media subsystem, media's
> > > -maintainership model is to have sub-maintainers that have a broad
> > > -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> > > -task to review the patches, providing feedback to users if the patches are
> > > +Due to the size and wide scope of the media subsystem, the media's
> > > +maintainership model is to have committers that have a broad knowledge of
> > > +a specific aspect of the subsystem. It is the committers' task to
> > > +review the patches, providing feedback to users if the patches are
> > >  following the subsystem rules and are properly using the media kernel and
> > >  userspace APIs.  
> > 
> > This sounds really like a maintainer definition. I won't bikeshed too
> > much on the wording though, we will always be able to adjust it later to
> > reflect the reality of the situation as it evolves. I do like the
> > removal of the "sub-maintainer" term though, as I've always found it
> > demeaning.
> 
> The main goal here was to replace sub-maintainers by committers.
> 
> Other changes can go later on, or if you have a better way to define
> the paper of committers, be welcomed to propose it.

I think we would waste time arguing about this section. It's not the
main goal of this patch, so I'm fine handling it later.

> > > -Patches for the media subsystem must be sent to the media mailing list
> > > -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > -HTML will be automatically rejected by the mail server. It could be wise
> > > -to also copy the sub-maintainer(s).
> > > +Media committers
> > > +----------------
> > > +
> > > +In the media subsystem, there are experienced developers that can commit  
> > 
> > s/that/who/
> > s/commit/push/ to standardize the vocabulary (below you use "upload" to
> > mean the same thing)
> > 
> > > +patches directly on a development tree. These developers are called  
> > 
> > s/on a/to the/
> 
> I won't comment here any below about trivial changes like that: I'll
> just incorporate at v2. I'll focus my reply on your the comments about
> the text contents itself.

Fine with me. I actually considered sending the trivial comments as a
separate reply.

> > > +Media committers and are divided into the following categories:
> > > +
> > > +- Committers: responsible for one or more drivers within the media subsystem.
> > > +  They can upload changes to the tree that do not affect the core or ABI.  
> > 
> > s/upload/push/
> > 
> > > +
> > > +- Core committers: responsible for part of the media core. They are typically
> > > +  responsible for one or more drivers within the media subsystem, but, besides
> > > +  that, they can also merge patches that change the code common to multiple
> > > +  drivers, including the kernel internal API/ABI.  
> > 
> > I would write "API" only here. Neither the kernel internal API nor its
> > internal ABI are stable, and given that lack of stability, the ABI
> > concept doesn't really apply within the kernel.
> 
> It does for distros, but this is a separate matter ;-)
> 
> From my side, I'm ok with either API or API/ABI, if ok for Hans and others
> as well.
> 
> > > +
> > > +- Subsystem maintainers: responsible for the subsystem as a whole, with
> > > +  access to the entire subsystem.
> > > +
> > > +  Only subsystem maintainers can change the userspace API/ABI.  
> > 
> > This can give the impression that only subsystem maintainers are allowed
> > to work on the API. I would write
> > 
> >   Only subsystem maintainers change push changes that affect the userspace
> >   API/ABI.
> 
> I guess you meant to say:
> 
>    Only subsystem maintainers *can* push changes that affect the userspace
>    API/ABI.
> 
>   (change -> can)

Yes, sorry, that's what I meant.

> The new text seems OK to me. I'll change it at v2.
> 
> > > +
> > > +Media committers shall explicitly agree with the Kernel development process  
> > 
> > Do we have to capitalize "Kernel" everywhere ? There are way more
> > occurrences of "kernel" than "Kernel" in Documentation/ (even excluding
> > the lower case occurrences in e-mail addresses, file paths, ...).
> 
> "The Kernel" means "the Linux Kernel". e. g. it is not just a random kernel,
> it is the Linux Kernel. So, it is a proper noun. Proper nouns should always 
> be capitalized in English.

I don't think anyone would consider "kernel" to refer to the BSD kernel
in this context. I still think we shouldn't capitalize the term here,
but usage of "Kernel" in this file predates this patch, so we can
address this separately.

> > > +as described at Documentation/process/index.rst and to the Kernel
> > > +development rules inside the Kernel documentation, including its code of
> > > +conduct.  
> > 
> > That's expected of all kernel developers, but I don't object reiterating
> > it here.
> > 
> > > +
> > > +More details about media committers can be found here:  
> > 
> > Maybe "about media commiters' roles and responsibilities" would be more
> > accurate, the document doesn't include information about the committers
> > themselves.
> > 
> > s/here:/at/
> > 
> > > +Documentation/driver-api/media/media-committer.rst.  
> > 
> > Should this be a RST link ?
> 
> No need: a Sphinx plugin automatically converts it to hyperlink.

Ah, good to know.

> > > +
> > > +Media development tree
> > > +----------------------
> > > +
> > > +The main development tree used by the media subsystem is hosted at LinuxTV.org,
> > > +where we also maintain news about the subsystem, wiki pages and a patchwork
> > > +instance where we track patches though their lifetime.
> > > +
> > > +The main tree used by media developers is at:
> > > +
> > > +https://git.linuxtv.org/media.git/  
> > 
> > I think the multi-committers tree should be upgraded to main development
> > tree status, but that's a separate issue that I'm fine discussing
> > separately, and also delaying for a few kernel releases until we iron
> > out the rough edges of the process.
> 
> This is a separate discussion, and it is too early to start discussing it.

Ack.

> > > +.. _Media development workflow:
> > > +
> > > +Media development workflow
> > > +++++++++++++++++++++++++++
> > > +
> > > +All changes for the media subsystem must be sent first as e-mails to the
> > > +media mailing list, as plain text only e-mail to:
> > > +
> > > +  `https://subspace.kernel.org/vger.kernel.org.html <linux-media@vger.kernel.org>`_
> > > +
> > > +Emails with HTML will be automatically rejected by the mail server.
> > > +It could be wise to also copy the media committer(s). You should use
> > > +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
> > > +Please always copy driver's authors and maintainers.  
> > 
> > Instead of duplicating a tiny part of the patch submission process, I
> > would link to the appropriate documentation.
> 
> The intention here is to bold that driver's authors and maintainers should
> always be c/c and the way to do it is via get_maintainers.pl. Yet, a link
> to the process submission makes sense. I'll move the link to here.
> 
> > [1] (see below)
> > 
> > > +
> > > +Such patches needed to be based against a public branch or tag as follows:  
> > 
> > s/needed/need/
> > 
> > > +
> > > +1. new Kernel releases:  
> > 
> > s/new/New/
> > 
> > What does that mean though ? It's not very clear.
> 
> Maybe "Upcoming Kernel releases"?

I think the distinction between the three categories is whether the
patches are features (i.e. not fixes), fixes for an issue present in an
already released kernel, or fixes for an issue not present in any
released kernel (i.e. present in -next only). Phrasing it that way would
make it easier to understand, compared to the current wording that
focusses on when the patch is sent.

> > > +
> > > +   Those need to be based at the ``next`` branch of that media.git tree
> > > +
> > > +2. During Kernel release development cycle, patches fixing bugs on a -rc
> > > +   kernel should preferably be against the latest -rc1 Kernel. If they
> > > +   require a previously-applied change, they need to be against the ``fixes``
> > > +   branch;
> > > +
> > > +3. Patches against an already released kernel should preferably be  against
> > > +   the latest released Kernel. If they require a previously-applied
> > > +   change, they need to be against ``fixes``.  
> > 
> > If I were a new contributor I think I would have trouble understand this
> > to be honest. I won't push hard for a rework of this section, as I
> > expect it will change after the multi-committer tree becomes the main
> > way to get patches merged. We can then update the documentation.
> 
> Basically, the preference is to have patches against a release or against
> -rc1 when it makes sense, as it helps when backports are needed.
> I don't think this will ever change.
> 
> Patches against media.git next branch are ok, specially for new
> features.
> 
> > > +
> > > +All patches with fixes shall have:
> > > +   - a ``Fixes:`` tag pointing to the first commit that introduced the bug;
> > > +   - a ``Cc: stable@vger.kernel.org``
> > > +
> > > +Patches that were fixing bugs reported by someone else shall have:
> > > +  - a ``Reported-by`` tag immediately followed by a ``Closes`` tag.  
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
> Good point, but:
> 
> 1. I can't remember last time I saw a media patch pointing to a Kernel BZ
>    in the recent days (surely there are, but they're not frequent);
> 2. We do have a common pattern on media about people adding Reported-by:
>    without Closes:, or with closes at the wrong place.
>
> So, we're trying to address those problematic cases. Maybe we could change
> the above to:
> 
> 	Patches with fixes shall have:
> 	- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
> 	- when applicable, a ``Cc: stable@vger.kernel.org``.
> 
> 	Patches that were fixing bugs publicly reported by someone
> 	at the media mailing list shall have:
> 	- a ``Reported-by`` tag immediately followed by a ``Closes`` tag.  

Given that the Reported-by + Closes pattern isn't specific to the media
subsystem, that checkpatch.pl should warn about that (unless I'm
mistaken) and cause CI to fail, and that we would need to expand the
documentation to cover the privacy issue, my preference would be to drop
the paragraph related to Reported-by + Closes. I don't think keeping it
here would bring much value.

The mention of Fixes and Cc: stable is good.

> > > +
> > > +Patches that change API/ABI shall require patches to update documentation  
> > 
> > s/require patches to //
> > 
> > > +accordingly at the same patch series.  
> > 
> > s/at the/in the/
> > 
> > > +
> > > +See Documentation/process/index.rst for more details about e-mail submission.  
> > 
> > This could be moved up to [1].
> > 
> > > +
> > > +Once a patch is submitted, it may follow either one of the workflows
> > > +below:  
> > 
> > "of the following workflows"
> > 
> > > +
> > > +a. Normal workflow: patches are handled by subsystem maintainers::
> > > +
> > > +     +------+   +---------+   +-------+   +-------------------+   +---------+
> > > +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge  |-->|media.git|
> > > +     +------+   +---------+   |request|   |at media-committers|   +---------+
> > > +                              +-------+   +-------------------+  
> > 
> > This makes it look like the pull request originates from patchwork.
> 
> No, it points that patches from e-mail go to patchwork, and the PRs come
> from what it is in patchwork(*).
> 
> (*) Now, it doesn't matter if one picks it manually from the mailing list
>     or picked with b4 or pwclient, the point is that the patch shall be 
>     in patchwork before someone does a pull request, as the patch state
>     at patchwork needs to reflect the patch review lifetime.

Yes, I understand the workflow, my point is that the diagram could be
misunderstood by people who are not already familiar with the process.

> > s/at /in /
> > 
> > I would also add .git to media-committers to make it clear it's a git
> > tree.
> 
> Ok.
> 
> > (I still think the tree name is too long and not very appropriate, but
> > that's a different question)
> > 
> > > +
> > > +   For this workflow, pull requests can be generated by a committer,
> > > +   a previous committer, subsystem maintainers or by a couple of trusted
> > > +   long-time contributors. If you are not in such group, please don't submit
> > > +   pull requests, as they will likely be ignored.
> > > +
> > > +b. Committers' workflow: patches are handled by media committers::
> > > +
> > > +     +------+   +---------+   +-------------------+   +-----------+   +---------+
> > > +     |e-mail|-->|patchwork|-->|committers merge   |-->|maintainers|-->|media.git|
> > > +     +------+   +---------+   |at media-committers|   |approval   |   +---------+
> > > +                              +-------------------+   +-----------+
> > > +
> > > +When patches are merged at patchwork and when merged at media-committers,  
> > 
> > We don't "merge" patches in patchwork. You could write "When patches are
> > picked by patchwork" for instance.
> 
> Works for me. I'll change it in v2.
> 
> > > +CI bots will check for errors and may provide e-mail feedback about
> > > +patch problems. When this happens, the e-mail author must fix them  
> > 
> > s/e-mail author/patch author/ ? Or possibly better, "patch submitter" as
> > that person may not be the author.
> 
> Ok.
> 
> > > +and send another version of the patch.
> > > +
> > > +Patches will only be moved to the next stage in those two workflows if they
> > > +don't fail on CI or if there are false-positives at the CI reports.  
> > 
> > s/at the/in the/
> > 
> > > +  
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
> Will try to do such change at v2.
> 
> > 
> > > +Failures during e-mail submission
> > > ++++++++++++++++++++++++++++++++++
> > >  
> > >  Media's workflow is heavily based on Patchwork, meaning that, once a patch
> > >  is submitted, the e-mail will first be accepted by the mailing list
> > > @@ -47,51 +156,36 @@ server, and, after a while, it should appear at:
> > >  
> > >     - https://patchwork.linuxtv.org/project/linux-media/list/
> > >  
> > > -If it doesn't automatically appear there after a few minutes, then
> > > +If it doesn't automatically appear there after some time [2]_, then
> > >  probably something went wrong on your submission. Please check if the
> > > -email is in plain text\ [2]_ only and if your emailer is not mangling
> > > +email is in plain text\ [3]_ only and if your emailer is not mangling
> > >  whitespaces before complaining or submitting them again.
> > >  
> > > -You can check if the mailing list server accepted your patch, by looking at:
> > > +To troubleshoot problems, you should first check if the mailing list
> > > +server has accepted your patch, by looking at:
> > >  
> > >     - https://lore.kernel.org/linux-media/
> > >  
> > > -.. [2] If your email contains HTML, the mailing list server will simply
> > > +If the patch is there and not at patchwork, it is likely that your e-mailer
> > > +mangled the patch. Patchwork internally has a logic that checks if the
> > > +received e-mail contain a valid patch. Any whitespace and new line
> > > +breakages mangling the patch won't be recognized by patchwork, thus such
> > > +patch will be rejected.
> > > +
> > > +.. [2] It usually takes a few minutes for the patch to arrive, but
> > > +       the e-mail server is busy, so it may take up to a few hours  
> > 
> > s/is busy/may be busy/
> > 
> > > +       for a patch to be handled by the mail server and by the patchwork
> > > +       instance.  
> > 
> > "for a patch to be recorded by patchwork."
> > 
> > > +
> > > +.. [3] If your email contains HTML, the mailing list server will simply
> > >         drop it, without any further notice.  
> > 
> > These changes too could have been split to a separate cleanup patch, to
> > make the crux of this patch easier to review.
> > 
> > >  
> > > +Subsystem maintainers
> > > +---------------------
> > >  
> > > -Media maintainers
> > > -+++++++++++++++++
> > > -
> > > -At the media subsystem, we have a group of senior developers that
> > > -are responsible for doing the code reviews at the drivers (also known as
> > > -sub-maintainers), and another senior developer responsible for the
> > > -subsystem as a whole. For core changes, whenever possible, multiple
> > > -media maintainers do the review.
> > > -
> > > -The media maintainers that work on specific areas of the subsystem are:
> > > -
> > > -- Remote Controllers (infrared):
> > > -    Sean Young <sean@mess.org>
> > > -
> > > -- HDMI CEC:
> > > -    Hans Verkuil <hverkuil@xs4all.nl>
> > > -
> > > -- Media controller drivers:
> > > -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > -
> > > -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
> > > -    Sakari Ailus <sakari.ailus@linux.intel.com>
> > > -
> > > -- V4L2 drivers and core V4L2 frameworks:
> > > -    Hans Verkuil <hverkuil@xs4all.nl>  
> > 
> > We're losing that information, isn't it valuable ?
> 
> With the media-committers model, there's no concept of "media
> maintainers" anymore. Also, the above will dynamically change
> over time. Instead of placing things here, it makes more sense to
> ensure that the MAINTAINERS entry gets updated accordingly as we
> add media-committers, as this is what get-maintainers.pl uses.

OK, I suppose MAINTAINERS is indeed better.

> Besides that, the auto-delegation rules at patchwork will help
> keeping the patches c/c to the right person, in the eventual
> case someone doesn't run get-maintainers.pl.
> 
> > > -
> > > -The subsystem maintainer is:
> > > -  Mauro Carvalho Chehab <mchehab@kernel.org>
> > > -
> > > -Media maintainers may delegate a patch to other media maintainers as needed.
> > > -On such case, checkpatch's ``delegate`` field indicates who's currently
> > > -responsible for reviewing a patch.
> > > +The subsystem maintainers are:
> > > +  Mauro Carvalho Chehab <mchehab@kernel.org> and
> > > +  Hans Verkuil <hverkuil@xs4all.nl>  
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
> It should be a separate patch. I would be doing such change once
> Hans will be about to start sending pull requests, which still
> require more actions.

In can be a separate patch, but I think having it in the same series
would make sense, as you're listing Hans here as a subsystem maintainer.
It doesn't mean he will send pull requests behind your back immediately
:-)

> > >  
> > >  Submit Checklist Addendum
> > >  -------------------------
> > > @@ -108,17 +202,14 @@ implementing the media APIs:
> > >  ====================	=======================================================
> > >  Type			Tool
> > >  ====================	=======================================================
> > > -V4L2 drivers\ [3]_	``v4l2-compliance``
> > > +V4L2 drivers\ [4]_	``v4l2-compliance``
> > >  V4L2 virtual drivers	``contrib/test/test-media``
> > >  CEC drivers		``cec-compliance``
> > >  ====================	=======================================================
> > >  
> > > -.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
> > > +.. [4] The ``v4l2-compliance`` also covers the media controller usage inside
> > >         V4L2 drivers.
> > >  
> > > -Other compilance tools are under development to check other parts of the
> > > -subsystem.
> > > -
> > >  Those tests need to pass before the patches go upstream.
> > >  
> > >  Also, please notice that we build the Kernel with::
> > > @@ -134,6 +225,8 @@ Where the check script is::
> > >  Be sure to not introduce new warnings on your patches without a
> > >  very good reason.
> > >  
> > > +Please see `Media development workflow`_ for e-mail submission rules.
> > > +  
> > 
> > These hunks too could have been split to a cleanup patch before the main
> > changes.
> > 
> > >  Style Cleanup Patches
> > >  +++++++++++++++++++++
> > >  
> > > diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
> > > new file mode 100644
> > > index 000000000000..27b85a37fb2b
> > > --- /dev/null
> > > +++ b/Documentation/driver-api/media/media-committer.rst
> > > @@ -0,0 +1,252 @@
> > > +Media committers
> > > +================
> > > +
> > > +What is a media committer?
> > > +--------------------------
> > > +
> > > +A media committer is a developer who can apply patches from other developers  
> > 
> > Here too we could standardize to "push" instead of "apply".
> > 
> > > +and their own patches at the  
> > 
> > s/at the/to the/
> > 
> > I would simply write "who can push commits to the ...".
> 
> The main goal of a maintainer, which is partially delegated to
> committers, is to apply patches from other developers.

Hence my comment above, where I said the description looked more like
maintainer than committer. Bluring the lines is dangerous. Are we
talking about committers or maintainers here ? From a committer I would
only expect that they would get the rights to push commits for areas
they control directly, lowering Hans' and your work load. This has a
clear and immediate value to me, and I believe it's a good first step.

If we're talking about delegating more maintainer duties, then it's a
different conversation, with a stronger commitment that should go hand
in hand with more trust and more rights.

> We'd like to bold it here.
> 
> > 
> > > +`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_
> > > +tree.
> > > +
> > > +It is a media committer's duty to ensure that their entries at the MAINTAINERS  
> > 
> > s/at the/in the/
> > 
> > > +file will be kept updated, and that submitted patches for files for which  
> > 
> > s/will be kept update/are kept up-to-date/
> > 
> > > +they are listed as maintainers are timely reviewed at the mailing list,  
> > 
> > s/at the/on the/
> > 
> > > +not waiting in patchwork as ``New`` for more than one Kernel merge cycle,
> > > +and, if accepted, applying them at the media committer's tree.  
> > 
> > I think this goes a bit backward, and mixes things up a bit. On the
> > mixing side, the expectation of timely reviews comes from maintainer
> > status. Having commit rights is orthogonal to that.
> > The goal of direct commit access is to speed up maintenance, to get
> > patches reviewed and merged quicker. 
> > Are we saying here that if someone
> > has commit rights they will lose them if they take too long to review
> > code ? That would then slow down maintenance even more, which seems
> > counterproductive.
> > 
> 
> This seems to be a difference between drm-misc criteria and our
> criteria: it is a requirement for committers to review other peoples patches.

Then we're not talking about committers, but about maintainers, and
that's something that should be explicit, including in the name. To be
clear, I don't want commit rights if that means my workload will
significantly increase as a result, I can't commit at this point to be a
subsystem maintainer. I think it would be a shame if there was no
committer role.

> It is somewhat similar to drm-intel and drm-xe, where reviews are part
> of the acceptance criteria to become committers.

Those are corporate trees, so it's easier to set such rules.

> 
> On other words, committers are people where maintainers will delegate
> some parts. They need to work as "maintainer's proxy" for the delegated
> parties, which includes reviewing patches.

That sounds like slave labour, being forced to do work without any of
the recognition that comes from being a maintainer.

> So, the same way maintainers have duties to do timely reviews
> (as you mentioned), committers will have it for the parts of the 
> subsystem that were delegated for them to merge code. This includes
> not only their work as developers, but also patches submitted by third
> parties.
> 
> Clearly, nobody will get rights revoked if a couple of patches would
> take more than one kernel cycle because of technical issues
> (for instance too complex patches or patches that may have potential 
> to cause regressions). But it is expected that committers will do timely
> reviews for the code he asked to be a committer.
> 
> > Also, while one can be recognized as a maintainer for multiple drivers
> > or parts of the kernel, there's a single committer status. You can't
> > revoke committer status of a particular driver only.
> 
> While not explicitly written, if a committer that maintains multiple
> drivers wants to step down from maintaining one of them, he could
> simply write an e-mail to media-committers requesting to step down
> from maintaining such driver.
> 
> On such case, MAINTAINERS file should be updated accordingly,
> as usual.
> 
> > > +
> > > +This privilege is granted with some expectation of responsibility:  
> > 
> > "Privilege" sounds a bit like lord and serf.
> 
> This is the term used on SQL databases. Here, it is used in the context
> of having the same technical meaning as there. We used this term here
> in the lack of a better word. Do you have a better way to describe it?

I think "rights" would sound better.

> 
> See, while correct, it is not nice to repeat grant twice like:
> 
> 	This grant is granted with some expectation of ...
> 	     =====    =======
> 
> We might use "duties", but it is not quite the same.
> 
> > > +committers are people who care about the Linux Kernel as a whole and
> > > +about the Linux media subsystem and want to help its development. It
> > > +is also based on a trust relationship between the rest of the committers,
> > > +maintainers and the LinuxTV community.  
> > 
> > Who is "the LinuxTV community" ?
> 
> See https://linuxtv.org/:
> 
> 	The LinuxTV community (linux-media) develops and maintains the Linux Kernel Media Subsystems and several userspace libraries and applications.

Yes, but who is that ? You list maintainers, committers and the LinuxTV
community. Is there a "community" here that wouldn't be part of
"maintainers" and "committers" ?

> I'll add a link to linuxtv.org there.
> 
> > > +
> > > +As such, a media committer is not just someone who is capable of creating
> > > +code, but someone who has demonstrated their ability to collaborate
> > > +with the team, get the most knowledgeable people to review code,
> > > +contribute high-quality code, and follow through to fix issues (in code
> > > +or tests).
> > > +
> > > +.. Note::
> > > +
> > > +   1. If a patch introduced a regression, then it is the media committer's  
> > 
> > s/introduced/introduces/
> > 
> > > +      responsibility to correct that as soon as possible. Typically the
> > > +      patch is either reverted, or an additional patch is committed that
> > > +      fixes the regression;
> > > +   2. if patches are fixing bugs against already released Kernels, including
> > > +      the reverts above mentioned, the media committer shall add the needed
> > > +      tags.  Please see :ref:`Media development workflow` for more details.  
> > 
> > s/  Please/ Please/
> > 
> > > +   3. all patches should be properly reviewed at
> > > +      linux-media@vger.kernel.org before being merged at the  
> > 
> > s/at the/in the/
> > 
> > > +      media-committers tree or submitted on pull requests.  
> > 
> > This is a fundamental rule that belongs to the development workflow in
> > my opinion.
> 
> I'll add it there. Yet, I would prefer to keep it here too, as new
> committers need to be aware that patches need to be reviewed first
> at the ML.

I think committers can be expected to read the subsystem's maintainer
profile, it's even listed explicitly in this document. Duplicating
information means they easily get out of sync.

> > > +
> > > +Becoming a media committer
> > > +--------------------------
> > > +
> > > +The most important aspect of volunteering to be a committer is that you will
> > > +be able to review and approve other people's changes, so we are looking for  
> > 
> > Everybody is able to review patches (rather, everybody is allowed to
> > review patches, the ability is a different matter).
> 
> Ok.
> 
> > 
> > > +whether we think you will be good at doing that.  
> > 
> > I've been told that "whether" should also come with a "or" clause. You
> > can write "whether or not we think ...".
> > 
> > > +
> > > +As such, potential committers must earn enough credibility and trust from the
> > > +LinuxTV community. To do that, developers shall be familiar with the open
> > > +source model and have been active at the Linux Kernel community for some time,  
> > 
> > s/at the/in the/
> > 
> > > +and, in particular, with the media subsystem.  
> > 
> > s/with the/in the/
> > 
> > > +
> > > +So, in addition to actually making the code changes, you are basically
> > > +demonstrating your:
> > > +
> > > +- commitment to the project;
> > > +- ability to collaborate with the team and communicate well;
> > > +- understand of how upstream and the LinuxTV community  works  
> > 
> > s/  works/ work/
> > 
> > > +  (policies, processes for testing, code review, ...)
> > > +- reasonable knowledge about:
> > > +
> > > +  - the Kernel development process:
> > > +    Documentation/process/index.rst
> > > +
> > > +  - the Media development profile:
> > > +    Documentation/driver-api/media/maintainer-entry-profile.rst
> > > +
> > > +- understanding of the projects' code base and coding style;
> > > +- ability to provide feedback to the patch authors;
> > > +- ability to judge when a patch might be ready for review and to submit;
> > > +- ability to write good code (last but certainly not least).
> > > +
> > > +It is also desirable that developers that intend to become committers
> > > +make a best effort to attend the yearly Linux Media Summit, typically
> > > +co-located with another Linux conference.  
> > 
> > I would say that "are encouraged to attend" instead of "make a best
> > effort to attend". 
> 
> Ok.
> 
> > Also, how will this scale when we'll have a few
> > dozen committers ? Typically the media summit is capped to 20 attendees
> > or less.
> 
> If we have a few dozen committers, I would try to find a bigger
> room for the Media Summit ;-)

It may be due to a difference of opinion on what "committer" means vs.
"maintainer". I wouldn't expect "committers" in the drm-misc sense to
attend the linux media summits (they can of course do so if they wish),
as I would expect many of such "committers" to only handle a small part
of the code base.

> > > +If you are doing such tasks and have become a valued developer, an
> > > +existing committer can nominate you to the media subsystem maintainers.  
> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request:
> > 
> > "Maintainers and committers should encourage contributors to request
> > commit rights, especially junior contributors tend to underestimate
> > their skills."
> 
> Too early for that. We don't want junior contributors causing
> merge issues and forcing maintainers to do rebases at media-committers.git.

This doesn't mean we want to give commit rights to everybody. It's about
showing inclusiveness and a will to trust people who show they deserve
the trust, compared to wording it as being a secret society that can
only be joined when co-opted by existing members.

> > > +
> > > +The ultimate responsibility for accepting a nominated committer is up to
> > > +the subsystem's maintainers. The committers must earn a trust relationship
> > > +with all subsystem maintainers, as, by granting you commit rights, they will
> > > +be delegating part of their maintenance tasks.
> > > +
> > > +Due to that, to become a committer or a core committer, a consensus between
> > > +all subsystem maintainers is required, as they all need to trust a developer
> > > +well enough to be delegated the responsibility to maintain part of the code
> > > +and to properly review patches from third parties, in a timely manner and
> > > +keeping the status of the reviewed code at https://patchwork.linuxtv.org
> > > +updated.
> > > +
> > > +.. Note::
> > > +
> > > +   In order to preserve the developers that could have their commit rights  
> > 
> > Do you mean "protect" instead of "preserve" ? Or maybe "preserve/protect
> > the privacy of" ?
> 
> Good point. I'd say both.
> 
> > s/that/who/
> > s/their // (in the granted case, they don't have commit rights yet)
> > 
> > > +   granted or denied as well as the subsystem maintainers who have the  
> > 
> > "granted, denied or removed" ?
> 
> Ok.
> 
> > > +   task to accept or deny commit rights, all communication related to
> > > +   nominating a committer, preserving commit rights or leaving such function
> > > +   should happen in private as much as possible.
> > > +
> > > +Media committer's agreement
> > > +---------------------------
> > > +
> > > +Once a nominated committer is accepted by all subsystem maintainers,
> > > +they will ask if the developer is interested in the nomination and discuss
> > > +what area(s) of the media subsystem the committer will be responsible for.
> > > +
> > > +Once the developer accepts being a committer, the new committer shall
> > > +explicitly accept the Kernel development policies described under its
> > > +Documentation/, and, in particular to the rules on this document, by writing
> > > +an e-mail to media-committers@linuxtv.org, with a declaration of intent
> > > +following the model below::
> > > +
> > > +   I, John Doe, would like to change my status to: Committer
> > > +
> > > +   I intend to actively develop the XYZ driver, send fixes to drivers
> > > +   that I can test, reviewing patches and merging trivial fixes
> > > +   for the subsystem, ...  
> > 
> > "Merging trivial fixes for the subsystem" bothers me. I don't think it
> > needs to be a requirement for committers. This is a maintainer's
> > responsibility. If people want to help with that that's great, but
> > making it a requirement isn't. Or did you mean this as an example ?
> 
> This is an example. The scope will be case-by-case, and will be
> part of the discussions with the maintainers.

OK. Then maybe a sentence after this model to state that the list of
activities is an example and should be adapted based on the submitter's
interests would be good.

> Yet, if a committer requests rights for driver A, I expect him/her to 
> pick trivial patches for it.

Generally speaking, I would expect someone who commits patches for a
driver to be listed in MAINTAINERS for that driver (possibly along other
people), so they would indeed pick third-party patches. The way you
phrased it above includes "for the subsystem" which gives the impression
that committers have to volunteer to be janitors for the whole
subsystem. People may do so, but I think we agree it's not a
requirement, so avoiding implying it's required would be nice.

> The committers may eventually pick trivial patches for other drivers. We 
> need to take some care with that to avoid multiple developers to review
> the same patches and wasting their time.

I'll be happy if we managed to scale up to a point where we get too many
reviews :-)

> > We shouldn't expect committers to handle a higher workload than what
> > they do as driver maintainers who submit patches by e-mail or send pull
> > requests. Giving commit rights will lower the effort to get patches in,
> > and I think it's fair to ask for keeping patchwork up-to-date in return,
> > but that's about it.
> > 
> > > +
> > > +Followed by a formal declaration of agreement with the Kernel development
> > > +rules, signed with a PGP key cross signed by other Kernel and media  
> > 
> > s/PGP/GPG/ (same thing in practice, but let's advocate for free
> > software)
> 
> The Kernel docs referred in this section use the term PGP. I don't
> mind replacing them to GPG, but this has to happen at the already
> existing docs as well. Feel free to submit such patch later on, once
> we get this merged upstream.
> 
> > 
> > > +developers. Such declaration shall be::  
> > 
> > I find the GPG signature requirement to be borderline ridiculous. The
> > first message you're giving to committers is that you distrust them so
> > much that you want them to sign an agreement with their blood
> > (figuratively speaking). I don't think it's a very good approach to
> > community building, nor does it bring any advantage to anyone.
> 
> Please don't spread FUD. The intent is to ensure that the email
> really came from the committer, and was not impersonated by someone's
> else.

There's no FUD here, this is my honest perception of the wording that
implies, for me, that the relationship starts on mistrust. I think it
gives the wrong message, and I don't believe that the risk of uncaught
impersonification is real here.

> > > +
> > > +   I hereby declare that I agree with the Kernel development rules described at:
> > > +
> > > +   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
> > > +
> > > +   and to the Linux Kernel development process rules.
> > > +
> > > +   I agree to the Code of Conduct as documented here:  
> > 
> > s/here:/in/
> > 
> > > +   Documentation/process/code-of-conduct.rst  
> > 
> > You use an http link for meda-commiter.rst and a file path for
> > code-of-conduct.rst. RST links for both would be more consistent, but if
> > the goal is to paste the text in an e-mail, you can also use http links
> > or file paths for both.
> 
> Good point. Both shall be pointing to https://www.kernel.org/doc/html/latest/,
> as this is the example of the content of the e-mail. Also, as this is inside
> a Sphinx code-block, ReST links won't work.
> 
> > > +   I am aware that I can, at any point of time, retire. In that case, I will
> > > +   send an e-mail to notify the subsystem maintainers for them to revoke my
> > > +   commit rights.
> > > +
> > > +   I am aware that the Kernel development rules change over time.
> > > +   By doing a new commit, I understand that I agree with the rules in effect  
> > 
> > What does "doing a new commit" mean here ? Sending a patch to the list ?
> > Pushing it to the shared tree ? I assume the latter given the text
> > below, it could be clarified here.
> 
> It means a commit at media-committers.git. I'll clarify it.
>  
> > > +   at the time of the commit.
> > > +
> > > +For more details about PGP sign, please read
> > > +Documentation/process/maintainer-pgp-guide.rst and
> > > +:ref:`kernel_org_trust_repository`.
> > > +
> > > +In case the kernel development process changes, by merging new commits at the  
> > 
> > s/at the/in the/
> > 
> > > +`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_,  
> > 
> > s/media-committers/media-committers tree/
> > 
> > > +the media committer implicitly declares that the agreement with the latest  
> > 
> > s/that the/their/
> > 
> > > +version of the documented process and to the contents of this file.  
> > 
> > s/to the contents // ("latest version" applies to both "the documented
> > process" and "this file")
> > 
> > This is problematic, as we can't expect people to check for changes in
> > this file every time they push something. Changes to this file should be
> > announced to all committers, with a reasonable review period.
> 
> I don't expect that this document will change too much. See for instance
> how many times we changed the media developers profile. Also, any 
> changes for the media committers document shall be c/c to linux-media
> and hopefully c/c to media committers.

More than "hopefully". Can we write in this document that changes *will*
be CC'ed to all existing committers, that they will be given a
reasonable amount of time to provide feedback (and I'm fine not defining
precisely what "reasonable amount of time" is), and that subsystem
maintainers will make a best effort to solve any issue throught
consensus ? This still gives you full power ultimately, but is more
community-building.

> 
> But see: it is not just this file: it is the entire Kernel submission
> process, and CoC. We can't expect that people will notify us with a 
> reasonable review period every time someone changes a bit at the 
> documentation process, as such discussions typically happen at 
> linux-docs ML.

We can't generally speaking, but we can for areas we control, especially
when making significatn changes to this document. I'm not concerned
about tree-wide typo fixes that we wouldn't notice.

> If such changes happen and a committer doesn't notice and gets
> upset enough to decide retiring, The committer can step down when
> this is noticed. Yet, we don't want any troubles for the already
> committed patches, nor we want to cause any harm for the other
> media committers and maintainers if this ever happens.

In my experience people will be less upset if they have been given a
chance to express their opinion before a decision is made, and if they
feel their opinion is taken into consideration (even if it isn't always
followed).

> > > +
> > > +Core committers
> > > +---------------
> > > +
> > > +As described in Documentation/driver-api/media/maintainer-entry-profile.rst  
> > 
> > RST link here too.
> > 
> > > +a committer may be granted with additional privileges to also be able to  
> > 
> > s/privileges/rights/
> > 
> > (same below)
> > 
> > > +change a core file and/or media subsystem's Kernel API/ABI. The extent of  
> > 
> > Drop "/ABI" as above.
> > 
> > > +the core committer's additional privileges will be detailed by the subsystem
> > > +maintainers when they nominate a core committer.
> > > +
> > > +Existing committers may become core committers and vice versa. Such
> > > +decisions will be taken in consensus between the subsystem maintainers.
> > > +
> > > +Media committers rules
> > > +----------------------
> > > +
> > > +Media committers shall ensure that merged patches will not break any existing
> > > +drivers. If it breaks, fixup or revert patches shall be merged as soon as  
> > 
> > How do they ensure that ? I would prefer mentioning a best effort here,
> > as it's practically not possible to ensure this (until we have CI
> > covering all the drivers in the subsystem, which is not a reasonable
> > target).
> 
> Makes sense, I'll change it. The important message there relies at the 
> second phrase:
> 
> "If it breaks, fixup or revert patches shall be merged as soon as possible"
>  
> > > +possible, aiming to be merged at the same Kernel cycle the bug is reported.
> > > +
> > > +Media committers shall behave accordingly to the permissions granted by  
> > 
> > s/permissions/rights/ (we never use "permission" anywhere else)
> > 
> > > +the subsystem maintainers, specially with regards of the scope of changes
> > > +they may apply directly at the media-committers tree. Such scope can
> > > +change overtime on a mutual greement between media committers and  
> > 
> > s/overtime/over time/
> > s/greement/agreement/
> > 
> > > +maintainers.
> > > +
> > > +As described at :ref:`Media development workflow`, there are workflows.  
> > 
> > s/at /in /
> > 
> > > +For the committers' workflow, the following rules apply:
> > > +
> > > +- Each merged patch shall pass CI tests;
> > > +
> > > +- Media committers shall request reviews from other committers were  
> > 
> > We shouldn't limit this to "other committers". When making changes to a
> > driver that is not maintained by any committer (for instance when making
> > tree-wide changes), the person in the best position to review the
> > changes is the driver maintainer or author. I would extend this to "from
> > third parties", or "from other developers".
> 
> True, but the idea here is to enforce the need of collaboration with
> other maintainers. So, perhaps:
> 
> 	"from other committers and developers"

I'm OK with that.

> > > +  applicable, i.e. because those committers have more knowledge about
> > > +  some areas that are changed by a patch;
> > > +
> > > +- No other media committer would be against the proposed changes.  
> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html#merge-criteria:
> > 
> > "There must not be open issues or unresolved or conflicting feedback
> > from anyone. Clear them up first. Defer to maintainers as needed."
> > 
> > That's better than restricting the conflicts to committers. If there are
> > open issues, the patches should not be merged through the shared tree.
> 
> Works for me.
> 
> > > +
> > > +Patches that do not fall under the committer's workflow criteria will follow
> > > +the normal workflow as described at :ref:`Media development workflow`.
> > > +
> > > +Only a subsystem maintainer can override such rules.
> > > +
> > > +All media committers shall ensure that patchwork will reflect the current
> > > +status, e.g. patches shall be delegated to the media committer who is
> > > +handling them and the patch status shall be updated according to these rules:
> > > +
> > > +- ``Under review``: Used if the patch requires a second opinion
> > > +  or when it is part of a pull request;
> > > +- ``Accepted``: Once a patch is merged at the multi-committer tree.  
> > 
> > s/at the/in the/
> > 
> > > +- ``Superseded``: There is a newer version of the patch posted in the  
> > 
> > s/in the/to the/
> > 
> > > +  mailing list.
> > > +- ``Duplicated``: There was another patch doing the same thing from someone
> > > +  else that was accepted.
> > > +- ``Not Applicable``: Use for patch series that are not merged at media.git
> > > +  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
> > > +  linux-media mailing list.
> > > +
> > > +If the committer decides not to merge it, then reply by email to patch
> > > +authors, explaining why it is not merged, and patchwork shall be updated
> > > +accordingly with either:
> > > +
> > > +- ``Changes Requested``: if a new revision was requested;
> > > +- ``Rejected``: if the proposed change won't be merged upstream.  
> > 
> > There are tools to ease updating the status of a patch, could you
> > document or at least mention them ?
> 
> I'll add a link to:
> 	https://patchwork.readthedocs.io/en/latest/usage/clients/
> 
> From my side, I only tested pwclient (and the REST API interface
> which I use on some scripts, like the one at Jenkins to test PRs).

Is there a document that explains how to udpate the status of a series
on the command line based on the msgid ? That would be very useful to
integrate it in mail client macros.

> > > +
> > > +If a media committer decides to retire, it is the committer's duty to
> > > +notify the subsystem maintainers about that decision.
> > > +
> > > +Maintaining media committer status
> > > +----------------------------------
> > > +
> > > +A community of committers working together to move the Linux Kernel
> > > +forward is essential to creating successful projects that are rewarding
> > > +to work on. If there are problems or disagreements within the community,
> > > +they can usually be solved through healthy discussion and debate.
> > > +
> > > +In the unhappy event that a media committer continues to disregard good
> > > +citizenship (or actively disrupts the project), we may need to revoke  
> > 
> > That's very, very vague, surprisingly vague even from someone who raised
> > many concerns about the kernel code of conduct being vague.
> 
> This text came from Google Chromium committer document:
> 	https://chromium.googlesource.com/playground/chromium-org-site/+/refs/heads/main/getting-involved/become-a-committer.md#maintaining-committer-status
> 
> It is vague, a revoking commit rights is a discretionary act. It is nearly
> impossible to describe all conditions that could lead a committer to be
> distrusted.

Indeed, but we can be more precise regarding the process. For instance
we could mention that affected committers will be given an opportunity
to defend themselves before access is revoked when the revocation isn't
urgent.

> > > +that person's status. In such cases, if someone suggests the revocation with
> > > +a good reason, other developers may second the motion. The final decision
> > > +is taken by the subsystem maintainers. As the decision to become a media  
> > 
> > What does "seconding the motion" bring, if the decision lies solely in
> > maintainers ?
> 
> The decision is up to maintainers, but other committers/developers may
> voice about it.

Yes, but what's the rationale for that, if the decision is made solely
by you and Hans ?

What could be worth saying on this topic is that subsystem maintainers
will try to gather feedback from other committers before making a final
decision. I used the word "try" on purpose as sometimes urgent
revocation of commit rights could be needed, but I really don't expect
that to be common, or to even ever happen in practice (yes, I know
you've had problems with a couple of people in the past, but the
probability of this happening again within the committers group is still
very low).

> > > +committer comes from a consensus between subsystem maintainers, a single
> > > +subsystem maintainer not trusting the media committer anymore is enough to
> > > +revoke committer's privileges.
> > > +
> > > +If a committer is inactive for more than a couple of Kernel cycles,
> > > +maintainers will try to reach you via e-mail. If not possible, they may

s/you/them/ (for consistency, the rest of this section addresses the
reader with the 3rd person singular)

> > > +revoke your committer privileges and update MAINTAINERS file entries

s/your/their/

> > > +accordingly. If you wish to resume contributing later on, then contact

s/you swish/the commmitter wishes/
s/then/then they can/

> > > +the subsystem maintainers to ask if your rights can be restored.  

"to ask for their rights to be restored."

> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request:
> > 
> > "Committers are encouraged to request their commit rights get removed
> > when they no longer contribute to the project. Commit rights may be
> > automatically revoked after a year of inactivity (no commits or
> > reviews). 
> 
> I prefer the current version, as it makes clearer that we expect
> committers to request removal before becoming inactive. 
> 
> > Commit rights will be reinstated when they come back to the
> > project."
> 
> This doesn't sound right, as it means that just returning back
> is an enough condition for having committer grants restored.
> 
> This should not be automatic: the returned contributors need to
> opt-in to be committers again, and the maintainers need to be 
> confident that the developers will do their duties before restore
> committers' grants. 

I didn't push for this to be automatic. I'm OK keeping the current
wording (with the 2nd person replaced by the 3rd for consistency).

> > > +
> > > +A previous committer that had his commit rights revoked can keep contributing  
> > 
> > s/his/their/
> > 
> > > +to the subsystem via the normal e-mail workflow as documented at the
> > > +:ref:`Media development workflow`.
> > > +
> > > +References
> > > +----------
> > > +
> > > +Much of this was inspired by/copied from the committer policies of:
> > > +
> > > +- `Chromium <https://chromium.googlesource.com/chromium/src/+/main/docs/contributing.md>`_;
> > > +- `WebKit <http://www.google.com/url?q=http%3A%2F%2Fwebkit.org%2Fcoding%2Fcommit-review-policy.html&sa=D&sntz=1&usg=AFrqEze4W4Lvbhue4Bywqgbv-N5J66kQgA>`_;  
> > 
> > Google tracks us enough without using google URLs.
> 
> I'll fix.
> 
> > 
> > > +- `Mozilla <http://www.google.com/url?q=http%3A%2F%2Fwww.mozilla.org%2Fhacking%2Fcommitter%2F&sa=D&sntz=1&usg=AFrqEzecK7iiXqV30jKibNmmMtzHwtYRTg>`_.  
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
> The criteria for drm-misc has a big gap from what we want:
> 
> 	"This should not be interpreted as a requirement to review other 
> 	peoples patches"
> 
> We do require committers to review other peoples patches. It sounds

I don't want to require that. We can encourage it, we can try to get
people to expand their role and help more with overall subsystem
maintenance to try and scale, but voicing that as a requirement is wrong
for me. The carrot will work better than the stick.

> that the criteria there for xe/i915 partially fixes the issue with
> drm-misc, as it adds this criteria:
> 
> 	"Has reviewed at least 25 patches from other developers to the
> 	 chosen driver that have already been merged upstream. Again,
> 	 most of the reviewed patches must be non-trivial."
> 
> But still it doesn't say that committers shall review other peoples
> patches(*).
> 
> (*) Such reviews happen in practice there, but the number of patches
>     from external parties for xe/915 are very small and they usually come
>     from business partners. This is a very different reality than what we
>     have on media.
> 
> Besides that, in practical terms, we're not ready to accept "anyone". 

"Anyone who requests them *and* fulfills the criteria". That's very far
from anyone. Again, it's a matter of being inclusive in the wording.
Wording matters, we'll have a much bigger change of success if the
community appears inviting rather than suspicious.

> Our current goal is to grant commit rights to the most active developers
> that have been doing a good work reviewing patches from others. On other
> words, the focus are on those who has already grants at patchwork to 
> update patches. It doesn't mean that we're limited to them. It is just
> that we need to implement multi-committers without causing troubles to
> the subsystem's workflow.

Absolutely no disagreement on the fact that we'll start with a smaller
pool of the most experienced contributors, and slowly expand that over
time.

> Also, we had enough troubles with our past multi-committers model,
> back in the days we were using Mercurial, because there, we used
> to grant committer access to "anyone" that were active at the 
> media development.
> 
> So, it has to be a step-by-step approach.
> 
> Maybe after a couple of years this will be revisited and we could use
> a more inclusive text, but first we need to ensure that media-ci, 

The text should be inclusive from the beginning. It's absolutely fine to
start small, and tell people they will have to wait as we don't want to
expand faster than we can manage. Please rest assured I won't pressure
you to grant committer access to dozens of people from day one, or even
to anyone before I get to try the process and grow enough confidence
that it can scale.

> patchwork and the multi-committer's model will work for us on a 
> multi-committers model. Then, we'll likely need a tool similar to `dim`
> to help with the merge requests and avoid problems that may
> force maintainers to do rebases.
> 
> > > +
> > > diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
> > > index f5277993b195..795ef8d89271 100644
> > > --- a/Documentation/process/maintainer-pgp-guide.rst
> > > +++ b/Documentation/process/maintainer-pgp-guide.rst
> > > @@ -903,6 +903,8 @@ the new default in GnuPG v2). To set it, add (or modify) the
> > >  
> > >      trust-model tofu+pgp
> > >  
> > > +.. _kernel_org_trust_repository:
> > > +
> > >  Using the kernel.org web of trust repository
> > >  --------------------------------------------
> > >    

-- 
Regards,

Laurent Pinchart

