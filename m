Return-Path: <linux-media+bounces-51418-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPwaMM16c2kfwAAAu9opvQ
	(envelope-from <linux-media+bounces-51418-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 14:42:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C4766BA
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 14:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBCF13019131
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAA0322B68;
	Fri, 23 Jan 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyP92Ygv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56353242AD
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175754; cv=none; b=Rdoq6Pmb1z/VBYtQHQiHBzpAR0Vbx3TPx/bvbV9T6Nz3gUuMRQxrNIADQ0My0FO0bGSF07Ycl/moepcWtMSS5yLH8iXd0AfKTTSGglrhT0oId880y7rfCilmytHgZYBALKWF5RvIFAkxgsvcrUHNKHg/NqEc2JyFnulrT6kRHFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175754; c=relaxed/simple;
	bh=S5VznD06K6MYlUqx/HrHXb0bN2BNpmiHvEg6Xhm8yq8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pEmq72ykftYwWshXJ5y1GC+lXn4eNg/PBll3RFMNCQKzjfk0KUlw9U04vuF52VDOgz7ihWvjyxv2uaefFijcWx42oBKXoVy4cEt2kiODiFs3365JeeIQ7Vj5skH9KE5v1lklW444A4v8QmHcWppQfQ0acEohj4Um+njkkoHOGBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyP92Ygv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B0EC4CEF1;
	Fri, 23 Jan 2026 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769175754;
	bh=S5VznD06K6MYlUqx/HrHXb0bN2BNpmiHvEg6Xhm8yq8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=jyP92YgvACvxAmn16OLr08Psix6OIfYXAetcQ/oX5nVzWTG0N6tXd6pnx3MrIqSgT
	 7e7UpcdK/zf8/+OdPwgvBKv1UWQR0s69h35Y1v16nf8D4IiAYGT8FAZRBgcRVcHRfP
	 SSADOjTxDGFHPaWpgt1nreJ9wXVwf3+j6TWoCxhYBxK5C3thl/KcFLUFT2Qirvc8qe
	 58/H3rTV7DFttrEVGWr145oEsAwKskhBuO6RXhlyzBcxLuJP87DbI+gOPMDy1yGJM3
	 wLoFtMromRRBXMcf4DU/jNVyIHacidP9WbHiW8/8QSfNP2diIJfnlEFhStX2NJ9AtT
	 oneAle9sBogwg==
Message-ID: <f5e7f0fc-c259-4552-8513-a3862bee5c29@kernel.org>
Date: Fri, 23 Jan 2026 14:42:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv6 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <cover.1761571713.git.hverkuil+cisco@kernel.org>
 <1495ec4ccdcdfab788fa9d02e11a6028a455e31b.1761571713.git.hverkuil+cisco@kernel.org>
 <CANiDSCsJwYht4_v8B_1n2u+MxuHSo+nD5xsZ85VLujgAEEMqOw@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCsJwYht4_v8B_1n2u+MxuHSo+nD5xsZ85VLujgAEEMqOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51418-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 060C4766BA
X-Rspamd-Action: no action

On 03/12/2025 13:27, Ricardo Ribalda wrote:
> Hi Hans
> 
> Thanks for the new version
> 
> On Mon, 27 Oct 2025 at 14:51, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>
>> As the media subsystem will experiment with a multi-committers model,
>> update the Maintainer's entry profile to the new rules.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  .../media/maintainer-entry-profile.rst        | 368 +++++++++++++++---
>>  1 file changed, 308 insertions(+), 60 deletions(-)
>>
>> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
>> index 2127e5b15e8f..af499e79b23e 100644
>> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
>> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
>> @@ -4,19 +4,25 @@ Media Subsystem Profile
>>  Overview
>>  --------
>>
>> -The media subsystem covers support for a variety of devices: stream
>> -capture, analog and digital TV streams, cameras, remote controllers, HDMI CEC
>> -and media pipeline control.
>> +The Linux Media Community (aka: the LinuxTV Community) is formed of
>> +developers working on Linux Kernel Media Subsystem, together with users
>> +who also play an important role in testing the code.
>>
>> -It covers, mainly, the contents of those directories:
>> +The Media Subsystem has code to support a wide variety of media-related
>> +devices: stream capture, analog and digital TV streams, cameras,
>> +video codecs, video processing (resizers, etc.), radio, remote controllers,
>> +HDMI CEC and media pipeline control.
>> +
>> +The Media Subsystem consists of the following directories in the kernel
>> +tree:
>>
>>    - drivers/media
>>    - drivers/staging/media
>> +  - include/media
>> +  - Documentation/devicetree/bindings/media/\ [1]_
>>    - Documentation/admin-guide/media
>>    - Documentation/driver-api/media
>>    - Documentation/userspace-api/media
>> -  - Documentation/devicetree/bindings/media/\ [1]_
>> -  - include/media
>>
>>  .. [1] Device tree bindings are maintained by the
>>         OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS maintainers
>> @@ -27,19 +33,264 @@ It covers, mainly, the contents of those directories:
>>  Both media userspace and Kernel APIs are documented and the documentation
>>  must be kept in sync with the API changes. It means that all patches that
>>  add new features to the subsystem must also bring changes to the
>> -corresponding API files.
>> +corresponding API documentation.
>>
>> -Due to the size and wide scope of the media subsystem, media's
>> -maintainership model is to have sub-maintainers that have a broad
>> -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
>> -task to review the patches, providing feedback to users if the patches are
>> -following the subsystem rules and are properly using the media kernel and
>> -userspace APIs.
>> +A small subsystem will typically consist of driver maintainers (as listed
>> +in the MAINTAINERS file) and one or two subsystem maintainers who merge
>> +the patches when ready, maintain the subsystem core code and make the pull
>> +requests to Linus. Due to the size and wide scope of the Media Subsystem
>> +this does not scale and more maintainance layers are needed.
>>
>> -Patches for the media subsystem must be sent to the media mailing list
>> -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
>> -HTML will be automatically rejected by the mail server. It could be wise
>> -to also copy the sub-maintainer(s).
>> +Media Maintainers
>> +-----------------
>> +
>> +The media subsystem has three layers of media maintainers:
>> +
>> +- Media Maintainer:
>> +    Responsible for a group of drivers within the Media Subsystem. Typically
>> +    these are all drivers that have something in common, e.g. codec drivers
>> +    or drivers from the same vendor. Media Maintainers provide feedback if the
>> +    patches are not following the subsystem rules, or are not using the
>> +    media kernel or userspace APIs correctly, or have poor code quality. They
>> +    also keep patchwork up to date, decide when patches are ready for merging,
>> +    and create Pull Requests for the Media Subsystem Maintainers to merge.
>> +
>> +    A Media Maintainer is not just someone who is capable of creating code, but
>> +    someone who has demonstrated their ability to collaborate with the team, get
>> +    the most knowledgeable people to review code, contribute high-quality code,
>> +    and follow through to fix issues (in code or tests).
>> +
>> +- Media Core Maintainer:
>> +    Media Maintainers who are also responsible for one or more media core
>> +    frameworks.
>> +
>> +    Core framework changes are done via consensus between the relevant Media
>> +    Core Maintainers. Media Maintainers may include core framework changes in
>> +    their Pull Requests if they are signed off by the relevant Media Core
>> +    Maintainers.
>> +
>> +- Media Subsystem Maintainers:
>> +    Responsible for the subsystem as a whole, with access to the
>> +    entire subsystem. Responsible for merging Pull Requests from other
>> +    Media Maintainers.
>> +
>> +    Userspace API/ABI changes are done via consensus between Media Subsystem
>> +    Maintainers\ [2]_. Media (Core) Maintainers may include API/ABI changes in
>> +    their Pull Requests if they are signed off by the all Media Subsystem
>> +    Maintainers.
>> +
>> +All Media Maintainers shall explicitly agree with the Kernel development process
>> +as described at Documentation/process/index.rst and to the Kernel
>> +development rules inside the Kernel documentation, including its code of
>> +conduct.
>> +
>> +All Media Maintainers shall ensure that patchwork will reflect the current
>> +status, e.g. patches shall be delegated to the Media Maintainer who is
>> +handling them and the patch status shall be updated according to these rules:
>> +
>> +- ``Under Review``: Used if the patch requires a second opinion
>> +  or when it is part of a pull request;
>> +- ``Accepted``: Once a patch is merged in the multi-committer tree.
>> +- ``Superseded``: There is a newer version of the patch posted to the
>> +  mailing list.
>> +- ``Duplicated``: There was another patch doing the same thing from someone
>> +  else that was accepted.
>> +- ``Not Applicable``: Use for patch series that are not merged at media.git
>> +  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
>> +  linux-media mailing list.
>> +
>> +If the Media Maintainer decides not to accept a patch, then reply by email to
>> +the patch authors, explaining why it is not accepted, and patchwork shall be
>> +updated accordingly with either:
>> +
>> +- ``Changes Requested``: if a new revision was requested;
>> +- ``Rejected``: if the proposed change is not acceptable at all.
>> +
>> +.. Note::
>> +
>> +   Patchwork supports a couple of clients to help semi-automating
>> +   status updates via its REST interface:
>> +
>> +   https://patchwork.readthedocs.io/en/latest/usage/clients/
>> +
>> +Media Maintainers are reachable via the #linux-media IRC channel at OFTC.
>> +
>> +.. [2] Everything that would break backward compatibility with existing
>> +       non-kernel code are API/ABI changes. This includes ioctl and sysfs
>> +       interfaces, v4l2 controls, and their behaviors.
>> +
>> +Becoming a Media Maintainer
>> +---------------------------
>> +
>> +The most important aspect of volunteering to be a Media Maintainer is that you
>> +have demonstrated the ability to give good code reviews. So we are looking for
>> +whether or not we think you will be good at doing that.
>> +
>> +As such, potential maintainers must earn enough credibility and trust from the
>> +Linux Media Community. To do that, developers shall be familiar with the open
>> +source model and have been active in the Linux Kernel community for some time,
>> +and, in particular, in the media subsystem.
>> +
>> +In addition to actually making the code changes, you are basically
>> +demonstrating your:
>> +
>> +- commitment to the project;
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
>> +Developers that desire to become maintainers are encouraged to participate
>> +at the yearly Linux Media Summit, typically co-located with a Linux related
>> +conference. These summits will be announced at the linux-media mailing list.
>> +
>> +If you are doing such tasks and have become a valued developer, an
>> +existing Media Maintainer can nominate you to the Media Subsystem Maintainers.
>> +
>> +The ultimate responsibility for accepting a nominated maintainer is up to
>> +the subsystem's maintainers. The nominated maintainer must have earned a trust
>> +relationship with all Media Subsystem Maintainers, as, by becoming Media
>> +Maintainer, you will take over part of their maintenance tasks.
>> +
>> +Media Committers
>> +----------------
>> +
>> +Experienced and trusted Media (Core) Maintainers may be granted commit rights

Based on Ricardo's question below this should probably be rewritten as:

'Media Maintainers and Media Core Maintainers'

I also think that this "Media Committers" section shouldn't be added in this
patch, but in the next patch. It is clearer in the context of that one.

>> +which allow them to directly push patches to the media development tree instead
>> +of posting a Pull Request for the Media Subsystem Maintainers. This helps
>> +offloading some of the work of the Media Subsystem Maintainers.
> 
> I believe the consensus was that anyone could be a committer, not only
> core maintainers.
> IMHO there is no point in designing all this process for just 4 people.

The maintainer-entry-profile section is about the responsibilities of a
media maintainer. Committers are maintainers with commit rights, but you
can be a maintainer without commit rights: either because you are not
experienced/trusted enough, or because you don't want them in the first
place. E.g., as CEC maintainer I have commit rights for drm. But I really
want to give those up since it is so rare that I have patches for drm
that it takes me too much time to figure out how it worked.

The reverse, being a committer without being a maintainer, makes no sense.

So this section describes the responsibilities of media maintainers, and
the next patch describes the additional responsibilities of a media
committer.

Note that, while I am not opposed to giving media driver maintainers
commit rights, I prefer to add that when we actually have someone that
falls in that category. It must be someone with a proven track record
of understanding the bigger picture. And usually such people become
media maintainers rather than staying just driver maintainers.

> 
> I also prefer the original nomenclature for the roles:
> 
> Contributor: Anyone that posts a patch to the ML
> Committer: Contributors that can commit (List provided by you)
> Core Committer:  Laurent, Sakari, Sean and Sebastian  (Names in the
> original presentation, should be updated)
> Subsystem Maintainer: Mauro and Hans
> 
> In my head, a maintainer is someone that pushes to the upper tree,
> rebases and merges. In the media-committer tree that is only you and
> Mauro.

No, a maintainer is someone who decides when patches are ready for
mainline inclusion and posts PRs. A committer is a maintainer who
can directly push patches to the git tree and can skip the PR step.

Previous versions of this series mixed those concepts, which was very confusing.

Regards,

	Hans

> 
> 
>> +
>> +Media development tree
>> +----------------------
>> +
>> +The main development tree used by the media subsystem is hosted at
>> +gitlab.freedesktop.org. LinuxTV.org hosts news about the subsystem, wiki pages
>> +and a patchwork instance where we track patches though their lifetime.
>> +
>> +The main tree used by media developers is at:
>> +
>> +https://gitlab.freedesktop.org/linux-media/media-committers.git
>> +
>> +Please note that this tree can be rebased, although only as a last resort.
>> +
>> +.. _Media development workflow:
>> +
>> +Media development workflow
>> +++++++++++++++++++++++++++
>> +
>> +All changes for the media subsystem shall be sent first as e-mails to the
>> +media mailing list, following the process documented at
>> +Documentation/process/index.rst.
>> +
>> +It means that patches shall be submitted as plain text only via e-mail to
>> +linux-media@vger.kernel.org (aka: LMML). While subscription is not mandatory,
>> +you can find details about how to subscribe to it and to see its archives at:
>> +
>> +  https://subspace.kernel.org/vger.kernel.org.html
>> +
>> +Emails with HTML will be automatically rejected by the mail server.
>> +
>> +It could be wise to also copy the Media Maintainer(s). You should use
>> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
>> +Please always copy driver's authors and maintainers.
>> +
>> +To minimize the chance of merge conflicts for your patch series, and make
>> +easier to backport patches to stable Kernels, we recommend that you use the
>> +following baseline for your patch series:
>> +
>> +1. Features for the next mainline release:
>> +
>> +   - baseline shall be the media-committers.git ``next`` branch;
>> +
>> +2. Bug fixes for the next mainline release:
>> +
>> +   - baseline shall be the media-committers.git ``next`` branch. If the
>> +     changes depend on a fix from the media-committers.git
>> +     ``fixes`` branch, then you can use that as baseline.
>> +
>> +3. Bug fixes for the current mainline release (-rcX):
>> +
>> +   - baseline shall be the latest mainline -rcX release or the
>> +     media-committers.git ``fixes`` branch if changes depend on a mainline
>> +     fix that is not yet merged;
>> +
>> +.. Note::
>> +
>> +   See https://www.kernel.org/category/releases.html for an overview
>> +   about Kernel release types.
>> +
>> +Patches with fixes shall have:
>> +
>> +- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
>> +- when applicable, a ``Cc: stable@vger.kernel.org``.
>> +
>> +Patches that were fixing bugs publicly reported by someone at the
>> +linux-media@vger.kernel.org mailing list shall have:
>> +
>> +- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
>> +
>> +Patches that change API shall update documentation accordingly at the
>> +same patch series.
>> +
>> +See Documentation/process/index.rst for more details about e-mail submission.
>> +
>> +Once a patch is submitted, it may follow either one of the following
>> +workflows:
>> +
>> +a. Media Maintainers' workflow: Media Maintainers post the PRs, which
>> +   are handled by the Media Subsystem Maintainers::
>> +
>> +     +-------+   +------------+   +------+   +-------+   +----------------------------+
>> +     |e-mail |-->|picked up by|-->|code  |-->|pull   |-->|Subsystem Maintainers merge |
>> +     |to LMML|   |patchwork   |   |review|   |request|   |in media-committers.git     |
>> +     +-------+   +------------+   +------+   +-------+   +----------------------------+
>> +
>> +   For this workflow, pull requests are generated by Media Maintainers.
>> +   If you are not a Media Maintainer, then please don't submit pull requests,
>> +   as they will not be processed.
>> +
>> +b. Media Committers' workflow: patches are handled by Media Maintainers with
>> +   commit rights::
>> +
>> +     +-------+   +------------+   +------+   +--------------------------+
>> +     |e-mail |-->|picked up by|-->|code  |-->|Media Committers merge in |
>> +     |to LMML|   |patchwork   |   |review|   |media-committers.git      |
>> +     +-------+   +------------+   +------+   +--------------------------+
>> +
>> +When patches are picked up by patchwork and when merged at media-committers,
>> +Media CI bots will check for errors and may provide e-mail feedback about
>> +patch problems. When this happens, the patch submitter must fix them or
>> +explain why the errors are false positives.
>> +
>> +Patches will only be moved to the next stage in these two workflows if they
>> +pass on Media CI or if there are false-positives in the Media CI reports.
>> +
>> +For both workflows, all patches shall be properly reviewed at
>> +linux-media@vger.kernel.org (LMML) before being merged in media-committers.git.
>> +Media patches will be reviewed in a timely manner by the maintainers and
>> +reviewers as listed in the MAINTAINERS file.
>> +
>> +Media Maintainers shall request reviews from other Media Maintainers and
>> +developers where applicable, i.e. because those developers have more
>> +knowledge about some areas that are changed by a patch.
>> +
>> +There shall be no open issues or unresolved or conflicting feedback
>> +from anyone. Clear them up first. Defer to the Media Subsystem
>> +Maintainers if needed.
>> +
>> +Failures during e-mail submission
>> ++++++++++++++++++++++++++++++++++
>>
>>  Media's workflow is heavily based on Patchwork, meaning that, once a patch
>>  is submitted, the e-mail will first be accepted by the mailing list
>> @@ -47,51 +298,49 @@ server, and, after a while, it should appear at:
>>
>>     - https://patchwork.linuxtv.org/project/linux-media/list/
>>
>> -If it doesn't automatically appear there after a few minutes, then
>> +If it doesn't automatically appear there after some time [3]_, then
>>  probably something went wrong on your submission. Please check if the
>> -email is in plain text\ [2]_ only and if your emailer is not mangling
>> +email is in plain text\ [4]_ only and if your emailer is not mangling
>>  whitespaces before complaining or submitting them again.
>>
>> -You can check if the mailing list server accepted your patch, by looking at:
>> +To troubleshoot problems, you should first check if the mailing list
>> +server has accepted your patch, by looking at:
>>
>>     - https://lore.kernel.org/linux-media/
>>
>> -.. [2] If your email contains HTML, the mailing list server will simply
>> +If the patch is there and not at patchwork, it is likely that your e-mailer
>> +mangled the patch. Patchwork internally has logic that checks if the
>> +received e-mail contains a valid patch. Any whitespace and new line
>> +breakages mangling the patch won't be recognized by patchwork, thus such
>> +patch will be rejected.
>> +
>> +.. [3] It usually takes a few minutes for the patch to arrive, but
>> +       the e-mail server may be busy, so it may take up a longer time
>> +       for a patch to be picked by patchwork.
>> +
>> +.. [4] If your email contains HTML, the mailing list server will simply
>>         drop it, without any further notice.
>>
>> +.. _media-developers-gpg:
>>
>> -Media maintainers
>> -+++++++++++++++++
>> +Authentication for pull and merge requests
>> +++++++++++++++++++++++++++++++++++++++++++
>>
>> -At the media subsystem, we have a group of senior developers that
>> -are responsible for doing the code reviews at the drivers (also known as
>> -sub-maintainers), and another senior developer responsible for the
>> -subsystem as a whole. For core changes, whenever possible, multiple
>> -media maintainers do the review.
>> +The authenticity of developers submitting pull requests and merge requests
>> +shall be validated by using PGP signing at some moment.
>> +See: :ref:`kernel_org_trust_repository`.
>>
>> -The media maintainers that work on specific areas of the subsystem are:
>> +With the pull request workflow, pull requests shall use PGP-signed tags.
>>
>> -- Remote Controllers (infrared):
>> -    Sean Young <sean@mess.org>
>> +For more details about PGP sign, please read
>> +Documentation/process/maintainer-pgp-guide.rst.
>>
>> -- HDMI CEC:
>> -    Hans Verkuil <hverkuil@kernel.org>
>> +Subsystem Media Maintainers
>> +---------------------------
>>
>> -- Media controller drivers:
>> -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> -
>> -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
>> -    Sakari Ailus <sakari.ailus@linux.intel.com>
>> -
>> -- V4L2 drivers and core V4L2 frameworks:
>> -    Hans Verkuil <hverkuil@kernel.org>
>> -
>> -The subsystem maintainer is:
>> -  Mauro Carvalho Chehab <mchehab@kernel.org>
>> -
>> -Media maintainers may delegate a patch to other media maintainers as needed.
>> -On such case, checkpatch's ``delegate`` field indicates who's currently
>> -responsible for reviewing a patch.
>> +The subsystem maintainers are:
>> +  - Mauro Carvalho Chehab <mchehab@kernel.org>
>> +  - Hans Verkuil <hverkuil@kernel.org>
>>
>>  Submit Checklist Addendum
>>  -------------------------
>> @@ -106,18 +355,15 @@ that should be used in order to check if the drivers are properly
>>  implementing the media APIs:
>>
>>  ====================   =======================================================
>> -Type                   Tool
>> +Type                   Utility
>>  ====================   =======================================================
>> -V4L2 drivers\ [3]_     ``v4l2-compliance``
>> +V4L2 drivers\ [5]_     ``v4l2-compliance``
>>  V4L2 virtual drivers   ``contrib/test/test-media``
>>  CEC drivers            ``cec-compliance``
>>  ====================   =======================================================
>>
>> -.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
>> -       V4L2 drivers.
>> -
>> -Other compliance tools are under development to check other parts of the
>> -subsystem.
>> +.. [5] The ``v4l2-compliance`` utility also covers the media controller usage
>> +       inside V4L2 drivers.
>>
>>  Those tests need to pass before the patches go upstream.
>>
>> @@ -134,6 +380,8 @@ Where the check script is::
>>  Be sure to not introduce new warnings on your patches without a
>>  very good reason.
>>
>> +Please see `Media development workflow`_ for e-mail submission rules.
>> +
>>  Style Cleanup Patches
>>  +++++++++++++++++++++
>>
>> @@ -183,23 +431,23 @@ In particular, we accept lines with more than 80 columns:
>>  Key Cycle Dates
>>  ---------------
>>
>> -New submissions can be sent at any time, but if they intend to hit the
>> +New submissions can be sent at any time, but if they are intended to hit the
>>  next merge window they should be sent before -rc5, and ideally stabilized
>>  in the linux-media branch by -rc6.
>>
>>  Review Cadence
>>  --------------
>>
>> -Provided that your patch is at https://patchwork.linuxtv.org, it should
>> +Provided that your patch has landed in https://patchwork.linuxtv.org, it should
>>  be sooner or later handled, so you don't need to re-submit a patch.
>>
>> -Except for bug fixes, we don't usually add new patches to the development
>> -tree between -rc6 and the next -rc1.
>> +Except for important bug fixes, we don't usually add new patches to the
>> +development tree between -rc6 and the next -rc1.
>>
>>  Please notice that the media subsystem is a high traffic one, so it
>>  could take a while for us to be able to review your patches. Feel free
>>  to ping if you don't get a feedback in a couple of weeks or to ask
>> -other developers to publicly add Reviewed-by and, more importantly,
>> +other developers to publicly add ``Reviewed-by:`` and, more importantly,
>>  ``Tested-by:`` tags.
>>
>>  Please note that we expect a detailed description for ``Tested-by:``,
>> --
>> 2.51.0
>>
> 
> 


