Return-Path: <linux-media+bounces-21377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 821359C6F04
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 13:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38A951F22452
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 12:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F161FF7D9;
	Wed, 13 Nov 2024 12:26:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAC41FF5F9
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731500791; cv=none; b=ZnmfAdctIRCw1FMndZ6ORkdXvspMIwzq9DJYaCeZBL9Rq4AVqwd1iOXqNK6Xd5zWYeX7RQ1x/hveXcBiifiKnTRZ6lTJDEz+TBrNPRqj8gN3pzHC75VxxF7PABr2vOe7wsVdRVDGXd+Bxa73e6LylyatxPpDKd2su+phPsHCPM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731500791; c=relaxed/simple;
	bh=Jah/dWFhU9fmnHb31STtUPR95DsEe16PaJWU7UzOLGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/0jBHlGTJWtX7hT7lilC/Adb/b3hqbXut42Qk12J6hwifMDUm+6TCme+MN9PJuGrbJ6gbSqcNyPgEmCxq7++v1CxWgIlfdMs6blcy6GYDV8RaZzKhy1QvSLen74M9dA8aiE1UneOBEeCq4oykzkPD5V8tL5wvToNZcGOdpQjDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3BCC4CECD;
	Wed, 13 Nov 2024 12:26:28 +0000 (UTC)
Message-ID: <846db937-9445-4f5c-b8fe-7c973522a3a1@xs4all.nl>
Date: Wed, 13 Nov 2024 13:26:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/4] media: v4l: ctrl: Add V4L2_CID_CONFIG_MODEL control
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-5-sakari.ailus@linux.intel.com>
 <137d5e38-b9fd-4274-8877-e5f71365242c@xs4all.nl>
 <ZzRkwVlNLzXQmWoK@kekkonen.localdomain>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ZzRkwVlNLzXQmWoK@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/24 09:35, Sakari Ailus wrote:
> Hi Hans,
> 
> Thank you for the review.
> 
> On Wed, Nov 13, 2024 at 09:03:57AM +0100, Hans Verkuil wrote:
>> On 11/10/2024 09:55, Sakari Ailus wrote:
>>> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
>>>  .../userspace-api/media/v4l/subdev-config-model.rst          | 2 ++
>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
>>>  include/uapi/linux/v4l2-controls.h                           | 3 +++
>>>  4 files changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> index 27803dca8d3e..928e8e3eed7f 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> @@ -55,3 +55,7 @@ Image Process Control IDs
>>>      control value divided by e.g. 0x100, meaning that to get no
>>>      digital gain the control value needs to be 0x100. The no-gain
>>>      configuration is also typically the default.
>>> +
>>> +``V4L2_CID_CONFIG_MODEL (bitmask)``
>>> +    Which configuration models the sub-device supports. Please see
>>> +    :ref:`media_subdev_config_model`.
>>
>> First of all the naming is confusing: since this is specific to sub-devices, it
>> should at least have 'SUBDEV' in the name. I first thought this reported the
> 
> I don't object in principle, but the reason why I didn't add that in v1 was
> the names would get quite long. Maybe V4L2_CID_SUBDEV_CFG_MODEL?
> 
>> model name or something like that, I'm not sure "configuration model" is a very
>> good name.
> 
> Feel free to propose a different one. :-)

I would, if I understood what you intend to achieve :-)

> 
>>
>> Secondly, is this supposed to be valid for all subdevices? Only for sensors?
>> Would an HDMI-to-CSI bridge qualify?
> 
> I think it could but we should have a use case for it. In other words,
> something we can't reasonably express using existing means. In this case
> it's a number of interfaces and device type specific behaviour (see the 3rd
> patch).
> 
>>
>> Thirdly, only V4L2_CID_CONFIG_MODEL_COMMON_RAW is defined right now. What other
>> models do you have in mind? What models can co-exist (since this is a bitmask)?
> 
> We could have different raw camera models if needed. I don't have any
> planned right now, though.
> 
>>
>> Finally, why choose a control for this? Should this perhaps be better done as
>> a field in media_entity_desc/media_v2_entity?
> 
> I don't think it's a great fit. This is largely about V4L2 (to some but
> lesser extent about MC) and we traditionally have avoided MC -> V4L2
> dependencies.
> 

It sounds a bit like you want to report what Mauro calls a 'Profile'.

But I would expect the control to be an enum and not a bitmask, since I
would expect a device to fit just a single configuration mode, and not
multiple modes.

Also, V4L2_CID_CONFIG_MODEL_COMMON_RAW applies only to sensors, right?
So this should be V4L2_CID_CONFIG_MODEL_SENSOR_COMMON_RAW. But what is
common about it and what is raw about it?

Isn't it the case that pretty much all sensor drivers fall into this
category?

The only reason I see for this is if there are actually other configuration
modes going to be added in the near future.

What I am missing in this RFC is a high-level view of why it is needed and
how it is going to be used.

Perhaps I missed a discussion on linux-media?

Regards,

	Hans

