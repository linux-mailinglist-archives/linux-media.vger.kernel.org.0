Return-Path: <linux-media+bounces-35721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE65AE5E89
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 09:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233E8402B5F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 07:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46F22512D1;
	Tue, 24 Jun 2025 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MBHQWgtD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EF5246BCD
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751609; cv=none; b=sEhdTdlVRzK8dS30FrtJKIFsxWsvBtFLV5lHFaSWYriK6QdfWhRJ8rkTHKO7OZxIBxVsNqrPWdPgWFuX2QB0Y3oSUQcS0j93+Aa9i2QQize+B8rQWiehawJ8O+sc0hvpAej+TpZ36t1X2guyTaMftDsiSdjULIhgsY2x7iD4gfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751609; c=relaxed/simple;
	bh=qZt4z5BJPUyQZL02fOK2jefzKSU0GghbzVOg8hCNN4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KReLdZAY+LEu7mOAt+ZucgsDgSXZ6iXNw6i1MBF4BdkaV7H6Dtlo8JsSNqBqxTSTbskzDLy/GeiB1ymjO0fkry4F4qpIZ2OI79w1fbFfLQRyUDEwlfK3tsd2khRuMqHlgQPPjQj32uehYU9+BUg6u8vIrxfBr2nKhWlB1xjUS6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MBHQWgtD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44CCE741;
	Tue, 24 Jun 2025 09:53:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750751582;
	bh=qZt4z5BJPUyQZL02fOK2jefzKSU0GghbzVOg8hCNN4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MBHQWgtDeKAfn1QdYWDPvM1LiYS+3CGM07ylTuDqQHuqNwtVSemAzN8WN8nTRU8Tx
	 EyH1Y2Ef+Fv6OHR2X8wI4jb9VdDcQuLtSgDBYhV7/do1has7gTzFKSRPMaluOYmEE8
	 RnL7UdSyLaRZJUT3NgdECNK4zAndk0Ww3M61CgUM=
Message-ID: <131d6b8f-d004-41d2-86d4-4afdd338711a@ideasonboard.com>
Date: Tue, 24 Jun 2025 08:53:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add media jobs framework
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
 <a3acaf1aab0ff43e19ba77e1ee5d43d573e1bf5f.camel@ndufresne.ca>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <a3acaf1aab0ff43e19ba77e1ee5d43d573e1bf5f.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicolas - sorry for the delayed response, I missed this message somehow.

On 30/05/2025 16:11, Nicolas Dufresne wrote:
> Hi Daniel,
>
> Le lundi 19 mai 2025 à 15:04 +0100, Daniel Scally a écrit :
>> Hello all
>>
>> This series adds a new API to the media controller framework, which
>> I'm calling "media jobs". The framework is intended to facilitate
>> communication between separate drivers which need to work together
>> to fully operate a media pipeline. For example, the need for the
>> framework arose when writing support for the ISP in the RZ/V2H; the
>> ISP is fed by a DMA engine which is not part of the same IP block,
>> and so is driven by its own driver (though sharing a media graph).
>> The ISP driver needs to be able to communicate with the DMA engine
>> driver to instruct it to push the next frame. Because the DMA engine
>> might be different on a different platform that used the ISP, direct
>> calls into functions exported by the DMA engine driver wouldn't be
>> scalable, and so this driver agnostic route was adopted. The
>> framework allows drivers to define the steps that need to be taken
>> (for example writing configuration data, reading statistics data,
>> writing buffer addresses and triggering data transmission) to complete
>> a "job" (of which the only current example is the processing of a
>> frame of data through the pipeline, though I expect that other use
>> cases could become apparent too) and to then schedule them into a
>> work queue once driver definable dependencies have been met. The
>> dependencies might, for example, be the queuing of buffers to V4L2
>> capture / output devices.
> This is just a first impression, about the naming of course. If you
> haven't been there, Request was once called Job, so bringing back
> jobs next to request looks like it going to be very confusing.
>
> When I look at your proposal, what I see here is a scheduler, the
> jobs being the abstraction of the task being scheduled. What about
> going forward with "Media Scheduler" ?
Ah; Requests being Jobs was before my time so that potential for confusion didn't twig to me....I'm 
happy to rename it, though I think just "Media Scheduler" begs the question "what is being 
scheduled?" so I feel like something more is needed...but I don't know what else.
> I can't stop finding similarities with the DRM scheduler. I'm not expert,
> still learning, but it seems DRM agnostic and possible usable even by us.
> It does support dependencies, but it also support priorities. Instead of
> ops for deps, uses fences. The fences are not necessarily userspace facing,
> they do allow having jobs that depends on foreign job without any sub-system
> boundaries. They properly abstract the dependencies too.
>
> I would like to see your impression about this. I would also see a reflection
> around non-camera use cases, since MC is no longer just a camera API.

Having had a look I agree that there's a lot of parallels. I don't think it would be usable as-is 
unless I'm missing something, but perhaps it could be adapted to be usable instead. I've revised 
this series so I'll post the v2 in a moment, but I'll delve more into the DRM scheduler and see 
where that leads. Thanks for bringing it up!


Thanks

Dan

>
> regards,
> Nicolas
>
>> The framework allows precise definition of the ordering of the steps
>> regardless of the order in which the drivers populate the jobs. Steps
>> can be flagged as being placed at a particular position from the front
>> or back of the queue (I.E. last, or third from last) or as requiring
>> no particular order. This would allow the construction of a job like:
>>
>> Step 0 (ISP Driver): Program the hardware with parameters
>> Step 1 to N-1 (Both drivers): Program the hardware with buffers
>> Step N (DMA Engine Driver): Send a frame of data to the ISP
>> ... ISP processes data ...
>> Step N + 1 (ISP Driver): Read out statistics data from the last frame
>>
>> The mali-c55 ISP driver and the DMA engine feeding it on the RZ/V2H
>> (called the rzv2h-ivc driver) both use the framework, and will be
>> posted shortly after this series with references back to it. I will
>> reply to this message with links to those series for convenience.
>>
>> The first patch in this set is not strictly part of the framework,
>> but also facilitates multiple drivers with V4L2 Video Devices
>> sharing a single media graph. We have a requirement to delay the
>> start of streaming until all of a pipeline's video devices have had
>> their .start_streaming() operations called; these new entity ops
>> provide a mechanism through which each driver can inform the other
>> that the last video device in the pipeline has now been started.
>>
>> Thanks
>> Dan
>>
>> Daniel Scally (3):
>>    media: mc: entity: Add pipeline_started/stopped ops
>>    media: mc: Add media jobs framework
>>    media: Documentation: Add documentation for media jobs
>>
>>   Documentation/driver-api/media/mc-core.rst | 154 +++++++
>>   drivers/media/mc/Makefile                  |   2 +-
>>   drivers/media/mc/mc-entity.c               |  45 +++
>>   drivers/media/mc/mc-jobs.c                 | 446 +++++++++++++++++++++
>>   include/media/media-entity.h               |  24 ++
>>   include/media/media-jobs.h                 | 354 ++++++++++++++++
>>   6 files changed, 1024 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/media/mc/mc-jobs.c
>>   create mode 100644 include/media/media-jobs.h

