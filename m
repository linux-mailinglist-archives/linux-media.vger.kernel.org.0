Return-Path: <linux-media+bounces-22457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 064149E064E
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89DEB171ADA
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D983209F46;
	Mon,  2 Dec 2024 14:49:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3416209F45;
	Mon,  2 Dec 2024 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150952; cv=none; b=UYyMUnpNCGREamX6D7aCVm85ya+bK0FtYn71dRxTEdOTfxryjry0E5mpmlcltuOZQ1Kst4LYqn7aQdel+zgY0K74IgvPIj32F0aG1vS+RYU+xA1sHnyaaNrvO3G8J7rinJWnocHsS4Uwps0Q94LIIBpvCwjJ5W5wRs1c/QoO8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150952; c=relaxed/simple;
	bh=VIztj+2CI4UA0ULTrj7H4fIyGUhXHCgmpc/R25O2jHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N34PuAHVijyymUkkNGZAe2piPEVZYvvUqzB5KVx1rtS+Ku80gTdoUD8FTc4+op5IZhwDGJre3J1t+dUDIk/VINBkWwOE9so/YrXundNMOkmudP+lapCSWJPlDw9uZgZea7IbZycZUxV8Jts2/B4pn8rwuhhlUrSF4LGpV/zvGcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324C6C4CED1;
	Mon,  2 Dec 2024 14:49:09 +0000 (UTC)
Message-ID: <2215c3f7-9d45-4c7f-a626-e78dbf68a455@xs4all.nl>
Date: Mon, 2 Dec 2024 15:49:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4ll.nl>, Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
 <e9a5f9f49b185c694d38ea620bd68252eb52e9d3.1733131405.git.mchehab+huawei@kernel.org>
 <b3837cf3-8d32-41ad-82f8-855d48256f09@xs4all.nl>
 <20241202145405.58499677@foz.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241202145405.58499677@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2024 14:54, Mauro Carvalho Chehab wrote:
> Em Mon, 2 Dec 2024 14:17:48 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> Hi Mauro,
>>
>> On 02/12/2024 10:26, Mauro Carvalho Chehab wrote:
>>> As the media subsystem will experiment with a multi-committers model,
>>> update the Maintainer's entry profile to the new rules.
>>>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>  
>>
>> xs4ll.nl -> xs4all.nl
>>
>> (it's probably my typo, but please fix this in the final version)
> 
> Yes, I copied and pasted it. Will fix at the next version.
> 
>>
>>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  .../media/maintainer-entry-profile.rst        | 208 ++++++++++++++----
>>>  MAINTAINERS                                   |   1 +
>>>  2 files changed, 163 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
>>> index ffc712a5f632..dc764163cf1c 100644
>>> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
>>> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
>>> @@ -27,19 +27,139 @@ It covers, mainly, the contents of those directories:
>>>  Both media userspace and Kernel APIs are documented and the documentation
>>>  must be kept in sync with the API changes. It means that all patches that
>>>  add new features to the subsystem must also bring changes to the
>>> -corresponding API files.
>>> +corresponding API documentation files.
>>>  
>>> -Due to the size and wide scope of the media subsystem, media's
>>> -maintainership model is to have sub-maintainers that have a broad
>>> -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
>>> -task to review the patches, providing feedback to users if the patches are
>>> +Due to the size and wide scope of the media subsystem, the media's
>>> +maintainership model is to have committers that have a broad knowledge of
>>> +a specific aspect of the subsystem. It is the committers' task to
>>> +review the patches, providing feedback to users if the patches are
>>>  following the subsystem rules and are properly using the media kernel and
>>>  userspace APIs.
>>>  
>>> -Patches for the media subsystem must be sent to the media mailing list
>>> -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
>>> -HTML will be automatically rejected by the mail server. It could be wise
>>> -to also copy the sub-maintainer(s).
>>> +Media committers
>>> +----------------
>>> +
>>> +In the media subsystem, there are experienced developers who can push
>>> +patches directly to the development tree. These developers are called
>>> +Media committers and are divided into the following categories:
>>> +
>>> +- Committers:
>>> +    contributors for one or more drivers within the media subsystem.
>>> +    They can push changes to the tree that do not affect the core or ABI.
>>> +
>>> +- Core committers:
>>> +    responsible for part of the media core. They are typically
>>> +    responsible for one or more drivers within the media subsystem, but, besides
>>> +    that, they can also merge patches that change the code common to multiple
>>> +    drivers, including the kernel internal API.
>>> +
>>> +- Subsystem maintainers:
>>> +    responsible for the subsystem as a whole, with access to the
>>> +    entire subsystem.
>>> +
>>> +    Only subsystem maintainers can push changes that affect the userspace
>>> +    API/ABI.
>>> +
>>> +All media committers shall explicitly agree with the Kernel development process
>>> +as described at Documentation/process/index.rst and to the Kernel
>>> +development rules inside the Kernel documentation, including its code of
>>> +conduct.
>>> +
>>> +Media development tree
>>> +----------------------
>>> +
>>> +The main development tree used by the media subsystem is hosted at LinuxTV.org,
>>> +where we also maintain news about the subsystem, wiki pages and a patchwork
>>> +instance where we track patches though their lifetime.
>>> +
>>> +The main tree used by media developers is at:
>>> +
>>> +https://git.linuxtv.org/media.git/
>>> +
>>> +.. _Media development workflow:
>>> +
>>> +Media development workflow
>>> +++++++++++++++++++++++++++
>>> +
>>> +All changes for the media subsystem must be sent first as e-mails to the
>>> +media mailing list, following the process documented at
>>> +Documentation/process/index.rst.
>>> +
>>> +It means that patches shall be submitted as plain text only via e-mail to
>>> +linux-media@vger.kernel.org. While subscription is not mandatory, you
>>> +can find details about how to subscribe to it and to see its archives at:
>>> +
>>> +  https://subspace.kernel.org/vger.kernel.org.html
>>> +
>>> +Emails with HTML will be automatically rejected by the mail server.
>>> +
>>> +It could be wise to also copy the media committer(s). You should use
>>> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
>>> +Please always copy driver's authors and maintainers.
>>> +
>>> +Such patches need to be based against a public branch or tag as follows:
>>> +
>>> +1. Patches for new features need to be based at the ``next`` branch of
>>> +   media.git tree;
>>> +
>>> +2. Fixes against an already released kernel should preferably be against
>>> +   the latest released Kernel. If they require a previously-applied
>>> +   change at media.git tree, they need to be against its ``fixes`` branch.  
>>
>> What is an "released kernel"? Does an -rcX kernel qualify?
>>> +
>>> +3. Fixes for issues not present at the latest released kernel shall
>>> +   be either against a -rc kernel for an upcoming release or
>>> +   against the ``fixes`` branch of the media.git tree.  
>>
>> 2 and 3 remain vague, IMO. Not a blocker, but I think this needs more work
>> at some point.
> 
> Some Kernel documents use "mainline release" to refer to Kernel final
> releases.
> 
> One option to make it clearer would be to add a link to:
> 	https://www.kernel.org/category/releases.html
> 
> And then use the terms:
> 	- "Mainline release" for v6.10, v6.11, v6.12...
> 	- "Prepatch release" for -rc1, -rc2, -rc3...
> 
> What 2 and means are:
> 
> 	1. Features for the next mainline release:
> 
> 	   - baseline shall be media.git ``next`` branch;
> 
> 	2. Fixes bugs at mainline releases:
> 
> 	   - baseline shall be the latest mainline release or media.git ``fixes``  
> 	     if changes depend on a fix already merged;
> 
> 	3. Fixes for the next mainline release:
> 
> 	   - baseline shall be a prepatch release or media.git ``fixes``  
> 	     if changes depend on a fix already merged;

If it is for the next mainline release, then I would also be fine with 'next'
as baseline. That avoids having to modify the patch if it conflicts with
new work that went into next. Having to base a fix on the 'fixes' branch is
rare in this case. You typically only need to do that in case 2.

> 
> 	.. Note:
> 
> 	   See https://www.kernel.org/category/releases.html for an overview
> 	   about Kernel release types.
>   
> Would the above text work best you? If not please propose another
> text.

Yes, that's much better.

> 
> In practice, we'll likely accept other baselines for fixes as
> well, for practical reasons. From my side, I don't have any issues
> if I need to rebase a tested bugfix patch produced against an
> older Kernel send by an occasional contributor, if it only has 
> trivial merge conflicts.

Sure, these three points are really about our preference since following
that reduces the chance of merge conflicts.

We can say something like this:

"To minimize the chance of merge conflicts for your patch series, we recommend
that you use the following baseline for your patch series:"

> 
>>> +Patches with fixes shall have:
>>> +
>>> +- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
>>> +- when applicable, a ``Cc: stable@vger.kernel.org``.
>>> +
>>> +Patches that were fixing bugs publicly reported by someone at the
>>> +linux-media@vger.kernel.org mailing list shall have:
>>> +
>>> +- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
>>> +
>>> +Patches that change API shall update documentation accordingly at the
>>> +same patch series.
>>> +
>>> +See Documentation/process/index.rst for more details about e-mail submission.
>>> +
>>> +Once a patch is submitted, it may follow either one of the following
>>> +workflows:
>>> +
>>> +a. Pull request workflow: patches are handled by subsystem maintainers::
>>> +
>>> +     +------+   +---------+   +-------+   +-----------------------+   +---------+
>>> +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|
>>> +     +------+   |picks it |   |request|   |in media-committers.git|   +---------+
>>> +                +---------+   +-------+   +-----------------------+
>>> +
>>> +   For this workflow, pull requests can be generated by a committer,
>>> +   a previous committer, subsystem maintainers or by a trusted long-time
>>> +   contributor. If you are not in such group, please don't submit
>>> +   pull requests, as they will not be processed.
>>> +
>>> +b. Committers' workflow: patches are handled by media committers::
>>> +
>>> +     +------+   +---------+   +--------------------+   +-----------+   +---------+
>>> +     |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
>>> +     +------+   |picks it |   |media-committers.git|   |approval   |   +---------+
>>> +                +---------+   +--------------------+   +-----------+
>>> +
>>> +On both workflows, all patches shall be properly reviewed at
>>> +linux-media@vger.kernel.org before being merged at media-committers.git.
>>> +
>>> +When patches are picked by patchwork and when merged at media-committers,
>>> +CI bots will check for errors and may provide e-mail feedback about
>>> +patch problems. When this happens, the patch submitter must fix them, or
>>> +explain why the errors are false positives.
>>> +
>>> +Patches will only be moved to the next stage in those two workflows if they
>>> +don't fail on CI or if there are false-positives in the CI reports.
>>> +
>>> +Failures during e-mail submission
>>> ++++++++++++++++++++++++++++++++++
>>>  
>>>  Media's workflow is heavily based on Patchwork, meaning that, once a patch
>>>  is submitted, the e-mail will first be accepted by the mailing list
>>> @@ -47,51 +167,48 @@ server, and, after a while, it should appear at:
>>>  
>>>     - https://patchwork.linuxtv.org/project/linux-media/list/
>>>  
>>> -If it doesn't automatically appear there after a few minutes, then
>>> +If it doesn't automatically appear there after some time [2]_, then
>>>  probably something went wrong on your submission. Please check if the
>>> -email is in plain text\ [2]_ only and if your emailer is not mangling
>>> +email is in plain text\ [3]_ only and if your emailer is not mangling
>>>  whitespaces before complaining or submitting them again.
>>>  
>>> -You can check if the mailing list server accepted your patch, by looking at:
>>> +To troubleshoot problems, you should first check if the mailing list
>>> +server has accepted your patch, by looking at:
>>>  
>>>     - https://lore.kernel.org/linux-media/
>>>  
>>> -.. [2] If your email contains HTML, the mailing list server will simply
>>> +If the patch is there and not at patchwork, it is likely that your e-mailer
>>> +mangled the patch. Patchwork internally has a logic that checks if the  
>>
>> a logic -> logic
>>
>>> +received e-mail contain a valid patch. Any whitespace and new line  
>>
>> contain -> contains
>>
>>> +breakages mangling the patch won't be recognized by patchwork, thus such
>>> +patch will be rejected.
>>> +
>>> +.. [2] It usually takes a few minutes for the patch to arrive, but
>>> +       the e-mail server may be busy, so it may take up to a few hours
>>> +       for a patch to be picked by patchwork.
>>> +
>>> +.. [3] If your email contains HTML, the mailing list server will simply
>>>         drop it, without any further notice.
>>>  
>>> +.. _media-developers-gpg:
>>>  
>>> -Media maintainers
>>> -+++++++++++++++++
>>> +Authentication for pull and merge requests
>>> +++++++++++++++++++++++++++++++++++++++++++
>>>  
>>> -At the media subsystem, we have a group of senior developers that
>>> -are responsible for doing the code reviews at the drivers (also known as
>>> -sub-maintainers), and another senior developer responsible for the
>>> -subsystem as a whole. For core changes, whenever possible, multiple
>>> -media maintainers do the review.
>>> +The authenticity of developers submitting pull requests and merge requests
>>> +shall be validated by using PGP sign. See: :ref:`kernel_org_trust_repository`.  
>>
>> sign -> signing
>>
>> Hmm, merge requests through gitlab are not signed. So this isn't correct, I
>> think.
> 
> No, but they are authenticated based on gitlab's user ID. The authentication
> we'll have is when the new committer sends us an e-mail providing the
> gitlab's user ID.
> 
> See patch 3, as it contains some changes aiming to better explain it. Once
> it get the same people reviewing that also reviewed 1 and 2, I'll fold it.
> 
>>
>>>  
>>> -The media maintainers that work on specific areas of the subsystem are:
>>> +With the pull request workflow, pull requests shall use a PGP-signed tag.
>>>  
>>> -- Remote Controllers (infrared):
>>> -    Sean Young <sean@mess.org>
>>> +For more details about PGP sign, please read
>>> +Documentation/process/maintainer-pgp-guide.rst.
>>>  
>>> -- HDMI CEC:
>>> -    Hans Verkuil <hverkuil@xs4all.nl>
>>> +Subsystem maintainers
>>> +---------------------
>>>  
>>> -- Media controller drivers:
>>> -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> -
>>> -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
>>> -    Sakari Ailus <sakari.ailus@linux.intel.com>
>>> -
>>> -- V4L2 drivers and core V4L2 frameworks:
>>> -    Hans Verkuil <hverkuil@xs4all.nl>
>>> -
>>> -The subsystem maintainer is:
>>> -  Mauro Carvalho Chehab <mchehab@kernel.org>
>>> -
>>> -Media maintainers may delegate a patch to other media maintainers as needed.
>>> -On such case, checkpatch's ``delegate`` field indicates who's currently
>>> -responsible for reviewing a patch.
>>> +The subsystem maintainers are:
>>> +  - Mauro Carvalho Chehab <mchehab@kernel.org> and
>>> +  - Hans Verkuil <hverkuil@xs4all.nl>
>>>  
>>>  Submit Checklist Addendum
>>>  -------------------------
>>> @@ -108,17 +225,14 @@ implementing the media APIs:
>>>  ====================	=======================================================
>>>  Type			Tool
>>>  ====================	=======================================================
>>> -V4L2 drivers\ [3]_	``v4l2-compliance``
>>> +V4L2 drivers\ [4]_	``v4l2-compliance``
>>>  V4L2 virtual drivers	``contrib/test/test-media``
>>>  CEC drivers		``cec-compliance``
>>>  ====================	=======================================================
>>>  
>>> -.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
>>> +.. [4] The ``v4l2-compliance`` also covers the media controller usage inside  
>>
>> The ``v4l2-compliance`` utility
>>
>> (add 'utility')
> 
> Ok.
> 
>>
>>>         V4L2 drivers.
>>>  
>>> -Other compilance tools are under development to check other parts of the
>>> -subsystem.
>>> -
>>>  Those tests need to pass before the patches go upstream.
>>>  
>>>  Also, please notice that we build the Kernel with::
>>> @@ -134,6 +248,8 @@ Where the check script is::
>>>  Be sure to not introduce new warnings on your patches without a
>>>  very good reason.
>>>  
>>> +Please see `Media development workflow`_ for e-mail submission rules.
>>> +
>>>  Style Cleanup Patches
>>>  +++++++++++++++++++++
>>>  
>>> @@ -199,7 +315,7 @@ tree between -rc6 and the next -rc1.
>>>  Please notice that the media subsystem is a high traffic one, so it
>>>  could take a while for us to be able to review your patches. Feel free
>>>  to ping if you don't get a feedback in a couple of weeks or to ask
>>> -other developers to publicly add Reviewed-by and, more importantly,
>>> +other developers to publicly add ``Reviewed-by:`` and, more importantly,
>>>  ``Tested-by:`` tags.
>>>  
>>>  Please note that we expect a detailed description for ``Tested-by:``,
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 1e930c7a58b1..c77f56a2e695 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -14510,6 +14510,7 @@ MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
>>>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>>>  L:	linux-media@vger.kernel.org
>>>  S:	Maintained
>>> +P:	Documentation/driver-api/media/maintainer-entry-profile.rst
>>>  W:	https://linuxtv.org
>>>  Q:	http://patchwork.kernel.org/project/linux-media/list/  
>>
>> Shouldn't this point to our patchwork instance instead?
> 
> Good catch! I'll update it.
> 
>>
>>>  T:	git git://linuxtv.org/media.git  

Regards,

	Hans

