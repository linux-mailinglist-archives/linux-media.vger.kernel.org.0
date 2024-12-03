Return-Path: <linux-media+bounces-22536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5669E1D55
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 14:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25ED2B2BD20
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 12:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9F71E501B;
	Tue,  3 Dec 2024 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Oafo0XJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03B33398B;
	Tue,  3 Dec 2024 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228966; cv=none; b=MySzmsoHPXMIIBm4Kq4yvHxwqpd0uqqgH5oEENVLm333GOdJJkO+/+86goRSSgiHJ7Rmkm4+hqa6nv2TC+Tc20y+1BTa8liA86nUezd2Ovj5pAloZPsNjVE3GziSw0yKUwLAK+klmBNW2asPKe7nx/mju/YQ3l/fw7Jy9j2Jj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228966; c=relaxed/simple;
	bh=JuTct5KR1CcFYr4w+jW2pHOcBTUC4XM9PvwyQrCpgIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvE5HNTEx8QInufPgr3QPIZeOjThnRdfVD4i+0hO0hwJ2IBFXj/5WyjFdgtW4Z6a2c8hGvOKvg1jpFSoXUWLJvpsT8XxtajMJ/34uZtnDhE9U2Iu8sxEGP+zqWP1YlgOntQr/XpcRmUe3BBPcn0rqNtz/OlU8vLfiM5/7WCQMI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Oafo0XJ/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A7C3E1;
	Tue,  3 Dec 2024 13:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733228934;
	bh=JuTct5KR1CcFYr4w+jW2pHOcBTUC4XM9PvwyQrCpgIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oafo0XJ/Kto0/MqBTn+5M7LrB+p2f6r91xJBIk5CqKsyuOmU+JtbWP066aCfjU6NL
	 42wGcRSMl3JZG5hm8GS7nJmcBH7ijaNey96r9YLslDNwHj+cdOOD9K3zIMlsNG2FRO
	 zZwqzPRBNiejeRjz2nt338KmKvDQsiJiD0B5leaA=
Date: Tue, 3 Dec 2024 14:29:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v4 4/5] docs: media: document media multi-committers
 rules and process
Message-ID: <20241203122910.GT10736@pendragon.ideasonboard.com>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
 <01acc93fd8780265ea55772ba793f3f09a43ffa7.1733218348.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01acc93fd8780265ea55772ba793f3f09a43ffa7.1733218348.git.mchehab+huawei@kernel.org>

Hi Mauro,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:35:48AM +0100, Mauro Carvalho Chehab wrote:
> As the media subsystem will experiment with a multi-committers model,
> update the Maintainer's entry profile to the new rules, and add a file
> documenting the process to become a committer and to maintain such
> rights.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  Documentation/driver-api/media/index.rst      |   1 +
>  .../media/maintainer-entry-profile.rst        |   8 +
>  .../driver-api/media/media-committer.rst      | 280 ++++++++++++++++++
>  3 files changed, 289 insertions(+)
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
> index 101f6df6374f..fa28059f7b3f 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -69,6 +69,9 @@ as described at Documentation/process/index.rst and to the Kernel
>  development rules inside the Kernel documentation, including its code of
>  conduct.
>  
> +More details about media commiters' roles and responsibilities can be
> +found here: Documentation/driver-api/media/media-committer.rst.
> +
>  .. [2] Everything that would break backward compatibility with existing
>         non-kernel code are API/ABI changes. This includes ioctl and sysfs
>         interfaces, v4l2 controls, and their behaviors.
> @@ -221,6 +224,11 @@ See: :ref:`kernel_org_trust_repository`.
>  
>  With the pull request workflow, pull requests shall use PGP-signed tags.
>  
> +With the committers' workflow, this is ensured at the time merge request
> +rights will be granted to the gitlab instance used by the media-committers.git
> +tree, after receiving the e-mail documented in
> +:ref:`media-committer-agreement`.
> +
>  For more details about PGP sign, please read
>  Documentation/process/maintainer-pgp-guide.rst.
>  
> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
> new file mode 100644
> index 000000000000..3d0987a8a93b
> --- /dev/null
> +++ b/Documentation/driver-api/media/media-committer.rst
> @@ -0,0 +1,280 @@
> +Media committers
> +================
> +
> +Who is a media committer?
> +-------------------------
> +
> +A media committer is a developer who has been granted commit access to push
> +patches from other developers and their own patches to the
> +`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_
> +tree.

This is a much better definition than in v1, I do like this.

> +
> +It is a media committer's duty to ensure that their entries in the MAINTAINERS
> +file are kept up-to-date, and that submitted patches for files for which
> +they are listed as maintainers are timely reviewed on the mailing list,
> +ideally not waiting in patchwork as ``New`` for more than one Kernel merge
> +cycle, and, if accepted, applying them at the media committer's tree.

This is not a committer's duty. This is related to maintainers, not
committers, and doesn't belong to this document.

> +
> +These commit rights are granted with expectation of responsibility:
> +committers are people who care about the Linux Kernel as a whole and
> +about the Linux media subsystem and want to advance its development. It

Responsibility, yes, but not as described. The committer's
responsibility is to adhere to the process we define, to minimize the
risk of breakages. It's a committer's responsibility to not push patches
that have not received consensus, and to not bypass CI. It isn't a
committer's responsibility to "advance the Linux media subsystem
development" (especially given that there are often very opposite views
in the community about what this means in practice).

> +is also based on a trust relationship among other committers, maintainers
> +and the Linux Media community[1].
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
> +      patch is either reverted, or an additional patch is committed to
> +      fix the regression;
> +   2. if patches are fixing bugs against already released Kernels, including
> +      the reverts above mentioned, the media committer shall add the needed

s/above mentioned/mentioned above/

> +      tags. Please see :ref:`Media development workflow` for more details.
> +
> +[1] The Linux Media Community, also called LinuxTV Community, has its primary
> +    site at https://linuxtv.org.
> +
> +    Media committers and developers are reachable via the #linux-media
> +    IRC channel at OFTC.

s/at/on/

> +
> +Becoming a media committer
> +--------------------------
> +
> +The most important aspect of volunteering to be a committer is that you have
> +demonstrated the ability to give good code reviews. So we are looking for

Again, that's not what a committer is about. Committer, as the name
strongly implies, is about committing patches.

> +whether or not we think you will be good at doing that.
> +
> +As such, potential committers must earn enough credibility and trust from the
> +Linux Media Community. To do that, developers shall be familiar with the open
> +source model and have been active in the Linux Kernel community for some time,
> +and, in particular, in the media subsystem.
> +
> +So, in addition to actually making the code changes, you are basically
> +demonstrating your:
> +
> +- commitment to the project;

What does that mean ?

> +- ability to collaborate with the team and communicate well;
> +- understand of how upstream and the Linux Media Community work
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
> +Developers that desire to become committers are encouraged to participate

s/that/who/

> +at the yearly Linux Media Summit, typically co-located with a Linux related
> +conference.
> +
> +If you are doing such tasks and have become a valued developer, an
> +existing committer can nominate you to the media subsystem maintainers.

All of this sounds so horrible from a community building point of view.
As a newcomer, reading this document, I would be really tempted to run
away from a community that seems very unwelcoming (not to use stronger
words).

> +
> +The ultimate responsibility for accepting a nominated committer is up to
> +the subsystem's maintainers. The committers must earn a trust relationship
> +with all subsystem maintainers, as, by granting you commit rights, they will
> +be a part of their maintenance tasks.

I don't understand the last part of the sentence.

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

s/protect/protect the privacy of/
s/that/who/

> +   rights granted, denied or removed as well as the subsystem maintainers who
> +   have the task to accept or deny commit rights, all communication related to
> +   changing commit rights should happen in private as much as possible.

Unless you plan a system that puts gag orders in place, people who get
their commit rights denied or removed against their will will be vocal
about it.  The privacy of maintainers is a pipe dream here. A more
transparent process would likely benefit everybody.

> +
> +.. _media-committer-agreement:
> +
> +Media committer's agreement
> +---------------------------
> +
> +Once a nominated committer is accepted by all subsystem maintainers,
> +they will ask if the developer is interested in the nomination and discuss
> +what area(s) of the media subsystem the committer will be responsible for.

Being "responsible for an area" of the subsystem is maintainership
duties, it's not about committers.

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

Dropping "hereby " would make it sound a bit less like a forced
confession obtained by torture.

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
> +   By doing a new push to media-committer tree, I understand that I agree
> +   with the rules in effect at the time of the commit.
> +
> +That e-mail shall be signed with a PGP key cross signed by other Kernel and
> +media developers. As described at :ref:`media-developers-gpg`, the PGP
> +signature, together with the gitlab user security are fundamental components
> +that ensure the authenticity of the merge requests that will happen at the
> +media-committer.git tree.
> +
> +In case the kernel development process changes, by merging new commits
> +to the
> +`media-committer tree <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
> +the media committer implicitly declares their agreement with the latest
> +version of the documented process including the contents of this file.
> +
> +If a media committer decides to retire, it is the committer's duty to
> +notify the subsystem maintainers about that decision.
> +
> +.. note::
> +
> +   1. Changes to the kernel media development process shall be announced in
> +      the media-committers mailinglist with a reasonable review period. All
> +      committers are automatically subscribed to that mailinglist;

Make this more than a note, it's fundamental to agreeing implicitly to
process changes as listed above.

> +   2. Due to the distributed nature of the Kernel development, it is
> +      possible that kernel development process changes may end being
> +      reviewed/merged at the linux-docs mailing list, specially for the

s/specially/especially/

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

s/merged/merging/

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

Not something to address here, but I've always found it confusing that
patches that are accepted but not merged in your tree yet are supposed
to be marked as "Under review". "Accepted" would be a more natural state
of them, and we could introduce a "Merged" state for patches that are
merged.

> +- ``Superseded``: There is a newer version of the patch posted to the
> +  mailing list.
> +- ``Duplicated``: There was another patch doing the same thing from someone
> +  else that was accepted.
> +- ``Not Applicable``: Use for patch series that are not merged at media.git
> +  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
> +  linux-media mailing list.

- ``Not Applicable``: Used for patch series that are not meant to be
  merged through the media.git tree. This is mostly used for patches
  that are cross-posted to the linux-media mailing list and meant to be
  merged through another tree (e.g. DRM, dmabuf, device tree sources,
  ...).

> +
> +If the committer decides not to merge it, then reply by email to patch
> +authors, explaining why it is not merged, and patchwork shall be updated
> +accordingly with either:
> +
> +- ``Changes Requested``: if a new revision was requested;
> +- ``Rejected``: if the proposed change won't be merged upstream.
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
> +anymore is enough to revoke the commit rights.
> +
> +If a committer is inactive for more than a couple of Kernel cycles,
> +maintainers will try to reach you via e-mail. If not possible, they may
> +revoke your committer rights and update MAINTAINERS file entries
> +accordingly. If you wish to resume contributing later on, then contact
> +the subsystem maintainers to ask if your commit rights can be restored.
> +
> +A previous committer that had their commit rights revoked can keep

s/that/who/

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

-- 
Regards,

Laurent Pinchart

