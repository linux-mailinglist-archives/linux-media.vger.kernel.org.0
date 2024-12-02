Return-Path: <linux-media+bounces-22449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C509E063B
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB6B416E556
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A363205E30;
	Mon,  2 Dec 2024 14:37:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C71F203718;
	Mon,  2 Dec 2024 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150225; cv=none; b=D0tzs3y8yHszgLUdiD8v122raqK+DUq4dw4WjVIa3E99acAr/fvbBn+9PD6kINh970gP1Tz4K3gtSyrthCdwGS9IOXp0G1K9YvkRySSMMx8oSAP/i8/sxRmQDTGP3fWGUp+vAK9AJRTbq1Ye7VIb1r0lMYpV28NMo4frvTtNvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150225; c=relaxed/simple;
	bh=nCovjcUAmhhIWti/fkqH+fv0IoWSq+b8q/24niJLpnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWgHCjgkeHvlOkSmhJF0sm6J9Am7edBn91JhaG1CwtsMQNupSqe45HVporQNwxpNNQzQMaxGbXUTI02S8MuRHjfBbOJenYJSgZKBGzRx2VO+V9Uu0bioPWS4J1Ebj9nn5gvdzoU7iuKJ+aGJpcuzxxLkga3burAYXrM4e6k9p2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75DEC4CED1;
	Mon,  2 Dec 2024 14:37:02 +0000 (UTC)
Message-ID: <4295a38c-b2db-48ee-b9ca-d6f792b79fd7@xs4all.nl>
Date: Mon, 2 Dec 2024 15:37:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] docs: media: document media multi-committers rules
 and process
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4ll.nl>, Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
 <49cdca2d2b3b5422c34506bfe2c91173e847ea1f.1733131405.git.mchehab+huawei@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <49cdca2d2b3b5422c34506bfe2c91173e847ea1f.1733131405.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2024 10:26, Mauro Carvalho Chehab wrote:
> As the media subsystem will experiment with a multi-committers model,
> update the Maintainer's entry profile to the new rules, and add a file
> documenting the process to become a committer and to maintain such
> rights.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>

Same typo in my email.

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  Documentation/driver-api/media/index.rst      |   1 +
>  .../media/maintainer-entry-profile.rst        |   8 +
>  .../driver-api/media/media-committer.rst      | 278 ++++++++++++++++++
>  .../process/maintainer-pgp-guide.rst          |   2 +
>  4 files changed, 289 insertions(+)
>  create mode 100644 Documentation/driver-api/media/media-committer.rst
> 
> diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
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
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index dc764163cf1c..705209eacf58 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -65,6 +65,9 @@ as described at Documentation/process/index.rst and to the Kernel
>  development rules inside the Kernel documentation, including its code of
>  conduct.
>  
> +More details about media commiters' roles and responsibilities can be

commiters -> committers

> +found here: Documentation/driver-api/media/media-committer.rst.
> +
>  Media development tree
>  ----------------------
>  
> @@ -200,6 +203,11 @@ shall be validated by using PGP sign. See: :ref:`kernel_org_trust_repository`.
>  
>  With the pull request workflow, pull requests shall use a PGP-signed tag.
>  
> +With the committers' workflow, this is ensured at the time merge request
> +rights will be granted to the gitlab instance used by media-committers.git

by -> by the

> +tree, after receiving the e-mail documented at

at -> in

> +:ref:`media-committer-agreement`.
> +
>  For more details about PGP sign, please read
>  Documentation/process/maintainer-pgp-guide.rst.
>  
> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
> new file mode 100644
> index 000000000000..3c2f8f413307
> --- /dev/null
> +++ b/Documentation/driver-api/media/media-committer.rst
> @@ -0,0 +1,278 @@
> +Media committers
> +================
> +
> +What is a media committer?
> +--------------------------
> +
> +A media committer is a developer who can push patches from other developers
> +and their own patches to the
> +`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_
> +tree.
> +
> +It is a media committer's duty to ensure that their entries in the MAINTAINERS
> +file are kept up-to-date, and that submitted patches for files for which
> +they are listed as maintainers are timely reviewed on the mailing list,
> +ideally not waiting in patchwork as ``New`` for more than one Kernel merge
> +cycle, and, if accepted, applying them at the media committer's tree.
> +
> +These commit rights are granted with some expectation of responsibility:
> +committers are people who care about the Linux Kernel as a whole and
> +about the Linux media subsystem and want to help its development. It
> +is also based on a trust relationship between the rest of the committers,
> +maintainers and the Linux Media community[1].
> +
> +As such, a media committer is not just someone who is capable of creating
> +code, but someone who has demonstrated their ability to collaborate
> +with the team, get the most knowledgeable people to review code,
> +contribute high-quality code, and follow through to fix issues (in code
> +or tests).
> +
> +.. Note::
> +
> +   1. If a patch introduces a regression, then it is the media committer's
> +      responsibility to correct that as soon as possible. Typically the
> +      patch is either reverted, or an additional patch is committed that
> +      fixes the regression;
> +   2. if patches are fixing bugs against already released Kernels, including
> +      the reverts above mentioned, the media committer shall add the needed
> +      tags. Please see :ref:`Media development workflow` for more details.
> +
> +[1] The Linux Media community, also called LinuxTV community, has its primary
> +    site at https://linuxtv.org.
> +
> +Becoming a media committer
> +--------------------------
> +
> +The most important aspect of volunteering to be a committer is that you have
> +demonstrated the ability to give good code reviews. So we are looking for
> +whether or not we think you will be good at doing that.
> +
> +As such, potential committers must earn enough credibility and trust from the
> +LinuxTV community. To do that, developers shall be familiar with the open

LinuxTV -> Linux Media

Please do a search-and-replace.

> +source model and have been active in the Linux Kernel community for some time,
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
> +Developers that intend to become committers are encouraged to participate
> +at the yearly Linux Media Summit, typically co-located with another Linux
> +conference.
> +
> +If you are doing such tasks and have become a valued developer, an
> +existing committer can nominate you to the media subsystem maintainers.
> +
> +The ultimate responsibility for accepting a nominated committer is up to
> +the subsystem's maintainers. The committers must earn a trust relationship
> +with all subsystem maintainers, as, by granting you commit rights, they will
> +be delegating part of their maintenance tasks.
> +
> +Due to that, to become a committer or a core committer, a consensus between
> +all subsystem maintainers is required, as they all need to trust a developer
> +well enough to be delegated the responsibility to maintain part of the code
> +and to properly review patches from third parties, in a timely manner and
> +keeping the status of the reviewed code at https://patchwork.linuxtv.org
> +updated.
> +
> +.. Note::
> +
> +   In order to preserve/protect the developers that could have their commit
> +   rights granted, denied or removed as well as the subsystem maintainers who
> +   have the task to accept or deny commit rights, all communication related to
> +   nominating a committer, preserving commit rights or leaving such function

I'd simplify this and just say: all communication related to changing commit rights
should happen in private as much as possible.

> +   should happen in private as much as possible.
> +
> +.. _media-committer-agreement:
> +
> +Media committer's agreement
> +---------------------------
> +
> +Once a nominated committer is accepted by all subsystem maintainers,
> +they will ask if the developer is interested in the nomination and discuss
> +what area(s) of the media subsystem the committer will be responsible for.
> +
> +Once the developer accepts being a committer, the new committer shall
> +explicitly accept the Kernel development policies described under its
> +Documentation/, and, in particular to the rules on this document, by writing
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
> +   I'll be using my user https://gitlab.freedesktop.org/users/<username>.
> +
> +Followed by a formal declaration of agreement with the Kernel development
> +rules::
> +
> +   I hereby declare that I agree with the Kernel development rules described at:
> +
> +   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
> +
> +   and to the Linux Kernel development process rules.
> +
> +   I agree to the Code of Conduct as documented in:
> +   https://www.kernel.org/doc/html/latest/process/code-of-conduct.rst
> +
> +   I am aware that I can, at any point of time, retire. In that case, I will
> +   send an e-mail to notify the subsystem maintainers for them to revoke my
> +   commit rights.
> +
> +   I am aware that the Kernel development rules change over time.
> +   By doing a new push to media-commiter tree, I understand that I agree

commiter -> committer (do a search if there are more occurrences of the same typo)

> +   with the rules in effect at the time of the commit.
> +
> +Such e-mail shall be signed with a PGP key cross signed by other Kernel and

Such -> That

> +media developers. As described at :ref:`media-developers-gpg`, the PGP
> +signature, together with the gitlab user security are fundamental components
> +that ensure the authentity of the merge requests that will happen at the

authentity -> authenticity

> +media-committer.git tree.
> +
> +In case the kernel development process changes, by merging new commits
> +in the

in -> to

> +`media-committer tree <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
> +the media committer implicitly declares their agreement with the latest
> +version of the documented process including the contents of this file.
> +
> +.. note::
> +
> +   1. Changes to the kernel media development process should be announced in
> +      the media-committers mailinglist with a reasonable review period. All
> +      committers are automatically subscribed to that mailinglist;
> +   2. Due to the distributed nature of the Kernel development, it is
> +      possible that kernel development process changes may end being
> +      reviewed/merged at the linux-docs mailing list, specially for the
> +      contents under Documentation/process and for trivial typo fixes.
> +
> +Core committers
> +---------------
> +
> +As described in Documentation/driver-api/media/maintainer-entry-profile.rst
> +a committer may be granted with additional rights to also be able to
> +change a core file and/or media subsystem's Kernel API. The extent of
> +the core committer's grants will be detailed by the subsystem maintainers
> +when they nominate a core committer.
> +
> +Existing committers may become core committers and vice versa. Such
> +decisions will be taken in consensus between the subsystem maintainers.
> +
> +Media committers rules
> +----------------------
> +
> +Media committers shall do their best efforts to avoid merged patches that
> +would break any existing drivers. If it breaks, fixup or revert patches
> +shall be merged as soon as possible, aiming to be merged at the same Kernel
> +cycle the bug is reported.
> +
> +Media committers shall behave accordingly to the rights granted by
> +the subsystem maintainers, specially with regards of the scope of changes
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
> +  from anyone. Clear them up first. Defer to subsystem maintainers as needed.
> +
> +Patches that do not fall under the committer's workflow criteria will follow
> +the pull request workflow as described at :ref:`Media development workflow`.
> +
> +Only a subsystem maintainer can override such rules.
> +
> +All media committers shall ensure that patchwork will reflect the current
> +status, e.g. patches shall be delegated to the media committer who is
> +handling them and the patch status shall be updated according to these rules:
> +
> +- ``Under review``: Used if the patch requires a second opinion
> +  or when it is part of a pull request;
> +- ``Accepted``: Once a patch is merged in the multi-committer tree.
> +- ``Superseded``: There is a newer version of the patch posted to the
> +  mailing list.
> +- ``Duplicated``: There was another patch doing the same thing from someone
> +  else that was accepted.
> +- ``Not Applicable``: Use for patch series that are not merged at media.git
> +  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
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

I wonder if this short paragraph doesn't belong to the "Media committer's agreement"
section above. It's a weird thing to talk about here, you would expect it in
the section talking about commit rights.

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
> +with a good reason, then after discussing this among the media committers,
> +the final decision is taken by the subsystem maintainers. As the decision
> +to become a media committer comes from a consensus between subsystem
> +maintainers, a single subsystem maintainer not trusting the media committer
> +anymore is enough to revoke committer's grants.

committer's grants -> the commit rights

> +
> +If a committer is inactive for more than a couple of Kernel cycles,
> +maintainers will try to reach you via e-mail. If not possible, they may
> +revoke your committer grants and update MAINTAINERS file entries

committer grants -> commit rights

> +accordingly. If you wish to resume contributing later on, then contact
> +the subsystem maintainers to ask if your rights can be restored.

rights -> commit rights

> +
> +A previous committer that had their commit rights revoked can keep
> +contributing to the subsystem via the pull request workflow as documented
> +at the :ref:`Media development workflow`.
> +
> +References
> +----------
> +
> +Much of this was inspired by/copied from the committer policies of:
> +
> +- `Chromium <https://chromium.googlesource.com/chromium/src/+/main/docs/contributing.md>`_;
> +- `WebKit <https://webkit.org/commit-and-review-policy/>`_;
> +- `Mozilla <https://www.mozilla.org/hacking/committer/>`_.
> +
> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
> index f5277993b195..795ef8d89271 100644
> --- a/Documentation/process/maintainer-pgp-guide.rst
> +++ b/Documentation/process/maintainer-pgp-guide.rst
> @@ -903,6 +903,8 @@ the new default in GnuPG v2). To set it, add (or modify) the
>  
>      trust-model tofu+pgp
>  
> +.. _kernel_org_trust_repository:
> +
>  Using the kernel.org web of trust repository
>  --------------------------------------------
>  

Regards,

	Hans

