Return-Path: <linux-media+bounces-22706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A049E559D
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 13:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E738283A78
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 12:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AC6218840;
	Thu,  5 Dec 2024 12:36:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866F1D9A7E;
	Thu,  5 Dec 2024 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402189; cv=none; b=EVFgx6eP0uoBk3VJLC4d3e2Pr/jn2LpdaWBiJpNX3d6TTtas5O07gd1NwdLD+I7J+RVIwgZgC63alr8P0Ckqvl87QpK47QL62aVM7uXb5HmQmpKSEXX5HeD4SUfPPEvHAGQ8GnDM6U/jnKy1FrvEKY+/2qT6Fkybi76pdHzgsUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402189; c=relaxed/simple;
	bh=F/OtFHdyheF0i5gwpLyBBfKD47fnmgF/xKRSAOghjyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luQcGfHm2ele77si6z6POLbG0o0SWdmFakDXuj9rutEB9RS0yQfgK0YonhLD+tK27vmyCWrekFv/6j2FAYI5TIJnw/lv4lAepuKV3q3j9msbrKa+3Q0fK662kwggxxZ2KfC7S2mzUhrFLBabfT51zhUPRQYyhYqrlC0Ri+knBq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C87C4CED1;
	Thu,  5 Dec 2024 12:36:26 +0000 (UTC)
Message-ID: <e7bd710b-a2d8-4d77-8da1-c007af65baef@xs4all.nl>
Date: Thu, 5 Dec 2024 13:36:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] docs: media: document media multi-committers rules
 and process
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
 <01acc93fd8780265ea55772ba793f3f09a43ffa7.1733218348.git.mchehab+huawei@kernel.org>
 <20241203122910.GT10736@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241203122910.GT10736@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2024 13:29, Laurent Pinchart wrote:
> Hi Mauro,
> 
> Thank you for the patch.
> 
> On Tue, Dec 03, 2024 at 10:35:48AM +0100, Mauro Carvalho Chehab wrote:
>> As the media subsystem will experiment with a multi-committers model,
>> update the Maintainer's entry profile to the new rules, and add a file
>> documenting the process to become a committer and to maintain such
>> rights.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  Documentation/driver-api/media/index.rst      |   1 +
>>  .../media/maintainer-entry-profile.rst        |   8 +
>>  .../driver-api/media/media-committer.rst      | 280 ++++++++++++++++++
>>  3 files changed, 289 insertions(+)
>>  create mode 100644 Documentation/driver-api/media/media-committer.rst
>>
>> diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
>> index d5593182a3f9..d0c725fcbc67 100644
>> --- a/Documentation/driver-api/media/index.rst
>> +++ b/Documentation/driver-api/media/index.rst
>> @@ -26,6 +26,7 @@ Documentation/userspace-api/media/index.rst
>>      :numbered:
>>  
>>      maintainer-entry-profile
>> +    media-committer
>>  
>>      v4l2-core
>>      dtv-core
>> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
>> index 101f6df6374f..fa28059f7b3f 100644
>> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
>> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
>> @@ -69,6 +69,9 @@ as described at Documentation/process/index.rst and to the Kernel
>>  development rules inside the Kernel documentation, including its code of
>>  conduct.
>>  
>> +More details about media commiters' roles and responsibilities can be
>> +found here: Documentation/driver-api/media/media-committer.rst.
>> +
>>  .. [2] Everything that would break backward compatibility with existing
>>         non-kernel code are API/ABI changes. This includes ioctl and sysfs
>>         interfaces, v4l2 controls, and their behaviors.
>> @@ -221,6 +224,11 @@ See: :ref:`kernel_org_trust_repository`.
>>  
>>  With the pull request workflow, pull requests shall use PGP-signed tags.
>>  
>> +With the committers' workflow, this is ensured at the time merge request
>> +rights will be granted to the gitlab instance used by the media-committers.git
>> +tree, after receiving the e-mail documented in
>> +:ref:`media-committer-agreement`.
>> +
>>  For more details about PGP sign, please read
>>  Documentation/process/maintainer-pgp-guide.rst.
>>  
>> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
>> new file mode 100644
>> index 000000000000..3d0987a8a93b
>> --- /dev/null
>> +++ b/Documentation/driver-api/media/media-committer.rst
>> @@ -0,0 +1,280 @@
>> +Media committers
>> +================
>> +
>> +Who is a media committer?
>> +-------------------------
>> +
>> +A media committer is a developer who has been granted commit access to push
>> +patches from other developers and their own patches to the
>> +`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_
>> +tree.
> 
> This is a much better definition than in v1, I do like this.
> 
>> +
>> +It is a media committer's duty to ensure that their entries in the MAINTAINERS
>> +file are kept up-to-date, and that submitted patches for files for which
>> +they are listed as maintainers are timely reviewed on the mailing list,
>> +ideally not waiting in patchwork as ``New`` for more than one Kernel merge
>> +cycle, and, if accepted, applying them at the media committer's tree.
> 
> This is not a committer's duty. This is related to maintainers, not
> committers, and doesn't belong to this document.

True. This really belongs to the previous patch, that's where we talk about
the maintainer's duties and expectations.

> 
>> +
>> +These commit rights are granted with expectation of responsibility:
>> +committers are people who care about the Linux Kernel as a whole and
>> +about the Linux media subsystem and want to advance its development. It
> 
> Responsibility, yes, but not as described. The committer's
> responsibility is to adhere to the process we define, to minimize the
> risk of breakages. It's a committer's responsibility to not push patches
> that have not received consensus, and to not bypass CI. It isn't a
> committer's responsibility to "advance the Linux media subsystem
> development" (especially given that there are often very opposite views
> in the community about what this means in practice).

I think we can just drop the "and want to advance its development" part.
It's too vague in any case.

> 
>> +is also based on a trust relationship among other committers, maintainers
>> +and the Linux Media community[1].
>> +
>> +As such, a media committer is not just someone who is capable of creating
>> +code, but someone who has demonstrated their ability to collaborate
>> +with the team, get the most knowledgeable people to review code,
>> +contribute high-quality code, and follow through to fix issues (in code
>> +or tests).
>> +
>> +.. Note::
>> +
>> +   1. If a patch introduces a regression, then it is the media committer's
>> +      responsibility to correct that as soon as possible. Typically the
>> +      patch is either reverted, or an additional patch is committed to
>> +      fix the regression;
>> +   2. if patches are fixing bugs against already released Kernels, including
>> +      the reverts above mentioned, the media committer shall add the needed
> 
> s/above mentioned/mentioned above/
> 
>> +      tags. Please see :ref:`Media development workflow` for more details.
>> +
>> +[1] The Linux Media Community, also called LinuxTV Community, has its primary
>> +    site at https://linuxtv.org.
>> +
>> +    Media committers and developers are reachable via the #linux-media
>> +    IRC channel at OFTC.
> 
> s/at/on/
> 
>> +
>> +Becoming a media committer
>> +--------------------------
>> +
>> +The most important aspect of volunteering to be a committer is that you have
>> +demonstrated the ability to give good code reviews. So we are looking for
> 
> Again, that's not what a committer is about. Committer, as the name
> strongly implies, is about committing patches.

I disagree with that. Reviewing patches is very much part of a committer's life.
You cannot just commit patches from someone else without looking at them.
If you can't do a good code review, then you shouldn't be given commit rights.
It just wouldn't work.

> 
>> +whether or not we think you will be good at doing that.
>> +
>> +As such, potential committers must earn enough credibility and trust from the
>> +Linux Media Community. To do that, developers shall be familiar with the open
>> +source model and have been active in the Linux Kernel community for some time,
>> +and, in particular, in the media subsystem.
>> +
>> +So, in addition to actually making the code changes, you are basically
>> +demonstrating your:
>> +
>> +- commitment to the project;
> 
> What does that mean ?

I think this comes down to being able and willing to put in the time.
How about this:

- commitment to the project, i.e. being able and willing to put in the
time required;

> 
>> +- ability to collaborate with the team and communicate well;
>> +- understand of how upstream and the Linux Media Community work
>> +  (policies, processes for testing, code review, ...)
>> +- reasonable knowledge about:
>> +
>> +  - the Kernel development process:
>> +    Documentation/process/index.rst
>> +
>> +  - the Media development profile:
>> +    Documentation/driver-api/media/maintainer-entry-profile.rst
>> +
>> +- understanding of the projects' code base and coding style;
>> +- ability to provide feedback to the patch authors;
>> +- ability to judge when a patch might be ready for review and to submit;
>> +- ability to write good code (last but certainly not least).
>> +
>> +Developers that desire to become committers are encouraged to participate
> 
> s/that/who/
> 
>> +at the yearly Linux Media Summit, typically co-located with a Linux related
>> +conference.
>> +
>> +If you are doing such tasks and have become a valued developer, an
>> +existing committer can nominate you to the media subsystem maintainers.
> 
> All of this sounds so horrible from a community building point of view.
> As a newcomer, reading this document, I would be really tempted to run
> away from a community that seems very unwelcoming (not to use stronger
> words).

I know, but right now we are just trying to get something in so we can kick off
the multi-committer process.

> 
>> +
>> +The ultimate responsibility for accepting a nominated committer is up to
>> +the subsystem's maintainers. The committers must earn a trust relationship
>> +with all subsystem maintainers, as, by granting you commit rights, they will
>> +be a part of their maintenance tasks.
> 
> I don't understand the last part of the sentence.

Now that you mention it, it is not very clear.

> 
>> +
>> +Due to that, to become a committer or a core committer, a consensus between
>> +all subsystem maintainers is required, as they all need to trust a developer
>> +well enough to be delegated the responsibility to maintain part of the code
>> +and to properly review patches from third parties, in a timely manner and
>> +keeping the status of the reviewed code at https://patchwork.linuxtv.org
>> +updated.
>> +
>> +.. Note::
>> +
>> +   In order to preserve/protect the developers that could have their commit
> 
> s/protect/protect the privacy of/
> s/that/who/
> 
>> +   rights granted, denied or removed as well as the subsystem maintainers who
>> +   have the task to accept or deny commit rights, all communication related to
>> +   changing commit rights should happen in private as much as possible.
> 
> Unless you plan a system that puts gag orders in place, people who get
> their commit rights denied or removed against their will will be vocal
> about it.  The privacy of maintainers is a pipe dream here. A more
> transparent process would likely benefit everybody.

That's why it says 'as much as possible'. I don't think you should discuss
such things in the open by default. There is no 'best way' here: it depends
very much on the details of what is discussed and who is involved. And that
includes cultural and personality differences.

And please note that maintainers might also want to have their privacy protected.
It is painful to have to say 'no' to someone, and we're human too.

> 
>> +
>> +.. _media-committer-agreement:
>> +
>> +Media committer's agreement
>> +---------------------------
>> +
>> +Once a nominated committer is accepted by all subsystem maintainers,
>> +they will ask if the developer is interested in the nomination and discuss
>> +what area(s) of the media subsystem the committer will be responsible for.
> 
> Being "responsible for an area" of the subsystem is maintainership
> duties, it's not about committers.

No, it's about which area of the media subsystem the committer will handle
patches/PRs. E.g. Sebastian is responsible for codecs, you for media controller
and ISPs, Sakari for sensors, etc. A committer might be maintainer as well for
some/all parts, but that's separate (stored in the MAINTAINERS file).

> 
>> +
>> +Once the developer accepts being a committer, the new committer shall
>> +explicitly accept the Kernel development policies described under its
>> +Documentation/, and, in particular to the rules on this document, by writing
>> +an e-mail to media-committers@linuxtv.org, with a declaration of intent
>> +following the model below::
>> +
>> +   I, John Doe, would like to change my status to: Committer
>> +
>> +   I intend to actively develop the XYZ driver, send fixes to drivers
>> +   that I can test, optionally reviewing patches and merging trivial
>> +   fixes in other areas of the subsystem, ...
>> +
>> +   For the purpose of committing patches to the media-committer's tree,
>> +   I'll be using my user https://gitlab.freedesktop.org/users/<username>.
>> +
>> +Followed by a formal declaration of agreement with the Kernel development
>> +rules::
>> +
>> +   I hereby declare that I agree with the Kernel development rules described at:
> 
> Dropping "hereby " ...

I would just drop the "I hereby declare that " part. It is probably a copy-and-paste
from somewhere, but it is overly formal.

> 
>> +
>> +   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
>> +
>> +   and to the Linux Kernel development process rules.
>> +
>> +   I agree to the Code of Conduct as documented in:
>> +   https://www.kernel.org/doc/html/latest/process/code-of-conduct.rst
>> +
>> +   I am aware that I can, at any point of time, retire. In that case, I will
>> +   send an e-mail to notify the subsystem maintainers for them to revoke my
>> +   commit rights.
>> +
>> +   I am aware that the Kernel development rules change over time.
>> +   By doing a new push to media-committer tree, I understand that I agree
>> +   with the rules in effect at the time of the commit.
>> +
>> +That e-mail shall be signed with a PGP key cross signed by other Kernel and
>> +media developers. As described at :ref:`media-developers-gpg`, the PGP
>> +signature, together with the gitlab user security are fundamental components
>> +that ensure the authenticity of the merge requests that will happen at the
>> +media-committer.git tree.
>> +
>> +In case the kernel development process changes, by merging new commits
>> +to the
>> +`media-committer tree <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
>> +the media committer implicitly declares their agreement with the latest
>> +version of the documented process including the contents of this file.
>> +
>> +If a media committer decides to retire, it is the committer's duty to
>> +notify the subsystem maintainers about that decision.
>> +
>> +.. note::
>> +
>> +   1. Changes to the kernel media development process shall be announced in
>> +      the media-committers mailinglist with a reasonable review period. All
>> +      committers are automatically subscribed to that mailinglist;
> 
> Make this more than a note, it's fundamental to agreeing implicitly to
> process changes as listed above.
> 
>> +   2. Due to the distributed nature of the Kernel development, it is
>> +      possible that kernel development process changes may end being
>> +      reviewed/merged at the linux-docs mailing list, specially for the
> 
> s/specially/especially/
> 
>> +      contents under Documentation/process and for trivial typo fixes.

I agree, these can just be paragraphs rather than notes.

>> +
>> +Core committers
>> +---------------
>> +
>> +As described in Documentation/driver-api/media/maintainer-entry-profile.rst
>> +a committer may be granted with additional rights to also be able to
>> +change a core file and/or media subsystem's Kernel API. The extent of
>> +the core committer's grants will be detailed by the subsystem maintainers
>> +when they nominate a core committer.
>> +
>> +Existing committers may become core committers and vice versa. Such
>> +decisions will be taken in consensus between the subsystem maintainers.
>> +
>> +Media committers rules
>> +----------------------
>> +
>> +Media committers shall do their best efforts to avoid merged patches that
> 
> s/merged/merging/
> 
>> +would break any existing drivers. If it breaks, fixup or revert patches
>> +shall be merged as soon as possible, aiming to be merged at the same Kernel
>> +cycle the bug is reported.
>> +
>> +Media committers shall behave accordingly to the rights granted by
>> +the subsystem maintainers, specially with regards of the scope of changes
>> +they may apply directly at the media-committers tree. Such scope can
>> +change over time on a mutual agreement between media committers and
>> +maintainers.
>> +
>> +As described at :ref:`Media development workflow`, there are workflows.
>> +For the committers' workflow, the following rules apply:
>> +
>> +- Each merged patch shall pass CI tests;
>> +
>> +- Media committers shall request reviews from other committers and
>> +  developers where applicable, i.e. because those developers have more
>> +  knowledge about some areas that are changed by a patch;
>> +
>> +- There shall be no open issues or unresolved or conflicting feedback
>> +  from anyone. Clear them up first. Defer to subsystem maintainers as needed.
>> +
>> +Patches that do not fall under the committer's workflow criteria will follow
>> +the pull request workflow as described at :ref:`Media development workflow`.
>> +
>> +Only a subsystem maintainer can override such rules.
>> +
>> +All media committers shall ensure that patchwork will reflect the current
>> +status, e.g. patches shall be delegated to the media committer who is
>> +handling them and the patch status shall be updated according to these rules:
>> +
>> +- ``Under review``: Used if the patch requires a second opinion
>> +  or when it is part of a pull request;
>> +- ``Accepted``: Once a patch is merged in the multi-committer tree.

multi-committer -> media-committers

> 
> Not something to address here, but I've always found it confusing that
> patches that are accepted but not merged in your tree yet are supposed
> to be marked as "Under review". "Accepted" would be a more natural state
> of them, and we could introduce a "Merged" state for patches that are
> merged.

Sorry, I don't follow this. Probably because I am not sure what tree you
refer to with 'in your tree'.

> 
>> +- ``Superseded``: There is a newer version of the patch posted to the
>> +  mailing list.
>> +- ``Duplicated``: There was another patch doing the same thing from someone
>> +  else that was accepted.
>> +- ``Not Applicable``: Use for patch series that are not merged at media.git
>> +  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
>> +  linux-media mailing list.
> 
> - ``Not Applicable``: Used for patch series that are not meant to be
>   merged through the media.git tree. This is mostly used for patches
>   that are cross-posted to the linux-media mailing list and meant to be
>   merged through another tree (e.g. DRM, dmabuf, device tree sources,
>   ...).

OK

> 
>> +
>> +If the committer decides not to merge it, then reply by email to patch
>> +authors, explaining why it is not merged, and patchwork shall be updated
>> +accordingly with either:
>> +
>> +- ``Changes Requested``: if a new revision was requested;
>> +- ``Rejected``: if the proposed change won't be merged upstream.
>> +
>> +.. Note::
>> +
>> +   Patchwork supports a couple of clients to help semi-automating
>> +   status updates via its REST interface:
>> +
>> +   https://patchwork.readthedocs.io/en/latest/usage/clients/
>> +
>> +Maintaining media committer status
>> +----------------------------------
>> +
>> +A community of committers working together to move the Linux Kernel
>> +forward is essential to creating successful projects that are rewarding
>> +to work on. If there are problems or disagreements within the community,
>> +they can usually be solved through healthy discussion and debate.
>> +
>> +In the unhappy event that a media committer continues to disregard good
>> +citizenship (or actively disrupts the project), we may need to revoke
>> +that person's status. In such cases, if someone suggests the revocation
>> +with a good reason, then after discussing this among the media committers,
>> +the final decision is taken by the subsystem maintainers. As the decision
>> +to become a media committer comes from a consensus between subsystem
>> +maintainers, a single subsystem maintainer not trusting the media committer
>> +anymore is enough to revoke the commit rights.
>> +
>> +If a committer is inactive for more than a couple of Kernel cycles,
>> +maintainers will try to reach you via e-mail. If not possible, they may
>> +revoke your committer rights and update MAINTAINERS file entries
>> +accordingly. If you wish to resume contributing later on, then contact
>> +the subsystem maintainers to ask if your commit rights can be restored.
>> +
>> +A previous committer that had their commit rights revoked can keep
> 
> s/that/who/
> 
>> +contributing to the subsystem via the pull request workflow as documented
>> +at the :ref:`Media development workflow`.
>> +
>> +References
>> +----------
>> +
>> +Much of this was inspired by/copied from the committer policies of:
>> +
>> +- `Chromium <https://chromium.googlesource.com/chromium/src/+/main/docs/contributing.md>`_;
>> +- `WebKit <https://webkit.org/commit-and-review-policy/>`_;
>> +- `Mozilla <https://www.mozilla.org/hacking/committer/>`_.
>> +
> 

Regards,

	Hans

