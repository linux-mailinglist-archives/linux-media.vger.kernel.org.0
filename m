Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5AE1FD439
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 20:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgFQSSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 14:18:17 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:38194 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbgFQSSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 14:18:16 -0400
IronPort-SDR: efYVrKFao1abJfgAjuK3Z7ZhcR4PPWKob2D0Sc0JUt0fxhdrIifeNFsfw4j787EcYLyq0puyF2
 8SuFunk0L7IEehqBId+wX9i+j/VH5Yv2fLbyYDwXquJteTC8znMTAMj+UOSMnJ/R3Vd9uDEGmI
 VuNJOv7wXFdQ6KzOc4d80QFvy17O9dySPk22vdYYoQfaZ5OyGCIrpDYhQ5ZYiCeneAYwUFqecg
 /tE6vIdEEjJdrpNVhvr+PhJAI6/88xeUDSb0U/MoY2bJJ4/UCr//4NX9EA429+iiUpInuti+/4
 vj0=
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; 
   d="scan'208";a="49938173"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 17 Jun 2020 10:18:15 -0800
IronPort-SDR: wGbn1KzcJ5/BWQql3TKTC64LOt6hWVJy0IhGWCQ5oxSBO0w2LzdQodM1mTQSpcGF+INKHZcuId
 KbyDtj0Fjq+skL/iCZOkpSXdtR/vvNTtgkXY7JTt4XvnTA8VvPnT5pxJfgeysIA8a/nf8Q8HQ+
 nCx+d7eNxggs0e3Tmyp9HjQ9okWZJDcmruAYLUiZtC56+mMtR3Kdzm1ZH63sZ+d5pE1fdZiuqL
 EzvPW4lbnxHIjaDIeKJOSxg5BaglbmWhF611PqhKVu5Oa8MBy+EMfyRQgtMCGS/mpBfpzj+urO
 HPM=
Subject: Re: [PATCH] media: rcar-vin: Move media_device_register to async
 completion
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Rodin <mrodin@de.adit-jv.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>
References: <1592328696-84533-1-git-send-email-mrodin@de.adit-jv.com>
 <20200617105646.GB2850317@oden.dyn.berto.se>
 <20200617151537.GB88066@vmlxhi-121.adit-jv.com>
 <20200617152857.GA2936315@oden.dyn.berto.se>
From:   Steve Longerbeam <steve_longerbeam@mentor.com>
Message-ID: <888de4f6-3d89-5b74-750c-376173404832@mentor.com>
Date:   Wed, 17 Jun 2020 11:18:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617152857.GA2936315@oden.dyn.berto.se>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Michael,

On 6/17/20 8:28 AM, Niklas Söderlund wrote:
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
>>> I'm curious to what situation created the need for this change. I'm
>>> currently trying to take the VIN driver in the opposite direction [1]
>>> with the end goal of registering video devices at probe time and then
>>> allow the media graph to populate as devices becomes available.
>> It looks like almost all platform drivers call media_device_register() in
>> the completion callback. From my understaning it is necessary to ensure
>> that all subdevices are bound and all links are created before the user
>> can enable any link (which would trigger link_notify callback execution)
>> and set formats. If I am not mistaken, Steve could observe an "OOPS" or
>> at least it is theoretically possible.
> If an OOPS have been observed I would be interested to see it. That way
> we can fix the OOPS and keep the media graph registration where it is
> today.

It's been a long time since I looked at this on a Salvator-X. But I do 
remember there was an OOPS if an attempt was made to enable a link 
before all devices had bound. Unfortunately I no longer have access to 
RCAR h/w to prove this point.

>> Actually I found that this patch alone is not enough even if it is correct,
>> because we also have to register the media device in rvin_parallel_notify_complete()
>> in case if there is only a parallel video input device attached.
>>
>>> My reason for this is that we could have a functional pipeline inside
>>> the graph even if it's not complete. This came out of the GMSL work done
>>> a while pack where I had a faulty camera that would prevent the other 7
>>> in the system to function.
>> I agree that if a probe of a faulty subdevice fails, this should not affect
>> functionality of the other attached subdevices. The "complete" callback of
>> the async notifier is probably not executed in this case, so I guess, we
>> would have to register the media device in the "bound" callback after the first
>> subdevice has been probed? Otherwise there is not much sense to have video
>> capture devices, which are not connected to any source.
> Calling it in the bound callback is mostly the same as it is today, as
> link_notify could then be called when not all entities are in the graph.
> In fact even if we where tp move the media device registration to the t
> complete callback we have this problem if any of the subdevices are
> unbound. Then we are back to the state with a registerd media device
> where not all entities are present.
>
> I think the solution here is to address the issue (if any) in the
> link_notify callback when the graph is not fully populated.

I like the idea of allowing a functional pipeline without all devices 
bound. So I understand the desire to keep media device registration in 
probe.

So in that case I agree link_notify should be fixed if it still needs 
fixing to handle non-bound subdevices.

Steve

>> (Delayed) population of the media graph after media device registration
>> sounds also like a requirement for device tree overlay support, which would
>> also be a nice feature.
>>
>>> 1. [PATCH 0/5] media-device: Report if graph is complete
>>>
>>>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
>>>> ---
>>>>   drivers/media/platform/rcar-vin/rcar-core.c | 14 ++++++--------
>>>>   1 file changed, 6 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
>>>> index 7440c89..e70f83b 100644
>>>> --- a/drivers/media/platform/rcar-vin/rcar-core.c
>>>> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
>>>> @@ -253,7 +253,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>   	struct media_device *mdev = &group->mdev;
>>>>   	const struct of_device_id *match;
>>>>   	struct device_node *np;
>>>> -	int ret;
>>>>   
>>>>   	mutex_init(&group->lock);
>>>>   
>>>> @@ -266,7 +265,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>   	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
>>>>   
>>>>   	mdev->dev = vin->dev;
>>>> -	mdev->ops = &rvin_media_ops;
>>>>   
>>>>   	match = of_match_node(vin->dev->driver->of_match_table,
>>>>   			      vin->dev->of_node);
>>>> @@ -278,11 +276,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>   
>>>>   	media_device_init(mdev);
>>>>   
>>>> -	ret = media_device_register(&group->mdev);
>>>> -	if (ret)
>>>> -		rvin_group_cleanup(group);
>>>> -
>>>> -	return ret;
>>>> +	return 0;
>>>>   }
>>>>   
>>>>   static void rvin_group_release(struct kref *kref)
>>>> @@ -688,6 +682,8 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>>>>   		return ret;
>>>>   	}
>>>>   
>>>> +	vin->group->mdev.ops = &rvin_media_ops;
>>>> +
>>>>   	/* Register all video nodes for the group. */
>>>>   	for (i = 0; i < RCAR_VIN_NUM; i++) {
>>>>   		if (vin->group->vin[i] &&
>>>> @@ -736,8 +732,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>>>>   		}
>>>>   	}
>>>>   	mutex_unlock(&vin->group->lock);
>>>> +	if (ret)
>>>> +		return ret;
>>>>   
>>>> -	return ret;
>>>> +	return media_device_register(&vin->group->mdev);
>>>>   }
>>>>   
>>>>   static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>>>> -- 
>>>> 2.7.4
>>>>
>>> -- 
>>> Regards,
>>> Niklas Söderlund
>> -- 
>> Best Regards,
>> Michael

