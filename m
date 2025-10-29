Return-Path: <linux-media+bounces-45932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79268C199EE
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 11:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D33F4273DB
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 10:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BDF2E0B5A;
	Wed, 29 Oct 2025 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbwITu6B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303FB2D7386
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732835; cv=none; b=VRrwE/EU+yZhA9yS10MAmq/JO0PUSFSGqWuk30bdwPzFiltqvBvT8YcTHZai60Z9usRK6RayJEUqatJjmx1UWVvjfZqsRxInvEw7gR2fA0NOr8dUU2qH/VMRZIzU59tbLVZCU6ValQzafATyLQV+Hw/OrawqVxZprMc/dzGCpXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732835; c=relaxed/simple;
	bh=/uOjIZDAPBaVJsxsI4VZ0muO9PH3PjJWm3lmzAcOQSI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oIJUj2GLkWTs6v6xPHhQ3D6gqljE91jPtttIREZx0Em2WisnNwU/+vfYt82IBNCwoNJlaw6V3nLgMUIx2IaPBhKgWxEXrBy2dtHxxh0zdc1FS9o3i3/8W+RsvuaWB486tso7RHncycMHalwF7wI8Pqyj0wdu0ZGNGp3AWWyFrto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbwITu6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A64FC4CEF7;
	Wed, 29 Oct 2025 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761732834;
	bh=/uOjIZDAPBaVJsxsI4VZ0muO9PH3PjJWm3lmzAcOQSI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=qbwITu6B/lGFmM6mAVcuHr6cbsvxTfe8GFd4weoMHT4QjMwq+pv059kE2T+BUtOVc
	 6J4eBqErEGK9jHvQ+HC4c8MWqn/L1BW+h9LFbsMvnIqOVoLITGgESJad8ZhpF2L+Di
	 3r88MaEprSTMZVfrqMxgbf1tI9zXApOVbi/oXXT4/tXJgpPmypRvzXKH1SLLxSUxEr
	 oeJkr8gKXyZqAaIhxuBYBEPvkdbTt4KF1DiiZFwBux336lqHHsrwFv5tAKviq1kp0C
	 xdRwYntXtIxJPCJPYkNGWMeRN8RQ/7Aqw9ACUk81SwurTvQel0aDFwj7wFZNRPAnQN
	 6xoTc7d570pSw==
Message-ID: <a649f02a-563a-4c3a-afb3-469d40df03a4@kernel.org>
Date: Wed, 29 Oct 2025 11:13:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils] v4l2-compliance: Fix test for UVC USER controls
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
References: <20251028-uvc-fix-v1-1-dfcc504ff8e2@chromium.org>
 <968fc56f-268f-4b2d-8f99-01fa886b524e@kernel.org>
 <CANiDSCtjitQqziDnGbAcxHNSqkp78w74OTvqz=tijgZ3KxoSnQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCtjitQqziDnGbAcxHNSqkp78w74OTvqz=tijgZ3KxoSnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2025 10:37, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Wed, 29 Oct 2025 at 10:10, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>> On 28/10/2025 18:45, Ricardo Ribalda wrote:
>>> v4l2-compliance only supports priv_user_controls which id starts from
>>> CID_PRIV_BASE and are contiguous; or compound controls. This is not
>>> enough for UVC:
>>>
>>> The UVC driver exposes two controls V4L2_CID_UVC_REGION_OF_INTEREST_RECT
>>> and V4L2_CID_UVC_REGION_OF_INTEREST_AUTO and reserve space for 62 more.
>>>
>>> Make v4l2-compliance aware of them.
>>>
>>> With this patch the following v4l2-compliance is fixed:
>>>
>>> fail: v4l2-test-controls.cpp(326): expected 1 private controls, got 0
>>>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  utils/v4l2-compliance/v4l2-test-controls.cpp | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> index e4925ca3977b5b87a6a8e9ad5794847fa7009e50..6f645c4f9aca94a4ef586b11d6fd11268f1bf195 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> @@ -316,6 +316,22 @@ int testQueryExtControls(struct node *node)
>>>               priv_user_controls++;
>>>       }
>>>
>>> +     for (id = V4L2_CID_USER_UVC_BASE; id < V4L2_CID_USER_UVC_BASE + 64; id++) {
>>> +             memset(&qctrl, 0xff, sizeof(qctrl));
>>> +             qctrl.id = id;
>>> +             ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
>>> +             if (ret && ret != EINVAL)
>>> +                     return fail("invalid query_ext_ctrl return code (%d)\n", ret);
>>> +             if (ret)
>>> +                     continue;
>>> +             if (qctrl.id != id)
>>> +                     return fail("qctrl.id (%08x) != id (%08x)\n", qctrl.id, id);
>>> +             if (checkQCtrl(node, qctrl))
>>> +                     return fail("invalid control %08x\n", qctrl.id);
>>> +             if (qctrl.type < V4L2_CTRL_COMPOUND_TYPES)
>>> +                     priv_user_controls++;
>>> +     }
>>> +
>>
>> Ah, no, this is wrong.
>>
>> So a long, long time ago there were only standard integer type controls and driver
>> private controls. The latter started at V4L2_CID_PRIVATE_BASE.
>>
>> The problem with that was that different drivers supported controls with the same
>> ID (V4L2_CID_PRIVATE_BASE + offset), but very different meaning.
>>
>> When I created the control framework, I defined that drivers should use ranges of
>> controls IDs instead ensuring that control IDs would always be unique. Those are
>> reserved in v4l2-controls.h, in the case of UVC they start at V4L2_CID_USER_UVC_BASE.
>> And you can enumerate them using V4L2_CTRL_FLAG_NEXT_CTRL.
>>
>> But to preserve backwards compatibility with existing applications that do not support
>> V4L2_CTRL_FLAG_NEXT_CTRL, the control framework maps those private ranges to
>> V4L2_CID_PRIVATE_BASE. See find_private_ref in drivers/media/v4l2-core/v4l2-ctrls-core.c.
>> This will just find the nth driver private user control that is not a compound control.
>>
>> Drivers don't need to do anything, it's all done by the control framework.
>>
>> In the case of UVC there is one such control: V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>>
>> So v4l2-compliance expects that when querying controls from V4L2_CID_PRIVATE_BASE
>> onwards, it will see one control with ID V4L2_CID_PRIVATE_BASE.
>>
>> But it doesn't, since UVC doesn't support this backwards compatibility code.
>>
>> There are two options: UVC can support this old way of working as well, or
>> v4l2-compliance skips this check for uvc. I'm inclined to just skip it for uvc.
>>
>> This patch should do this:
> 
> Thanks for the detailed explanation.
> 
> What about landing your proposal and then I start to work to fix uvc
> to support V4L2_CID_PRIVATE_BASE ?
> After I add support for V4L2_CID_PRIVATE_BASE we will revert your quirk.

I don't think we should spend time on adding support for that in uvc. It never
needed to support it, and the two new private controls that were added require
that userspace supports compound controls anyway, so they won't use
V4L2_CID_PRIVATE_BASE.

There are more uvc quirks in v4l2-compliance, so I'm fine with adding another
one.

To be honest, I'd love to remove V4L2_CID_PRIVATE_BASE completely, but I'm sure
there are still old apps in use that need it.

> 
> If we go that path. Do I need to resend a v2 with your code?

I'll post the patch, but I'd like a Tested-by from you with the UVC device
that caused the problem in the first place.

Regards,

	Hans

> 
> Thanks!
> 
>>
>> [PATCH] v4l2-compliance: skip V4L2_CID_PRIVATE_BASE check for UVC
>>
>> UVC doesn't support V4L2_CID_PRIVATE_BASE, so skip the check.
>>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
>> index e4925ca3..73a6a3be 100644
>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
>> @@ -321,6 +321,9 @@ int testQueryExtControls(struct node *node)
>>         if (user_controls != user_controls_check)
>>                 return fail("expected %d user controls, got %d\n",
>>                         user_controls_check, user_controls);
>> +       /* UVC doesn't support V4L2_CID_PRIVATE_BASE */
>> +       if (is_uvcvideo)
>> +               priv_user_controls_check = 0;
>>         if (priv_user_controls != priv_user_controls_check)
>>                 return fail("expected %d private controls, got %d\n",
>>                         priv_user_controls_check, priv_user_controls);
>>
>>
>> Regards,
>>
>>         Hans
>>
>>>       if (priv_user_controls + user_controls && node->controls.empty())
>>>               return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
>>>       if (user_controls != user_controls_check)
>>>
>>> ---
>>> base-commit: 796dc550a682e8f65fe6457cd5fec5ee123f39aa
>>> change-id: 20251028-uvc-fix-a8ce84e198f4
>>>
>>> Best regards,
>>
> 
> 


