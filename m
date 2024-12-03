Return-Path: <linux-media+bounces-22532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D019E1B40
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 12:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D3E5164D42
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 11:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237191E47B2;
	Tue,  3 Dec 2024 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OFAsB/zx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D755F1E4120;
	Tue,  3 Dec 2024 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226537; cv=none; b=Ali37F2r7nHvlkl0GwpGwzknUIEavlwrnxp28it7ldXTrJolz400QbuB6fZOIhWPxRlALeFgDO/noMvEbl+ohJ9M1xRo6ktW9x44MV5lmE2AfSm+KHxJA5m9MQAcj0hWqpAz0PaPqzam1QgEvJqhcFHc29PMM/9ZKKg8i14fjlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226537; c=relaxed/simple;
	bh=n8fB01WsAc6jmuVH2KQWtBR1Ogk23j1XENdf7RUJyFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5RjA3W8yOQ8Weax/fUWr7J38VS1ftzJNScklrI5thwPPGxCUP9R7Qxgakn/EuNapY4TVPL4q7koHPoEnOVR7BbawYsrKwGvdM6no6QXlB//X1UnYe+DNIwPnHFzIlDE/q3i9eCFbGGDpbOLVMZoA/9C05NcCT8QdfJPwdcuMlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OFAsB/zx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A61324CE;
	Tue,  3 Dec 2024 12:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733226505;
	bh=n8fB01WsAc6jmuVH2KQWtBR1Ogk23j1XENdf7RUJyFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFAsB/zxgU96FJrvjRhK7YxAND7rMn6D2D3pDALXDZAGtfNJh4zvLaXW9EOKc1stf
	 SUG6qYgJXZXHgffxExQcGbF86kmYJxxv7c6tj6LiTH7qgqDZu2ezuxlmL2IiCbD43e
	 K/TnkJXlDTOq0ytXUKZXSMKQoRiNunUy+uzTPTBo=
Date: Tue, 3 Dec 2024 13:48:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v4 3/5] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <20241203114841.GS10736@pendragon.ideasonboard.com>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
 <5eed1e4a37d087f401b7bd54b793ea301e511d7e.1733218348.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5eed1e4a37d087f401b7bd54b793ea301e511d7e.1733218348.git.mchehab+huawei@kernel.org>

Hi Mauro,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:35:47AM +0100, Mauro Carvalho Chehab wrote:
> As the media subsystem will experiment with a multi-committers model,
> update the Maintainer's entry profile to the new rules.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../media/maintainer-entry-profile.rst        | 241 ++++++++++++++----
>  1 file changed, 189 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index ffc712a5f632..101f6df6374f 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -4,11 +4,12 @@ Media Subsystem Profile
>  Overview
>  --------
>  
> -The media subsystem covers support for a variety of devices: stream
> -capture, analog and digital TV streams, cameras, remote controllers, HDMI CEC
> -and media pipeline control.
> +The Linux Media Community (aka: the LinuxTV Community) covers support for a

I think this paragraph really talks about the media subsystem, not the
community. I wouldn't change it.

> +variety of devices: stream capture, analog and digital TV streams, cameras,
> +remote controllers, HDMI CEC and media pipeline control.
>  
> -It covers, mainly, the contents of those directories:
> +They consist of developers who work with the Linux Kernel media subsystem,
> +which covers, mainly, the contents of those directories:

Same here.

>  
>    - drivers/media
>    - drivers/staging/media
> @@ -27,19 +28,158 @@ It covers, mainly, the contents of those directories:
>  Both media userspace and Kernel APIs are documented and the documentation
>  must be kept in sync with the API changes. It means that all patches that
>  add new features to the subsystem must also bring changes to the
> -corresponding API files.
> +corresponding API documentation files.
>  
> -Due to the size and wide scope of the media subsystem, media's
> -maintainership model is to have sub-maintainers that have a broad
> -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> -task to review the patches, providing feedback to users if the patches are
> +Due to the size and wide scope of the media subsystem, the media's
> +maintainership model is to have committers that have a broad knowledge of
> +a specific aspect of the subsystem. It is the committers' task to
> +review the patches, providing feedback to users if the patches are

We discussed that reviews are not a committer's duty, but come from
being a driver maintainer, as indicated by the MAINTAINERS file. Is the
mention of "review" here a leftover from previous versions ?

>  following the subsystem rules and are properly using the media kernel and
>  userspace APIs.
>  
> -Patches for the media subsystem must be sent to the media mailing list
> -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> -HTML will be automatically rejected by the mail server. It could be wise
> -to also copy the sub-maintainer(s).
> +Media committers
> +----------------
> +
> +In the media subsystem, there are experienced developers who can push
> +patches directly to the development tree. These developers are called
> +Media committers and are divided into the following categories:
> +
> +- Committers:
> +    contributors for one or more drivers within the media subsystem.
> +    They can push changes to the tree that do not affect the core or ABI.

a/ABI/ userspace ABI/

> +
> +- Core committers:
> +    responsible for part of the media core. They are typically

This paragraph can be reflowed to 80 columns.

> +    responsible for one or more drivers within the media subsystem, but, besides
> +    that, they can also merge patches that change the code common to multiple

s/the code/code/

> +    drivers, including the kernel internal API.
> +
> +- Subsystem maintainers:
> +    responsible for the subsystem as a whole, with access to the
> +    entire subsystem.

You can reflow this too.

> +
> +    API/ABI changes are done via consensus between subsystem maintainers\ [2]_.
> +
> +    Only subsystem maintainers push changes that affect the userspace
> +    API/ABI. Committers may push ABI/API changes on their commits if they

Is the second mention of "ABI/API" here referring to the in-kernel API
or the userspace API ? If it's the latter, the second sentence
contradicts the first one.

> +    have approvals from subsystem maintainers.
> +
> +All media committers shall explicitly agree with the Kernel development process
> +as described at Documentation/process/index.rst and to the Kernel
> +development rules inside the Kernel documentation, including its code of
> +conduct.
> +
> +.. [2] Everything that would break backward compatibility with existing
> +       non-kernel code are API/ABI changes. This includes ioctl and sysfs

More than that, backward compatibility can't be broken, that's a kernel
policy. I would drop this note.

> +       interfaces, v4l2 controls, and their behaviors.

s/v4l2/V4L2/

> +
> +Media development tree
> +----------------------
> +
> +The main development tree used by the media subsystem is hosted at LinuxTV.org,
> +where we also maintain news about the subsystem, wiki pages and a patchwork
> +instance where we track patches though their lifetime.
> +
> +The main tree used by media developers is at:
> +
> +https://git.linuxtv.org/media.git/
> +
> +.. _Media development workflow:
> +
> +Media development workflow
> +++++++++++++++++++++++++++
> +
> +All changes for the media subsystem must be sent first as e-mails to the
> +media mailing list, following the process documented at
> +Documentation/process/index.rst.
> +
> +It means that patches shall be submitted as plain text only via e-mail to
> +linux-media@vger.kernel.org (aka: LMML). While subscription is not mandatory,
> +you can find details about how to subscribe to it and to see its archives at:
> +
> +  https://subspace.kernel.org/vger.kernel.org.html
> +
> +Emails with HTML will be automatically rejected by the mail server.
> +
> +It could be wise to also copy the media committer(s). You should use

It's more than wise, let's make it strongly adviced:

Patches should be CC'ed to the appropriate maintainers.

> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.

s/else //

> +Please always copy driver's authors and maintainers.
> +
> +To minimize the chance of merge conflicts for your patch series, and make
> +easier to backport patches to stable Kernels, we recommend that you use the
> +following baseline for your patch series:
> +
> +1. Features for the next mainline release:
> +
> +   - baseline shall be media.git ``next`` branch;
> +
> +2. Bug fixes for the current mainline release:
> +
> +   - baseline shall be the latest mainline release or media.git ``fixes``
> +     if changes depend on a fix already merged;
> +
> +3. Bug fixes for the next mainline release:
> +
> +   - baseline shall be a prepatch release (-rcX) or media.git ``fixes``
> +     if changes depend on a fix already merged. It is also
> +     fine to use media.git ``next`` as baseline for such patches if such
> +     patches apply cleanly on ``fixes``.

Why is it fine to use the next branch ? That branch will already contain
lots of changes for the next release. Applying cleanly to fixes is not
a strong enough criteria, fixes must be tested on the fixes branch. I'd
drop the second sentence.

> +
> +.. Note::
> +
> +   See https://www.kernel.org/category/releases.html for an overview
> +   about Kernel release types.
> +
> +Patches with fixes shall have:
> +
> +- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
> +- when applicable, a ``Cc: stable@vger.kernel.org``.
> +
> +Patches that were fixing bugs publicly reported by someone at the

s/were fixing/fix/

> +linux-media@vger.kernel.org mailing list shall have:
> +
> +- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
> +
> +Patches that change API shall update documentation accordingly at the
> +same patch series.
> +
> +See Documentation/process/index.rst for more details about e-mail submission.

This duplicates the first paragraph of this section.

> +
> +Once a patch is submitted, it may follow either one of the following
> +workflows:
> +
> +a. Pull request workflow: patches are handled by subsystem maintainers::
> +
> +     +-------+   +---------+   +-------+   +-----------------------+   +---------+
> +     |e-mail |-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|
> +     |to LMML|   |picks it |   |request|   |in media-committers.git|   +---------+
> +     +-------+   +---------+   +-------+   +-----------------------+
> +
> +   For this workflow, pull requests can be generated by committers,
> +   former committers, subsystem maintainers or by trusted long-time
> +   contributors. If you are not in such group, please don't submit
> +   pull requests, as they will not be processed.

I don't see why we wouldn't process them, but I won't fight on this.

> +
> +b. Committers' workflow: patches are handled by media committers::
> +
> +     +-------+   +---------+   +--------------------+   +-----------+   +---------+
> +     |e-mail |-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
> +     |to LMML|   |picks it |   |media-committers.git|   |approval   |   +---------+
> +     +-------+   +---------+   +--------------------+   +-----------+
> +
> +On both workflows, all patches shall be properly reviewed at
> +linux-media@vger.kernel.org (LMML) before being merged at media-committers.git.
> +
> +When patches are picked by patchwork and when merged at media-committers,
> +CI bots will check for errors and may provide e-mail feedback about
> +patch problems. When this happens, the patch submitter must fix them, or
> +explain why the errors are false positives.
> +
> +Patches will only be moved to the next stage in those two workflows if they
> +pass on CI or if there are false-positives in the CI reports.

"or if all CI issues are false positives"

> +
> +Failures during e-mail submission
> ++++++++++++++++++++++++++++++++++
>  
>  Media's workflow is heavily based on Patchwork, meaning that, once a patch
>  is submitted, the e-mail will first be accepted by the mailing list
> @@ -47,51 +187,49 @@ server, and, after a while, it should appear at:
>  
>     - https://patchwork.linuxtv.org/project/linux-media/list/
>  
> -If it doesn't automatically appear there after a few minutes, then
> +If it doesn't automatically appear there after some time [3]_, then
>  probably something went wrong on your submission. Please check if the
> -email is in plain text\ [2]_ only and if your emailer is not mangling
> +email is in plain text\ [4]_ only and if your emailer is not mangling
>  whitespaces before complaining or submitting them again.
>  
> -You can check if the mailing list server accepted your patch, by looking at:
> +To troubleshoot problems, you should first check if the mailing list
> +server has accepted your patch, by looking at:
>  
>     - https://lore.kernel.org/linux-media/
>  
> -.. [2] If your email contains HTML, the mailing list server will simply
> +If the patch is there and not at patchwork, it is likely that your e-mailer
> +mangled the patch. Patchwork internally has logic that checks if the
> +received e-mail contains a valid patch. Any whitespace and new line
> +breakages mangling the patch won't be recognized by patchwork, thus such
> +patch will be rejected.
> +
> +.. [3] It usually takes a few minutes for the patch to arrive, but
> +       the e-mail server may be busy, so it may take up to a few hours
> +       for a patch to be picked by patchwork.
> +
> +.. [4] If your email contains HTML, the mailing list server will simply
>         drop it, without any further notice.
>  
> +.. _media-developers-gpg:
>  
> -Media maintainers
> -+++++++++++++++++
> +Authentication for pull and merge requests

"Merge request", as opposed to "pull request", usually refers to merge
request submitted on git forges such as github or gitlab. As far as I
know, this is not being discussed as a change to the workflow, and isn't
listed anywhere in our documentation. Do we need to include it here,
can't we talk about pull requests only ?

> +++++++++++++++++++++++++++++++++++++++++++
>  
> -At the media subsystem, we have a group of senior developers that
> -are responsible for doing the code reviews at the drivers (also known as
> -sub-maintainers), and another senior developer responsible for the
> -subsystem as a whole. For core changes, whenever possible, multiple
> -media maintainers do the review.
> +The authenticity of developers submitting pull requests and merge requests

I think you mean either "the identity of developers" or "the
authenticity of pull requests".

> +shall be validated by using PGP signing at some moment.

"at the same moment" as what ?

> +See: :ref:`kernel_org_trust_repository`.
>  
> -The media maintainers that work on specific areas of the subsystem are:
> +With the pull request workflow, pull requests shall use PGP-signed tags.
>  
> -- Remote Controllers (infrared):
> -    Sean Young <sean@mess.org>
> +For more details about PGP sign, please read
> +Documentation/process/maintainer-pgp-guide.rst.
>  
> -- HDMI CEC:
> -    Hans Verkuil <hverkuil@xs4all.nl>
> +Subsystem maintainers
> +---------------------
>  
> -- Media controller drivers:
> -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -
> -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
> -    Sakari Ailus <sakari.ailus@linux.intel.com>
> -
> -- V4L2 drivers and core V4L2 frameworks:
> -    Hans Verkuil <hverkuil@xs4all.nl>
> -
> -The subsystem maintainer is:
> -  Mauro Carvalho Chehab <mchehab@kernel.org>
> -
> -Media maintainers may delegate a patch to other media maintainers as needed.
> -On such case, checkpatch's ``delegate`` field indicates who's currently
> -responsible for reviewing a patch.
> +The subsystem maintainers are:
> +  - Mauro Carvalho Chehab <mchehab@kernel.org> and
> +  - Hans Verkuil <hverkuil@xs4all.nl>

Nitpicking, I think you can drop the indentation before the list markers. I'd also
insert a blank line just before the list, to make it more readable.

Not nitpicking, https://lore.kernel.org/all/e7a4c286-13ae-4025-b765-ee7055476cf1@xs4all.nl/
should be included in this series.

>  
>  Submit Checklist Addendum
>  -------------------------
> @@ -106,18 +244,15 @@ that should be used in order to check if the drivers are properly
>  implementing the media APIs:
>  
>  ====================	=======================================================
> -Type			Tool
> +Type			Utility
>  ====================	=======================================================
> -V4L2 drivers\ [3]_	``v4l2-compliance``
> +V4L2 drivers\ [5]_	``v4l2-compliance``
>  V4L2 virtual drivers	``contrib/test/test-media``
>  CEC drivers		``cec-compliance``
>  ====================	=======================================================
>  
> -.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
> -       V4L2 drivers.
> -
> -Other compilance tools are under development to check other parts of the
> -subsystem.
> +.. [5] The ``v4l2-compliance`` utility also covers the media controller usage
> +       inside V4L2 drivers.
>  
>  Those tests need to pass before the patches go upstream.
>  
> @@ -134,6 +269,8 @@ Where the check script is::
>  Be sure to not introduce new warnings on your patches without a
>  very good reason.
>  
> +Please see `Media development workflow`_ for e-mail submission rules.
> +
>  Style Cleanup Patches
>  +++++++++++++++++++++
>  
> @@ -199,7 +336,7 @@ tree between -rc6 and the next -rc1.
>  Please notice that the media subsystem is a high traffic one, so it
>  could take a while for us to be able to review your patches. Feel free
>  to ping if you don't get a feedback in a couple of weeks or to ask
> -other developers to publicly add Reviewed-by and, more importantly,
> +other developers to publicly add ``Reviewed-by:`` and, more importantly,
>  ``Tested-by:`` tags.
>  
>  Please note that we expect a detailed description for ``Tested-by:``,
> 

-- 
Regards,

Laurent Pinchart

