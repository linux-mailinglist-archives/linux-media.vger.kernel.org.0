Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915AB20749C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 15:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403957AbgFXNbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 09:31:13 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51011 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403950AbgFXNbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 09:31:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o5UTjhTn1Nb6lo5UXjtYFd; Wed, 24 Jun 2020 15:31:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593005469; bh=MDEddShRHZ2kQyBZBQSICoZD5Jdb8Z94kNEjYu7s8DE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Y7MI90oFR2JYlXXzwNsONDV7XaAFWkwG/xyfFgI3Ol0igF6PjvcgQdrOLQPsm+c98
         M6fgZDDvgqM83xfHXdQqd2SjHIqQjsyrxszqCXg87sIYepKmTDwk9dOB15tApagnvB
         wWVOAYx9/KeCnunGkUKgJ3++d90kaw+x/0lJgp58sY2uGCMOyM27c61RNMhD08Z7KN
         wV8N44paRL79PrZABbKT6ylOIvOoBAbFbtgfdMOdMayfZlrytrO7JpVyiTXz6hDfA2
         DOW0n/MNg+CntALZbSWk+PkiJ9wNEqPZxSlmDi0uMgHKFDniPV2f0gOjsPnK5HVopc
         G350vPytAdIyw==
Subject: Re: [PATCH] media: rcar-vin: Move media_device_register to async
 completion
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Rodin <mrodin@de.adit-jv.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        Steve Longerbeam <steve_longerbeam@mentor.com>
References: <1592328696-84533-1-git-send-email-mrodin@de.adit-jv.com>
 <20200617105646.GB2850317@oden.dyn.berto.se>
 <20200617151537.GB88066@vmlxhi-121.adit-jv.com>
 <20200617152857.GA2936315@oden.dyn.berto.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <427325ff-e21f-91fd-6236-6d1f6615ca41@xs4all.nl>
Date:   Wed, 24 Jun 2020 15:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200617152857.GA2936315@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAVplMJPHvtR2aXNKfwkT4KgjUl73JGbwOXzs3eY1Rkn/wL4GbwHFIJmDehJwHa5ARGtdcYU6afiWeFGOLB6IsaMrnEfLn5AJEmjvmRCvulKGKnlhnU0
 5V/P/i4uOk+yDl2A2HXfOUxZgzVJXxvyAVV2c7+nX3LT8xxpd2sQflmdXNQysnM9om6O4oPtfLAF+5z0WV47mC8YGPMdfi92dMtpvMVe1/Tc0jcDn71sKEHJ
 2DOv6BokZ+htfdoOQDZYGuqj6AlC4rft2AQ7t0pqPS28KypTaJo6HFHDBHWZktW+NUGp89AqOauerGWjN2WfZHoKz24YE+B4wGxBP+6HQ/1Fl2AolQTj2p7+
 VlgUo2XuT3nEq68rMFuPqo1SRYBKMRN3YL0KAjhXUFAaO+qj1BvE51GDOHR0F9FIoCMI5ny+FX5BTddSfYhoIGL0L5LAkMusHuPvL8mGS5BfHDkBJXVT1PdY
 SAgvJ8lini11xCiEndLsldjhIfkXDLfr1aKKB1DcSiBtgXyRNfuxcvlsVP4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/06/2020 17:28, Niklas Söderlund wrote:
> Hi Michael,
> 
> On 2020-06-17 17:15:37 +0200, Michael Rodin wrote:
>> Hi Niklas and Steve,
>>
>> On Wed, Jun 17, 2020 at 12:56:46PM +0200, Niklas Söderlund wrote:
>>> Hi Michael and Steve,
>>>
>>> On 2020-06-16 19:31:36 +0200, Michael Rodin wrote:
>>>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>>
>>>> The media_device is registered during driver probe, before async
>>>> completion, so it is possible for .link_notify to be called before
>>>> all devices are bound.
>>>>
>>>> Fix this by moving media_device_register() to rvin_group_notify_complete().
>>>> This ensures that all devices are now bound (the rcar-csi2 subdevices and
>>>> and video capture devices) before .link_notify can be called.
>>>
>>> I'm curious to what situation created the need for this change. I'm 
>>> currently trying to take the VIN driver in the opposite direction [1] 
>>> with the end goal of registering video devices at probe time and then 
>>> allow the media graph to populate as devices becomes available.
>>
>> It looks like almost all platform drivers call media_device_register() in
>> the completion callback. From my understaning it is necessary to ensure
>> that all subdevices are bound and all links are created before the user
>> can enable any link (which would trigger link_notify callback execution)
>> and set formats. If I am not mistaken, Steve could observe an "OOPS" or
>> at least it is theoretically possible.
> 
> If an OOPS have been observed I would be interested to see it. That way 
> we can fix the OOPS and keep the media graph registration where it is 
> today.
> 
>>
>> Actually I found that this patch alone is not enough even if it is correct,
>> because we also have to register the media device in rvin_parallel_notify_complete()
>> in case if there is only a parallel video input device attached.
>>
>>> My reason for this is that we could have a functional pipeline inside 
>>> the graph even if it's not complete. This came out of the GMSL work done
>>> a while pack where I had a faulty camera that would prevent the other 7 
>>> in the system to function.
>>
>> I agree that if a probe of a faulty subdevice fails, this should not affect
>> functionality of the other attached subdevices. The "complete" callback of
>> the async notifier is probably not executed in this case, so I guess, we
>> would have to register the media device in the "bound" callback after the first
>> subdevice has been probed? Otherwise there is not much sense to have video
>> capture devices, which are not connected to any source.
> 
> Calling it in the bound callback is mostly the same as it is today, as 
> link_notify could then be called when not all entities are in the graph.  
> In fact even if we where tp move the media device registration to the t
> complete callback we have this problem if any of the subdevices are 
> unbound. Then we are back to the state with a registerd media device 
> where not all entities are present.
> 
> I think the solution here is to address the issue (if any) in the 
> link_notify callback when the graph is not fully populated.

As I have mentioned in other threads in this mailinglist (e.g.
https://www.spinics.net/lists/linux-media/msg171067.html), this is part
of a bigger problem: what to do if only part of a graph comes up, or
a part disappears. Today this is not supported.

It is certainly desirable to support this, but I want to see an RFC first
detailing the interaction with userspace. And remember that today the
expectation of applications is that device nodes are only created if all
components of the device probed successfully.

My preference is that rcar-vin is first changed to conform to current
expectations (i.e. /dev/mediaX is only registered at async completion).

After a proper discussion on how to handle partial initialization and
after we have a good plan, then this can be implemented in rcar-vin.

Note that I really want to support partial initialization, but I want
to see an RFC with a proper analysis and proposal first.

Regards,

	Hans

> 
>>
>> (Delayed) population of the media graph after media device registration
>> sounds also like a requirement for device tree overlay support, which would
>> also be a nice feature.
>>
>>> 1. [PATCH 0/5] media-device: Report if graph is complete
>>>
>>>>
>>>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
>>>> ---
>>>>  drivers/media/platform/rcar-vin/rcar-core.c | 14 ++++++--------
>>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
>>>> index 7440c89..e70f83b 100644
>>>> --- a/drivers/media/platform/rcar-vin/rcar-core.c
>>>> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
>>>> @@ -253,7 +253,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>  	struct media_device *mdev = &group->mdev;
>>>>  	const struct of_device_id *match;
>>>>  	struct device_node *np;
>>>> -	int ret;
>>>>  
>>>>  	mutex_init(&group->lock);
>>>>  
>>>> @@ -266,7 +265,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>  	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
>>>>  
>>>>  	mdev->dev = vin->dev;
>>>> -	mdev->ops = &rvin_media_ops;
>>>>  
>>>>  	match = of_match_node(vin->dev->driver->of_match_table,
>>>>  			      vin->dev->of_node);
>>>> @@ -278,11 +276,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>  
>>>>  	media_device_init(mdev);
>>>>  
>>>> -	ret = media_device_register(&group->mdev);
>>>> -	if (ret)
>>>> -		rvin_group_cleanup(group);
>>>> -
>>>> -	return ret;
>>>> +	return 0;
>>>>  }
>>>>  
>>>>  static void rvin_group_release(struct kref *kref)
>>>> @@ -688,6 +682,8 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>>>>  		return ret;
>>>>  	}
>>>>  
>>>> +	vin->group->mdev.ops = &rvin_media_ops;
>>>> +
>>>>  	/* Register all video nodes for the group. */
>>>>  	for (i = 0; i < RCAR_VIN_NUM; i++) {
>>>>  		if (vin->group->vin[i] &&
>>>> @@ -736,8 +732,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>>>>  		}
>>>>  	}
>>>>  	mutex_unlock(&vin->group->lock);
>>>> +	if (ret)
>>>> +		return ret;
>>>>  
>>>> -	return ret;
>>>> +	return media_device_register(&vin->group->mdev);
>>>>  }
>>>>  
>>>>  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>>>> -- 
>>>> 2.7.4
>>>>
>>>
>>> -- 
>>> Regards,
>>> Niklas Söderlund
>>
>> -- 
>> Best Regards,
>> Michael
> 

