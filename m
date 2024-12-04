Return-Path: <linux-media+bounces-22618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB79E3B45
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD6E28542A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549FF1BF804;
	Wed,  4 Dec 2024 13:29:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD531B85E2;
	Wed,  4 Dec 2024 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733318991; cv=none; b=GV7AKpqChf6U9GVOhbyseVZ5NTvuxbxsCKOMfvQSPAkN3tEWfM+PN4cGpSfkUL9iCtwMj/sNoWRk/50qPIhcxhjcvwD+/a1YyAxIXNrarDl4bM2NujtRuw79ycOREGjbpjakUc7WsS/S34U7eTCoUNNMot2FHblUvPlStbmuDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733318991; c=relaxed/simple;
	bh=taL63lGoC+rOfxqQvmZWNVQDc87d8a10c/kclBT9mpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4uLD7DS5LxUPFkTVMVtg8puKNfVavvAfxMBK6BmQUw6Wl6bkR4BSHsFKy1w9TVEKBOftxV3gHHOthBabIdm+C0C6QkM/cqD1KbhsWtHXwC40mMmBSE//AA59IDeqOKk7uSIXGh8mjjRyOHUETyt60RFCX3SYFclwJENGXdXzfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B719C4CED1;
	Wed,  4 Dec 2024 13:29:49 +0000 (UTC)
Message-ID: <a9eed620-5cf7-4fdc-a00a-87b488c2a63c@xs4all.nl>
Date: Wed, 4 Dec 2024 14:29:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] docs: media: profile: make it clearer about
 maintainership duties
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
 <f74d32eba4c1799fe7fd407a3889a3de91fb09f2.1733218348.git.mchehab+huawei@kernel.org>
 <57ed2ba7-ebe8-433f-bb52-914a020ca468@xs4all.nl>
 <20241204135127.7b295c19@foz.lan>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20241204135127.7b295c19@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/4/24 13:51, Mauro Carvalho Chehab wrote:
> Em Wed, 4 Dec 2024 13:11:45 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> On 12/3/24 10:35, Mauro Carvalho Chehab wrote:
>>> During the review of the media committer's profile, it was noticed
>>> that the responsibility for timely review patches was not clear:
>>> such review is expected that all developers listed at MAINTAINERS
>>> with the "M:" tag (e.g. "maintainers" on its broad sense).
>>>
>>> This is orthogonal of being a media committer or not. Such duty
>>> is implied at:
>>>
>>> 	Documentation/admin-guide/reporting-issues.rst
>>>
>>> and at the MAINTAINERS header, when it says that even when the
>>> status is "odd fixes", the patches will flow in.
>>>
>>> So, let make it explicit at the maintainer-entry-profile that
>>> maintainers need to do timely reviews.
>>>
>>> Also, while right now our focus is on granting committer rights to
>>> maintainers, the media-committer model may evolve in the future to
>>> accept other committers that don't have such duties.
>>>
>>> So, make it clear at the media-committer.rst that the duties
>>> related to reviewing patches from others are for the drivers
>>> they are maintainers as well.
>>>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---
>>>  Documentation/driver-api/media/maintainer-entry-profile.rst | 5 +++++
>>>  Documentation/driver-api/media/media-committer.rst          | 6 +++---
>>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
>>> index fa28059f7b3f..87b71f89b1df 100644
>>> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
>>> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
>>> @@ -173,6 +173,11 @@ b. Committers' workflow: patches are handled by media committers::
>>>  On both workflows, all patches shall be properly reviewed at
>>>  linux-media@vger.kernel.org (LMML) before being merged at media-committers.git.
>>>  
>>> +Such patches will be reviewed timely by the maintainers and reviewers as
>>> +listed in the MAINTAINERS file. The subsystem maintainers will follow one of
>>> +the above workflows, e. g. they will either send a pull request or merge
>>> +patches directly at the media-committers tree.
>>> +
>>>  When patches are picked by patchwork and when merged at media-committers,
>>>  CI bots will check for errors and may provide e-mail feedback about
>>>  patch problems. When this happens, the patch submitter must fix them, or
>>> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
>>> index 3d0987a8a93b..0bc038a0fdcc 100644
>>> --- a/Documentation/driver-api/media/media-committer.rst
>>> +++ b/Documentation/driver-api/media/media-committer.rst
>>> @@ -90,9 +90,9 @@ be a part of their maintenance tasks.
>>>  Due to that, to become a committer or a core committer, a consensus between
>>>  all subsystem maintainers is required, as they all need to trust a developer
>>>  well enough to be delegated the responsibility to maintain part of the code
>>> -and to properly review patches from third parties, in a timely manner and
>>> -keeping the status of the reviewed code at https://patchwork.linuxtv.org
>>> -updated.
>>> +and to properly review patches from third parties for the drivers that they
>>> +maintain in a timely manner and keeping the status of the patches at
>>> +https://patchwork.linuxtv.org updated.
>>>  
>>>  .. Note::
>>>    
>>
>> Looks OK to me, but I thought this was supposed to be folded into the 3/5 and 4/5 patches?

For the record:

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

You can also add that for patches 1 and 2 (I found them in lore.kernel.org).

Regards,

	Hans

> 
> I'll fold it once you and Ricardo gives the same review/Sob as marked on 3/5 and 4/5.
> 
> 
> Thanks,
> Mauro


