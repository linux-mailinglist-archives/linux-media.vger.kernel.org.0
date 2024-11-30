Return-Path: <linux-media+bounces-22383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C19DF05E
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 13:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2C33282216
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 12:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88D9198E6D;
	Sat, 30 Nov 2024 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knsNiAf8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193215D5CE;
	Sat, 30 Nov 2024 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732970546; cv=none; b=oMX0VdTt+yGsbVhG/QvXE7oFF6QkWB+52SsoFuJBHLj7wfjJygPowDFCvQiEN050A2dL3tkwczlRiM0jbLVQaJEEzEwqscwciBk5JmDb4mg4GP2ccO+X/HWbgCa+maKIgbBtmKLO3FNWNhSecughNWPiQ8wlJfb5g+j39Vm7hNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732970546; c=relaxed/simple;
	bh=OTFExf+QsXXdlpNsJKQkd59yFLG/lgzzIOiyJ0lxdIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYMqZDeW0W8Ldm/gg/HdoD8nQf/JMKYrRj+dd3QMEjsg3O2f9sAjOIaxHWq4eyUxggcey27yBfLJBIy4eWN/6f0s2QJ0V4Bz/mmwZDLms5f85+L8IsvCGhtXGQTlrYhAnhlLHq0RMJPKWdU1PiM1r3CaIaTPFudLqzLBwwRKcbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knsNiAf8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D2CC4CECC;
	Sat, 30 Nov 2024 12:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732970545;
	bh=OTFExf+QsXXdlpNsJKQkd59yFLG/lgzzIOiyJ0lxdIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=knsNiAf8nA3Ih9rS8JkTeC8kUvcBs9YNy7qkOXBwofAx1jeVaqLKmkRr1bUvphlt8
	 dkIRXN/D96k8mqPxyJX+ekgNp5irdidptdIIDH22eukZb/1I1QN9uEumjORARUefgL
	 QOTj1GM3n0hgI6pzPs92j6E1jeFTPYPCHtTmOwC1idkyjcwCM0ye0ZrFYoQkHJrDus
	 dhZL59KAFAJITnPSK0XWI+efk7lwZOjH4I/KME0AzNNtjFbhnTY3YF6BQ0VO8Hpj/q
	 9s760oqnNpRZsGNzJVPERMGvMadNkIL/n+1M+FV5FLawGuWzOjKAcUWzjxIODusJrm
	 QANmNoMzxp8Gg==
Date: Sat, 30 Nov 2024 13:42:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4ll.nl>
Subject: Re: [PATCH v2 1/2] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <20241130134221.5629bf57@foz.lan>
In-Reply-To: <CAPybu_2O9GVNCroLoFPGgrhs_UB97p6ng1dHgtVwbGhyr9LruA@mail.gmail.com>
References: <cover.1732872169.git.mchehab+huawei@kernel.org>
	<99e1b9df713827ce2e6c21073276c97030071a07.1732872169.git.mchehab+huawei@kernel.org>
	<CAPybu_2O9GVNCroLoFPGgrhs_UB97p6ng1dHgtVwbGhyr9LruA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 29 Nov 2024 16:09:41 +0100
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> escreveu:

> Thanks for putting this together.
>=20
> I have marked some minor nits here and there. You can put my
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks!

> The only thing that is not a nit: is changing responsible with
> contributor. But if we agree on the meaning (and I think that we do)
> we can always improve this doc later.

See the comments below with regards to your nits.

> On Fri, Nov 29, 2024 at 12:15=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:

> > +In the media subsystem, there are experienced developers who can push
> > +patches directly to the development tree. These developers are called
> > +Media committers and are divided into the following categories:
> > +
> > +- Committers: responsible for one or more drivers within the media sub=
system.
> > +  They can push changes to the tree that do not affect the core or ABI=
. =20
>=20
> Can we say contributor instead of responsible? For me responsible
> means maintainer.

Works for me.

> I would like to land patches that have been properly reviewed to the
> committers tree for areas that I do not maintiain:
>=20
> For example:
> - Laurent has reviewed a uvc patch that I want to land asap to avoid
> conflicts with other patchsets that I am working with.
> - I want to land a patch for a ci breakage that has been reviewed by
> another person, it is trivial, and none has a bad comment about it.
> - I want to land a fix for a driver that has been properly reviewed by
> the maintainer and none has a bad comment about it.

Makes sense. Yet, for the first example you would need to coordinate
with the uvc maintainers to avoid conflicts at the trees they would
be using.

> > +Media development workflow
> > +++++++++++++++++++++++++++
> > +
> > +All changes for the media subsystem must be sent first as e-mails to t=
he
> > +media mailing list, following the process documented at
> > +Documentation/process/index.rst.
> > +
> > +It means that patches shall be submitted as plain text only via e-mail=
 to:
> > +
> > +  `https://subspace.kernel.org/vger.kernel.org.html <linux-media@vger.=
kernel.org>`_ =20
>=20
> nit: Maybe this is a better url? https://lore.kernel.org/linux-media/

As this is focused on upcoming contributors, placing the place that contains
the subscription link sounds better to me. There, it has links for
subscribe, unsubscribe, post and archive (which already links to lore).

IMO, works better for newbies.

> > +
> > +Emails with HTML will be automatically rejected by the mail server.
> > +
> > +It could be wise to also copy the media committer(s). You should use =
=20
> nit: How does someone know who the committers are? I think sending to
> the ML and to ./get_maintainers.pl is enough

Yes, but that's what it is written...
>=20
>=20
> > +``scripts/get_maintainers.pl`` to identify whom else needs to be copie=
d.

here ^

> > +Please always copy driver's authors and maintainers.
> > +
> > +Such patches need to be based against a public branch or tag as follow=
s:
> > +
> > +1. Patches for new features need to be based at the ``next`` branch of
> > +   media.git tree;
> > +
> > +2. Fixes against an already released kernel should preferably be again=
st
> > +   the latest released Kernel. If they require a previously-applied
> > +   change at media.git tree, they need to be against its ``fixes`` bra=
nch. =20
>=20
> 2. Fixes against an already released kernel should preferably be against
>    the ``fixes`` branch of the media.git tree;

The better is to have such fixes against the latest released one, as
this would mean that such patch will apply cleanly at least at the
latest -stable.

Usually, conflicts are unlikely on such cases, but, when they happen,
committers can easily solve it.

As stable will be copied on both versions, that hopefully make their
work easier, as they can just use the version without conflicts.

As a notice, usually stable people doesn't solve conflicts, if they
have a high number of patches: they send-emails requesting us and/or
the author to do it.

> > +3. Fixes for issues not present at the latest released kernel should
> > +   preferably be against the latest -rc1 Kernel. If they require a
> > +   previously-applied change at media.git tree, they need to be against
> > +   its ``fixes`` branch. =20
>=20
> Can we get rid of this third type? It is a bit confusing.  My mental mode=
l is:
> - Things for the next kernel version: next
> - Things for this kernel version: fixes
>=20
> We will make sure to close the next tree when needed, and that fixes
> and next are upreved accordingly.

Not all people reporting patches to us will be doing against the
media tree for stuff that are on upstream. That's perfectly fine.
Also, it is an usual practice to have patches against -rc kernels.
This is specially true for developers working on distros: they just
test Linus -rc during their rolling release kernels.

See, for instance:
	https://bodhi.fedoraproject.org/updates/?packages=3Dkernel

So, we need to be prepared to receive patches aiming an upcoming
release on the top of a -rc release.

Maybe we can tell, instead:

3. Fixes for issues not present at the latest released kernel shall
   be either against a -rc kernel for an upcoming release or
   against the ``fixes`` branch of the media.git tree.

That's said, it is uncommon to have conflicts there, but sometimes
they happen.

When they happen, they're trivial enough for the committers to
handle it.

> > +Once a patch is submitted, it may follow either one of the following
> > +workflows:
> > +
> > +a. Pull request workflow: patches are handled by subsystem maintainers=
::
> > +
> > +     +------+   +---------+   +-------+   +-----------------------+   =
+---------+
> > +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->=
|media.git|
> > +     +------+   |picks it |   |request|   |in media-committers.git|   =
+---------+
> > +                +---------+   +-------+   +-----------------------+
> > +
> > +   For this workflow, pull requests can be generated by a committer,
> > +   a previous committer, subsystem maintainers or by a couple of trust=
ed =20
>=20
> I guess you mean a trusted long-time contributor, not a couple.=20
> can you send a PR from two people?

"a couple of" means "a few", not "a couple" ;-)

but yeah, "a trusted long-time contributor" works better.

>=20
> > +   long-time contributors. If you are not in such group, please don't =
submit
> > +   pull requests, as they will likely be ignored. =20
> s/be ignored/not processed/.
>=20
> Sounds a bit better :).

Agreed.

> Maybe you could even say: not processed, and the author notified.

You meant changing it to:

	please don't submit pull requests, as they will
	not be processed, and the author notified.

right? What do you mean by "and the author notified"?
"and the author will not be notified"?

> > +b. Committers' workflow: patches are handled by media committers::
> > +
> > +     +------+   +---------+   +--------------------+   +-----------+  =
 +---------+
> > +     |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|--=
>|media.git|
> > +     +------+   |picks it |   |media-committers.git|   |approval   |  =
 +---------+
> > +                +---------+   +--------------------+   +-----------+
> > +
> > +On both workflows, all patches shall be properly reviewed at
> > +linux-media@vger.kernel.org before being merged at media-committers.gi=
t.
> > +
> > +When patches are picked by patchwork and when merged at media-committe=
rs,
> > +CI bots will check for errors and may provide e-mail feedback about
> > +patch problems. When this happens, the patch submitter must fix them
> > +and send another version of the patch. =20
>=20
> must fix them, or explain why the errors are false positives.

Ok.

Thanks,
Mauro

