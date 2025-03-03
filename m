Return-Path: <linux-media+bounces-27401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C163A4C6EB
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7710B3A79D5
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA9D234990;
	Mon,  3 Mar 2025 16:16:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D73215193;
	Mon,  3 Mar 2025 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018564; cv=none; b=mgHYuyVIBxpNU8dFX+uCCxTm0XeenxVPCGnwW90lWkdOFCu8ZCJaUnARvHiiNfOB41y1TjpEK4RqRkHdBSJ4Il5gH5quXwjai5sw9/3YHambxvSoYnzllXgEL4nXuNcxs6DkSYBMp28PIP89LQvUeLF49YXh5qHGo8T9ePfbdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018564; c=relaxed/simple;
	bh=226GBRazPsQUlovXUlaIfleUlXMaCqSaJQkbVRe8mU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngsOsy4WahiQFwZzfshRvmhW6FOEW/gAnuHownpB5W001gb6CSIzhZE4SULklm6uq+YqgIDJ0FVwmqylRp7ZWl2tjpQKkGoqAhsw6/RLWc/Ahg7tWGySrr/wf0J3eMgmZ3bgVYRyceCut5/7XVDw8JEEKqItdi/H0zKL41qaOLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16772C4CED6;
	Mon,  3 Mar 2025 16:16:02 +0000 (UTC)
Message-ID: <0527dc72-ccc3-4f1f-a982-5bc8b2341c1a@xs4all.nl>
Date: Mon, 3 Mar 2025 17:16:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org>
 <20250223170319.GA2821@pendragon.ideasonboard.com>
 <CANiDSCv1HVu82D=PoJFu=XCQ97k_MM1dmYpufkUCiKpSgGRT9w@mail.gmail.com>
 <20250303151603.GD32048@pendragon.ideasonboard.com>
 <CANiDSCvQ2evpdfg5FYKBRB9ZNQ5Lfa8Sk-EJ4yNiQwB4OfFnKg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CANiDSCvQ2evpdfg5FYKBRB9ZNQ5Lfa8Sk-EJ4yNiQwB4OfFnKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2025 17:05, Ricardo Ribalda wrote:
> On Mon, 3 Mar 2025 at 16:16, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Mon, Feb 24, 2025 at 10:26:34AM +0100, Ricardo Ribalda wrote:
>>> On Sun, 23 Feb 2025 at 18:03, Laurent Pinchart wrote:
>>>> On Sat, Jan 11, 2025 at 09:57:21AM +0000, Ricardo Ribalda wrote:
>>>>> To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
>>>>> step and flags of the control. For some of the controls, this involves
>>>>> querying the actual hardware.
>>>>>
>>>>> Some non-compliant cameras produce errors when we query them. Right now,
>>>>> we populate that error to userspace. When an error happens, the v4l2
>>>>> framework does not copy the v4l2_queryctrl struct to userspace. Also,
>>>>> userspace apps are not ready to handle any other error than -EINVAL.
>>>>>
>>>>> One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
>>>>> of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
>>>>> that usecase, a non-compliant control will make it almost impossible to
>>>>> enumerate all controls of the device.
>>>>>
>>>>> A control with an invalid max/min/step/flags is better than non being
>>>>> able to enumerate the rest of the controls.
>>>>>
>>>>> This patch makes VIDIOC_QUERYCTRL return 0 in all the error cases
>>>>> different than -EINVAL, introduces a warning in dmesg so we can
>>>>> have a trace of what has happened and sets the V4L2_CTRL_FLAG_DISABLED.
>>>>>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>> Hi 2*Hans and Laurent!
>>>>>
>>>>> I came around a device that was listing just a couple of controls when
>>>>> it should be listing much more.
>>>>>
>>>>> Some debugging latter I found that the device was returning -EIO when
>>>>> all the focal controls were read.
>>>>>
>>>>> Lots of good arguments in favor/against this patch in the v1. Please
>>>>> check!
>>>>>
>>>>> Without this patch:
>>>>> $ v4l2-ctl --list-ctrls
>>>>>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>>>>>          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
>>>>>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
>>>>> region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
>>>>>
>>>>> With this patch:
>>>>> $ v4l2-ctl --list-ctrls
>>>>>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>>>>>          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
>>>>>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
>>>>> error 5 getting ext_ctrl Focus, Absolute
>>>>> error 5 getting ext_ctrl Focus, Automatic Continuous
>>>>>    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
>>>>> region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
>>>>> --
>>>>> ---
>>>>> Changes in v4:
>>>>> - Display control name (Thanks Hans)
>>>>> - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
>>>>>
>>>>> Changes in v3:
>>>>> - Add a retry mechanism during error.
>>>>
>>>> This needs to be explained in the commit message, including when/why it
>>>> helps, and why the retry count is 2.
>>>>
>>>>> - Set V4L2_CTRL_FLAG_DISABLED flag.
>>>>> - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
>>>>>
>>>>> Changes in v2:
>>>>> - Never return error, even if we are not enumerating the controls
>>>>> - Improve commit message.
>>>>> - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
>>>>> ---
>>>>>  drivers/media/usb/uvc/uvc_ctrl.c | 43 ++++++++++++++++++++++++++++++++--------
>>>>>  1 file changed, 35 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>>>> index 4e58476d305e..9d7812e8572d 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>>>> @@ -1280,6 +1280,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>>>>>       return ~0;
>>>>>  }
>>>>>
>>>>> +#define MAX_QUERY_RETRIES 2
>>>>> +
>>>>>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>>>       struct uvc_control *ctrl,
>>>>>       struct uvc_control_mapping *mapping,
>>>>> @@ -1305,19 +1307,44 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>>>               __uvc_find_control(ctrl->entity, mapping->master_id,
>>>>>                                  &master_map, &master_ctrl, 0);
>>>>>       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>>>>> +             unsigned int retries;
>>>>>               s32 val;
>>>>> -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> +             int ret;
>>>>>
>>>>> -             if (val != mapping->master_manual)
>>>>> -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>>>> +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
>>>>> +                     ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
>>>>> +                                          &val);
>>>>> +                     if (ret >= 0)
>>>>> +                             break;
>>>>> +             }
>>>>> +
>>>>> +             if (ret < 0) {
>>>>> +                     dev_warn_ratelimited(&chain->dev->udev->dev,
>>>>> +                                          "UVC non compliance: Error %d querying master control %x (%s)\n",
>>>>> +                                           ret, master_map->id,
>>>>> +                                           uvc_map_get_name(master_map));
>>>>> +             } else if (val != mapping->master_manual) {
>>>>> +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>>>> +             }
>>>>>       }
>>>>>
>>>>>       if (!ctrl->cached) {
>>>>> -             int ret = uvc_ctrl_populate_cache(chain, ctrl);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> +             unsigned int retries;
>>>>> +             int ret;
>>>>> +
>>>>> +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
>>>>> +                     ret = uvc_ctrl_populate_cache(chain, ctrl);
>>>>> +                     if (ret >= 0)
>>>>> +                             break;
>>>>> +             }
>>>>> +
>>>>> +             if (ret < 0) {
>>>>> +                     dev_warn_ratelimited(&chain->dev->udev->dev,
>>>>> +                                          "UVC non compliance: Error %d populating cache of control %x (%s)\n",
>>>>> +                                          ret, mapping->id,
>>>>> +                                          uvc_map_get_name(mapping));
>>>>> +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
>>>>
>>>> Can we make the control permanently disabled ?
>>>
>>> I'd rather not. In funky hardware the control might work with the
>>> right combination of other controls.
>>
>> That makes the behaviour random and therefore very confusing for
>> userspace. All of a sudden a control will start being available, even if
>> it was marked as disabled during enumeration.
> 
> Random weird hardware will have random behaviour. I think this is kind
> of expected.
> 
> Also there are probably lots of cameras in the field that cannot
> enumerate properly but are used by custom apps. We are going to break
> userspace if we enforce this.
> 
> Hans V. What do you think?

I agree with Laurent here. If this sometimes works, and sometimes it doesn't,
then what is an application going to do with that? I would start with just
permanently disabling this. If it turns out that for some hardware this works
with some magic combination of other controls values, then that feels more like
a quirk to me.

One note, though:

>>>>> +                     dev_warn_ratelimited(&chain->dev->udev->dev,
>>>>> +                                          "UVC non compliance: Error %d populating cache of control %x (%s)\n",
>>>>> +                                          ret, mapping->id,
>>>>> +                                          uvc_map_get_name(mapping));
>>>>> +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;

That warning is too cryptic. You want to clearly state in the kernel log
that this specific control is disabled due to UVC non compliance. E.g.:

                                          "UVC non-compliance: permanently disabling control %x (%s) due to error %d\n",

Regards,

	Hans

> 
>>
>>>>> +             }
>>>>>       }
>>>>>
>>>>>       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
>>>>>
>>>>> ---
>>>>> base-commit: c5aa327e10b194884a9c9001a751f6e4703bc3e3
>>>>> change-id: 20241213-uvc-eaccess-755cc061a360
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 


