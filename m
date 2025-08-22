Return-Path: <linux-media+bounces-40742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B326B313A8
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 11:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB4EDB0184A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1492F3C39;
	Fri, 22 Aug 2025 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5EPteNe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D53E296BAF;
	Fri, 22 Aug 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855124; cv=none; b=oEiqlM3pM1HwGlVmcNWE5Y0brwelkkXqX7OAlJQeRknCgE4200pEjEYKDzNg2dw0AZNabmmsYsf0S02DHw6/QTg1YppXl1gjZ6ELSFItu3WcL+kDyVkjWX9fC3C6CkYqyhDR/5gev9oqQKlPBvR//CJjwnn7tqc2JoGsAkrINzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855124; c=relaxed/simple;
	bh=kJXddl+t/XD3bQ9/mNPaVp39cob4yaCytLv1VTs2pM4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6tusnaJtKUplscRKeJEmQ6ZXyZLoZypCYKPq1d2vs2AsR1+8bdMHfcE/hATXtypmwF8fCVS/ZKhDnddCK7JQ12bikESET34XFETbwxkSlNb8vPsKpZUq3/X2pMznqEHURzaMarnQRDetnjmhyk9JqmKP0tbJ3/qnk+sJ+cRzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5EPteNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E427AC4CEED;
	Fri, 22 Aug 2025 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755855124;
	bh=kJXddl+t/XD3bQ9/mNPaVp39cob4yaCytLv1VTs2pM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y5EPteNeXuctLxNAqyNdPkgMuiTAnsx3AvyMwG/jeeJTO62gvjMCsxpN0/6nV37U9
	 /E1xWY5ewtG17F+MW24YQ+WWvkAO2P61+0UoA4H2gIaIm6JGAGLgr55JZSXXXkLFP6
	 0UBUgJ08isdMFqURMI3/94gPt5yPzqsZbcNKwxvDDxy1q015KtXHFlyZCPpg9KAwKX
	 wh1hBOK33sICn146WX18Grh0EDt6nQIkApQ34UXVAtekduSGIh/JNMAB7NCiOvaiQd
	 Zs0wIYgG4Z5ZKBCHfNdNu8XCCc0H65s/1OYHiMQqPoIAnFt8pB77bvBdkqsvPUyJ/T
	 KUBbTyx1kjuSA==
Date: Fri, 22 Aug 2025 11:31:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v4 3/5] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <20250822113159.70b0339d@foz.lan>
In-Reply-To: <aKgxcWYq-WZAFwsx@valkosipuli.retiisi.eu>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
	<5eed1e4a37d087f401b7bd54b793ea301e511d7e.1733218348.git.mchehab+huawei@kernel.org>
	<aKcQak8k2MiCriZt@valkosipuli.retiisi.eu>
	<20250822102346.30347275@foz.lan>
	<aKgxcWYq-WZAFwsx@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 22 Aug 2025 08:59:29 +0000
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> On Fri, Aug 22, 2025 at 10:23:46AM +0200, Mauro Carvalho Chehab wrote:
> > Em Thu, 21 Aug 2025 12:26:18 +0000
> > Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> >   
> > > Hi Mauro,
> > > 
> > > This seems pretty good, there are some comments mostly on technicalities
> > > below.
> > > 
> > > On Tue, Dec 03, 2024 at 10:35:47AM +0100, Mauro Carvalho Chehab wrote:  
> > > > As the media subsystem will experiment with a multi-committers model,
> > > > update the Maintainer's entry profile to the new rules.
> > > > 
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> > > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  .../media/maintainer-entry-profile.rst        | 241 ++++++++++++++----
> > > >  1 file changed, 189 insertions(+), 52 deletions(-)
> > > > 
> > > > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > > index ffc712a5f632..101f6df6374f 100644
> > > > --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > > @@ -4,11 +4,12 @@ Media Subsystem Profile
> > > >  Overview
> > > >  --------
> > > >  
> > > > -The media subsystem covers support for a variety of devices: stream
> > > > -capture, analog and digital TV streams, cameras, remote controllers, HDMI CEC
> > > > -and media pipeline control.
> > > > +The Linux Media Community (aka: the LinuxTV Community) covers support for a
> > > > +variety of devices: stream capture, analog and digital TV streams, cameras,
> > > > +remote controllers, HDMI CEC and media pipeline control.    
> > > 
> > > I'd make a difference here between the Media tree and the Linux Media
> > > community. The drivers in the Media tree support these devices whereas the
> > > community generally works on this codebase.
> > >   
> > > >  
> > > > -It covers, mainly, the contents of those directories:
> > > > +They consist of developers who work with the Linux Kernel media subsystem,
> > > > +which covers, mainly, the contents of those directories:    
> > > 
> > > If you want to refer to the community here, I'd use that word.  
> > 
> > What about this:
> > 
> > <text>
> > The Linux Media Community (aka: the LinuxTV Community) consist of developers 
> > who work with the Linux Kernel media subsystem, together with users who
> > benefit from such develoment and help testing the developed code.  
> 
> How about, with slight modifications:
> 
> The Linux Media Community (aka: the LinuxTV Community) is formed of
> developers working on Linux Kernel Media Subsystem, together with users.

Works for me, although I prefer keep mentioning about the important
role that users play on help testing drivers.

> 
> > 
> > They work on the top of the Media tree, which has code to support a    
> > variety of devices: stream capture, analog and digital TV streams, cameras,
> > remote controllers, HDMI CEC and media pipeline control.
> > 
> > The Media tree is mainly responsible to be the main source of the
> > code under development with the contents of those directories:
> > 
> >   - drivers/media
> >   - drivers/staging/media
> >   - Documentation/admin-guide/media
> >   - Documentation/driver-api/media
> >   - Documentation/userspace-api/media
> >   - Documentation/devicetree/bindings/media/\ [1]_
> >   - include/media
> > </text>
> >   
> > >   
> > > >  
> > > >    - drivers/media
> > > >    - drivers/staging/media
> > > > @@ -27,19 +28,158 @@ It covers, mainly, the contents of those directories:
> > > >  Both media userspace and Kernel APIs are documented and the documentation
> > > >  must be kept in sync with the API changes. It means that all patches that
> > > >  add new features to the subsystem must also bring changes to the
> > > > -corresponding API files.
> > > > +corresponding API documentation files.    
> > > 
> > > I'd drop " files" as the documentation is split between C source code files
> > > and ReST nowadays.  
> > 
> > OK.
> >   
> > > > -Due to the size and wide scope of the media subsystem, media's
> > > > -maintainership model is to have sub-maintainers that have a broad
> > > > -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> > > > -task to review the patches, providing feedback to users if the patches are
> > > > +Due to the size and wide scope of the media subsystem, the media's
> > > > +maintainership model is to have committers that have a broad knowledge of    
> > > 
> > > Maintainership or maintenance?
> > > 
> > > s/is to have/recognises/ ?  
> > 
> > OK.
> >    
> > > > +a specific aspect of the subsystem. It is the committers' task to
> > > > +review the patches, providing feedback to users if the patches are
> > > >  following the subsystem rules and are properly using the media kernel and
> > > >  userspace APIs.
> > > >  
> > > > -Patches for the media subsystem must be sent to the media mailing list
> > > > -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > > -HTML will be automatically rejected by the mail server. It could be wise
> > > > -to also copy the sub-maintainer(s).
> > > > +Media committers
> > > > +----------------
> > > > +
> > > > +In the media subsystem, there are experienced developers who can push
> > > > +patches directly to the development tree. These developers are called
> > > > +Media committers and are divided into the following categories:
> > > > +
> > > > +- Committers:
> > > > +    contributors for one or more drivers within the media subsystem.
> > > > +    They can push changes to the tree that do not affect the core or ABI.    
> > > 
> > > Question to Ricardo -- sorry if I already have asked this: can this be
> > > enforced?
> > >   
> > > > +
> > > > +- Core committers:
> > > > +    responsible for part of the media core. They are typically
> > > > +    responsible for one or more drivers within the media subsystem, but, besides
> > > > +    that, they can also merge patches that change the code common to multiple
> > > > +    drivers, including the kernel internal API.    
> > > 
> > > This doesn't say clearly whether e.g. the V4L2 or MC frameworks are
> > > included or not. I think they should be and this should be mentioned. Same
> > > for videobuf2.  
> > 
> > The problem of specifying what the core via frameworks, vb2, etc is that
> > this would require constant maintainance. Core is everything that is not
> > inside a driver for an specific driver.
> > 
> > We called this here as "the code common to multiple drivers". For me it
> > is clear, but if you have a better generic term, I'm all ears.  
> 
> How about:
> 
> - Core committers:
>     responsible for part of the Media Core, including V4L2, Media
>     controller, Videobuf2, CEC and DVB frameworks. They are typically
>     responsible for one or more drivers within the Media Subsystem, but,
>     besides that, they can also merge patches that change the code common
>     to multiple drivers, including the kernel internal API.
> 
> I think we should define Media Subsystem, Media Core and possibly Media
> Community in the glossary but I'd do that after merging this set.

You forgot remote controllers there ;-)

Btw, that's exactly my point: when we enumerate things, we tend to forget
about something, and, when new stuff gets add, we need to remember to
add here.

> 
> >   
> > >   
> > > > +
> > > > +- Subsystem maintainers:
> > > > +    responsible for the subsystem as a whole, with access to the
> > > > +    entire subsystem.
> > > > +
> > > > +    API/ABI changes are done via consensus between subsystem maintainers\ [2]_.
> > > > +
> > > > +    Only subsystem maintainers push changes that affect the userspace
> > > > +    API/ABI. Committers may push ABI/API changes on their commits if they
> > > > +    have approvals from subsystem maintainers.
> > > > +
> > > > +All media committers shall explicitly agree with the Kernel development process
> > > > +as described at Documentation/process/index.rst and to the Kernel
> > > > +development rules inside the Kernel documentation, including its code of
> > > > +conduct.    
> > > 
> > > Is there a need to mention this? Aren't people generally expected to
> > > follow the process anyway?  
> > 
> > There's a big difference between "generally expected" and "have to agree".
> > The goal here is really to prevent having bad committers as we had in the
> > past on our previous multicommiters model before we moved to git. If this
> > ever have again, by having an explicit agreement, one cannot deny he/she
> > didn't know the rules.  
> 
> Fair enough. Either way, enforment is discretionary so I think this is
> fine -- mistakes tend to happen, to everybody, at least in some extent.

Yeah, mistakes can happen. What we want to cover is intentional misbehavior.

> > > > +
> > > > +.. [2] Everything that would break backward compatibility with existing
> > > > +       non-kernel code are API/ABI changes. This includes ioctl and sysfs
> > > > +       interfaces, v4l2 controls, and their behaviors.
> > > > +
> > > > +Media development tree
> > > > +----------------------
> > > > +
> > > > +The main development tree used by the media subsystem is hosted at LinuxTV.org,
> > > > +where we also maintain news about the subsystem, wiki pages and a patchwork
> > > > +instance where we track patches though their lifetime.
> > > > +
> > > > +The main tree used by media developers is at:
> > > > +
> > > > +https://git.linuxtv.org/media.git/
> > > > +
> > > > +.. _Media development workflow:
> > > > +
> > > > +Media development workflow
> > > > +++++++++++++++++++++++++++
> > > > +
> > > > +All changes for the media subsystem must be sent first as e-mails to the    
> > > 
> > > s/must/shall/ ?  
> > 
> > OK.
> >   
> > > > +media mailing list, following the process documented at
> > > > +Documentation/process/index.rst.
> > > > +
> > > > +It means that patches shall be submitted as plain text only via e-mail to
> > > > +linux-media@vger.kernel.org (aka: LMML). While subscription is not mandatory,
> > > > +you can find details about how to subscribe to it and to see its archives at:
> > > > +
> > > > +  https://subspace.kernel.org/vger.kernel.org.html
> > > > +
> > > > +Emails with HTML will be automatically rejected by the mail server.
> > > > +
> > > > +It could be wise to also copy the media committer(s). You should use
> > > > +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
> > > > +Please always copy driver's authors and maintainers.
> > > > +
> > > > +To minimize the chance of merge conflicts for your patch series, and make
> > > > +easier to backport patches to stable Kernels, we recommend that you use the
> > > > +following baseline for your patch series:
> > > > +
> > > > +1. Features for the next mainline release:
> > > > +
> > > > +   - baseline shall be media.git ``next`` branch;
> > > > +
> > > > +2. Bug fixes for the current mainline release:
> > > > +
> > > > +   - baseline shall be the latest mainline release or media.git ``fixes``
> > > > +     if changes depend on a fix already merged;
> > > > +
> > > > +3. Bug fixes for the next mainline release:
> > > > +
> > > > +   - baseline shall be a prepatch release (-rcX) or media.git ``fixes``
> > > > +     if changes depend on a fix already merged. It is also
> > > > +     fine to use media.git ``next`` as baseline for such patches if such
> > > > +     patches apply cleanly on ``fixes``.
> > > > +
> > > > +.. Note::
> > > > +
> > > > +   See https://www.kernel.org/category/releases.html for an overview
> > > > +   about Kernel release types.
> > > > +
> > > > +Patches with fixes shall have:
> > > > +
> > > > +- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
> > > > +- when applicable, a ``Cc: stable@vger.kernel.org``.
> > > > +
> > > > +Patches that were fixing bugs publicly reported by someone at the
> > > > +linux-media@vger.kernel.org mailing list shall have:
> > > > +
> > > > +- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
> > > > +
> > > > +Patches that change API shall update documentation accordingly at the
> > > > +same patch series.
> > > > +
> > > > +See Documentation/process/index.rst for more details about e-mail submission.
> > > > +
> > > > +Once a patch is submitted, it may follow either one of the following
> > > > +workflows:
> > > > +
> > > > +a. Pull request workflow: patches are handled by subsystem maintainers::
> > > > +
> > > > +     +-------+   +---------+   +-------+   +-----------------------+   +---------+
> > > > +     |e-mail |-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|
> > > > +     |to LMML|   |picks it |   |request|   |in media-committers.git|   +---------+
> > > > +     +-------+   +---------+   +-------+   +-----------------------+
> > > > +
> > > > +   For this workflow, pull requests can be generated by committers,
> > > > +   former committers, subsystem maintainers or by trusted long-time
> > > > +   contributors. If you are not in such group, please don't submit
> > > > +   pull requests, as they will not be processed.
> > > > +
> > > > +b. Committers' workflow: patches are handled by media committers::
> > > > +
> > > > +     +-------+   +---------+   +--------------------+   +-----------+   +---------+
> > > > +     |e-mail |-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
> > > > +     |to LMML|   |picks it |   |media-committers.git|   |approval   |   +---------+
> > > > +     +-------+   +---------+   +--------------------+   +-----------+
> > > > +
> > > > +On both workflows, all patches shall be properly reviewed at
> > > > +linux-media@vger.kernel.org (LMML) before being merged at media-committers.git.
> > > > +
> > > > +When patches are picked by patchwork and when merged at media-committers,
> > > > +CI bots will check for errors and may provide e-mail feedback about
> > > > +patch problems. When this happens, the patch submitter must fix them, or    
> > > 
> > > I'd remove the latter comma.  
> > 
> > OK.
> >   
> > >   
> > > > +explain why the errors are false positives.
> > > > +
> > > > +Patches will only be moved to the next stage in those two workflows if they
> > > > +pass on CI or if there are false-positives in the CI reports.
> > > > +
> > > > +Failures during e-mail submission
> > > > ++++++++++++++++++++++++++++++++++
> > > >  
> > > >  Media's workflow is heavily based on Patchwork, meaning that, once a patch
> > > >  is submitted, the e-mail will first be accepted by the mailing list
> > > > @@ -47,51 +187,49 @@ server, and, after a while, it should appear at:
> > > >  
> > > >     - https://patchwork.linuxtv.org/project/linux-media/list/
> > > >  
> > > > -If it doesn't automatically appear there after a few minutes, then
> > > > +If it doesn't automatically appear there after some time [3]_, then
> > > >  probably something went wrong on your submission. Please check if the
> > > > -email is in plain text\ [2]_ only and if your emailer is not mangling
> > > > +email is in plain text\ [4]_ only and if your emailer is not mangling
> > > >  whitespaces before complaining or submitting them again.
> > > >  
> > > > -You can check if the mailing list server accepted your patch, by looking at:
> > > > +To troubleshoot problems, you should first check if the mailing list
> > > > +server has accepted your patch, by looking at:
> > > >  
> > > >     - https://lore.kernel.org/linux-media/
> > > >  
> > > > -.. [2] If your email contains HTML, the mailing list server will simply
> > > > +If the patch is there and not at patchwork, it is likely that your e-mailer
> > > > +mangled the patch. Patchwork internally has logic that checks if the
> > > > +received e-mail contains a valid patch. Any whitespace and new line
> > > > +breakages mangling the patch won't be recognized by patchwork, thus such
> > > > +patch will be rejected.
> > > > +
> > > > +.. [3] It usually takes a few minutes for the patch to arrive, but
> > > > +       the e-mail server may be busy, so it may take up to a few hours
> > > > +       for a patch to be picked by patchwork.    
> > > 
> > > I'd just refer to "longer" in the latter case; there are no fixed time
> > > limits anyway.
> > >   
> > 
> > OK.
> >   
> > > > +
> > > > +.. [4] If your email contains HTML, the mailing list server will simply
> > > >         drop it, without any further notice.
> > > >  
> > > > +.. _media-developers-gpg:
> > > >  
> > > > -Media maintainers
> > > > -+++++++++++++++++
> > > > +Authentication for pull and merge requests
> > > > +++++++++++++++++++++++++++++++++++++++++++
> > > >  
> > > > -At the media subsystem, we have a group of senior developers that
> > > > -are responsible for doing the code reviews at the drivers (also known as
> > > > -sub-maintainers), and another senior developer responsible for the
> > > > -subsystem as a whole. For core changes, whenever possible, multiple
> > > > -media maintainers do the review.
> > > > +The authenticity of developers submitting pull requests and merge requests
> > > > +shall be validated by using PGP signing at some moment.
> > > > +See: :ref:`kernel_org_trust_repository`.
> > > >  
> > > > -The media maintainers that work on specific areas of the subsystem are:
> > > > +With the pull request workflow, pull requests shall use PGP-signed tags.
> > > >  
> > > > -- Remote Controllers (infrared):
> > > > -    Sean Young <sean@mess.org>
> > > > +For more details about PGP sign, please read
> > > > +Documentation/process/maintainer-pgp-guide.rst.
> > > >  
> > > > -- HDMI CEC:
> > > > -    Hans Verkuil <hverkuil@xs4all.nl>
> > > > +Subsystem maintainers
> > > > +---------------------
> > > >  
> > > > -- Media controller drivers:
> > > > -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > -
> > > > -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
> > > > -    Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > -
> > > > -- V4L2 drivers and core V4L2 frameworks:
> > > > -    Hans Verkuil <hverkuil@xs4all.nl>
> > > > -
> > > > -The subsystem maintainer is:
> > > > -  Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > -
> > > > -Media maintainers may delegate a patch to other media maintainers as needed.
> > > > -On such case, checkpatch's ``delegate`` field indicates who's currently
> > > > -responsible for reviewing a patch.
> > > > +The subsystem maintainers are:
> > > > +  - Mauro Carvalho Chehab <mchehab@kernel.org> and
> > > > +  - Hans Verkuil <hverkuil@xs4all.nl>
> > > >  
> > > >  Submit Checklist Addendum
> > > >  -------------------------
> > > > @@ -106,18 +244,15 @@ that should be used in order to check if the drivers are properly
> > > >  implementing the media APIs:
> > > >  
> > > >  ====================	=======================================================
> > > > -Type			Tool
> > > > +Type			Utility
> > > >  ====================	=======================================================
> > > > -V4L2 drivers\ [3]_	``v4l2-compliance``
> > > > +V4L2 drivers\ [5]_	``v4l2-compliance``
> > > >  V4L2 virtual drivers	``contrib/test/test-media``
> > > >  CEC drivers		``cec-compliance``
> > > >  ====================	=======================================================
> > > >  
> > > > -.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
> > > > -       V4L2 drivers.
> > > > -
> > > > -Other compilance tools are under development to check other parts of the
> > > > -subsystem.
> > > > +.. [5] The ``v4l2-compliance`` utility also covers the media controller usage
> > > > +       inside V4L2 drivers.
> > > >  
> > > >  Those tests need to pass before the patches go upstream.
> > > >  
> > > > @@ -134,6 +269,8 @@ Where the check script is::
> > > >  Be sure to not introduce new warnings on your patches without a
> > > >  very good reason.
> > > >  
> > > > +Please see `Media development workflow`_ for e-mail submission rules.
> > > > +
> > > >  Style Cleanup Patches
> > > >  +++++++++++++++++++++
> > > >  
> > > > @@ -199,7 +336,7 @@ tree between -rc6 and the next -rc1.
> > > >  Please notice that the media subsystem is a high traffic one, so it
> > > >  could take a while for us to be able to review your patches. Feel free
> > > >  to ping if you don't get a feedback in a couple of weeks or to ask
> > > > -other developers to publicly add Reviewed-by and, more importantly,
> > > > +other developers to publicly add ``Reviewed-by:`` and, more importantly,
> > > >  ``Tested-by:`` tags.
> > > >  
> > > >  Please note that we expect a detailed description for ``Tested-by:``,    
> > >   
> 



Thanks,
Mauro

