Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5AF5AB4F
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 15:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfF2NI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 09:08:29 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:54607 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726723AbfF2NI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 09:08:28 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id hD5bhYxNEAOfNhD5ehfmWx; Sat, 29 Jun 2019 15:08:26 +0200
Subject: Re: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl>
 <6794762.LFFAoRDyN6@z50> <afc93b30-f91a-2bf0-6793-08efca59a300@xs4all.nl>
Message-ID: <a4d4f164-0b9d-0917-3a48-fc97ae6730bf@xs4all.nl>
Date:   Sat, 29 Jun 2019 15:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <afc93b30-f91a-2bf0-6793-08efca59a300@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJViUG6/leQsQpIqIJLb+rOtzjHo3EMddl1gvs9aR+W/WzHv0uk+xcn7+WQSJtEIWngdiBMFmLuL4gfpoMHkkT60oQz1aiQlj1xm/8CSoAUQxCvzv0Sk
 v7uNlQQj+t/g7V9lPjmQmg1o7GzLIJ3ws5S1e+zAoG+bWQjsK08lSgHiXRg7GaNTv/jVJnfOH3myFZxaPZEltVDPOa7UPnOjpDoJROvH2wXtI/dG5bLpJKfl
 8BTEQCFwalS7BDIQKd/RymPjrrRCxThGOzf3UYXQ+GNv5JApaRgOaEJ5BZjq7ePm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/29/19 2:57 PM, Hans Verkuil wrote:
> On 6/29/19 2:06 PM, Janusz Krzysztofik wrote:
>> Hi Hans,
>>
>> On Saturday, June 29, 2019 12:00:24 P.M. CEST Hans Verkuil wrote:
>>> sd->entity.graph_obj.mdev can be NULL when this function is called, and
>>> that breaks existing drivers (rcar-vin, but probably others as well).
>>>
>>> Check if sd->entity.num_pads is non-zero instead since that doesn't depend
>>> on mdev.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Reported-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in
>>> v4l2_subdev_call()") ---
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c
>>> b/drivers/media/v4l2-core/v4l2-subdev.c index 21fb90d66bfc..bc32fc1e0c0b
>>> 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -124,16 +124,11 @@ static inline int check_which(__u32 which)
>>>  static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
>>>  {
>>>  #if defined(CONFIG_MEDIA_CONTROLLER)
>>> -	if (sd->entity.graph_obj.mdev) {
>>> -		if (pad >= sd->entity.num_pads)
>>> -			return -EINVAL;
>>> -		return 0;
>>> -	}
>>> +	if (sd->entity.num_pads)
>>
>> This reverts a change introduced on Sakari's request in v7 of the series which 
>> is the source of the regression.  The intention was to fail if num_pads == 0 
>> on a valid media entity. Maybe we should still keep that restriction and fail 
>> in case mdev is not NULL? In other words: 
>>
>> -	if (sd->entity.num_pads)
>> +	if (sd->entity.num_pads || sd->entity.graph_obj.mdev)
> 
> If an entity has no pads, then it doesn't have pad ops either and this function
> would never be called.

Sakari, do you think it is ever possible that an entity may have pad ops,
but num_pads goes at some point to 0?

If so, then we can check for sd->entity.function != 0. All MC subdevs must
set that to a non-0 value, otherwise the core will issue a WARN_ON. I think
it is the only reliable indicator that can be used.

Regards,

	Hans

> 
>>
>> Thanks,
>> Janusz
>>
>>> +		return pad >= sd->entity.num_pads ? -EINVAL : 0;
>>
>> This and below look like coding style changes, not related strictly to the 
>> merit.  Shouldn't they rather be split into a separate patch?
> 
> I'll post a v2, the diff is a lot smaller. I might post a follow-up patch
> to use ? : since that's a lot shorter code.
> 
> Regards,
> 
> 	Hans
> 
>>
>> BTW, the current coding style follows original implementation of check_* 
>> functions present before that series was introduced.  Maybe it would be better 
>> to keep them unified, i.e., either as is or all updated with the new style.
>>
>> Thanks,
>> Janusz
>>
>>>  #endif
>>>  	/* allow pad 0 on subdevices not registered as media entities */
>>> -	if (pad > 0)
>>> -		return -EINVAL;
>>> -	return 0;
>>> +	return pad ? -EINVAL : 0;
>>>  }
>>>
>>>  static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)
>>
>>
>>
>>
> 

