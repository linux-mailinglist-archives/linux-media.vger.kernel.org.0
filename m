Return-Path: <linux-media+bounces-22242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D29DBBE9
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 18:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A104B283685
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2421C1AD0;
	Thu, 28 Nov 2024 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPZZxauy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE251C173C;
	Thu, 28 Nov 2024 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732815898; cv=none; b=cAodllRNHH9TP8a/8O7b+FbUbQNCc+OGxC0LmH/rYiRlIEIr0KLaXroVoymb9tzMK19nr6hn+HBdejnFnKlln3DEOI0xF66xHKbiEttXvtw0KUI1b0bdZUOmKPMKxO6cJAcCdYN4XhlYbeKguUcvn0EOT88drht/VbJIr/tjJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732815898; c=relaxed/simple;
	bh=sztXzGj18yXYQJrKHkGVmls9A3MQNMp3Zn17tr6MkUI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdUv0e7bSsBFphRpnUGfzyAiuV4cD9o6wiEQ4j2RvKBtwxf1FE/VVDjlY1cyxWNMiOZHBXLMCnF2UxapegXzlmpQCrxwCG0ViI1Nnev5Q9Tm8SeRlVm6y2ik1mh8I8f//feP2YW4P95VWWKKQudiHCbqrh4pxLEstaEdBnghbh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPZZxauy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016B9C4CECE;
	Thu, 28 Nov 2024 17:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732815897;
	bh=sztXzGj18yXYQJrKHkGVmls9A3MQNMp3Zn17tr6MkUI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dPZZxauya/WDGZshA5B6EqcVoEA31LRfnevmh/VPMPiQxz5oH8XgqOVqsAZy1YwWa
	 ZsftZdHRSvxSQVhzExGvGG/wvBlFq85xnkgKmce895BgztfS6NX+WdeSijS/qtLja0
	 kB4cTDKSE7w99hmsk3Tvz7IGVrNcyvrT3GYAgCF+x0uj9TX6FihZXPiKxymca8RNzN
	 ZMQTtoILzV8yr/U5Eq3EAHr/UkBXLPzBjAw4o6y0SOJvsIfy3j8hA0Fahni9MW9YG+
	 +70ZuAJCgiii453dKFuGMKQm6fvq+9z7tdPRM+zRIdD59oR662Kos0fP+ecYoxOdto
	 C2VyTknSOZiWg==
Date: Thu, 28 Nov 2024 18:44:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241128184453.6cb1590b@foz.lan>
In-Reply-To: <e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 27 Nov 2024 12:59:58 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

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

Yes, there are three situations: 

	- patches against released kernels;
	- patches against next kernel (-rc1 being prefered, IMO, against a random -rc);
	- new features.

I modified the text following Laurent's suggestion.

> 
> >   
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

I'm opting to use this word on v2:

	Patches that were fixing bugs publicly reported by someone at the
	linux-media@vger.kernel.org mailing list shall have:
	  - a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.

This makes clear that we expect to have Reported-by/Closes if someone publicly
reports via e-mail to our development ML. This is a subset of the cases
where permission is not required, and likely covers 99% of the cases where
this is needed.

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

As discussed at the other thread, things like that need to be at
MAINTAINERS, as this will warrant that the right people will be c/c.

While not explicitly stated at the document, when we mention
MAINTAINERS there, it means that media committer records there
need to be up-to-dated when changes happen, in special the
status (S:) and mail fields (M:) need to reflect the committers
responsibilities.

So, for instance, let's suppose we have an entry like this:

	RADIO GAGA MEDIA DRIVER
	M:	My User <my@user.domain>
	L:	linux-media@vger.kernel.org
	S:	Odd Fixes
	W:	https://linuxtv.org
	T:	git git://linuxtv.org/media.git
	F:	drivers/media/radio/radio-gaga*

if a new committer decides to step up to maintain the driver,
such entry will be changed to:

	RADIO GAGA MEDIA DRIVER
	M:	Queen Fanboy <fanboy@queen.fanclub>
	L:	linux-media@vger.kernel.org
	S:	Maintained
	W:	https://linuxtv.org
	T:	git git://linuxtv.org/media.git
	F:	drivers/media/radio/radio-gaga*

(either dropping "My User" if he has no time to maintain it anymore
or adding a second M:)

If, in the future, it decides to not maintain/commit patches for
it anymore, because he has no time or interest to keep maintaining
it, the status should be changed to:

	RADIO GAGA MEDIA DRIVER
	L:	linux-media@vger.kernel.org
	S:	Orphan
	W:	https://linuxtv.org
	T:	git git://linuxtv.org/media.git
	F:	drivers/media/radio/radio-gaga*

If nobody steps in to keep maintaining it.

That's not different from the current Kernel practices.

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
>
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

Exactly.

 
> That said, perhaps the text should change a bit:
> 
> "not waiting in patchwork as ``New`` for more than one Kernel merge cycle" ->
> "ideally not waiting in patchwork as ``New`` for more than one Kernel merge cycle"
> 
> We all have patches in patchwork that are much older than that, for one reason
> or another, but if this happens all the time, then you have a problem.

I'll do the suggested changes.

> >> +This privilege is granted with some expectation of responsibility:  
> > 
> > "Privilege" sounds a bit like lord and serf.  
> 
> How about 'These commit rights are granted'?

Ok.

> >> +committers are people who care about the Linux Kernel as a whole and
> >> +about the Linux media subsystem and want to help its development. It
> >> +is also based on a trust relationship between the rest of the committers,
> >> +maintainers and the LinuxTV community.  
> > 
> > Who is "the LinuxTV community" ?  
> 
> "linux kernel media community"?

I opted to add both.

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

Ok.

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

Agreed.

> Note that I am fine with "are encouraged to attend". I think that's a good
> phrase.

Ok.

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

Sounds OK to me. Will use that.

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

With PRs, the authenticity was ensured by signed git tags. With MRs,
we need to ensure when we're giving grants, which happens after the
committer sends us an e-mail agreeing to be a committer.

I'm adding to the declaration of intent a text with the username
that will be used by the new committer:

	   "I, John Doe, would like to change my status to: Committer

	    I intend to actively develop the XYZ driver, send fixes to drivers
	    that I can test, optionally reviewing patches and merging trivial
	    fixes in other areas of the subsystem, ...

	    For the purpose of committing patches to the media-committer's tree,
	    I'll be using my user https://gitlab.freedesktop.org/users/<username>.

I'm also replacing the part that mentions PGP with:

	Such e-mail shall be signed with a PGP key cross signed by other Kernel and
	media developers. As described at :ref:`media-developers-gpg`_, the PGP
	signature, together with the gitlab user security are fundamental components
	that ensure the authentity of the merge requests that will happen at the
	media-committer.git tree.

Finally, the reference there (media-developers-gpg) will be part of the
media maintainer profile entry as:

	Authentication for pull and merge requests
	++++++++++++++++++++++++++++++++++++++++++

	The authenticity of developers submitting pull requests and merge requests
	shall be validated by using PGP sign, via the
	:ref:`kernel_org_trust_repository`.

	With the pull request workflow, pull requests shall use a GPG-signed tag.

	With the committers' workflow, this is ensured at the time merge request
	rights will be granted to the gitlab instance used by media-committers.git
	tree, after receiving the e-mail documented at
	:ref:`media-committer-agreement`.

	For more details about PGP sign, please read
	Documentation/process/maintainer-pgp-guide.rst.

> > 
> > This is problematic, as we can't expect people to check for changes in
> > this file every time they push something. Changes to this file should be
> > announced to all committers, with a reasonable review period.  
> 
> "Any changes to the kernel media development process will be announced in
> the media-committers mailinglist with a reasonable review period. All
> committers are automatically subscribed to that mailinglist."

I added a variation of that:

	In case the kernel development process changes, by merging new commits
	in the
	`media-committer tree <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
	the media committer implicitly declares their agreement with the latest
	version of the documented process including the contents of this file.

	.. note::

	   1. Changes to the kernel media development process should be announced in
	      the media-committers mailinglist with a reasonable review period. All
	      committers are automatically subscribed to that mailinglist;
	   2. Due to the distributed nature of the Kernel development, it is
	      possible that kernel development process changes may end being
	      reviewed/merged at the linux-docs mailing list, specially for the
	      contents under Documentation/process and for trivial typo fixes.

Since we're talking about the kernel development process as a whole,
I added a notice that other parts of the process may change any time
(like the recent changes to CoC), and such changes may not be c/c
to linux-media.

> > There are tools to ease updating the status of a patch, could you
> > document or at least mention them ?  
> 
> I think that is out-of-scope. It certainly could be added as a follow-up
> patch.

I ended adding a link, as it doesn't hurt to have it there.


> >> +In the unhappy event that a media committer continues to disregard good
> >> +citizenship (or actively disrupts the project), we may need to revoke  
> > 
> > That's very, very vague, surprisingly vague even from someone who raised
> > many concerns about the kernel code of conduct being vague.  
> 
> I suspect that this phrasing is copied from another project. Mauro, can you
> confirm that?

Yes: it came from Chromium.

> I think it is extremely difficult to give explicit guidance here.

Agreed.

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

Changed.

> I really hope we will never end up in a situation like this, since that's going
> to be painful regardless of what procedure you choose.

Yes. Things like that are painful and stressful.

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

See my comments above (with regards to MAINTAINERS) and a separate thread.

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
>
> Even with just two sub-maintainers committing patches it took quite a long time
> to find and fix all the bugs/issues we encountered. At this point we are
> definitely not ready to implement a drm model.
> 
> This document just starts this process, it will change and be improved over time,
> but we need this in place before we can start adding more committers.

Agreed.

Thanks,
Mauro

