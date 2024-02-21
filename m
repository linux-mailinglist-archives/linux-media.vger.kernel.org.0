Return-Path: <linux-media+bounces-5556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A821085D763
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63ACC283E5A
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E9746548;
	Wed, 21 Feb 2024 11:48:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC8405C6
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708516134; cv=none; b=h2xgt63HGcwIZeNtEO3Cv32JM//w+u76RlBChGUN7QxXGu616qSKT3t8U4CZUcFA7Hir6VyLVHyL4LwfdTawTnCwwPQWkKGDNKd0vpz4Tb/bwZp1P6u/Yb2GsJDp4inAsVToGktP9ZHQmTrVI3u0Aaab4TEcLKqlC/a+ptJF1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708516134; c=relaxed/simple;
	bh=DqESWxeYn2C3FMTu8yGDmngIC6TMFE6nIOEdI4ZpBLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrP5J/zQ7fiXcZWrgvj8Vf2ScEGAT9QBfAMQ1Ri3zeBJjdSHOzjzudBBndyw6TAwVmkJ6xst/zlyJqTHX1W6w/I7xePRhbWx7BS7EvKGN0eC9hjER7KzHiG7zbyrlliBkT5wvnS9aDjvFKq5O7tka/w6HvAINY9VEHMq9KfbWeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C522C433F1;
	Wed, 21 Feb 2024 11:48:53 +0000 (UTC)
Message-ID: <e0014623-aac2-41f5-9102-196caaddc582@xs4all.nl>
Date: Wed, 21 Feb 2024 12:48:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/29] media: vimc: Release resources on media device
 release
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-24-sakari.ailus@linux.intel.com>
 <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>
 <ZdXWN4wPqT7XdK7K@kekkonen.localdomain>
 <77c003ad-a841-40ae-8f15-58fd6e0e22ff@xs4all.nl>
 <ZdXhGAmJhzQcXbN2@kekkonen.localdomain>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZdXhGAmJhzQcXbN2@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2024 12:40, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Feb 21, 2024 at 12:19:21PM +0100, Hans Verkuil wrote:
>> On 21/02/2024 11:53, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Mon, Feb 05, 2024 at 04:02:24PM +0100, Hans Verkuil wrote:
>>>> On 20/12/2023 11:37, Sakari Ailus wrote:
>>>>> Release all the resources when the media device is related, moving away
>>>
>>> s/related/released/
>>>
>>>>> form the struct v4l2_device used for that purpose.
>>>>
>>>> form -> from
>>>
>>> Yes.
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>> ---
>>>>>  drivers/media/test-drivers/vimc/vimc-core.c | 15 +++++++++------
>>>>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
>>>>> index af127476e920..3e59f8c256c7 100644
>>>>> --- a/drivers/media/test-drivers/vimc/vimc-core.c
>>>>> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
>>>>> @@ -264,13 +264,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> -static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
>>>>> +static void vimc_mdev_release(struct media_device *mdev)
>>>>>  {
>>>>>  	struct vimc_device *vimc =
>>>>> -		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
>>>>> +		container_of_const(mdev, struct vimc_device, mdev);
>>>>
>>>> Why this change?
>>>
>>> I changed the line already. There's no reason to continue using
>>> container_of() instead of container_of_const() that takes const-ness into
>>> account, too.
>>
>> But neither vimc nor mdev can be const anyway, that would make no sense
>> here.
> 
> Neither is const, true. Yet container_of_const() is preferred over

Says who?

It makes sense in generic defines that use it, e.g.:

drivers/base/firmware_loader/sysfs.h:#define to_fw_sysfs(__dev) container_of_const(__dev, struct fw_sysfs, dev)

That way it can handle both const and non-const __dev pointers.

In cases where this doesn't come into play I think there is no need to
make code changes. Perhaps when writing new code it might make sense to
use it, but changing it in existing code, esp. as part of a patch that
deals with something else entirely, seems just unnecessary churn.

I won't block this, but I recommend just dropping this change in this patch.

Regards,

	Hans

> container_of(), due to the fact that it does take const-ness into account.
> container_of() should really be avoided.
> 
> I'll add this to the commit message as Laurent suggested.
> 


