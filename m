Return-Path: <linux-media+bounces-35937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C359FAE9A3C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 504A77B0796
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 09:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03192D8789;
	Thu, 26 Jun 2025 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qH3C4pu2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6E2D876B
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930523; cv=none; b=PL4zpWx66j5g+bcXh9Dsb//vP3e8LfOL6JItpx38mZtruwDQS6LS/+lwE0uwTdCf1D9B5u6CYoomSgTeyqqOFzDvj8oxN8Fp9k17eopVZz0yQP1+WhFcGT2fBZH/tkDP7u9KrJ7QGsp2pxGqWohRSGw9k/8+K9lFeuSC/wN5YIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930523; c=relaxed/simple;
	bh=fOiVtXF1zRX9MkK7VaOZWLWVWUmL5JOgWziiPhnSuqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lq09cw0GSSGFjlFu6SrZMoE06iIoe1o15DckU9ep6Lvbirm5Xct64sMCXcaFWkL9ybXawbLxcmgV73xGQiGOFMzzCbo5JiHAuajNrL8enWB4gLNR/G3iVJToYpDMgBOtU96qdru+qzTERmh3U3jXvLo6c8/jRlbEbI7Jf79ZON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qH3C4pu2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 737986AE;
	Thu, 26 Jun 2025 11:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750930495;
	bh=fOiVtXF1zRX9MkK7VaOZWLWVWUmL5JOgWziiPhnSuqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qH3C4pu2hT4J4NyyFoWm2X26W1xnLOoR8+2IBveciHvROstc9P45cD4fQ9CyBFwDo
	 YTIn1F7pDnxxD5oLs272qjSWzxeGLp96Hl72M+wtnkXxo6rzpGbJ85HhICyUHlFYwJ
	 UsYUTniKAAo4MEO4TOW3eAxTGA7twFWduIbAFbiM=
Message-ID: <60774ed7-fb77-497e-9858-b1422f54832f@ideasonboard.com>
Date: Thu, 26 Jun 2025 10:35:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add media jobs framework
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, jacopo.mondi@ideasonboard.com
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
 <10609f72ceb27db9245b8cadde5bcfddf49fffff.camel@ndufresne.ca>
 <94826966-05e2-4944-bc81-72ef261d2af2@ideasonboard.com>
 <ba48d78044c8954ea0878ce74b53405ecf9140af.camel@ndufresne.ca>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <ba48d78044c8954ea0878ce74b53405ecf9140af.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Morning Nicolas

On 25/06/2025 17:07, Nicolas Dufresne wrote:
> Hi Dan,
>
> Le mercredi 25 juin 2025 à 16:40 +0100, Dan Scally a écrit :
>> Hi Nicolas - thanks for commenting
> [...]
>
>>>> - Link to v1: https://lore.kernel.org/r/20250519140403.443915-1-dan.scally@ideasonboard.com
>>> That's nice to have a link, but do you mind to summarize that changes you
>>> made from v1 ? I remember challenging the naming, and the fact jobs and request
>>> next to each other are extremely confusing. It felt rather important discussion
>>> to have, yet this cover later does say anything, and I don't remember seeing
>>> any reply.
>> I only replied yesterday. Sorry to be late - I didn't see your message for some reason until I was
>> getting ready to post this revision; on the naming I think that just "Media Scheduler" to me feels
>> like it begs the question "What's being scheduled?" but I'm not sure what other word to use if not
>> job...I don't really have strong feelings about it though - just Media Scheduler is fine by me if we
>> can't come up with anything better.
> Thanks for the reply, I was getting a bit annoyed by the silence
> around the high level of the framework. Glad its accidental, My thinking is
> the a scheduler runs jobs (or slice) and this is pretty much the case through
> the kernel. So a "job" framework, can only be a scheduler. Of course, its an
> highly specialized one.


Fair enough; let's go with just media scheduler then

> Note that M2M framework on the V4L2 side is also a multi-plexing scheduler,
> and it runs jobs despite not having a job object :-(. Its too simple, limited
> to one video node, and there is no way to carry over any state for when you
> must run more then one job at the time. We can't even consider having a job
> that depends on another ...
>
> So basically. its the best example of what not to do, and why I care about
> your work. There is an increasing amount of multi-stage, multi-core, with
> pre/post-processor CODEC, which will need multiple video nodes. So your
> scheduler framework seem to be the direction forward.

I'd love to see other users as early as possible really. The idea is for the framework to be generic 
(I.E. not specific to just ISP pipelines) and it's probably useful to have other users to help make 
sure it develops that way.

>> I took a look at the DRM scheduler and I agree that there's a lot of parallels - I don't _think_ it
>> would be usable as-is but perhaps it would be easier to adapt than to add a new piece of code (or it
>> might turn out we can just use it after all); I'm going to spend more time investigating that and
>> see where it leads - thanks for pointing it out.
> After further discussion with the DRM folks, using theirs directly is likely unpractical and
> difficult. But they suggested that we may want to look at a way to make the synchronization
> compatible. Notably by adopting (or supporting) the kernel side dma fence as a way to signal
> completion or failure. Once you get to that, let me know your ideas.


Ack - will do, thanks again.


Dan

>
> best,
> Nicolas
>
>>
>> Thanks
>>
>> Dan
>>
>>> Nicolas
>>>
>>>> ---
>>>> Daniel Scally (3):
>>>>         media: mc: entity: Add pipeline_started/stopped ops
>>>>         media: mc: Add media jobs framework
>>>>         media: Documentation: Add documentation for media jobs
>>>>
>>>>    Documentation/driver-api/media/mc-core.rst | 169 ++++++++++++
>>>>    drivers/media/mc/Makefile                  |   2 +-
>>>>    drivers/media/mc/mc-entity.c               |  46 ++++
>>>>    drivers/media/mc/mc-jobs.c                 | 428 +++++++++++++++++++++++++++++
>>>>    include/media/media-entity.h               |  24 ++
>>>>    include/media/media-jobs.h                 | 317 +++++++++++++++++++++
>>>>    6 files changed, 985 insertions(+), 1 deletion(-)
>>>> ---
>>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>>>> change-id: 20250623-media-jobs-6f3f9963063c
>>>>
>>>> Best regards,

