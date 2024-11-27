Return-Path: <linux-media+bounces-22147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC95A9DA4EF
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E8F2161DF1
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC77193432;
	Wed, 27 Nov 2024 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LR8dvTW6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46EE193060;
	Wed, 27 Nov 2024 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700393; cv=none; b=oyZNPnh/W/XxcH9jzJdOGwUAlEGibJgkFh1e+iDzgXO4HwvOtsZSG/Xl4Wl9rX5u7CLP7SKTyDYiMiu7mgUqAo2qhXPc97dHzfKTs1/RY0YXJ8+RDxv0uMR89IU9I9PcExxbMDeHAsp4jq0gOd1jsEz+sk1FWUtHSOOrnmjUnG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700393; c=relaxed/simple;
	bh=eaxXcUEdQ95OEXSESeFjPgrDddc80k2FGJeu5M+e1tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8Ggeixuuq0rZmQ8iZG4P/I1JLe8lUBojh5rQgC68fsTy+85AyUPFqerPWyAMpA+YbIUNa6QIG8sBKHAacRXNpWoFzBV1QC79K8tKVEl6qO+hALKYCthMug/IullFAJr4ABo/MzNoDC057efieWT+2KA4svtE/gjYuAmUgOB6kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LR8dvTW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE60C4CECC;
	Wed, 27 Nov 2024 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732700393;
	bh=eaxXcUEdQ95OEXSESeFjPgrDddc80k2FGJeu5M+e1tQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LR8dvTW6T6QO4lJri0gFIWn7qB//3xAVYJwQoO+ksp3MWsb12I+C8KDxoqJNbLtcE
	 7NGCP2vCeMHIUdxewA6eNQk4EghRYb9sWB5nZt7jqLlqPZkWgjbeaQOANPPnInrHpv
	 3oeaWXdDQdZqZzhZw8rPz3rfpxukN/Al+p6qPhDSfkT5WDGHALoU6wLs+fGC3exfNj
	 rSkr4yjFVePzAbYkEWggA9+RdPUDMDB+JmoI7atMgQxOZiHH7YKgXwIT409UiqWFsz
	 LsknUmac+vnWMPFf4fKpKFAMUKz1f41ORDsmWdMs2T+2DznzgMiAiGZK2ZGC+LFGH2
	 Ou8FPikWCSR5g==
Date: Wed, 27 Nov 2024 10:39:48 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241127103948.501b5a05@foz.lan>
In-Reply-To: <20241126151930.GA5493@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Em Tue, 26 Nov 2024 17:19:30 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro and Hans,
>=20
> On Mon, Nov 25, 2024 at 02:28:58PM +0100, Mauro Carvalho Chehab wrote:
> > As the media subsystem will experiment with a multi-committers model,
> > update the Maintainer's entry profile to the new rules, and add a file
> > documenting the process to become a committer and to maintain such
> > rights.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
> > ---
> >  Documentation/driver-api/media/index.rst      |   1 +
> >  .../media/maintainer-entry-profile.rst        | 193 ++++++++++----
> >  .../driver-api/media/media-committer.rst      | 252 ++++++++++++++++++
> >  .../process/maintainer-pgp-guide.rst          |   2 +
> >  4 files changed, 398 insertions(+), 50 deletions(-)
> >  create mode 100644 Documentation/driver-api/media/media-committer.rst
> >=20
> > diff --git a/Documentation/driver-api/media/index.rst b/Documentation/d=
river-api/media/index.rst
> > index d5593182a3f9..d0c725fcbc67 100644
> > --- a/Documentation/driver-api/media/index.rst
> > +++ b/Documentation/driver-api/media/index.rst
> > @@ -26,6 +26,7 @@ Documentation/userspace-api/media/index.rst
> >      :numbered:
> > =20
> >      maintainer-entry-profile
> > +    media-committer
> > =20
> >      v4l2-core
> >      dtv-core
> > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rs=
t b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > index ffc712a5f632..90c6c0d9cf17 100644
> > --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > @@ -27,19 +27,128 @@ It covers, mainly, the contents of those directori=
es:
> >  Both media userspace and Kernel APIs are documented and the documentat=
ion
> >  must be kept in sync with the API changes. It means that all patches t=
hat
> >  add new features to the subsystem must also bring changes to the
> > -corresponding API files.
> > +corresponding API documentation files. =20
>=20
> I would have split this kind of small changes to a separate patch to
> make reviews easier, but that's not a big deal.
>=20
> > =20
> > -Due to the size and wide scope of the media subsystem, media's
> > -maintainership model is to have sub-maintainers that have a broad
> > -knowledge of a specific aspect of the subsystem. It is the sub-maintai=
ners'
> > -task to review the patches, providing feedback to users if the patches=
 are
> > +Due to the size and wide scope of the media subsystem, the media's
> > +maintainership model is to have committers that have a broad knowledge=
 of
> > +a specific aspect of the subsystem. It is the committers' task to
> > +review the patches, providing feedback to users if the patches are
> >  following the subsystem rules and are properly using the media kernel =
and
> >  userspace APIs. =20
>=20
> This sounds really like a maintainer definition. I won't bikeshed too
> much on the wording though, we will always be able to adjust it later to
> reflect the reality of the situation as it evolves. I do like the
> removal of the "sub-maintainer" term though, as I've always found it
> demeaning.

The main goal here was to replace sub-maintainers by committers.

Other changes can go later on, or if you have a better way to define
the paper of committers, be welcomed to propose it.

> > -Patches for the media subsystem must be sent to the media mailing list
> > -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > -HTML will be automatically rejected by the mail server. It could be wi=
se
> > -to also copy the sub-maintainer(s).
> > +Media committers
> > +----------------
> > +
> > +In the media subsystem, there are experienced developers that can comm=
it =20
>=20
> s/that/who/
> s/commit/push/ to standardize the vocabulary (below you use "upload" to
> mean the same thing)
>=20
> > +patches directly on a development tree. These developers are called =20
>=20
> s/on a/to the/

I won't comment here any below about trivial changes like that: I'll
just incorporate at v2. I'll focus my reply on your the comments about
the text contents itself.

>=20
> > +Media committers and are divided into the following categories:
> > +
> > +- Committers: responsible for one or more drivers within the media sub=
system.
> > +  They can upload changes to the tree that do not affect the core or A=
BI. =20
>=20
> s/upload/push/
>=20
> > +
> > +- Core committers: responsible for part of the media core. They are ty=
pically
> > +  responsible for one or more drivers within the media subsystem, but,=
 besides
> > +  that, they can also merge patches that change the code common to mul=
tiple
> > +  drivers, including the kernel internal API/ABI. =20
>=20
> I would write "API" only here. Neither the kernel internal API nor its
> internal ABI are stable, and given that lack of stability, the ABI
> concept doesn't really apply within the kernel.

It does for distros, but this is a separate matter ;-)

=46rom my side, I'm ok with either API or API/ABI, if ok for Hans and others
as well.

> > +
> > +- Subsystem maintainers: responsible for the subsystem as a whole, with
> > +  access to the entire subsystem.
> > +
> > +  Only subsystem maintainers can change the userspace API/ABI. =20
>=20
> This can give the impression that only subsystem maintainers are allowed
> to work on the API. I would write
>=20
>   Only subsystem maintainers change push changes that affect the userspace
>   API/ABI.

I guess you meant to say:

   Only subsystem maintainers *can* push changes that affect the userspace
   API/ABI.

  (change -> can)

The new text seems OK to me. I'll change it at v2.

>=20
> > +
> > +Media committers shall explicitly agree with the Kernel development pr=
ocess =20
>=20
> Do we have to capitalize "Kernel" everywhere ? There are way more
> occurrences of "kernel" than "Kernel" in Documentation/ (even excluding
> the lower case occurrences in e-mail addresses, file paths, ...).

"The Kernel" means "the Linux Kernel". e. g. it is not just a random kernel,
it is the Linux Kernel. So, it is a proper noun. Proper nouns should always=
=20
be capitalized in English.

> > +as described at Documentation/process/index.rst and to the Kernel
> > +development rules inside the Kernel documentation, including its code =
of
> > +conduct. =20
>=20
> That's expected of all kernel developers, but I don't object reiterating
> it here.
>=20
> > +
> > +More details about media committers can be found here: =20
>=20
> Maybe "about media commiters' roles and responsibilities" would be more
> accurate, the document doesn't include information about the committers
> themselves.
>=20
> s/here:/at/
>=20
> > +Documentation/driver-api/media/media-committer.rst. =20
>=20
> Should this be a RST link ?

No need: a Sphinx plugin automatically converts it to hyperlink.

> > +
> > +Media development tree
> > +----------------------
> > +
> > +The main development tree used by the media subsystem is hosted at Lin=
uxTV.org,
> > +where we also maintain news about the subsystem, wiki pages and a patc=
hwork
> > +instance where we track patches though their lifetime.
> > +
> > +The main tree used by media developers is at:
> > +
> > +https://git.linuxtv.org/media.git/ =20
>=20
> I think the multi-committers tree should be upgraded to main development
> tree status, but that's a separate issue that I'm fine discussing
> separately, and also delaying for a few kernel releases until we iron
> out the rough edges of the process.

This is a separate discussion, and it is too early to start discussing it.

> > +.. _Media development workflow:
> > +
> > +Media development workflow
> > +++++++++++++++++++++++++++
> > +
> > +All changes for the media subsystem must be sent first as e-mails to t=
he
> > +media mailing list, as plain text only e-mail to:
> > +
> > +  `https://subspace.kernel.org/vger.kernel.org.html <linux-media@vger.=
kernel.org>`_
> > +
> > +Emails with HTML will be automatically rejected by the mail server.
> > +It could be wise to also copy the media committer(s). You should use
> > +``scripts/get_maintainers.pl`` to identify whom else needs to be copie=
d.
> > +Please always copy driver's authors and maintainers. =20
>=20
> Instead of duplicating a tiny part of the patch submission process, I
> would link to the appropriate documentation.

The intention here is to bold that driver's authors and maintainers should
always be c/c and the way to do it is via get_maintainers.pl. Yet, a link
to the process submission makes sense. I'll move the link to here.

>=20
> [1] (see below)
>=20
> > +
> > +Such patches needed to be based against a public branch or tag as foll=
ows: =20
>=20
> s/needed/need/
>=20
> > +
> > +1. new Kernel releases: =20
>=20
> s/new/New/
>=20
> What does that mean though ? It's not very clear.

Maybe "Upcoming Kernel releases"?

> > +
> > +   Those need to be based at the ``next`` branch of that media.git tree
> > +
> > +2. During Kernel release development cycle, patches fixing bugs on a -=
rc
> > +   kernel should preferably be against the latest -rc1 Kernel. If they
> > +   require a previously-applied change, they need to be against the ``=
fixes``
> > +   branch;
> > +
> > +3. Patches against an already released kernel should preferably be  ag=
ainst
> > +   the latest released Kernel. If they require a previously-applied
> > +   change, they need to be against ``fixes``. =20
>=20
> If I were a new contributor I think I would have trouble understand this
> to be honest. I won't push hard for a rework of this section, as I
> expect it will change after the multi-committer tree becomes the main
> way to get patches merged. We can then update the documentation.

Basically, the preference is to have patches against a release or against
-rc1 when it makes sense, as it helps when backports are needed.
I don't think this will ever change.

Patches against media.git next branch are ok, specially for new
features.

>=20
> > +
> > +All patches with fixes shall have:
> > +   - a ``Fixes:`` tag pointing to the first commit that introduced the=
 bug;
> > +   - a ``Cc: stable@vger.kernel.org``
> > +
> > +Patches that were fixing bugs reported by someone else shall have:
> > +  - a ``Reported-by`` tag immediately followed by a ``Closes`` tag. =20
>=20
> There's been a recent discussion about not including a Reported-by tag
> without asking permission from the reporter, due to privacy reasons (in
> particular for bugs reported to https://bugzilla.kernel.org/, as by
> default the e-mail address of the reporter is not public). As the
> Reported-by and Closes tags are not specific to the media tree, I would
> drop this paragraph, otherwise we will have to duplicate a relatively
> large amount of information related to privacy. You can link to the
> relevant documentation instead, but I wouldn't even do that as it's
> really not media-specific.

Good point, but:

1. I can't remember last time I saw a media patch pointing to a Kernel BZ
   in the recent days (surely there are, but they're not frequent);
2. We do have a common pattern on media about people adding Reported-by:
   without Closes:, or with closes at the wrong place.

So, we're trying to address those problematic cases. Maybe we could change
the above to:

	Patches with fixes shall have:
	- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
	- when applicable, a ``Cc: stable@vger.kernel.org``.

	Patches that were fixing bugs publicly reported by someone
	at the media mailing list shall have:
	- a ``Reported-by`` tag immediately followed by a ``Closes`` tag. =20

>=20
> > +
> > +Patches that change API/ABI shall require patches to update documentat=
ion =20
>=20
> s/require patches to //
>=20
> > +accordingly at the same patch series. =20
>=20
> s/at the/in the/
>=20
> > +
> > +See Documentation/process/index.rst for more details about e-mail subm=
ission. =20
>=20
> This could be moved up to [1].
>=20
> > +
> > +Once a patch is submitted, it may follow either one of the workflows
> > +below: =20
>=20
> "of the following workflows"
>=20
> > +
> > +a. Normal workflow: patches are handled by subsystem maintainers::
> > +
> > +     +------+   +---------+   +-------+   +-------------------+   +---=
------+
> > +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge  |-->|med=
ia.git|
> > +     +------+   +---------+   |request|   |at media-committers|   +---=
------+
> > +                              +-------+   +-------------------+ =20
>=20
> This makes it look like the pull request originates from patchwork.

No, it points that patches from e-mail go to patchwork, and the PRs come
from what it is in patchwork(*).

(*) Now, it doesn't matter if one picks it manually from the mailing list
    or picked with b4 or pwclient, the point is that the patch shall be=20
    in patchwork before someone does a pull request, as the patch state
    at patchwork needs to reflect the patch review lifetime.

>=20
> s/at /in /
>=20
> I would also add .git to media-committers to make it clear it's a git
> tree.

Ok.

>=20
> (I still think the tree name is too long and not very appropriate, but
> that's a different question)
>=20
> > +
> > +   For this workflow, pull requests can be generated by a committer,
> > +   a previous committer, subsystem maintainers or by a couple of trust=
ed
> > +   long-time contributors. If you are not in such group, please don't =
submit
> > +   pull requests, as they will likely be ignored.
> > +
> > +b. Committers' workflow: patches are handled by media committers::
> > +
> > +     +------+   +---------+   +-------------------+   +-----------+   =
+---------+
> > +     |e-mail|-->|patchwork|-->|committers merge   |-->|maintainers|-->=
|media.git|
> > +     +------+   +---------+   |at media-committers|   |approval   |   =
+---------+
> > +                              +-------------------+   +-----------+
> > +
> > +When patches are merged at patchwork and when merged at media-committe=
rs, =20
>=20
> We don't "merge" patches in patchwork. You could write "When patches are
> picked by patchwork" for instance.

Works for me. I'll change it in v2.

>=20
> > +CI bots will check for errors and may provide e-mail feedback about
> > +patch problems. When this happens, the e-mail author must fix them =20
>=20
> s/e-mail author/patch author/ ? Or possibly better, "patch submitter" as
> that person may not be the author.

Ok.

> > +and send another version of the patch.
> > +
> > +Patches will only be moved to the next stage in those two workflows if=
 they
> > +don't fail on CI or if there are false-positives at the CI reports. =20
>=20
> s/at the/in the/
>=20
> > + =20
>=20
> This workflow doesn't apply to patch submitters who are not allowed to
> send pull requests and who don't have direct commit access. I thought
> these submitters are the main audience of this document. In that case, I
> think moving the next section that explains the e-mail workflow before
> the "Media development workflow" section (which should likely be renamed
> to make it clear that it is about merging patches, not developing them)
> would be best. The "Review Cadence" section could also be folded in
> there, to give a full view of what a submitter can expect.
>=20
> This would also have the advantage of introducing the linuvtv.org
> patchwork instance, which you reference above. Documents are more
> readable when they introduce concepts first before using them.

Will try to do such change at v2.

>=20
> > +Failures during e-mail submission
> > ++++++++++++++++++++++++++++++++++
> > =20
> >  Media's workflow is heavily based on Patchwork, meaning that, once a p=
atch
> >  is submitted, the e-mail will first be accepted by the mailing list
> > @@ -47,51 +156,36 @@ server, and, after a while, it should appear at:
> > =20
> >     - https://patchwork.linuxtv.org/project/linux-media/list/
> > =20
> > -If it doesn't automatically appear there after a few minutes, then
> > +If it doesn't automatically appear there after some time [2]_, then
> >  probably something went wrong on your submission. Please check if the
> > -email is in plain text\ [2]_ only and if your emailer is not mangling
> > +email is in plain text\ [3]_ only and if your emailer is not mangling
> >  whitespaces before complaining or submitting them again.
> > =20
> > -You can check if the mailing list server accepted your patch, by looki=
ng at:
> > +To troubleshoot problems, you should first check if the mailing list
> > +server has accepted your patch, by looking at:
> > =20
> >     - https://lore.kernel.org/linux-media/
> > =20
> > -.. [2] If your email contains HTML, the mailing list server will simply
> > +If the patch is there and not at patchwork, it is likely that your e-m=
ailer
> > +mangled the patch. Patchwork internally has a logic that checks if the
> > +received e-mail contain a valid patch. Any whitespace and new line
> > +breakages mangling the patch won't be recognized by patchwork, thus su=
ch
> > +patch will be rejected.
> > +
> > +.. [2] It usually takes a few minutes for the patch to arrive, but
> > +       the e-mail server is busy, so it may take up to a few hours =20
>=20
> s/is busy/may be busy/
>=20
> > +       for a patch to be handled by the mail server and by the patchwo=
rk
> > +       instance. =20
>=20
> "for a patch to be recorded by patchwork."
>=20
> > +
> > +.. [3] If your email contains HTML, the mailing list server will simply
> >         drop it, without any further notice. =20
>=20
> These changes too could have been split to a separate cleanup patch, to
> make the crux of this patch easier to review.
>=20
> > =20
> > +Subsystem maintainers
> > +---------------------
> > =20
> > -Media maintainers
> > -+++++++++++++++++
> > -
> > -At the media subsystem, we have a group of senior developers that
> > -are responsible for doing the code reviews at the drivers (also known =
as
> > -sub-maintainers), and another senior developer responsible for the
> > -subsystem as a whole. For core changes, whenever possible, multiple
> > -media maintainers do the review.
> > -
> > -The media maintainers that work on specific areas of the subsystem are:
> > -
> > -- Remote Controllers (infrared):
> > -    Sean Young <sean@mess.org>
> > -
> > -- HDMI CEC:
> > -    Hans Verkuil <hverkuil@xs4all.nl>
> > -
> > -- Media controller drivers:
> > -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > -
> > -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor driver=
s:
> > -    Sakari Ailus <sakari.ailus@linux.intel.com>
> > -
> > -- V4L2 drivers and core V4L2 frameworks:
> > -    Hans Verkuil <hverkuil@xs4all.nl> =20
>=20
> We're losing that information, isn't it valuable ?

With the media-committers model, there's no concept of "media
maintainers" anymore. Also, the above will dynamically change
over time. Instead of placing things here, it makes more sense to
ensure that the MAINTAINERS entry gets updated accordingly as we
add media-committers, as this is what get-maintainers.pl uses.

Besides that, the auto-delegation rules at patchwork will help
keeping the patches c/c to the right person, in the eventual
case someone doesn't run get-maintainers.pl.

>=20
> > -
> > -The subsystem maintainer is:
> > -  Mauro Carvalho Chehab <mchehab@kernel.org>
> > -
> > -Media maintainers may delegate a patch to other media maintainers as n=
eeded.
> > -On such case, checkpatch's ``delegate`` field indicates who's currently
> > -responsible for reviewing a patch.
> > +The subsystem maintainers are:
> > +  Mauro Carvalho Chehab <mchehab@kernel.org> and
> > +  Hans Verkuil <hverkuil@xs4all.nl> =20
>=20
> If you don't intend on this being rendered as a list, it should be
>=20
> The subsystem maintainers are Mauro Carvalho Chehab <mchehab@kernel.org> =
and
> Hans Verkuil <hverkuil@xs4all.nl>.
>=20
> Otherwise,
>=20
> The subsystem maintainers are:
>=20
> - Mauro Carvalho Chehab <mchehab@kernel.org>
> - Hans Verkuil <hverkuil@xs4all.nl>
>=20
>=20
> Shouldn't MAINTAINERS be updated at the same time ?

It should be a separate patch. I would be doing such change once
Hans will be about to start sending pull requests, which still
require more actions.

> > =20
> >  Submit Checklist Addendum
> >  -------------------------
> > @@ -108,17 +202,14 @@ implementing the media APIs:
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >  Type			Tool
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > -V4L2 drivers\ [3]_	``v4l2-compliance``
> > +V4L2 drivers\ [4]_	``v4l2-compliance``
> >  V4L2 virtual drivers	``contrib/test/test-media``
> >  CEC drivers		``cec-compliance``
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > =20
> > -.. [3] The ``v4l2-compliance`` also covers the media controller usage =
inside
> > +.. [4] The ``v4l2-compliance`` also covers the media controller usage =
inside
> >         V4L2 drivers.
> > =20
> > -Other compilance tools are under development to check other parts of t=
he
> > -subsystem.
> > -
> >  Those tests need to pass before the patches go upstream.
> > =20
> >  Also, please notice that we build the Kernel with::
> > @@ -134,6 +225,8 @@ Where the check script is::
> >  Be sure to not introduce new warnings on your patches without a
> >  very good reason.
> > =20
> > +Please see `Media development workflow`_ for e-mail submission rules.
> > + =20
>=20
> These hunks too could have been split to a cleanup patch before the main
> changes.
>=20
> >  Style Cleanup Patches
> >  +++++++++++++++++++++
> > =20
> > diff --git a/Documentation/driver-api/media/media-committer.rst b/Docum=
entation/driver-api/media/media-committer.rst
> > new file mode 100644
> > index 000000000000..27b85a37fb2b
> > --- /dev/null
> > +++ b/Documentation/driver-api/media/media-committer.rst
> > @@ -0,0 +1,252 @@
> > +Media committers
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +What is a media committer?
> > +--------------------------
> > +
> > +A media committer is a developer who can apply patches from other deve=
lopers =20
>=20
> Here too we could standardize to "push" instead of "apply".
>=20
> > +and their own patches at the =20
>=20
> s/at the/to the/
>=20
> I would simply write "who can push commits to the ...".

The main goal of a maintainer, which is partially delegated to
committers, is to apply patches from other developers.

We'd like to bold it here.

>=20
> > +`media-committers <https://gitlab.freedesktop.org/linux-media/media-co=
mmitters>`_
> > +tree.
> > +
> > +It is a media committer's duty to ensure that their entries at the MAI=
NTAINERS =20
>=20
> s/at the/in the/
>=20
> > +file will be kept updated, and that submitted patches for files for wh=
ich =20
>=20
> s/will be kept update/are kept up-to-date/
>=20
> > +they are listed as maintainers are timely reviewed at the mailing list=
, =20
>=20
> s/at the/on the/
>=20
> > +not waiting in patchwork as ``New`` for more than one Kernel merge cyc=
le,
> > +and, if accepted, applying them at the media committer's tree. =20
>=20
> I think this goes a bit backward, and mixes things up a bit. On the
> mixing side, the expectation of timely reviews comes from maintainer
> status. Having commit rights is orthogonal to that.
> The goal of direct commit access is to speed up maintenance, to get
> patches reviewed and merged quicker.=20
> Are we saying here that if someone
> has commit rights they will lose them if they take too long to review
> code ? That would then slow down maintenance even more, which seems
> counterproductive.
>=20

This seems to be a difference between drm-misc criteria and our
criteria: it is a requirement for committers to review other peoples patche=
s.
It is somewhat similar to drm-intel and drm-xe, where reviews are part
of the acceptance criteria to become committers.

On other words, committers are people where maintainers will delegate
some parts. They need to work as "maintainer's proxy" for the delegated
parties, which includes reviewing patches.

So, the same way maintainers have duties to do timely reviews
(as you mentioned), committers will have it for the parts of the=20
subsystem that were delegated for them to merge code. This includes
not only their work as developers, but also patches submitted by third
parties.

Clearly, nobody will get rights revoked if a couple of patches would
take more than one kernel cycle because of technical issues
(for instance too complex patches or patches that may have potential=20
to cause regressions). But it is expected that committers will do timely
reviews for the code he asked to be a committer.

> Also, while one can be recognized as a maintainer for multiple drivers
> or parts of the kernel, there's a single committer status. You can't
> revoke committer status of a particular driver only.

While not explicitly written, if a committer that maintains multiple
drivers wants to step down from maintaining one of them, he could
simply write an e-mail to media-committers requesting to step down
from maintaining such driver.

On such case, MAINTAINERS file should be updated accordingly,
as usual.


> > +
> > +This privilege is granted with some expectation of responsibility: =20
>=20
> "Privilege" sounds a bit like lord and serf.

This is the term used on SQL databases. Here, it is used in the context
of having the same technical meaning as there. We used this term here
in the lack of a better word. Do you have a better way to describe it?

See, while correct, it is not nice to repeat grant twice like:

	This grant is granted with some expectation of ...
	     =3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D

We might use "duties", but it is not quite the same.

> > +committers are people who care about the Linux Kernel as a whole and
> > +about the Linux media subsystem and want to help its development. It
> > +is also based on a trust relationship between the rest of the committe=
rs,
> > +maintainers and the LinuxTV community. =20
>=20
> Who is "the LinuxTV community" ?

See https://linuxtv.org/:

	The LinuxTV community (linux-media) develops and maintains the Linux Kerne=
l Media Subsystems and several userspace libraries and applications.

I'll add a link to linuxtv.org there.

>=20
> > +
> > +As such, a media committer is not just someone who is capable of creat=
ing
> > +code, but someone who has demonstrated their ability to collaborate
> > +with the team, get the most knowledgeable people to review code,
> > +contribute high-quality code, and follow through to fix issues (in code
> > +or tests).
> > +
> > +.. Note::
> > +
> > +   1. If a patch introduced a regression, then it is the media committ=
er's =20
>=20
> s/introduced/introduces/
>=20
> > +      responsibility to correct that as soon as possible. Typically the
> > +      patch is either reverted, or an additional patch is committed th=
at
> > +      fixes the regression;
> > +   2. if patches are fixing bugs against already released Kernels, inc=
luding
> > +      the reverts above mentioned, the media committer shall add the n=
eeded
> > +      tags.  Please see :ref:`Media development workflow` for more det=
ails. =20
>=20
> s/  Please/ Please/
>=20
> > +   3. all patches should be properly reviewed at
> > +      linux-media@vger.kernel.org before being merged at the =20
>=20
> s/at the/in the/
>=20
> > +      media-committers tree or submitted on pull requests. =20
>=20
> This is a fundamental rule that belongs to the development workflow in
> my opinion.

I'll add it there. Yet, I would prefer to keep it here too, as new
committers need to be aware that patches need to be reviewed first
at the ML.

>=20
> > +
> > +Becoming a media committer
> > +--------------------------
> > +
> > +The most important aspect of volunteering to be a committer is that yo=
u will
> > +be able to review and approve other people's changes, so we are lookin=
g for =20
>=20
> Everybody is able to review patches (rather, everybody is allowed to
> review patches, the ability is a different matter).

Ok.

>=20
> > +whether we think you will be good at doing that. =20
>=20
> I've been told that "whether" should also come with a "or" clause. You
> can write "whether or not we think ...".
>=20
> > +
> > +As such, potential committers must earn enough credibility and trust f=
rom the
> > +LinuxTV community. To do that, developers shall be familiar with the o=
pen
> > +source model and have been active at the Linux Kernel community for so=
me time, =20
>=20
> s/at the/in the/
>=20
> > +and, in particular, with the media subsystem. =20
>=20
> s/with the/in the/
>=20
> > +
> > +So, in addition to actually making the code changes, you are basically
> > +demonstrating your:
> > +
> > +- commitment to the project;
> > +- ability to collaborate with the team and communicate well;
> > +- understand of how upstream and the LinuxTV community  works =20
>=20
> s/  works/ work/
>=20
> > +  (policies, processes for testing, code review, ...)
> > +- reasonable knowledge about:
> > +
> > +  - the Kernel development process:
> > +    Documentation/process/index.rst
> > +
> > +  - the Media development profile:
> > +    Documentation/driver-api/media/maintainer-entry-profile.rst
> > +
> > +- understanding of the projects' code base and coding style;
> > +- ability to provide feedback to the patch authors;
> > +- ability to judge when a patch might be ready for review and to submi=
t;
> > +- ability to write good code (last but certainly not least).
> > +
> > +It is also desirable that developers that intend to become committers
> > +make a best effort to attend the yearly Linux Media Summit, typically
> > +co-located with another Linux conference. =20
>=20
> I would say that "are encouraged to attend" instead of "make a best
> effort to attend".=20

Ok.

> Also, how will this scale when we'll have a few
> dozen committers ? Typically the media summit is capped to 20 attendees
> or less.

If we have a few dozen committers, I would try to find a bigger
room for the Media Summit ;-)

> > +If you are doing such tasks and have become a valued developer, an
> > +existing committer can nominate you to the media subsystem maintainers=
. =20
>=20
> https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-acces=
s.html#access-request:
>=20
> "Maintainers and committers should encourage contributors to request
> commit rights, especially junior contributors tend to underestimate
> their skills."

Too early for that. We don't want junior contributors causing
merge issues and forcing maintainers to do rebases at media-committers.git.
=20
> > +
> > +The ultimate responsibility for accepting a nominated committer is up =
to
> > +the subsystem's maintainers. The committers must earn a trust relation=
ship
> > +with all subsystem maintainers, as, by granting you commit rights, the=
y will
> > +be delegating part of their maintenance tasks.
> > +
> > +Due to that, to become a committer or a core committer, a consensus be=
tween
> > +all subsystem maintainers is required, as they all need to trust a dev=
eloper
> > +well enough to be delegated the responsibility to maintain part of the=
 code
> > +and to properly review patches from third parties, in a timely manner =
and
> > +keeping the status of the reviewed code at https://patchwork.linuxtv.o=
rg
> > +updated.
> > +
> > +.. Note::
> > +
> > +   In order to preserve the developers that could have their commit ri=
ghts =20
>=20
> Do you mean "protect" instead of "preserve" ? Or maybe "preserve/protect
> the privacy of" ?

Good point. I'd say both.

> s/that/who/
> s/their // (in the granted case, they don't have commit rights yet)
>=20
> > +   granted or denied as well as the subsystem maintainers who have the=
 =20
>=20
> "granted, denied or removed" ?

Ok.

> > +   task to accept or deny commit rights, all communication related to
> > +   nominating a committer, preserving commit rights or leaving such fu=
nction
> > +   should happen in private as much as possible.
> > +
> > +Media committer's agreement
> > +---------------------------
> > +
> > +Once a nominated committer is accepted by all subsystem maintainers,
> > +they will ask if the developer is interested in the nomination and dis=
cuss
> > +what area(s) of the media subsystem the committer will be responsible =
for.
> > +
> > +Once the developer accepts being a committer, the new committer shall
> > +explicitly accept the Kernel development policies described under its
> > +Documentation/, and, in particular to the rules on this document, by w=
riting
> > +an e-mail to media-committers@linuxtv.org, with a declaration of intent
> > +following the model below::
> > +
> > +   I, John Doe, would like to change my status to: Committer
> > +
> > +   I intend to actively develop the XYZ driver, send fixes to drivers
> > +   that I can test, reviewing patches and merging trivial fixes
> > +   for the subsystem, ... =20
>=20
> "Merging trivial fixes for the subsystem" bothers me. I don't think it
> needs to be a requirement for committers. This is a maintainer's
> responsibility. If people want to help with that that's great, but
> making it a requirement isn't. Or did you mean this as an example ?

This is an example. The scope will be case-by-case, and will be
part of the discussions with the maintainers.

Yet, if a committer requests rights for driver A, I expect him/her to=20
pick trivial patches for it.

The committers may eventually pick trivial patches for other drivers. We=20
need to take some care with that to avoid multiple developers to review
the same patches and wasting their time.

> We shouldn't expect committers to handle a higher workload than what
> they do as driver maintainers who submit patches by e-mail or send pull
> requests. Giving commit rights will lower the effort to get patches in,
> and I think it's fair to ask for keeping patchwork up-to-date in return,
> but that's about it.
>=20
> > +
> > +Followed by a formal declaration of agreement with the Kernel developm=
ent
> > +rules, signed with a PGP key cross signed by other Kernel and media =20
>=20
> s/PGP/GPG/ (same thing in practice, but let's advocate for free
> software)

The Kernel docs referred in this section use the term PGP. I don't
mind replacing them to GPG, but this has to happen at the already
existing docs as well. Feel free to submit such patch later on, once
we get this merged upstream.

>=20
> > +developers. Such declaration shall be:: =20
>=20
> I find the GPG signature requirement to be borderline ridiculous. The
> first message you're giving to committers is that you distrust them so
> much that you want them to sign an agreement with their blood
> (figuratively speaking). I don't think it's a very good approach to
> community building, nor does it bring any advantage to anyone.

Please don't spread FUD. The intent is to ensure that the email
really came from the committer, and was not impersonated by someone's
else.

> > +
> > +   I hereby declare that I agree with the Kernel development rules des=
cribed at:
> > +
> > +   https://www.kernel.org/doc/html/latest/driver-api/media/media-commi=
tter.rst
> > +
> > +   and to the Linux Kernel development process rules.
> > +
> > +   I agree to the Code of Conduct as documented here: =20
>=20
> s/here:/in/
>=20
> > +   Documentation/process/code-of-conduct.rst =20
>=20
> You use an http link for meda-commiter.rst and a file path for
> code-of-conduct.rst. RST links for both would be more consistent, but if
> the goal is to paste the text in an e-mail, you can also use http links
> or file paths for both.

Good point. Both shall be pointing to https://www.kernel.org/doc/html/lates=
t/,
as this is the example of the content of the e-mail. Also, as this is inside
a Sphinx code-block, ReST links won't work.

> > +   I am aware that I can, at any point of time, retire. In that case, =
I will
> > +   send an e-mail to notify the subsystem maintainers for them to revo=
ke my
> > +   commit rights.
> > +
> > +   I am aware that the Kernel development rules change over time.
> > +   By doing a new commit, I understand that I agree with the rules in =
effect =20
>=20
> What does "doing a new commit" mean here ? Sending a patch to the list ?
> Pushing it to the shared tree ? I assume the latter given the text
> below, it could be clarified here.

It means a commit at media-committers.git. I'll clarify it.
=20
> > +   at the time of the commit.
> > +
> > +For more details about PGP sign, please read
> > +Documentation/process/maintainer-pgp-guide.rst and
> > +:ref:`kernel_org_trust_repository`.
> > +
> > +In case the kernel development process changes, by merging new commits=
 at the =20
>=20
> s/at the/in the/
>=20
> > +`media-committers <https://gitlab.freedesktop.org/linux-media/media-co=
mmitters>`_, =20
>=20
> s/media-committers/media-committers tree/
>=20
> > +the media committer implicitly declares that the agreement with the la=
test =20
>=20
> s/that the/their/
>=20
> > +version of the documented process and to the contents of this file. =20
>=20
> s/to the contents // ("latest version" applies to both "the documented
> process" and "this file")
>=20
> This is problematic, as we can't expect people to check for changes in
> this file every time they push something. Changes to this file should be
> announced to all committers, with a reasonable review period.

I don't expect that this document will change too much. See for instance
how many times we changed the media developers profile. Also, any=20
changes for the media committers document shall be c/c to linux-media
and hopefully c/c to media committers.

But see: it is not just this file: it is the entire Kernel submission
process, and CoC. We can't expect that people will notify us with a=20
reasonable review period every time someone changes a bit at the=20
documentation process, as such discussions typically happen at=20
linux-docs ML.

If such changes happen and a committer doesn't notice and gets
upset enough to decide retiring, The committer can step down when
this is noticed. Yet, we don't want any troubles for the already
committed patches, nor we want to cause any harm for the other
media committers and maintainers if this ever happens.

>=20
> > +
> > +Core committers
> > +---------------
> > +
> > +As described in Documentation/driver-api/media/maintainer-entry-profil=
e.rst =20
>=20
> RST link here too.
>=20
> > +a committer may be granted with additional privileges to also be able =
to =20
>=20
> s/privileges/rights/
>=20
> (same below)
>=20
> > +change a core file and/or media subsystem's Kernel API/ABI. The extent=
 of =20
>=20
> Drop "/ABI" as above.
>=20
> > +the core committer's additional privileges will be detailed by the sub=
system
> > +maintainers when they nominate a core committer.
> > +
> > +Existing committers may become core committers and vice versa. Such
> > +decisions will be taken in consensus between the subsystem maintainers.
> > +
> > +Media committers rules
> > +----------------------
> > +
> > +Media committers shall ensure that merged patches will not break any e=
xisting
> > +drivers. If it breaks, fixup or revert patches shall be merged as soon=
 as =20
>=20
> How do they ensure that ? I would prefer mentioning a best effort here,
> as it's practically not possible to ensure this (until we have CI
> covering all the drivers in the subsystem, which is not a reasonable
> target).

Makes sense, I'll change it. The important message there relies at the=20
second phrase:

"If it breaks, fixup or revert patches shall be merged as soon as possible"
=20
> > +possible, aiming to be merged at the same Kernel cycle the bug is repo=
rted.
> > +
> > +Media committers shall behave accordingly to the permissions granted b=
y =20
>=20
> s/permissions/rights/ (we never use "permission" anywhere else)
>=20
> > +the subsystem maintainers, specially with regards of the scope of chan=
ges
> > +they may apply directly at the media-committers tree. Such scope can
> > +change overtime on a mutual greement between media committers and =20
>=20
> s/overtime/over time/
> s/greement/agreement/
>=20
> > +maintainers.
> > +
> > +As described at :ref:`Media development workflow`, there are workflows=
. =20
>=20
> s/at /in /
>=20
> > +For the committers' workflow, the following rules apply:
> > +
> > +- Each merged patch shall pass CI tests;
> > +
> > +- Media committers shall request reviews from other committers were =20
>=20
> We shouldn't limit this to "other committers". When making changes to a
> driver that is not maintained by any committer (for instance when making
> tree-wide changes), the person in the best position to review the
> changes is the driver maintainer or author. I would extend this to "from
> third parties", or "from other developers".

True, but the idea here is to enforce the need of collaboration with
other maintainers. So, perhaps:

	"from other committers and developers"

>=20
> > +  applicable, i.e. because those committers have more knowledge about
> > +  some areas that are changed by a patch;
> > +
> > +- No other media committer would be against the proposed changes. =20
>=20
> https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-dr=
m-misc.html#merge-criteria:
>=20
> "There must not be open issues or unresolved or conflicting feedback
> from anyone. Clear them up first. Defer to maintainers as needed."
>=20
> That's better than restricting the conflicts to committers. If there are
> open issues, the patches should not be merged through the shared tree.

Works for me.

> > +
> > +Patches that do not fall under the committer's workflow criteria will =
follow
> > +the normal workflow as described at :ref:`Media development workflow`.
> > +
> > +Only a subsystem maintainer can override such rules.
> > +
> > +All media committers shall ensure that patchwork will reflect the curr=
ent
> > +status, e.g. patches shall be delegated to the media committer who is
> > +handling them and the patch status shall be updated according to these=
 rules:
> > +
> > +- ``Under review``: Used if the patch requires a second opinion
> > +  or when it is part of a pull request;
> > +- ``Accepted``: Once a patch is merged at the multi-committer tree. =20
>=20
> s/at the/in the/
>=20
> > +- ``Superseded``: There is a newer version of the patch posted in the =
=20
>=20
> s/in the/to the/
>=20
> > +  mailing list.
> > +- ``Duplicated``: There was another patch doing the same thing from so=
meone
> > +  else that was accepted.
> > +- ``Not Applicable``: Use for patch series that are not merged at medi=
a.git
> > +  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted =
to the
> > +  linux-media mailing list.
> > +
> > +If the committer decides not to merge it, then reply by email to patch
> > +authors, explaining why it is not merged, and patchwork shall be updat=
ed
> > +accordingly with either:
> > +
> > +- ``Changes Requested``: if a new revision was requested;
> > +- ``Rejected``: if the proposed change won't be merged upstream. =20
>=20
> There are tools to ease updating the status of a patch, could you
> document or at least mention them ?

I'll add a link to:
	https://patchwork.readthedocs.io/en/latest/usage/clients/

=46rom my side, I only tested pwclient (and the REST API interface
which I use on some scripts, like the one at Jenkins to test PRs).

> > +
> > +If a media committer decides to retire, it is the committer's duty to
> > +notify the subsystem maintainers about that decision.
> > +
> > +Maintaining media committer status
> > +----------------------------------
> > +
> > +A community of committers working together to move the Linux Kernel
> > +forward is essential to creating successful projects that are rewarding
> > +to work on. If there are problems or disagreements within the communit=
y,
> > +they can usually be solved through healthy discussion and debate.
> > +
> > +In the unhappy event that a media committer continues to disregard good
> > +citizenship (or actively disrupts the project), we may need to revoke =
=20
>=20
> That's very, very vague, surprisingly vague even from someone who raised
> many concerns about the kernel code of conduct being vague.

This text came from Google Chromium committer document:
	https://chromium.googlesource.com/playground/chromium-org-site/+/refs/head=
s/main/getting-involved/become-a-committer.md#maintaining-committer-status

It is vague, a revoking commit rights is a discretionary act. It is nearly
impossible to describe all conditions that could lead a committer to be
distrusted.

> > +that person's status. In such cases, if someone suggests the revocatio=
n with
> > +a good reason, other developers may second the motion. The final decis=
ion
> > +is taken by the subsystem maintainers. As the decision to become a med=
ia =20
>=20
> What does "seconding the motion" bring, if the decision lies solely in
> maintainers ?

The decision is up to maintainers, but other committers/developers may
voice about it.

> > +committer comes from a consensus between subsystem maintainers, a sing=
le
> > +subsystem maintainer not trusting the media committer anymore is enoug=
h to
> > +revoke committer's privileges.
> > +
> > +If a committer is inactive for more than a couple of Kernel cycles,
> > +maintainers will try to reach you via e-mail. If not possible, they may
> > +revoke your committer privileges and update MAINTAINERS file entries
> > +accordingly. If you wish to resume contributing later on, then contact
> > +the subsystem maintainers to ask if your rights can be restored. =20
>=20
> https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-acces=
s.html#access-request:
>=20
> "Committers are encouraged to request their commit rights get removed
> when they no longer contribute to the project. Commit rights may be
> automatically revoked after a year of inactivity (no commits or
> reviews).=20

I prefer the current version, as it makes clearer that we expect
committers to request removal before becoming inactive.=20

> Commit rights will be reinstated when they come back to the
> project."

This doesn't sound right, as it means that just returning back
is an enough condition for having committer grants restored.

This should not be automatic: the returned contributors need to
opt-in to be committers again, and the maintainers need to be=20
confident that the developers will do their duties before restore
committers' grants.=20

> > +
> > +A previous committer that had his commit rights revoked can keep contr=
ibuting =20
>=20
> s/his/their/
>=20
> > +to the subsystem via the normal e-mail workflow as documented at the
> > +:ref:`Media development workflow`.
> > +
> > +References
> > +----------
> > +
> > +Much of this was inspired by/copied from the committer policies of:
> > +
> > +- `Chromium <https://chromium.googlesource.com/chromium/src/+/main/doc=
s/contributing.md>`_;
> > +- `WebKit <http://www.google.com/url?q=3Dhttp%3A%2F%2Fwebkit.org%2Fcod=
ing%2Fcommit-review-policy.html&sa=3DD&sntz=3D1&usg=3DAFrqEze4W4Lvbhue4Bywq=
gbv-N5J66kQgA>`_; =20
>=20
> Google tracks us enough without using google URLs.

I'll fix.

>=20
> > +- `Mozilla <http://www.google.com/url?q=3Dhttp%3A%2F%2Fwww.mozilla.org=
%2Fhacking%2Fcommitter%2F&sa=3DD&sntz=3D1&usg=3DAFrqEzecK7iiXqV30jKibNmmMtz=
HwtYRTg>`_. =20
>=20
> https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-acces=
s.html
> would also have been a good source of inspiration. That's the only large
> multi-committer workflow today in the kernel, and it has proven its
> value. The explicit acceptance criteria in particular are very good.
> Quoting the document, it says
>=20
> "Commit rights will be granted to anyone who requests them and fulfills
> the below criteria:"
>=20
> That's how we build an inclusive community, it feels way more welcoming
> than saying that maintainers will discuss in private and grant
> privileges to underlings if it pleases them (even if the effect is the
> same in practice, it's still a maintainer decision).

The criteria for drm-misc has a big gap from what we want:

	"This should not be interpreted as a requirement to review other=20
	peoples patches"

We do require committers to review other peoples patches. It sounds
that the criteria there for xe/i915 partially fixes the issue with
drm-misc, as it adds this criteria:

	"Has reviewed at least 25 patches from other developers to the
	 chosen driver that have already been merged upstream. Again,
	 most of the reviewed patches must be non-trivial."

But still it doesn't say that committers shall review other peoples
patches(*).

(*) Such reviews happen in practice there, but the number of patches
    from external parties for xe/915 are very small and they usually come
    from business partners. This is a very different reality than what we
    have on media.

Besides that, in practical terms, we're not ready to accept "anyone".=20
Our current goal is to grant commit rights to the most active developers
that have been doing a good work reviewing patches from others. On other
words, the focus are on those who has already grants at patchwork to=20
update patches. It doesn't mean that we're limited to them. It is just
that we need to implement multi-committers without causing troubles to
the subsystem's workflow.

Also, we had enough troubles with our past multi-committers model,
back in the days we were using Mercurial, because there, we used
to grant committer access to "anyone" that were active at the=20
media development.

So, it has to be a step-by-step approach.

Maybe after a couple of years this will be revisited and we could use
a more inclusive text, but first we need to ensure that media-ci,=20
patchwork and the multi-committer's model will work for us on a=20
multi-committers model. Then, we'll likely need a tool similar to `dim`
to help with the merge requests and avoid problems that may
force maintainers to do rebases.

>=20
> > +
> > diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documenta=
tion/process/maintainer-pgp-guide.rst
> > index f5277993b195..795ef8d89271 100644
> > --- a/Documentation/process/maintainer-pgp-guide.rst
> > +++ b/Documentation/process/maintainer-pgp-guide.rst
> > @@ -903,6 +903,8 @@ the new default in GnuPG v2). To set it, add (or mo=
dify) the
> > =20
> >      trust-model tofu+pgp
> > =20
> > +.. _kernel_org_trust_repository:
> > +
> >  Using the kernel.org web of trust repository
> >  --------------------------------------------
> >   =20
>=20

Thanks,
Mauro

