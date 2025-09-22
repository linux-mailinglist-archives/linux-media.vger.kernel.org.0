Return-Path: <linux-media+bounces-42916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81571B8FD05
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 11:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E7A518A1DFA
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0F128850E;
	Mon, 22 Sep 2025 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFJuuvqw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA6C26E715;
	Mon, 22 Sep 2025 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534221; cv=none; b=LfCS/rfupCLe91JQeMr1OFYW/dg2ROMFUaTbv0RFiwWTo9svNV3HI1KOYfZjgPeb5uI9GNz6dgDR5i+PXKgfe5QkvQkHmBwDDZl98CEeK1WIqWSL7aAXO9x5O1vRaoX/vnTMJUHNEAaW3aCxY4w9CbegYela8F+HeOCklfccwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534221; c=relaxed/simple;
	bh=qAF+gdhVwypKA/+7TDnVFd3l6vLp7TIvZG0+aItb2Lk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tqNU9zbYVBxyUeSUddzrKMeVHzqejJtAyfycdyVkH4JJx2Rn+PlfZlljXzj7zVgkqFcfA6FX8MUIHsONYAjfFiaT2EFMqEkqwNRuYvDXTN/GbTMcXhJe3tf+oM6WkDv3kBlC2IAt7OyowAYzUXOy73kTgB+KkuZEJWvehton9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFJuuvqw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751B6C16AAE;
	Mon, 22 Sep 2025 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758534220;
	bh=qAF+gdhVwypKA/+7TDnVFd3l6vLp7TIvZG0+aItb2Lk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=VFJuuvqwCIVHuHYTT+82Wi5QArO76lafq49eKqdJ4LZytO2jdQqFrNycrJ/RzeYcK
	 bjglZMM2CXTGvJG0b8vmdrZl2/gMwOGxeMBjtliEoj8Vo7YJqupTVVQFEUwdGxBr20
	 hfefNmeF1Lv6UpwDbpKlY14y/QK/BeSyNmcXphRJeP1Ei+O1NYKgyujWpMHor+iebo
	 h5ZzreA6+oXR7/XtF3Dp37ZVxfImJJa8xOtQMS8wEv+uF8WFaCdrw96CKJUqf02egK
	 IpEOJP/qxqIeoHyeIAtpeXpBitm+wpuz6IUHpjnjgen4s+oZJPIE+mj1J9LXQXLMm6
	 kxsw65NZdCJnw==
Message-ID: <0a254051-627b-42e1-a53c-f55d7f6351d3@kernel.org>
Date: Mon, 22 Sep 2025 11:43:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 3/5] docs: media: update maintainer-entry-profile for
 multi-committers
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1755851331.git.mchehab+huawei@kernel.org>
 <3730608094e80a67ea0d88adc7422877109169f0.1755851331.git.mchehab+huawei@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <3730608094e80a67ea0d88adc7422877109169f0.1755851331.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

I have a number of comments, nothing major (I think). Mostly typos and consistency
issues.

On 22/08/2025 10:33, Mauro Carvalho Chehab wrote:
> As the media subsystem will experiment with a multi-committers model,
> update the Maintainer's entry profile to the new rules.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Can you update my SoB email address to hverkuil+cisco@kernel.org for this patch series?

For v6, please include linux-media as CC for the first two patches as well. Currently
patches 1 and 2 do not appear in patchwork for that reason. I had to hunt for those two
patches. And also Cc a v6 to my new email address rather than the old xs4all address.

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../media/maintainer-entry-profile.rst        | 245 ++++++++++++++----
>  1 file changed, 193 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index ad96a89ee916..66573c763e76 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -4,11 +4,16 @@ Media Subsystem Profile
>  Overview
>  --------
>  
> -The media subsystem covers support for a variety of devices: stream
> -capture, analog and digital TV streams, cameras, remote controllers, HDMI CEC
> -and media pipeline control.
> +The Linux Media Community (aka: the LinuxTV Community) consist of developers
> +who work with the Linux Kernel media subsystem, together with users who
> +benefit from such develoment and help testing the developed code.

Typo: develoment -> development

>  
> -It covers, mainly, the contents of those directories:
> +They work on the top of the Media tree, which has code to support a
> +variety of devices: stream capture, analog and digital TV streams, cameras,
> +remote controllers, HDMI CEC and media pipeline control.
> +
> +The Media tree is mainly responsible to be the main source of the
> +code under development with the contents of those directories:
>  
>    - drivers/media
>    - drivers/staging/media
> @@ -27,19 +32,158 @@ It covers, mainly, the contents of those directories:
>  Both media userspace and Kernel APIs are documented and the documentation
>  must be kept in sync with the API changes. It means that all patches that
>  add new features to the subsystem must also bring changes to the
> -corresponding API files.
> +corresponding API documentation.
>  
> -Due to the size and wide scope of the media subsystem, media's
> -maintainership model is to have sub-maintainers that have a broad
> -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> -task to review the patches, providing feedback to users if the patches are
> +Due to the size and wide scope of the media subsystem, the media's
> +maintainance model recognizes committers that have a broad knowledge of

maintainance -> maintenance

> +a specific aspect of the subsystem. It is the committers' task to
> +review the patches, providing feedback to users if the patches are
>  following the subsystem rules and are properly using the media kernel and
>  userspace APIs.

I think you mean: "if the patches are not" and "or are not properly"

After all, if the patch is doing everything correctly, then you can just
take the patch and you don't need to give feedback...

Also, I'd say 'the patch authors' rather than 'users'. Or perhaps just drop
the 'to users' bit. It's not really needed.

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

Committers -> Media Committers

(it's what we call it in the preceding paragraph as well, and 'Committers'
is also too generic, this is specific media subsystem terminology)

> +    contributors for one or more drivers within the media subsystem.
> +    They can push changes to the tree that do not affect the core or ABI.

ABI -> userspace API/ABI

> +
> +- Core committers:

Media Core Committers

> +    responsible for part of the media core. They are typically
> +    responsible for one or more drivers within the media subsystem, but, besides
> +    that, they can also merge patches that change the code common to multiple
> +    drivers, including the kernel internal API.
> +
> +- Subsystem maintainers:

Media Subsystem Maintainers

> +    responsible for the subsystem as a whole, with access to the
> +    entire subsystem.
> +
> +    API/ABI changes are done via consensus between subsystem maintainers\ [2]_.

subsystem -> media subsystem

> +
> +    Only subsystem maintainers push changes that affect the userspace

subsystem -> media subsystem

> +    API/ABI. Committers may push ABI/API changes on their commits if they

ABI/API -> API/ABI
Committers -> Media committers

> +    have approvals from subsystem maintainers.

subsystem -> the media subsystem

This section is confusing: first you say that *only* media subsystem maintainers
can push userspace changes, then you say that media committers can do that as
well, if they have approval.

I think it should be OK for media committers to make API/ABI changes, provided
they have the SoB of all media subsystem maintainers. But in that case, the 'Only'
bit has to be dropped.

How about this:

---------------------------------------------------------------
- Media Subsystem Maintainers:

responsible for the media subsystem as a whole, with access to the entire media
subsystem.

API/ABI changes are done via consensus between the media subsystem maintainers\ [2]_.

The media subsystem maintainers push changes that affect the userspace API/ABI.
Media committers may push API/ABI changes on their commits as well, but only if
they have approval (Signed-off-by) of all media subsystem maintainers.
---------------------------------------------------------------

I think this is clear, and it is also something that Media CI can easily test for.

> +
> +All media committers shall explicitly agree with the Kernel development process
> +as described at Documentation/process/index.rst and to the Kernel
> +development rules inside the Kernel documentation, including its code of
> +conduct.
> +
> +.. [2] Everything that would break backward compatibility with existing
> +       non-kernel code are API/ABI changes. This includes ioctl and sysfs
> +       interfaces, v4l2 controls, and their behaviors.
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
> +All changes for the media subsystem shall be sent first as e-mails to the
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
> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
> +Please always copy driver's authors and maintainers.
> +
> +To minimize the chance of merge conflicts for your patch series, and make
> +easier to backport patches to stable Kernels, we recommend that you use the
> +following baseline for your patch series:
> +
> +1. Features for the next mainline release:
> +
> +   - baseline shall be media.git ``next`` branch;

I'm fine with this for now, but in practice we use the media-committers
tree on gitlab. I haven't used media.git in quite a long time.

Just wondering if we should update this, or postpone that for a later
patch.

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
> +linux-media@vger.kernel.org mailing list shall have:
> +
> +- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
> +
> +Patches that change API shall update documentation accordingly at the
> +same patch series.
> +
> +See Documentation/process/index.rst for more details about e-mail submission.
> +
> +Once a patch is submitted, it may follow either one of the following
> +workflows:
> +
> +a. Pull request workflow: patches are handled by subsystem maintainers::

subsystem -> media subsystem

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

I want to limit this to "media committers". That's the current practice.
I'm fine with extending this, but that requires a separate discussion.

See also this discussion on the mailinglist:

https://lore.kernel.org/linux-media/8de3180d-5d53-4aa1-9e01-b6add8d67477@kernel.org/

> +
> +b. Committers' workflow: patches are handled by media committers::

Committers' -> Media committers'

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
> +patch problems. When this happens, the patch submitter must fix them or
> +explain why the errors are false positives.
> +
> +Patches will only be moved to the next stage in those two workflows if they
> +pass on CI or if there are false-positives in the CI reports.

"maintainers approval": this step is never explained, and I'm not sure what is
meant with that.

Personally I think the bit about 'patchwork picks it' is a bit confusing. It
suggests that patchwork is involved in the committing of patches, which is
definitely not the case. It does do a CI run, but that's about it. I'd drop
that part in both workflows, as I don't think it is relevant for this.

You can say: 'picked up by patchwork' in the sense that the e-mail is added
to patchwork so the patch/PR status can be traced.

> +
> +Failures during e-mail submission
> ++++++++++++++++++++++++++++++++++
>  
>  Media's workflow is heavily based on Patchwork, meaning that, once a patch
>  is submitted, the e-mail will first be accepted by the mailing list
> @@ -47,51 +191,49 @@ server, and, after a while, it should appear at:
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
> +++++++++++++++++++++++++++++++++++++++++++
>  
> -At the media subsystem, we have a group of senior developers that
> -are responsible for doing the code reviews at the drivers (also known as
> -sub-maintainers), and another senior developer responsible for the
> -subsystem as a whole. For core changes, whenever possible, multiple
> -media maintainers do the review.
> +The authenticity of developers submitting pull requests and merge requests
> +shall be validated by using PGP signing at some moment.
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

Subsystem -> Media subsystem

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

subsystem -> media subsystem

> +  - Mauro Carvalho Chehab <mchehab@kernel.org> and
> +  - Hans Verkuil <hverkuil@xs4all.nl>

Please change the email to hverkuil@kernel.org.

One problem I have with this change is that we lose the information about
who maintains what. This document is about media committers, and right now
us two are the only committers, so strictly speaking this is correct.

But in practice a lot of what is in this document is about maintenance
responsibilities, and commit rights is just an extra checkmark. I.e. to
become a media committer you must be a media maintainer, but the reverse
isn't true.

For patch submitters it is important to know who the maintainers are, since
they have to sign off on it and either make the PR or can commit the patch.

This change deletes the list of maintainers and their expert areas, and
I think we need to keep it around somewhere. And update it as well, since it
is outdated.

>  
>  Submit Checklist Addendum
>  -------------------------
> @@ -106,18 +248,15 @@ that should be used in order to check if the drivers are properly
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
> -Other compliance tools are under development to check other parts of the
> -subsystem.
> +.. [5] The ``v4l2-compliance`` utility also covers the media controller usage
> +       inside V4L2 drivers.
>  
>  Those tests need to pass before the patches go upstream.
>  
> @@ -134,6 +273,8 @@ Where the check script is::
>  Be sure to not introduce new warnings on your patches without a
>  very good reason.
>  
> +Please see `Media development workflow`_ for e-mail submission rules.
> +
>  Style Cleanup Patches
>  +++++++++++++++++++++
>  
> @@ -199,7 +340,7 @@ tree between -rc6 and the next -rc1.
>  Please notice that the media subsystem is a high traffic one, so it
>  could take a while for us to be able to review your patches. Feel free
>  to ping if you don't get a feedback in a couple of weeks or to ask
> -other developers to publicly add Reviewed-by and, more importantly,
> +other developers to publicly add ``Reviewed-by:`` and, more importantly,
>  ``Tested-by:`` tags.
>  
>  Please note that we expect a detailed description for ``Tested-by:``,

Regards,

	Hans

