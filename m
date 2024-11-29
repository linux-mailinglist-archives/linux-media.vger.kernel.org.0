Return-Path: <linux-media+bounces-22354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 035459DE918
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 16:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B77742819A3
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 15:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C3713E03E;
	Fri, 29 Nov 2024 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW33vAg7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98AC2E3FE;
	Fri, 29 Nov 2024 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732893002; cv=none; b=mpnjZ/A02XVNOBmHJ14VcdEF4GtACeFVQdNZj3K7NZj99ARciaGvSv4loaRrMR0kbvfuvzNMRAHUqs4XBrvkDG2ix49O2q1uzP1x3JTOZ1WPDdMjTEbbWcq3TSe2hO79lGm6/nIs/gjdiOqdU52Mjam0aynNBEoMGEknq5nywPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732893002; c=relaxed/simple;
	bh=3/EleBdj6gq8TvLAXgmAG2gB1921ud84c8HAqyEQAFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mq/KsCQVVMEl+g0TW7UgT+T9fyu9PLZmhctUdxwSTCzpZ3T47/EQLAnR2WSrrPJA5cK3tgNDl9yPm82Dh4Dyc1l6csAvy7UPnNFltBRxt9A8icVbfqs67KpLrqYjnPV88CC2XB6Bc7/znQHH2dbf6Y++h/6+o+gosg8N/eg6eRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW33vAg7; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e916196023so976284b6e.3;
        Fri, 29 Nov 2024 07:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732892999; x=1733497799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktf1iqLLniPmJrtKDoJwviJAkYjExjojPnwSihJ/5gc=;
        b=IW33vAg74hjfCoDP5Jr/L8ManMSE7vuvj3ZtVRF+ibQXWiyF7qnoXzGOSHnnZnbDp6
         QDKi6mOK8GR9yPLdFVGi1n8hygtyZLWtF1FqIxiF6HTcqk05lgF9iHJ/omUewIG8Rzjh
         MngvnXdBrsbrjThjg+/u3Z1WNLB35r6So2Q2odRrFNIaYIiZeR1VXOcFSUDaQlOjJtms
         8PCpZflxF31JtiDIcLtQEsVMMK/eRkMDycvWftVzY+lGqAHAiTTOcIzCm43qgvcAuFGm
         C8xSn4oivlURQeYiLDOw0NGbnGd/vCxv/sLqB7PLtitsgfwIZbBVgBhw0yMyaNJx3DvX
         YS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732892999; x=1733497799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ktf1iqLLniPmJrtKDoJwviJAkYjExjojPnwSihJ/5gc=;
        b=d7mTzerRmVfERAaRMS/ILEsw3CAoFtVF9i4YB4SEnPATBoJLXrbeINwOpHUOSwgh1c
         HXs/7rXoCou7nYvN0X8XxODraCYPpOdRoSdabnyYjbj4MsuHvuuL18JFulKOM5Swn5So
         SVLJoLCTMTDy8IKu6DlhtfivGWBndLdpaeqiAI//hm9BQ1GSpwPLZ48AHZuq5nHGQPww
         pDeVZqTBHj5BlP5VcoKh1h4bHrod//6ZL3EH5nDy0ZHKmBsWlKSwnUYVOuE91Y7c/CoR
         qot+8bvnbXMjTKlLpwYp7bJJG6s+ra7sHfEz7bAP3rM+WYhXq7/qjzepHYjySGW60Nlc
         7JMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvoZYzzSWOpHq87bMYJJIErRnc6yMardrRBUcsLcN1EWags2TSyGhIWygC6ZLYc14rWS5eY823G63PwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl96N/iFpR+NhO8xEg72rfRYL7ghVta8LToC2yxR1YmYYM7E4d
	qFG3funOLDhhGr9JgO6jCiGw6C13iE53tgVV8q8h2aZh43cJw9MIyLl5Eu2W9vQeoN3zWyJkTL3
	GgZ8HHrS3jS5aD4ewpEmCZiRAkbUute7S2vs=
X-Gm-Gg: ASbGncuXjuTXPFBUrflwxFYbqj23/0meOFpCZH8dwrrKFfpWUWz41CNlztlAFzKH/VK
	fmxEQIvpHW0oZnADJFyCYv89p8ESnnQtCu1sJgwt0QCgfC3OvbIR8kNgZIKwa
X-Google-Smtp-Source: AGHT+IH9BvnjSGwq8BnwIXvH/JVOqY2JhpnEF6UPLUKxhTmrN5yQ+E2R2olVT9ujnBLMi5Erq62o7t03PfyN3cdIa9U=
X-Received: by 2002:a05:6808:14cb:b0:3ea:4aec:4a43 with SMTP id
 5614622812f47-3ea6dde2562mr8806762b6e.43.1732892997539; Fri, 29 Nov 2024
 07:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1732872169.git.mchehab+huawei@kernel.org> <99e1b9df713827ce2e6c21073276c97030071a07.1732872169.git.mchehab+huawei@kernel.org>
In-Reply-To: <99e1b9df713827ce2e6c21073276c97030071a07.1732872169.git.mchehab+huawei@kernel.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 29 Nov 2024 16:09:41 +0100
Message-ID: <CAPybu_2O9GVNCroLoFPGgrhs_UB97p6ng1dHgtVwbGhyr9LruA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: media: update maintainer-entry-profile for multi-committers
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Hans Verkuil <hverkuil@xs4ll.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for putting this together.

I have marked some minor nits here and there. You can put my
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

The only thing that is not a nit: is changing responsible with
contributor. But if we agree on the meaning (and I think that we do)
we can always improve this doc later.

On Fri, Nov 29, 2024 at 12:15=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> As the media subsystem will experiment with a multi-committers model,
> update the Maintainer's entry profile to the new rules.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
> ---
>  .../media/maintainer-entry-profile.rst        | 203 ++++++++++++++----
>  MAINTAINERS                                   |   1 +
>  2 files changed, 158 insertions(+), 46 deletions(-)
>
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst =
b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index ffc712a5f632..47f15fad7f9f 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -27,19 +27,133 @@ It covers, mainly, the contents of those directories=
:
>  Both media userspace and Kernel APIs are documented and the documentatio=
n
>  must be kept in sync with the API changes. It means that all patches tha=
t
>  add new features to the subsystem must also bring changes to the
> -corresponding API files.
> +corresponding API documentation files.
>
> -Due to the size and wide scope of the media subsystem, media's
> -maintainership model is to have sub-maintainers that have a broad
> -knowledge of a specific aspect of the subsystem. It is the sub-maintaine=
rs'
> -task to review the patches, providing feedback to users if the patches a=
re
> +Due to the size and wide scope of the media subsystem, the media's
> +maintainership model is to have committers that have a broad knowledge o=
f
> +a specific aspect of the subsystem. It is the committers' task to
> +review the patches, providing feedback to users if the patches are
>  following the subsystem rules and are properly using the media kernel an=
d
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
> +- Committers: responsible for one or more drivers within the media subsy=
stem.
> +  They can push changes to the tree that do not affect the core or ABI.

Can we say contributor instead of responsible? For me responsible
means maintainer.

I would like to land patches that have been properly reviewed to the
committers tree for areas that I do not maintiain:

For example:
- Laurent has reviewed a uvc patch that I want to land asap to avoid
conflicts with other patchsets that I am working with.
- I want to land a patch for a ci breakage that has been reviewed by
another person, it is trivial, and none has a bad comment about it.
- I want to land a fix for a driver that has been properly reviewed by
the maintainer and none has a bad comment about it.


> +
> +- Core committers: responsible for part of the media core. They are typi=
cally
> +  responsible for one or more drivers within the media subsystem, but, b=
esides
> +  that, they can also merge patches that change the code common to multi=
ple
> +  drivers, including the kernel internal API.
> +
> +- Subsystem maintainers: responsible for the subsystem as a whole, with
> +  access to the entire subsystem.
> +
> +  Only subsystem maintainers can push changes that affect the userspace
> +  API/ABI.
> +
> +Media committers shall explicitly agree with the Kernel development proc=
ess
s/Media committers/All
> +as described at Documentation/process/index.rst and to the Kernel
> +development rules inside the Kernel documentation, including its code of
> +conduct.
> +
> +Media development tree
> +----------------------
> +
> +The main development tree used by the media subsystem is hosted at Linux=
TV.org,
> +where we also maintain news about the subsystem, wiki pages and a patchw=
ork
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
> +It means that patches shall be submitted as plain text only via e-mail t=
o:
> +
> +  `https://subspace.kernel.org/vger.kernel.org.html <linux-media@vger.ke=
rnel.org>`_

nit: Maybe this is a better url? https://lore.kernel.org/linux-media/

> +
> +Emails with HTML will be automatically rejected by the mail server.
> +
> +It could be wise to also copy the media committer(s). You should use
nit: How does someone know who the committers are? I think sending to
the ML and to ./get_maintainers.pl is enough


> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
> +Please always copy driver's authors and maintainers.
> +
> +Such patches need to be based against a public branch or tag as follows:
> +
> +1. Patches for new features need to be based at the ``next`` branch of
> +   media.git tree;
> +
> +2. Fixes against an already released kernel should preferably be against
> +   the latest released Kernel. If they require a previously-applied
> +   change at media.git tree, they need to be against its ``fixes`` branc=
h.

2. Fixes against an already released kernel should preferably be against
   the ``fixes`` branch of the media.git tree;

> +
> +3. Fixes for issues not present at the latest released kernel should
> +   preferably be against the latest -rc1 Kernel. If they require a
> +   previously-applied change at media.git tree, they need to be against
> +   its ``fixes`` branch.

Can we get rid of this third type? It is a bit confusing.  My mental model =
is:
- Things for the next kernel version: next
- Things for this kernel version: fixes

We will make sure to close the next tree when needed, and that fixes
and next are upreved accordingly.



> +
> +Patches with fixes shall have:
> +- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
> +- when applicable, a ``Cc: stable@vger.kernel.org``.
> +
> +Patches that were fixing bugs publicly reported by someone at the
> +linux-media@vger.kernel.org mailing list shall have:
> +- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
> +
> +Patches that change API shall update documentation accordingly at the
> +same patch series.
> +
> +See Documentation/process/index.rst for more details about e-mail submis=
sion.
> +
> +Once a patch is submitted, it may follow either one of the following
> +workflows:
> +
> +a. Pull request workflow: patches are handled by subsystem maintainers::
> +
> +     +------+   +---------+   +-------+   +-----------------------+   +-=
--------+
> +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->|m=
edia.git|
> +     +------+   |picks it |   |request|   |in media-committers.git|   +-=
--------+
> +                +---------+   +-------+   +-----------------------+
> +
> +   For this workflow, pull requests can be generated by a committer,
> +   a previous committer, subsystem maintainers or by a couple of trusted

I guess you mean a trusted long-time contributor, not a couple. How
can you send a PR from two people?

> +   long-time contributors. If you are not in such group, please don't su=
bmit
> +   pull requests, as they will likely be ignored.
s/be ignored/not processed/.

Sounds a bit better :).
Maybe you could even say: not processed, and the author notified.

> +
> +b. Committers' workflow: patches are handled by media committers::
> +
> +     +------+   +---------+   +--------------------+   +-----------+   +=
---------+
> +     |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|-->|=
media.git|
> +     +------+   |picks it |   |media-committers.git|   |approval   |   +=
---------+
> +                +---------+   +--------------------+   +-----------+
> +
> +On both workflows, all patches shall be properly reviewed at
> +linux-media@vger.kernel.org before being merged at media-committers.git.
> +
> +When patches are picked by patchwork and when merged at media-committers=
,
> +CI bots will check for errors and may provide e-mail feedback about
> +patch problems. When this happens, the patch submitter must fix them
> +and send another version of the patch.

must fix them, or explain why the errors are false positives.

> +
> +Patches will only be moved to the next stage in those two workflows if t=
hey
> +don't fail on CI or if there are false-positives in the CI reports.
> +
> +Failures during e-mail submission
> ++++++++++++++++++++++++++++++++++
>
>  Media's workflow is heavily based on Patchwork, meaning that, once a pat=
ch
>  is submitted, the e-mail will first be accepted by the mailing list
> @@ -47,51 +161,49 @@ server, and, after a while, it should appear at:
>
>     - https://patchwork.linuxtv.org/project/linux-media/list/
>
> -If it doesn't automatically appear there after a few minutes, then
> +If it doesn't automatically appear there after some time [2]_, then
>  probably something went wrong on your submission. Please check if the
> -email is in plain text\ [2]_ only and if your emailer is not mangling
> +email is in plain text\ [3]_ only and if your emailer is not mangling
>  whitespaces before complaining or submitting them again.
>
> -You can check if the mailing list server accepted your patch, by looking=
 at:
> +To troubleshoot problems, you should first check if the mailing list
> +server has accepted your patch, by looking at:
>
>     - https://lore.kernel.org/linux-media/
>
> -.. [2] If your email contains HTML, the mailing list server will simply
> +If the patch is there and not at patchwork, it is likely that your e-mai=
ler
> +mangled the patch. Patchwork internally has a logic that checks if the
> +received e-mail contain a valid patch. Any whitespace and new line
> +breakages mangling the patch won't be recognized by patchwork, thus such
> +patch will be rejected.
> +
> +.. [2] It usually takes a few minutes for the patch to arrive, but
> +       the e-mail server may be busy, so it may take up to a few hours
> +       for a patch to be picked by patchwork.
> +
> +.. [3] If your email contains HTML, the mailing list server will simply
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
> +The authenticity of developers submitting pull requests and merge reques=
ts
> +shall be validated by using PGP sign, via the
> +:ref:`kernel_org_trust_repository`.
>
> -The media maintainers that work on specific areas of the subsystem are:
> +With the pull request workflow, pull requests shall use a GPG-signed tag=
.
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
> -Media maintainers may delegate a patch to other media maintainers as nee=
ded.
> -On such case, checkpatch's ``delegate`` field indicates who's currently
> -responsible for reviewing a patch.
> +The subsystem maintainers are:
> +  - Mauro Carvalho Chehab <mchehab@kernel.org> and
> +  - Hans Verkuil <hverkuil@xs4all.nl>
>
>  Submit Checklist Addendum
>  -------------------------
> @@ -108,17 +220,14 @@ implementing the media APIs:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  Type                   Tool
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -V4L2 drivers\ [3]_     ``v4l2-compliance``
> +V4L2 drivers\ [4]_     ``v4l2-compliance``
>  V4L2 virtual drivers   ``contrib/test/test-media``
>  CEC drivers            ``cec-compliance``
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> -.. [3] The ``v4l2-compliance`` also covers the media controller usage in=
side
> +.. [4] The ``v4l2-compliance`` also covers the media controller usage in=
side
>         V4L2 drivers.
>
> -Other compilance tools are under development to check other parts of the
> -subsystem.
> -
>  Those tests need to pass before the patches go upstream.
>
>  Also, please notice that we build the Kernel with::
> @@ -134,6 +243,8 @@ Where the check script is::
>  Be sure to not introduce new warnings on your patches without a
>  very good reason.
>
> +Please see `Media development workflow`_ for e-mail submission rules.
> +
>  Style Cleanup Patches
>  +++++++++++++++++++++
>
> @@ -199,7 +310,7 @@ tree between -rc6 and the next -rc1.
>  Please notice that the media subsystem is a high traffic one, so it
>  could take a while for us to be able to review your patches. Feel free
>  to ping if you don't get a feedback in a couple of weeks or to ask
> -other developers to publicly add Reviewed-by and, more importantly,
> +other developers to publicly add ``Reviewed-by:`` and, more importantly,
>  ``Tested-by:`` tags.
>
>  Please note that we expect a detailed description for ``Tested-by:``,
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6db07b8fa215..f9bdef1b5966 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14193,6 +14193,7 @@ MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
>  M:     Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
> +P:     Documentation/driver-api/media/maintainer-entry-profile.rst
>  W:     https://linuxtv.org
>  Q:     http://patchwork.kernel.org/project/linux-media/list/
>  T:     git git://linuxtv.org/media_tree.git
> --
> 2.47.0
>
>


--=20
Ricardo Ribalda

