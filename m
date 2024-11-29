Return-Path: <linux-media+bounces-22356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643269DE95A
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 16:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10884162FF2
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 15:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183CC145B00;
	Fri, 29 Nov 2024 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfOBrD0i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E07B208CA;
	Fri, 29 Nov 2024 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732894094; cv=none; b=csBW49m9+Ybb1rDBMGJ8fyAHEutezbAAf2gmVI847IXHunFMWDMUvX0YlR/fbOpQC4fMVGgQcqb79wM1dom/zpHqavilKP5HQYQJJg4qP4EUpSbm2wjlR34VJad58XQxiV94odAJ0jem31rlO9v5oHIFtPZdv6DAtfU2rmW1+J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732894094; c=relaxed/simple;
	bh=3Z0MgbxOps/HSEcj/KP3Q1vYDOggl5wKI4yy5F1WnWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSgZx8nfmti8WjFHIJAydwqDr8tIXFBQwcG+Jy9v4tzXGDKsUpOO+ug7goVGSY1wrvGSNlppYKNlFuwvZWFCi2u4ndqCgOEHrzwMA/20TY9HGXqjOGaM+aybF8LGXDVcps7jwvwZiCUA5TdlGEZuMWIA1yLVfKW3+xwuPmAJAYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfOBrD0i; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6eeba477fcaso19224277b3.0;
        Fri, 29 Nov 2024 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732894091; x=1733498891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQNxyIkKlJtJa+P3W8kUijsnUrm7Aa/IVAxDQd+A7yE=;
        b=SfOBrD0inSK/XrV5kiwcsOrYneqkGWF54oJBXguLz7ecSV/Z2bg7T0gioqzcqfLza1
         Cd6iHuRi/KuOuynv6yP0VWESur8ZV3dvwllE6z2zhIYt/aSeCtMJuPN164XLRDI8b6BM
         d5SQ/+2+BoTLeuGzzVQHp/bAXjFZew17nwl2HKvmj+qAP4JYIJMCTRsbPfvfAsDdb7TR
         27ZFBTAPYEidLYla17g+5BZhqwkK/S3vvD6xLcK27hT8aZTfCt5XQR0nv9w+XkI9pSKG
         Y5i1BrpYM6n32CH/u+1aGDVCKK8JrA9de3fuvX6WJqxiNw5PmiA4+5hNBqwnhxoFpFJL
         Hv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732894091; x=1733498891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQNxyIkKlJtJa+P3W8kUijsnUrm7Aa/IVAxDQd+A7yE=;
        b=RLkIOyBY0cmcddTicCLSPoz1yExvULi3U8gAca7lk/Rj+HsHBEbNbHgfqlhF+qzgKM
         DPZALdNZmhA+vabaxzhfnx7/k4hqz0tC60TXrZ2tZZ2nW0T/I8d2ukvlEeQ/CK+tFWZm
         M/UwK5KZoGJy83zZmckiTxm3yBBPoHuGveJ5M2xZpokPkkfvomKzoGU2sppiQHh8K8oe
         IrbdmMxKxQcYLofUsox7xtvBvcB56ayPFh+zBoWxuwR2n+NtE0XgVJM/nXJpvay0dvOb
         tWttCX7h0HzoQeNCUu34+hGlrBaRawB5GyPm6Zaln0AJcmyjsflBawCTnjR2B8vCBM4C
         LNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEVVKFHOlZauQNkV1rO4IrTe7MilMCd96j3/eFV1IPqQ+onjvEE1VXbJF/9cJwtFpz1ciJE9S55bUi2yAT@vger.kernel.org, AJvYcCVSoy00snkFQeZdB+WH7fSwJvFCilT/wmJ2vOzRsitgvZHyLM5L0nqKWS+f8VzpxX7f59ApjnE/KyUC7K0=@vger.kernel.org, AJvYcCW0z/lhmu+/f61b6gUZbHz53mOdbMy3Yn9kc81iNq9HR4q7j0BwUtb3SAU70MOrv6SLu9JQDfiNxTk=@vger.kernel.org, AJvYcCWeLna2Fj84NF5u91H3A5fnqa0tm+2d7L2dcKnaL9f/JRoFMTIkwMXb3fnQL9UisiJDfOSux30bzPOq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy10cDxrnc2AB/WUn8Vo21MGZdG2hTAwhFEu/oR26ltitzKXOMT
	FeV1WbrUnEn2stJfrS/phqiBNHmBOMyL/zXbuHOIDbx/JDVxpGYQgcqEEZwYx2etm6zgjGXA3/c
	zcrl7024osSpVAClQyCUePcg3WsM=
X-Gm-Gg: ASbGncs7BXbP8SXKmJgrOBHUwc70nymUYD7W1hDuQm6o/wvcHrWe1CP4eEC0DbjUzlT
	O+wHSBG2Qip0a3AKB3sV0KyEjRIF0H6suMqa1eA7ARRXFQ/Q28s19LdyedfYz
X-Google-Smtp-Source: AGHT+IH2YBfNL80tohIKR+JITY+GZX8TzZyIk331Llwt2bi5LALYNnFxr2vnE6mr77nn9/6l8l+raePY9EBwzqdK1FA=
X-Received: by 2002:a05:690c:6105:b0:6e5:b6a7:1640 with SMTP id
 00721157ae682-6ef3728caacmr115383477b3.42.1732894090991; Fri, 29 Nov 2024
 07:28:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1732872169.git.mchehab+huawei@kernel.org> <f3c81e0e9d27b3876331e02ac35dd0e359657028.1732872169.git.mchehab+huawei@kernel.org>
In-Reply-To: <f3c81e0e9d27b3876331e02ac35dd0e359657028.1732872169.git.mchehab+huawei@kernel.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 29 Nov 2024 16:27:54 +0100
Message-ID: <CAPybu_1nGwH_ywf-UbN7wVAwqEnuJhRn-vZ+1ebXrdTk9RU80g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs: media: document media multi-committers rules
 and process
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, workflows@vger.kernel.org, 
	Hans Verkuil <hverkuil@xs4ll.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Minor nits here and there

On Fri, Nov 29, 2024 at 12:15=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> As the media subsystem will experiment with a multi-committers model,
> update the Maintainer's entry profile to the new rules, and add a file
> documenting the process to become a committer and to maintain such
> rights.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  Documentation/driver-api/media/index.rst      |   1 +
>  .../media/maintainer-entry-profile.rst        |   8 +
>  .../driver-api/media/media-committer.rst      | 278 ++++++++++++++++++
>  .../process/maintainer-pgp-guide.rst          |   2 +
>  4 files changed, 289 insertions(+)
>  create mode 100644 Documentation/driver-api/media/media-committer.rst
>
> diff --git a/Documentation/driver-api/media/index.rst b/Documentation/dri=
ver-api/media/index.rst
> index d5593182a3f9..d0c725fcbc67 100644
> --- a/Documentation/driver-api/media/index.rst
> +++ b/Documentation/driver-api/media/index.rst
> @@ -26,6 +26,7 @@ Documentation/userspace-api/media/index.rst
>      :numbered:
>
>      maintainer-entry-profile
> +    media-committer
>
>      v4l2-core
>      dtv-core
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst =
b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index 47f15fad7f9f..650803c30c41 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -62,6 +62,9 @@ as described at Documentation/process/index.rst and to =
the Kernel
>  development rules inside the Kernel documentation, including its code of
>  conduct.
>
> +More details about media commiters' roles and responsibilities can be
> +found here: Documentation/driver-api/media/media-committer.rst.
> +
>  Media development tree
>  ----------------------
>
> @@ -195,6 +198,11 @@ shall be validated by using PGP sign, via the
>
>  With the pull request workflow, pull requests shall use a GPG-signed tag=
.
>
> +With the committers' workflow, this is ensured at the time merge request
> +rights will be granted to the gitlab instance used by media-committers.g=
it
> +tree, after receiving the e-mail documented at
> +:ref:`media-committer-agreement`.
I am not sure I understand this sentence correctly. I guess you mean:

With the committers workflow, this is ensured during merge request via
gitlab credentials.
Committers will be granted access to the gitlab instance used by
media-committers.git
tree, after receiving the e-mail documented at :ref:`media-committer-agreem=
ent`.


> +
>  For more details about PGP sign, please read
>  Documentation/process/maintainer-pgp-guide.rst.
>
> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documen=
tation/driver-api/media/media-committer.rst
> new file mode 100644
> index 000000000000..1756a7af6353
> --- /dev/null
> +++ b/Documentation/driver-api/media/media-committer.rst
> @@ -0,0 +1,278 @@
> +Media committers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +What is a media committer?
> +--------------------------
> +
> +A media committer is a developer who can push patches from other develop=
ers
> +and their own patches to the
> +`media-committers <https://gitlab.freedesktop.org/linux-media/media-comm=
itters>`_
> +tree.
> +
> +It is a media committer's duty to ensure that their entries in the MAINT=
AINERS
> +file are kept up-to-date, and that submitted patches for files for which
> +they are listed as maintainers are timely reviewed on the mailing list,
> +ideally not waiting in patchwork as ``New`` for more than one Kernel mer=
ge
> +cycle, and, if accepted, applying them at the media committer's tree.
> +
> +These commit rights are granted with some expectation of responsibility:
> +committers are people who care about the Linux Kernel as a whole and
> +about the Linux media subsystem and want to help its development. It
> +is also based on a trust relationship between the rest of the committers=
,
> +maintainers and the Linux Media community.
> +
> +The Linux Media community, also called LinuxTV community, has its primar=
y
> +site at https://linuxtv.org.
> +
> +As such, a media committer is not just someone who is capable of creatin=
g
> +code, but someone who has demonstrated their ability to collaborate
> +with the team, get the most knowledgeable people to review code,
> +contribute high-quality code, and follow through to fix issues (in code
> +or tests).
> +
> +.. Note::
> +
> +   1. If a patch introduces a regression, then it is the media committer=
's
> +      responsibility to correct that as soon as possible. Typically the
> +      patch is either reverted, or an additional patch is committed that
> +      fixes the regression;
> +   2. if patches are fixing bugs against already released Kernels, inclu=
ding
> +      the reverts above mentioned, the media committer shall add the nee=
ded
> +      tags. Please see :ref:`Media development workflow` for more detail=
s.
> +
> +Becoming a media committer
> +--------------------------
> +
> +The most important aspect of volunteering to be a committer is that you =
have
> +demonstrated the ability to give good code reviews. So we are looking fo=
r
> +whether or not we think you will be good at doing that.
> +
> +As such, potential committers must earn enough credibility and trust fro=
m the
> +LinuxTV community. To do that, developers shall be familiar with the ope=
n
> +source model and have been active in the Linux Kernel community for some=
 time,
> +and, in particular, in the media subsystem.
> +
> +So, in addition to actually making the code changes, you are basically
> +demonstrating your:
> +
> +- commitment to the project;
> +- ability to collaborate with the team and communicate well;
> +- understand of how upstream and the LinuxTV community work
> +  (policies, processes for testing, code review, ...)
> +- reasonable knowledge about:
> +
> +  - the Kernel development process:
> +    Documentation/process/index.rst
> +
> +  - the Media development profile:
> +    Documentation/driver-api/media/maintainer-entry-profile.rst
> +
> +- understanding of the projects' code base and coding style;
> +- ability to provide feedback to the patch authors;
> +- ability to judge when a patch might be ready for review and to submit;
> +- ability to write good code (last but certainly not least).
> +
> +Developers that intend to become committers are encouraged to participat=
e
> +at the yearly Linux Media Summit, typically co-located with another Linu=
x
> +conference.
> +
> +If you are doing such tasks and have become a valued developer, an
> +existing committer can nominate you to the media subsystem maintainers.
> +
> +The ultimate responsibility for accepting a nominated committer is up to
> +the subsystem's maintainers. The committers must earn a trust relationsh=
ip
> +with all subsystem maintainers, as, by granting you commit rights, they =
will
> +be delegating part of their maintenance tasks.
> +
> +Due to that, to become a committer or a core committer, a consensus betw=
een
> +all subsystem maintainers is required, as they all need to trust a devel=
oper
> +well enough to be delegated the responsibility to maintain part of the c=
ode
> +and to properly review patches from third parties, in a timely manner an=
d
> +keeping the status of the reviewed code at https://patchwork.linuxtv.org
> +updated.
> +
> +.. Note::
> +
> +   In order to preserve/protect the developers that could have their com=
mit
> +   rights granted, denied or removed as well as the subsystem maintainer=
s who
> +   have the task to accept or deny commit rights, all communication rela=
ted to
> +   nominating a committer, preserving commit rights or leaving such func=
tion
> +   should happen in private as much as possible.
> +
> +.. _media-committer-agreement:
> +
> +Media committer's agreement
> +---------------------------
> +
> +Once a nominated committer is accepted by all subsystem maintainers,
> +they will ask if the developer is interested in the nomination and discu=
ss
> +what area(s) of the media subsystem the committer will be responsible fo=
r.
> +
> +Once the developer accepts being a committer, the new committer shall
> +explicitly accept the Kernel development policies described under its
> +Documentation/, and, in particular to the rules on this document, by wri=
ting
> +an e-mail to media-committers@linuxtv.org, with a declaration of intent
> +following the model below::
> +
> +   I, John Doe, would like to change my status to: Committer
> +
> +   I intend to actively develop the XYZ driver, send fixes to drivers
> +   that I can test, optionally reviewing patches and merging trivial
> +   fixes in other areas of the subsystem, ...
> +
> +   For the purpose of committing patches to the media-committer's tree,
> +   I'll be using my user https://gitlab.freedesktop.org/users/<username>=
.
> +
> +Followed by a formal declaration of agreement with the Kernel developmen=
t
> +rules::
> +
> +   I hereby declare that I agree with the Kernel development rules descr=
ibed at:
> +
> +   https://www.kernel.org/doc/html/latest/driver-api/media/media-committ=
er.rst
> +
> +   and to the Linux Kernel development process rules.
> +
> +   I agree to the Code of Conduct as documented in:
> +   https://www.kernel.org/doc/html/latest/process/code-of-conduct.rst
> +
> +   I am aware that I can, at any point of time, retire. In that case, I =
will
> +   send an e-mail to notify the subsystem maintainers for them to revoke=
 my
> +   commit rights.
> +
> +   I am aware that the Kernel development rules change over time.
> +   By doing a new push to media-commiter tree, I understand that I agree
> +   with the rules in effect at the time of the commit.
> +
> +Such e-mail shall be signed with a PGP key cross signed by other Kernel =
and
> +media developers. As described at :ref:`media-developers-gpg`_, the PGP
> +signature, together with the gitlab user security are fundamental compon=
ents
security,
> +that ensure the authentity of the merge requests that will happen at the
authenticity
> +media-committer.git tree.
> +
> +In case the kernel development process changes, by merging new commits
> +in the
> +`media-committer tree <https://gitlab.freedesktop.org/linux-media/media-=
committers>`_,
> +the media committer implicitly declares their agreement with the latest
> +version of the documented process including the contents of this file.
> +
> +.. note::
> +
> +   1. Changes to the kernel media development process should be announce=
d in
> +      the media-committers mailinglist with a reasonable review period. =
All
> +      committers are automatically subscribed to that mailinglist;
> +   2. Due to the distributed nature of the Kernel development, it is
> +      possible that kernel development process changes may end being
> +      reviewed/merged at the linux-docs mailing list, specially for the
> +      contents under Documentation/process and for trivial typo fixes.
> +
> +Core committers
> +---------------
> +
> +As described in Documentation/driver-api/media/maintainer-entry-profile.=
rst
> +a committer may be granted with additional rights to also be able to
> +change a core file and/or media subsystem's Kernel API. The extent of
> +the core committer's grants will be detailed by the subsystem maintainer=
s
> +when they nominate a core committer.
> +
> +Existing committers may become core committers and vice versa. Such
> +decisions will be taken in consensus between the subsystem maintainers.
> +
> +Media committers rules
> +----------------------
> +
> +Media committers shall do their best efforts to avoid merged patches tha=
t
> +would break any existing drivers. If it breaks, fixup or revert patches
> +shall be merged as soon as possible, aiming to be merged at the same Ker=
nel
> +cycle the bug is reported.
> +
> +Media committers shall behave accordingly to the rights granted by
> +the subsystem maintainers, specially with regards of the scope of change=
s
> +they may apply directly at the media-committers tree. Such scope can
> +change over time on a mutual agreement between media committers and
> +maintainers.
> +
> +As described at :ref:`Media development workflow`, there are workflows.
> +For the committers' workflow, the following rules apply:
> +
> +- Each merged patch shall pass CI tests;
> +
> +- Media committers shall request reviews from other committers and
> +  developers where applicable, i.e. because those developers have more
> +  knowledge about some areas that are changed by a patch;
> +
> +- There shall be no open issues or unresolved or conflicting feedback
> +  from anyone. Clear them up first. Defer to subsystem maintainers as ne=
eded.
> +
> +Patches that do not fall under the committer's workflow criteria will fo=
llow
> +the pull request workflow as described at :ref:`Media development workfl=
ow`.
> +
> +Only a subsystem maintainer can override such rules.
> +
> +All media committers shall ensure that patchwork will reflect the curren=
t
> +status, e.g. patches shall be delegated to the media committer who is
> +handling them and the patch status shall be updated according to these r=
ules:
> +
> +- ``Under review``: Used if the patch requires a second opinion
> +  or when it is part of a pull request;
> +- ``Accepted``: Once a patch is merged in the multi-committer tree.
> +- ``Superseded``: There is a newer version of the patch posted to the
> +  mailing list.
> +- ``Duplicated``: There was another patch doing the same thing from some=
one
> +  else that was accepted.
> +- ``Not Applicable``: Use for patch series that are not merged at media.=
git
> +  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to=
 the
> +  linux-media mailing list.
> +
> +If the committer decides not to merge it, then reply by email to patch
> +authors, explaining why it is not merged, and patchwork shall be updated
> +accordingly with either:
> +
> +- ``Changes Requested``: if a new revision was requested;
> +- ``Rejected``: if the proposed change won't be merged upstream.
> +
> +If a media committer decides to retire, it is the committer's duty to
> +notify the subsystem maintainers about that decision.
> +
> +.. Note::
> +
> +   Patchwork supports a couple of clients to help semi-automating
> +   status updates via its REST interface:
> +
> +   https://patchwork.readthedocs.io/en/latest/usage/clients/
> +
> +Maintaining media committer status
> +----------------------------------
> +
> +A community of committers working together to move the Linux Kernel
> +forward is essential to creating successful projects that are rewarding
> +to work on. If there are problems or disagreements within the community,
> +they can usually be solved through healthy discussion and debate.
> +
> +In the unhappy event that a media committer continues to disregard good
> +citizenship (or actively disrupts the project), we may need to revoke
> +that person's status. In such cases, if someone suggests the revocation
> +with a good reason, then after discussing this among the media committer=
s,
> +the final decision is taken by the subsystem maintainers. As the decisio=
n
> +to become a media committer comes from a consensus between subsystem
> +maintainers, a single subsystem maintainer not trusting the media commit=
ter
> +anymore is enough to revoke committer's grants.
> +
> +If a committer is inactive for more than a couple of Kernel cycles,
> +maintainers will try to reach you via e-mail. If not possible, they may
> +revoke your committer grants and update MAINTAINERS file entries
> +accordingly. If you wish to resume contributing later on, then contact
> +the subsystem maintainers to ask if your rights can be restored.
> +
> +A previous committer that had their commit rights revoked can keep
> +contributing to the subsystem via the pull request workflow as documente=
d
> +at the :ref:`Media development workflow`.
> +
> +References
> +----------
> +
> +Much of this was inspired by/copied from the committer policies of:
> +
> +- `Chromium <https://chromium.googlesource.com/chromium/src/+/main/docs/=
contributing.md>`_;
> +- `WebKit <https://webkit.org/commit-and-review-policy/>`_;
> +- `Mozilla <https://www.mozilla.org/hacking/committer/>`_.
> +
> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentati=
on/process/maintainer-pgp-guide.rst
> index f5277993b195..795ef8d89271 100644
> --- a/Documentation/process/maintainer-pgp-guide.rst
> +++ b/Documentation/process/maintainer-pgp-guide.rst
> @@ -903,6 +903,8 @@ the new default in GnuPG v2). To set it, add (or modi=
fy) the
>
>      trust-model tofu+pgp
>
> +.. _kernel_org_trust_repository:
> +
>  Using the kernel.org web of trust repository
>  --------------------------------------------
>
> --
> 2.47.0
>
>


--=20
Ricardo Ribalda

