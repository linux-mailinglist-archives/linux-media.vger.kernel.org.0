Return-Path: <linux-media+bounces-22434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9509E0405
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72CF8B2A2B7
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 13:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBDF1FECDE;
	Mon,  2 Dec 2024 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogCzlfBq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439096AAD;
	Mon,  2 Dec 2024 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733145819; cv=none; b=uwj7MXpwfQXYMbaFbteygYnW8UUIlnW3KrN0dKOlA+/AFjbxwbSjrnGlRHbB3Q45RL+4zBfBkZj6fI+f68dveADYupxf4kk11wDSIGekyO4KkVPHA9YakZSmzNXBH88PU6Y6ZqqQBYZYBYMQsxXixxDB6/dEgwzkacdTznT8yLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733145819; c=relaxed/simple;
	bh=gg0URn7zqLBdD3kqJg7xfNHLVCXEvqNrMp80a1HBM7M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+oB4Mtjc6GsgHTSw/Liksx2VpMNX9s3UjWNcoU0MtPNaYQHIhbFxNodcJVOy53pRAY/zIOTZjVZahbWV8pWnQd+cmixj8TOY/RrgG5512J41KynGBJVFYIJvIfE6wT6dUDD8XjgmYfmy8iJ4aiAxhGKF4LhEqnY5qm1658Rbho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogCzlfBq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4B5C4CED1;
	Mon,  2 Dec 2024 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733145818;
	bh=gg0URn7zqLBdD3kqJg7xfNHLVCXEvqNrMp80a1HBM7M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ogCzlfBqMHvBl2rf08eTZFDht6j6HphcHQZcYVEGrSgLdsrIQrvaPXFkqtkPzhZRG
	 gYPPnIpG8RSXUQu9cT+x4MwqV128d1U0/HVYB/WhzIIv9tb4xBcQQfIRmwl8oxRPkw
	 yRJel1qMKx4A+9J0AMQT1W/ROecGBurj+x3nrB3j9AtWiGRXAXbRJg914LSsuA2Pm/
	 Aa5Tk7JG5bakqD4MBXwFOqtCmZ0OPOcHiIKHtMnjTLr2LubUoAG3C1ctb5IY8sjTCC
	 JczgkcEbPB/TXchQLilxjoJKqkLkoQplCWOUHFVi9o3/ssOkX20fl40x5TXwZ1HIdG
	 BDu39YWLXK3DA==
Date: Mon, 2 Dec 2024 14:23:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4ll.nl>, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <20241202142334.60fbc25f@foz.lan>
In-Reply-To: <Z02qzF7e665uq44a@valkosipuli.retiisi.eu>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
	<e9a5f9f49b185c694d38ea620bd68252eb52e9d3.1733131405.git.mchehab+huawei@kernel.org>
	<Z02qzF7e665uq44a@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 2 Dec 2024 12:40:44 +0000
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> Thanks for the set.
> 
> Looks good overall, please still see my comments below.
> 
> On Mon, Dec 02, 2024 at 10:26:19AM +0100, Mauro Carvalho Chehab wrote:
> > As the media subsystem will experiment with a multi-committers model,
> > update the Maintainer's entry profile to the new rules.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  .../media/maintainer-entry-profile.rst        | 208 ++++++++++++++----
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 163 insertions(+), 46 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > index ffc712a5f632..dc764163cf1c 100644
> > --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > @@ -27,19 +27,139 @@ It covers, mainly, the contents of those directories:
> >  Both media userspace and Kernel APIs are documented and the documentation
> >  must be kept in sync with the API changes. It means that all patches that
> >  add new features to the subsystem must also bring changes to the
> > -corresponding API files.
> > +corresponding API documentation files.
> >  
> > -Due to the size and wide scope of the media subsystem, media's
> > -maintainership model is to have sub-maintainers that have a broad
> > -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> > -task to review the patches, providing feedback to users if the patches are
> > +Due to the size and wide scope of the media subsystem, the media's
> > +maintainership model is to have committers that have a broad knowledge of
> > +a specific aspect of the subsystem. It is the committers' task to
> > +review the patches, providing feedback to users if the patches are
> >  following the subsystem rules and are properly using the media kernel and
> >  userspace APIs.
> >  
> > -Patches for the media subsystem must be sent to the media mailing list
> > -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > -HTML will be automatically rejected by the mail server. It could be wise
> > -to also copy the sub-maintainer(s).
> > +Media committers
> > +----------------
> > +
> > +In the media subsystem, there are experienced developers who can push  
> 
> The media subsystem is generally understood to comprise of what's under
> drivers/media, this should be referring to the community instead.

Do you have a proposal for a different text here?

> 
> > +patches directly to the development tree. These developers are called
> > +Media committers and are divided into the following categories:
> > +
> > +- Committers:
> > +    contributors for one or more drivers within the media subsystem.
> > +    They can push changes to the tree that do not affect the core or ABI.
> > +
> > +- Core committers:
> > +    responsible for part of the media core. They are typically
> > +    responsible for one or more drivers within the media subsystem, but, besides
> > +    that, they can also merge patches that change the code common to multiple
> > +    drivers, including the kernel internal API.
> > +
> > +- Subsystem maintainers:  
> 
> s/Subsystem/Media tree/

Here, we're talking specifically about my hole and Hans, which will
co-maintain the subsystem with me.. I guess subsystem maintainer is the 
best to describe it.

Besides that, we used "media maintainers" in the past with a different
meaning. Better to not re-use it here.
> 
> ?
> > +    responsible for the subsystem as a whole, with access to the
> > +    entire subsystem.
> > +
> > +    Only subsystem maintainers can push changes that affect the userspace
> > +    API/ABI.  
> 
> This is ambiguous. I think it should intend to say API/ABI changes require
> approval from Media tree maintainers.

At the first moment, the idea is to commit them via PRs. So, no such
commits will be merged by committers/core committers, but yeah, it
could also be merged directly by a committer if it has our approval.

In any case, such changes need a consensus from the subsystem maintainers,
which can just be based on a trust relationship between them with
regards to certain parts of the subsystem, or via explicit acks.

Maybe:

	API/ABI changes are done via consensus between subsystem
	maintainers.

	Only subsystem maintainers push changes that affect the userspace
	API/ABI. Committers may push directly if they have approvals
	from subsystem maintainers.

> What constitutes a UAPI change is a topic of discussion on its own. 

Everything that would break backward compatibility with existing non-kernel
code are API/ABI changes.

> Does it
> require adding a new IOCTL? Taking into use a reserved field? Changing
> little-used driver behaviour slightly? 

For all of those, yes: any changes affecting the behavior or fields/nodes
exported via ioctls and sysfs, including new V4L2 controls are API/ABI changes.

Some changes at OF are also API/ABI changes, but those can flow via
committers, provided that OF maintainers added their review or acked-by.

> Fixing a bug in a driver?

No, fixing a bug, even if related to ABI/API non-compliance aren't.

Yet, ABI/API behavior changes at drivers shall not cause regressions.

I don't think we need to let it clear at the text

> The first two obviously yes, but the latter two probably not.
> 
> Also:
> 
> s/Only subsystem maintainers can push/Media tree maintainers' ack is
> required for/
> 
> ?
> 
> > +
> > +All media committers shall explicitly agree with the Kernel development process
> > +as described at Documentation/process/index.rst and to the Kernel
> > +development rules inside the Kernel documentation, including its code of
> > +conduct.
> > +
> > +Media development tree
> > +----------------------
> > +
> > +The main development tree used by the media subsystem is hosted at LinuxTV.org,
> > +where we also maintain news about the subsystem, wiki pages and a patchwork
> > +instance where we track patches though their lifetime.
> > +
> > +The main tree used by media developers is at:
> > +
> > +https://git.linuxtv.org/media.git/
> > +
> > +.. _Media development workflow:
> > +
> > +Media development workflow
> > +++++++++++++++++++++++++++
> > +
> > +All changes for the media subsystem must be sent first as e-mails to the
> > +media mailing list, following the process documented at  
> 
> s/^/linux-/
> 
> Also I'd refer to it as "LMML".

We can add an alias there, but better to be explicit about what mailing
list we're referring to.

> 
> > +Documentation/process/index.rst.
> > +
> > +It means that patches shall be submitted as plain text only via e-mail to
> > +linux-media@vger.kernel.org. While subscription is not mandatory, you
> > +can find details about how to subscribe to it and to see its archives at:
> > +
> > +  https://subspace.kernel.org/vger.kernel.org.html
> > +
> > +Emails with HTML will be automatically rejected by the mail server.
> > +
> > +It could be wise to also copy the media committer(s). You should use
> > +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
> > +Please always copy driver's authors and maintainers.
> > +
> > +Such patches need to be based against a public branch or tag as follows:
> > +
> > +1. Patches for new features need to be based at the ``next`` branch of
> > +   media.git tree;
> > +
> > +2. Fixes against an already released kernel should preferably be against
> > +   the latest released Kernel. If they require a previously-applied
> > +   change at media.git tree, they need to be against its ``fixes`` branch.  
> 
> This would be a change to the current process that I don't think has been
> discussed. If I understand correctly, generally this applies to patches
> that have been merged to the development branch (formerly media stage tree
> master) with Cc: stable and Fixes: tags.


Not really a change: this is what we do in practice (except that we renamed
master to next).

We did discuss that during the LPC week. There was a request there about
simplifying the trees during media summit with some suggestions. I did a 
followup meeting with Hans afterwards for us to check what would work best.

The change is, basically:
	media-tree master -> media.git next
	media-tree fixes   -> media.git fixes

	media-stage master -> media-committers next

Subsystem maintainers are also merging patches at media-committers fixes,
in order to let media-ci to test the fixes branch.

As agreed during the media summit, only subsystem maintainers will be
merging fixes patches.

> > +
> > +3. Fixes for issues not present at the latest released kernel shall
> > +   be either against a -rc kernel for an upcoming release or
> > +   against the ``fixes`` branch of the media.git tree.
> > +
> > +Patches with fixes shall have:
> > +
> > +- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
> > +- when applicable, a ``Cc: stable@vger.kernel.org``.
> > +
> > +Patches that were fixing bugs publicly reported by someone at the
> > +linux-media@vger.kernel.org mailing list shall have:
> > +
> > +- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
> > +
> > +Patches that change API shall update documentation accordingly at the
> > +same patch series.
> > +
> > +See Documentation/process/index.rst for more details about e-mail submission.
> > +
> > +Once a patch is submitted, it may follow either one of the following
> > +workflows:
> > +
> > +a. Pull request workflow: patches are handled by subsystem maintainers::
> > +
> > +     +------+   +---------+   +-------+   +-----------------------+   +---------+
> > +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|  
> 
> s/e-mail/LMML/

maybe, instead: e-mail to LMML.

> (see earlier comment)? Same below.
> 
> > +     +------+   |picks it |   |request|   |in media-committers.git|   +---------+
> > +                +---------+   +-------+   +-----------------------+
> > +
> > +   For this workflow, pull requests can be generated by a committer,
> > +   a previous committer, subsystem maintainers or by a trusted long-time  
> 
> s/previous/former/
> 
> I'd also use plural in all cases here.

Ok.

> 
> > +   contributor. If you are not in such group, please don't submit  
> 
> > +   pull requests, as they will not be processed.
> > +
> > +b. Committers' workflow: patches are handled by media committers::
> > +
> > +     +------+   +---------+   +--------------------+   +-----------+   +---------+
> > +     |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
> > +     +------+   |picks it |   |media-committers.git|   |approval   |   +---------+
> > +                +---------+   +--------------------+   +-----------+
> > +
> > +On both workflows, all patches shall be properly reviewed at
> > +linux-media@vger.kernel.org before being merged at media-committers.git.
> > +
> > +When patches are picked by patchwork and when merged at media-committers,
> > +CI bots will check for errors and may provide e-mail feedback about
> > +patch problems. When this happens, the patch submitter must fix them, or
> > +explain why the errors are false positives.
> > +
> > +Patches will only be moved to the next stage in those two workflows if they
> > +don't fail on CI or if there are false-positives in the CI reports.  
> 
> s/don't fail on/pass/

Ok.

> 
> > +
> > +Failures during e-mail submission
> > ++++++++++++++++++++++++++++++++++
> >  
> >  Media's workflow is heavily based on Patchwork, meaning that, once a patch
> >  is submitted, the e-mail will first be accepted by the mailing list
> > @@ -47,51 +167,48 @@ server, and, after a while, it should appear at:
> >  
> >     - https://patchwork.linuxtv.org/project/linux-media/list/
> >  
> > -If it doesn't automatically appear there after a few minutes, then
> > +If it doesn't automatically appear there after some time [2]_, then
> >  probably something went wrong on your submission. Please check if the
> > -email is in plain text\ [2]_ only and if your emailer is not mangling
> > +email is in plain text\ [3]_ only and if your emailer is not mangling
> >  whitespaces before complaining or submitting them again.
> >  
> > -You can check if the mailing list server accepted your patch, by looking at:
> > +To troubleshoot problems, you should first check if the mailing list
> > +server has accepted your patch, by looking at:
> >  
> >     - https://lore.kernel.org/linux-media/
> >  
> > -.. [2] If your email contains HTML, the mailing list server will simply
> > +If the patch is there and not at patchwork, it is likely that your e-mailer
> > +mangled the patch. Patchwork internally has a logic that checks if the
> > +received e-mail contain a valid patch. Any whitespace and new line
> > +breakages mangling the patch won't be recognized by patchwork, thus such
> > +patch will be rejected.
> > +
> > +.. [2] It usually takes a few minutes for the patch to arrive, but
> > +       the e-mail server may be busy, so it may take up to a few hours
> > +       for a patch to be picked by patchwork.
> > +
> > +.. [3] If your email contains HTML, the mailing list server will simply
> >         drop it, without any further notice.
> >  
> > +.. _media-developers-gpg:
> >  
> > -Media maintainers
> > -+++++++++++++++++
> > +Authentication for pull and merge requests
> > +++++++++++++++++++++++++++++++++++++++++++
> >  
> > -At the media subsystem, we have a group of senior developers that
> > -are responsible for doing the code reviews at the drivers (also known as
> > -sub-maintainers), and another senior developer responsible for the
> > -subsystem as a whole. For core changes, whenever possible, multiple
> > -media maintainers do the review.
> > +The authenticity of developers submitting pull requests and merge requests
> > +shall be validated by using PGP sign. See: :ref:`kernel_org_trust_repository`.
> >  
> > -The media maintainers that work on specific areas of the subsystem are:
> > +With the pull request workflow, pull requests shall use a PGP-signed tag.
> >  
> > -- Remote Controllers (infrared):
> > -    Sean Young <sean@mess.org>
> > +For more details about PGP sign, please read
> > +Documentation/process/maintainer-pgp-guide.rst.  
> 
> s/.*/:ref:`the PGP guide <pgpguide>`/

No need. A Sphinx plugin does that automatically.

> 
> >  
> > -- HDMI CEC:
> > -    Hans Verkuil <hverkuil@xs4all.nl>
> > +Subsystem maintainers
> > +---------------------
> >  
> > -- Media controller drivers:
> > -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > -
> > -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
> > -    Sakari Ailus <sakari.ailus@linux.intel.com>
> > -
> > -- V4L2 drivers and core V4L2 frameworks:
> > -    Hans Verkuil <hverkuil@xs4all.nl>
> > -
> > -The subsystem maintainer is:
> > -  Mauro Carvalho Chehab <mchehab@kernel.org>
> > -
> > -Media maintainers may delegate a patch to other media maintainers as needed.
> > -On such case, checkpatch's ``delegate`` field indicates who's currently
> > -responsible for reviewing a patch.
> > +The subsystem maintainers are:
> > +  - Mauro Carvalho Chehab <mchehab@kernel.org> and
> > +  - Hans Verkuil <hverkuil@xs4all.nl>
> >  
> >  Submit Checklist Addendum
> >  -------------------------
> > @@ -108,17 +225,14 @@ implementing the media APIs:
> >  ====================	=======================================================
> >  Type			Tool
> >  ====================	=======================================================
> > -V4L2 drivers\ [3]_	``v4l2-compliance``
> > +V4L2 drivers\ [4]_	``v4l2-compliance``
> >  V4L2 virtual drivers	``contrib/test/test-media``
> >  CEC drivers		``cec-compliance``
> >  ====================	=======================================================
> >  
> > -.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
> > +.. [4] The ``v4l2-compliance`` also covers the media controller usage inside
> >         V4L2 drivers.
> >  
> > -Other compilance tools are under development to check other parts of the
> > -subsystem.
> > -
> >  Those tests need to pass before the patches go upstream.
> >  
> >  Also, please notice that we build the Kernel with::
> > @@ -134,6 +248,8 @@ Where the check script is::
> >  Be sure to not introduce new warnings on your patches without a
> >  very good reason.
> >  
> > +Please see `Media development workflow`_ for e-mail submission rules.
> > +
> >  Style Cleanup Patches
> >  +++++++++++++++++++++
> >  
> > @@ -199,7 +315,7 @@ tree between -rc6 and the next -rc1.
> >  Please notice that the media subsystem is a high traffic one, so it
> >  could take a while for us to be able to review your patches. Feel free
> >  to ping if you don't get a feedback in a couple of weeks or to ask
> > -other developers to publicly add Reviewed-by and, more importantly,
> > +other developers to publicly add ``Reviewed-by:`` and, more importantly,
> >  ``Tested-by:`` tags.
> >  
> >  Please note that we expect a detailed description for ``Tested-by:``,
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1e930c7a58b1..c77f56a2e695 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14510,6 +14510,7 @@ MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
> >  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> > +P:	Documentation/driver-api/media/maintainer-entry-profile.rst
> >  W:	https://linuxtv.org
> >  Q:	http://patchwork.kernel.org/project/linux-media/list/
> >  T:	git git://linuxtv.org/media.git  
> 



Thanks,
Mauro

