Return-Path: <linux-media+bounces-51421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL4jOkaDc2kDxAAAu9opvQ
	(envelope-from <linux-media+bounces-51421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:18:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DC176E5F
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D02EE302C6FD
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 14:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237F82EA15C;
	Fri, 23 Jan 2026 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eth+fSjl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B71229617D
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177801; cv=none; b=HSE3gj4b+3UiCbMxjKSNm+mrRsLTVaAvOCCf0K2che1jwZmc3IF0h9Qj7H3FPTmInbiqbGHVMw1uK+JTwFdTAxDZ4p728aq3w01OHrdDrVc+ziTbJyKnIJWC5PgnH+HdVm47DIVfSVTZ2jWnQRqPWVp9QqfS2k42ZwbagtYfmVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177801; c=relaxed/simple;
	bh=Zun2243lQkrfE/XHBEyTRFo5p/5PRHEnzIaQx9V/ipQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pVy08zG1YFRurJIwoP/YWIHLjWXYzT2mKDxueMoviUf0bhsfaX11dj2GzCe1SxB25r5HaOtyBR3X1Kr0R+6kuDyWO+6hBi9OQhpOWKJ2Qw6sLKU2Db5DMxrY5Cci7AUJvM4LeBIDVD+soQ+CuYgjy1bSPQaBf8RpTsEZZSTEFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eth+fSjl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9FFC4CEF1;
	Fri, 23 Jan 2026 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769177801;
	bh=Zun2243lQkrfE/XHBEyTRFo5p/5PRHEnzIaQx9V/ipQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=eth+fSjlNPaJSoqUzuQ7T9Y1sqzbw29vfuAVJAcN5qUcUBV1PvA6FlaLp4RL2MNQ5
	 3NTcZziqLvLT0NKC/PHJkSewe7PRja4B6WZakiXYgy+cKFBnuJThPKimXgNgubQIIz
	 OlxTjjamEdSdiAqB4nkmNnowxb2nCWZhK6p9oygUVvmrvrmiWFWBzYvyGO8nnJMhzU
	 bWQNDLW3X1cYQ8vEygV280RpXLFG1gKobbh66wms9i3yGdSIhslRLAmq1E+yFVuK/O
	 ctvranYi2iS1A/KOhMjB1j4t3rPNJXv4IYzVdT9PaR3YuCBf4eLbvbD6FKS90Fy6Uu
	 opj0eKXxx8VQQ==
Message-ID: <e1e2fe4d-46db-49c7-b555-c7afac1bbfca@kernel.org>
Date: Fri, 23 Jan 2026 15:16:37 +0100
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
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1761571713.git.hverkuil+cisco@kernel.org>
 <1495ec4ccdcdfab788fa9d02e11a6028a455e31b.1761571713.git.hverkuil+cisco@kernel.org>
 <20251203104328.23d3139c@foz.lan>
Content-Language: en-US, nl
In-Reply-To: <20251203104328.23d3139c@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51421-lists,linux-media=lfdr.de,cisco];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 24DC176E5F
X-Rspamd-Action: no action

On 03/12/2025 10:43, Mauro Carvalho Chehab wrote:
> Em Mon, 27 Oct 2025 14:28:31 +0100
> Hans Verkuil <hverkuil+cisco@kernel.org> escreveu:
> 
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
> 
> I didn't like this paragraph. media maintainer's profile is not the right
> place to tell how a small subsystem would be maintained or not. Dropping
> that out-of-scope part, we have only:
> 
> 	Due to the size and wide scope of the Media Subsystem
> 	this does not scale and more maintainance layers are needed.
> 
> Which doesn't say much. Also, it defeats the goal of this paragraph: to
> describe the maintainership model we're adopting, and what a media 
> contributor should know about it. On version 5, we had:
> 
> 	Due to the size and wide scope of the media subsystem, the media's
> 	maintainance model recognizes committers that have a broad knowledge of
> 	a specific aspect of the subsystem. It is the committers' task to
> 	review the patches, providing feedback to users if the patches are
> 	following the subsystem rules and are properly using the media kernel and
> 	userspace APIs.
> 
> On my view, v5 text is more aligned to what it is needed here.

Alternative:

Due to the size and wide scope of the media subsystem, multiple layers of
maintainers are required, each with their own areas of expertise.

> 
> 
>> -Patches for the media subsystem must be sent to the media mailing list
>> -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
>> -HTML will be automatically rejected by the mail server. It could be wise
>> -to also copy the sub-maintainer(s).
> 
>> +Media Maintainers
>> +-----------------
> 
> While it is fine to keep this name here, there's a lack of consistency
> after your rename:
> 
> 	Media committers -> Media maintainers (all 3 committers group below)
> 
> 	1. committers -> Media maintainers
> 	2. core committers -> Media core maintainers
> 	3. subsystem maintainers -> Media subsystem maintainers
> 
> This is very confusing, as "Media maintainers" refer to the group of
> people that aren't core committers/subsystem maintainers and to the
> entire group.
> 
> Also, everybody listed in MAINTAINERS is a maintainer. Any maintainer
> for something under drivers/media would be referred as
> "a media maintainer" by other kernel developers.
> 
> More importantly, being listed as a media maintainer at MAINTAINERS
> doesn't imply receiving commit rights at the media.git tree.
> 
> So, in the lack of a better terminology, better to stick with 
> nomenclature we already agreed up to v5.

A major problem with v5 is that it mixed 'maintainer' with 'committer'.
A committer is a maintainer with commit rights. But the maintainer duties
remain the same, whether you have commit rights or not. It's one of the
reasons why previous versions were hard to understand.

But I agree that "Media Maintainer" needs a better name. I think "Media Core
Maintainer" and "Media Subsystem Maintainer" are clear, but for "Media
Maintainer" we need something better.

Today "Media Maintainers" in the sense of this document are Nicolas (codec
drivers) and Bryan (Qualcomm drivers). So developers with the responsibility
for certain classes of drivers.

"Media Specialist Maintainer"? Maintainers specializing in a certain type of
driver.

Basically the hierarchy is:

Media Contributor
Media Driver Maintainer
Media Specialist (?) Maintainer
Media Core Maintainer
Media Subsystem Maintainer

The last three can post media PRs or have media commit rights.

As mentioned in my reply to Ricardo, a Media Driver Maintainer can also get
commit rights, but I prefer to postpone that until we have a candidate for that.

> 
>> +
>> +The media subsystem has three layers of media maintainers:
> 
> "three layers" seems to imply that a patch need to pass to 3
> different levels of committers. I would write it as:
> 
> 	The media subsystem maintainership consists of:
> 
> And then, add a new type there to remind people about the
> MAINTAINERS file entries:
> 
> 	1. Media maintainers and reviewers

I'd call that "Media Driver Maintainer"

> 
> 	Everyone that has an entry at MAINTAINERS file for a component
>  	inside the media tree. They're typically authors and senior

I'd drop 'senior', that doesn't add anything.

> 	developers responsible for maintaining one or more components at
> 	the media subsystem.
> 
> 	Patches affecting such components should be copied to their
> 	corresponding media maintainers and reviewers when submitted to
> 	the linux-media@vger.kernel.org mailing list.
> 
>> +
>> +- Media Maintainer:
> 
> 
>     2. Media Committers:

"Media Specialist Maintainer" or something along those lines.

Definitely not 'committer'.

> 
>> +    Responsible for a group of drivers within the Media Subsystem. Typically
>> +    these are all drivers that have something in common, e.g. codec drivers
>> +    or drivers from the same vendor. 
> 
> OK
> 
>> +    Media Maintainers provide feedback if the
>> +    patches are not following the subsystem rules, or are not using the
>> +    media kernel or userspace APIs correctly, or have poor code quality. They
>> +    also keep patchwork up to date, decide when patches are ready for merging,
>> +    and create Pull Requests for the Media Subsystem Maintainers to merge.
>> +
>> +    A Media Maintainer is not just someone who is capable of creating code, but
>> +    someone who has demonstrated their ability to collaborate with the team, get
>> +    the most knowledgeable people to review code, contribute high-quality code,
>> +    and follow through to fix issues (in code or tests).
> 
> Those duties also apply to all types of committers. Better place at the
> end.
> 
>> +
>> +- Media Core Maintainer:
> 
> 3. Media Core Committers:
> 
>> +    Media Maintainers who are also responsible for one or more media core
>> +    frameworks.

With this I tried to indicate that the Media Core Maintainer duties are in
addition to those of the Media Specialist Maintainer.

>> +
>> +    Core framework changes are done via consensus between the relevant Media
>> +    Core Maintainers. Media Maintainers may include core framework changes in
>> +    their Pull Requests if they are signed off by the relevant Media Core
>> +    Maintainers.
> 
> Nomenclature needs update at the above paragraph.
> 
>> +
>> +- Media Subsystem Maintainers:
> 
> 4. Media Subsystem Maintainers:
> 

Here it should clearly state that these duties are in addition to those
of a Media Core Maintainer.

>> +    Responsible for the subsystem as a whole, with access to the
>> +    entire subsystem. Responsible for merging Pull Requests from other
>> +    Media Maintainers.
>> +
>> +    Userspace API/ABI changes are done via consensus between Media Subsystem
>> +    Maintainers\ [2]_. Media (Core) Maintainers may include API/ABI changes in
>> +    their Pull Requests if they are signed off by the all Media Subsystem
>> +    Maintainers.
> 
> Nomenclature needs update at the above paragraphs.
> 
> After listing the 4 types of roles, we can place here:
> 
> 	Media Maintainers provide feedback if the patches are not following the 
> 	subsystem rules, or are not using the media kernel or userspace APIs
> 	correctly, or have poor code quality.
> 
> 	Media Committers, core Committers and Media Subsystem Maintainers have
> 	commit rights at the media development tree. We refer to all of
> 	them as "Committers" inside the media documentation.
> 
> 	Committers keep patchwork up to date, decide when patches are ready for merging
> 	and create Pull	Requests when patches are ready to merge.
> 
> 	A Committer is not just someone who is capable of creating code, but 
> 	someone who has demonstrated their ability to collaborate with the team,
> 	get the most knowledgeable people to review code, contribute high-quality
> 	code and follow through to fix issues (in code or tests).
> 
>> +All Media Maintainers shall explicitly agree with the Kernel development process
>> +as described at Documentation/process/index.rst and to the Kernel
>> +development rules inside the Kernel documentation, including its code of
>> +conduct.
> 
> All Media Maintainers -> Committers 

No, no, no! A committer is a maintainer with commit rights. But the maintainer
may be too inexperienced, not yet trusted enough, or just not interested in getting
commit rights.

The next patch describes the extra responsibilities a committer has, but that makes
no difference to their responsibilities as maintainer.

The word 'committer' shouldn't occur in this section, other than as a reference to
the committer documentation.

I think the maintainer job is far more important than being able to commit to a tree.
Just posting a PR and letting someone else do the commit is a lot easier.

It's fairly time consuming for me to check a PR and ensure it is fine to commit.
Which is of course why we want a multi-committer model. But that also pushes the
time that I now spend to the maintainer with the commit rights. So other than
prestige it is just more work compared to posting a PR.

Regards,

	Hans

> 
>> +
>> +All Media Maintainers shall ensure that patchwork will reflect the current
>> +status, e.g. patches shall be delegated to the Media Maintainer who is
>> +handling them and the patch status shall be updated according to these rules:
> 
> All Media Maintainers -> Committers 
> 
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
> 
> the Media Maintainer -> the Committer
> 
> (same change everywhere inside this doc)
> 
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
> 
>> +Media Committers
>> +----------------
>> +
>> +Experienced and trusted Media (Core) Maintainers may be granted commit rights
>> +which allow them to directly push patches to the media development tree instead
>> +of posting a Pull Request for the Media Subsystem Maintainers. This helps
>> +offloading some of the work of the Media Subsystem Maintainers.
> 
> This one sounds confusing.
> 
> On your version, there are 6 types of maintainers related to media
> subsytem, plus the ones on MAINTAINERS, as one could potentially be
> a "media maintainer", a "core maintainer" or even a "subsystem maintainer",
> being responsible to update patchwork but still not having commit rights.
> 
> I don't think we want that.
> 
> ---
> 
> I'll stop the review here, as IMHO we need first to address the 
> nomenclature. Then check if the terms are properly used along the
> docs in a consistent way.
> 
> Thanks,
> Mauro
> 


