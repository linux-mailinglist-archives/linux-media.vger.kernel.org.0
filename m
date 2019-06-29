Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED735AB7B
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 15:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfF2NTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 09:19:46 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:49441 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726723AbfF2NTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 09:19:45 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id hDGWhZ0ZIAOfNhDGZhfnVJ; Sat, 29 Jun 2019 15:19:43 +0200
Subject: Re: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl>
 <6794762.LFFAoRDyN6@z50> <afc93b30-f91a-2bf0-6793-08efca59a300@xs4all.nl>
 <1892813.ECJImQiLv2@z50>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <58a1ea38-622a-0ed1-2cd1-afe8b8268fbe@xs4all.nl>
Date:   Sat, 29 Jun 2019 15:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1892813.ECJImQiLv2@z50>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCfeqRhZo8XJKNfi41P1oUOKi3zvb8IhnBBy6+ZOpusRtK3Upw9AWltUvZi8ivoRQZK6x5Ucosij1Cer+P5WnZikXm2VO3q2NKnDPIaco/BSBcCmrWa6
 i3AEvv2Hh73fJ2kMaPE11jJl9wqd32r2q33SXlMljQW+PHx12PC4zc38jlpgb0m5yX1L5ilF/tyZijHCQn5b+pjjkKg0nnY/Hyq4vmwCZRAF8SnVeejMLqU0
 Y3d8uFSM/tjMDoxZKvOE9ioAR/IpPQ209TfQtM7E8LhFz0dzuVjWu4YT+AB3zXeh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/29/19 3:13 PM, Janusz Krzysztofik wrote:
> On Saturday, June 29, 2019 2:57:09 P.M. CEST Hans Verkuil wrote:
>> On 6/29/19 2:06 PM, Janusz Krzysztofik wrote:
>>> Hi Hans,
>>>
>>> On Saturday, June 29, 2019 12:00:24 P.M. CEST Hans Verkuil wrote:
>>>> sd->entity.graph_obj.mdev can be NULL when this function is called, and
>>>> that breaks existing drivers (rcar-vin, but probably others as well).
>>>>
>>>> Check if sd->entity.num_pads is non-zero instead since that doesn't
>>>> depend
>>>> on mdev.
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> Reported-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>> Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in
>>>> v4l2_subdev_call()") ---
>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c
>>>> b/drivers/media/v4l2-core/v4l2-subdev.c index 21fb90d66bfc..bc32fc1e0c0b
>>>> 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> @@ -124,16 +124,11 @@ static inline int check_which(__u32 which)
>>>>
>>>>  static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
>>>>  {
>>>>  #if defined(CONFIG_MEDIA_CONTROLLER)
>>>>
>>>> -	if (sd->entity.graph_obj.mdev) {
>>>> -		if (pad >= sd->entity.num_pads)
>>>> -			return -EINVAL;
>>>> -		return 0;
>>>> -	}
>>>> +	if (sd->entity.num_pads)
>>>
>>> This reverts a change introduced on Sakari's request in v7 of the series
>>> which is the source of the regression.  The intention was to fail if
>>> num_pads == 0 on a valid media entity. Maybe we should still keep that
>>> restriction and fail in case mdev is not NULL? In other words:
>>>
>>> -	if (sd->entity.num_pads)
>>> +	if (sd->entity.num_pads || sd->entity.graph_obj.mdev)
>>
>> If an entity has no pads, then it doesn't have pad ops either and this
>> function would never be called.
> 
> Unless this is a subdevice which doesn't support MC, was updated in the past 
> to use pad ops instead of depreciated video ops, so it actually has pad ops 
> even if it has num_pads == 0, and is built by a user with 
> CONFIG_MEDIA_CONTROLLER=y for some reason.

That's fine. Then it just checks if pad == 0, which is OK for such drivers.

The issue here is a MC-enabled subdev with pad ops, but that really has no pads
for some reason, so check_pad() would always have to return -EINVAL.

Regards,

	Hans

> 
> Thanks,
> Janusz
> 
>>
>>> Thanks,
>>> Janusz
>>>
>>>> +		return pad >= sd->entity.num_pads ? -EINVAL : 0;
>>>
>>> This and below look like coding style changes, not related strictly to the
>>> merit.  Shouldn't they rather be split into a separate patch?
>>
>> I'll post a v2, the diff is a lot smaller. I might post a follow-up patch
>> to use ? : since that's a lot shorter code.
>>
>> Regards,
>>
>> 	Hans
>>
>>> BTW, the current coding style follows original implementation of check_*
>>> functions present before that series was introduced.  Maybe it would be
>>> better to keep them unified, i.e., either as is or all updated with the
>>> new style.
>>>
>>> Thanks,
>>> Janusz
>>>
>>>>  #endif
>>>>  
>>>>  	/* allow pad 0 on subdevices not registered as media entities */
>>>>
>>>> -	if (pad > 0)
>>>> -		return -EINVAL;
>>>> -	return 0;
>>>> +	return pad ? -EINVAL : 0;
>>>>
>>>>  }
>>>>  
>>>>  static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)
> 
> 
> 
> 

