Return-Path: <linux-media+bounces-31461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D71BAA4D08
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 15:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8956B9E0FF6
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95171F1319;
	Wed, 30 Apr 2025 13:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="m2Pui0vF"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6363248F6D;
	Wed, 30 Apr 2025 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018225; cv=none; b=JjeYNvcwbJd1/fKCeBslYihRdkgVo4Q0GAnSUCCDxdY8l4WweNNDrMADExZnGhkv/Ys9Oe0Hg6nPpC1vaAMhfcVjq0L/5XvgyY8WBOpRdh+GgIIjb4N1T/O+U8NJarAcu+OQljpKfA9pztsFugxQG4Xmix1z7JftoeaSZynalxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018225; c=relaxed/simple;
	bh=ynNrsxZMUbC1OvLE/L8H30dMbT/qMgO/upg8N7H7jvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uftdehZp8Sg8aftcbhRbpwc3TeN8lQZBATvghp3F5S6Vk5IenRRq4aRpXgvzbmExC1eyVi89HG8qI0fTLdJKhmatVL1M4RKGM7OslN6Z331CxCkt15p0ZIZr+IewoBBlbST8SWm3e4b2V1FsK5GmzvWGyAs2RLHfh1nJUYVzoDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=m2Pui0vF; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4ZncnD1P1mzgYw;
	Wed, 30 Apr 2025 13:03:28 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4ZncnC0hjzz2xMR;
	Wed, 30 Apr 2025 13:03:27 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=m2Pui0vF;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1746018207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VFM0RB041q0dAMDNjmnwWuw/FnQHo7Zdmh0S5PpFvTA=;
	b=m2Pui0vFNsC+nVHdkI9qFYFAo5zI981mE2G3UlAHdAk5DPLL8wyfHT85olTBzY2eglRi6H
	hZtPnwCy/1OelnJTIVfLpju8pZqUESSOeju+xJRXnRBcRfoSDuH05R1HTp2APhHdfdmcgx
	BzlClPPxelzcvOfpdb/FPb+pZtjco5kCxxOAkVdnye7/eNIFskj7dnNb11n5YjG7LEO7zV
	L6TVmYSZqiVZlRpncv+6ykmIkSYhh2H1bMrEsDNDDT9vzqE8vZDyMLpj5zXbY7O9jFMO2E
	pAFG9DD2QIjczpqrfZ9V8QxyBXVD7XWntFtuDj1DwJNcoAuqUpgHd/pwC6/fYw==
X-CM-Envelope: MS4xfDOtHrS1D5h4G7ZWaFsFv70+NOSrakYSQEqPbphgS8ssuETTAV0cUYPahF4NsA3NNAtaIcA2bN2QDvCqpmHJOqtET/A/vZG1IEPUXAB+ourV9UncuJu0 IO9zZpwhaIOTlTo+4u0U21m1f2Y3m4F+kXqVC+UXeAjCASuUwZz3e5h2vbRM2KN+BCTAznE/JwsSC4OS9lcU0vYtBe37+Tdv+WSeqiB4/Z5zHk5vuV/ZksFK S+tUkdspJOSLLR35KPFxncQdzwXr+/TGJwF4IQz7dSWY3Mlg51hoUXkj7TG2vj5Ddk2IdWV2R+FFDvz+HRYET3Z79oLqrQV2CKldIyCxLghn7+2Q0OrqZnAt Br13avDkgveCskYdYpzDqA/WyRBvGqMFbLd2+OC9Oxw1e6n2zsk=
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=68121f9f a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=xOd6jRPJAAAA:8 a=n-v-m4S5FT9mcBT6AccA:9 a=QEXdDO2ut3YA:10
Message-ID: <ee6e4732-0d71-4e96-8832-f4251540fd53@jjverkuil.nl>
Date: Wed, 30 Apr 2025 15:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org>
 <58c84d4f-b750-4817-b2ee-4d749e99c94b@xs4all.nl>
 <CANiDSCtVs34-OGZaBsa2bixP8pMLKwwujKmQYLy_9cHYvT30dQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <CANiDSCtVs34-OGZaBsa2bixP8pMLKwwujKmQYLy_9cHYvT30dQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

Hi Ricardo,

Apologies, this got snowed under.

On 07/04/2025 16:39, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 7 Apr 2025 at 16:02, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Ricardo,
>>
>> Some more comments:
>>
>> On 03/04/2025 14:59, Ricardo Ribalda wrote:
>>> To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
>>> step and flags of the control. For some of the controls, this involves
>>> querying the actual hardware.
>>>
>>> Some non-compliant cameras produce errors when we query them. These
>>> error can be triggered every time, sometimes, or when other controls do
>>> not have the "right value". Right now, we populate that error to userspace.
>>> When an error happens, the v4l2 framework does not copy the v4l2_queryctrl
>>> struct to userspace. Also, userspace apps are not ready to handle any
>>> other error than -EINVAL.
>>>
>>> One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
>>> of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
>>> that usecase, a non-compliant control will make it almost impossible to
>>> enumerate all controls of the device.
>>>
>>> A control with an invalid max/min/step/flags is better than non being
>>> able to enumerate the rest of the controls.
>>>
>>> This patch:
>>> - Retries for an extra attempt to read the control, to avoid spurious
>>>   errors. More attempts do not seem to produce better results in the
>>>   tested hardware.
>>> - Makes VIDIOC_QUERYCTRL return 0 in all the error cases different than
>>>   -EINVAL.
>>> - Introduces a warning in dmesg so we can have a trace of what has happened
>>>   and sets the V4L2_CTRL_FLAG_DISABLED.
>>> - Makes sure we keep returning V4L2_CTRL_FLAG_DISABLED for all the next
>>>   attempts to query that control (other operations have the same
>>>   functionality as now).
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>> Hi 2*Hans and Laurent!
>>>
>>> I came around a device that was listing just a couple of controls when
>>> it should be listing much more.
>>>
>>> Some debugging later I found that the device was returning -EIO when
>>> all the focal controls were read.
>>>
>>> Lots of good arguments in favor/against this patch in the v1. Please
>>> check!
>>>
>>> Without this patch:
>>> $ v4l2-ctl --list-ctrls
>>> User Controls
>>>
>>>                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
>>>                        contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
>>>                      saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
>>>                             hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
>>>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>>>                           gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
>>>            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
>>>       white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
>>>
>>> With this patch:
>>> $ v4l2-ctl --list-ctrls
>>>
>>> User Controls
>>>
>>>                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
>>>                        contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
>>>                      saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
>>>                             hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
>>>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>>>                           gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
>>>            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
>>>       white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
>>>                       sharpness 0x0098091b (int)    : min=0 max=7 step=1 default=3 value=3
>>>          backlight_compensation 0x0098091c (int)    : min=0 max=2 step=1 default=1 value=1
>>> [   32.777643] usb 3-6: UVC non compliance: permanently disabling control 98091b (Sharpness), due to error -5
>>>
>>> Camera Controls
>>>
>>>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>>>          exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250 step=1 default=156 value=156 flags=inactive
>>>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
>>>                         privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
>>>    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
>>>   region_of_interest_auto_ctrls 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
>>
>> When you post a v8, remember to update the v4l2-ctl --list-ctrls output.
> 
> will do. Please note that the output is after --- so it will not be in
> git log. Let me know if I shall promote it.

It's fine after the ---.

> 
>>
>>>
>>> Emulating error with:
>>> +       if (cs == UVC_PU_SHARPNESS_CONTROL && query == UVC_GET_MAX) {
>>> +               printk(KERN_ERR "%s:%d %s\n", __FILE__, __LINE__, __func__);
>>> +               return -EIO;
>>> +       }
>>> In uvc_query_ctrl()
>>> ---
>>> Changes in v7:
>>> - Only retry on -EIO (Thanks Hans).
>>> - Add comment for retry (Thanks Hans).
>>> - Rebase patch
>>> - Check master_map->disabled before reading the master control.
>>> - Link to v6: https://lore.kernel.org/r/20250310-uvc-eaccess-v6-1-bf4562f7cabd@chromium.org
>>>
>>> Changes in v6:
>>> - Keep returning V4L2_CTRL_FLAG_DISABLED in future control queries.
>>> - Link to v5: https://lore.kernel.org/r/20250224-uvc-eaccess-v5-1-690d73bcef28@chromium.org
>>>
>>> Changes in v5:
>>> - Explain the retry in the commit message (Thanks Laurent).
>>> - Link to v4: https://lore.kernel.org/r/20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org
>>>
>>> Changes in v4:
>>> - Display control name (Thanks Hans)
>>> - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
>>>
>>> Changes in v3:
>>> - Add a retry mechanism during error.
>>> - Set V4L2_CTRL_FLAG_DISABLED flag.
>>> - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
>>>
>>> Changes in v2:
>>> - Never return error, even if we are not enumerating the controls
>>> - Improve commit message.
>>> - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
>>> ---
>>>  drivers/media/usb/uvc/uvc_ctrl.c | 53 ++++++++++++++++++++++++++++++++++------
>>>  drivers/media/usb/uvc/uvcvideo.h |  2 ++
>>>  2 files changed, 47 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>> index cbf19aa1d82374a08cf79b6a6787fa348b83523a..b41fed364d54aefd7da72c47197cf9d9e3c1b176 100644
>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>> @@ -1483,14 +1483,28 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>>>       return ~0;
>>>  }
>>>
>>> +/*
>>> + * Maximum retry count to avoid spurious errors with controls. Increase this
>>
>> Increase -> Increasing
>>
>>> + * value does no seem to produce better results in the tested hardware.
>>> + */
>>> +#define MAX_QUERY_RETRIES 2
>>> +
>>>  static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>>>                                     struct uvc_control *ctrl,
>>>                                     struct uvc_control_mapping *mapping,
>>>                                     struct v4l2_query_ext_ctrl *v4l2_ctrl)
>>>  {
>>>       if (!ctrl->cached) {
>>> -             int ret = uvc_ctrl_populate_cache(chain, ctrl);
>>> -             if (ret < 0)
>>> +             unsigned int retries;
>>> +             int ret;
>>> +
>>> +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
>>> +                     ret = uvc_ctrl_populate_cache(chain, ctrl);
>>> +                     if (ret != -EIO)
>>> +                             break;
>>> +             }
>>> +
>>> +             if (ret)
>>>                       return ret;
>>>       }
>>>
>>> @@ -1567,6 +1581,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>  {
>>>       struct uvc_control_mapping *master_map = NULL;
>>>       struct uvc_control *master_ctrl = NULL;
>>> +     int ret;
>>>
>>>       memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
>>>       v4l2_ctrl->id = mapping->id;
>>> @@ -1587,18 +1602,29 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>               __uvc_find_control(ctrl->entity, mapping->master_id,
>>>                                  &master_map, &master_ctrl, 0, 0);
>>>       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>>> +             unsigned int retries;
>>>               s32 val;
>>>               int ret;
>>>
>>>               if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
>>>                       return -EIO;
>>>
>>> -             ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
>>> +                     ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
>>> +                                          &val);
>>
>> I'd write this:
>>
>>                         if (ret < 0 && ret != -EIO)
>>                                 return ret;
>>
>> Without that you'll see the non compliance warning below, but that's not
>> what you want for non-EIO errors.
> 
> I am not sure about this one. If there is an error reading a master
> control you probably want to continue. Semantically it is similar to
> not finding the control or having invalid flags.  And in those two
> cases we move on.
> Also, I think there is some value for the warning. It is counter
> intuitive that query_ctrl for control X fails due to an error in
> control Y.

In the original code you just return the error as well, without a
warning.

I think for non-EIO errors you should just return. It can always be
changed later, for now I think we should stick close to the original
code.

It's really a matter of taste rather than right or wrong code.

Regards,

	Hans

> 
> Let me know what do you think.
> 
>>
>>> +                     if (ret != -EIO)
>>> +                             break;
>>> +             }
>>>
>>> -             if (val != mapping->master_manual)
>>> -                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>> +             if (ret < 0) {
>>> +                     dev_warn_ratelimited(&chain->dev->udev->dev,
>>> +                                          "UVC non compliance: Error %d querying master control %x (%s)\n",
>>> +                                          ret, master_map->id,
>>> +                                          uvc_map_get_name(master_map));
>>> +             } else {
>>> +                     if (val != mapping->master_manual)
>>> +                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>> +             }
>>>       }
>>>
>>>       v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
>>> @@ -1613,7 +1639,18 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>               return 0;
>>>       }
>>>
>>> -     return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
>>> +     ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
>>> +     if (ret && !mapping->disabled) {
>>> +             dev_warn(&chain->dev->udev->dev,
>>> +                      "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
>>> +                      mapping->id, uvc_map_get_name(mapping), ret);
>>> +             mapping->disabled = true;
>>> +     }
>>> +
>>> +     if (mapping->disabled)
>>> +             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
>>> +
>>> +     return 0;
>>>  }
>>>
>>>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..8e3753896d42baddcc2192057e8c5786ddd79fa8 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -134,6 +134,8 @@ struct uvc_control_mapping {
>>>       s32 master_manual;
>>>       u32 slave_ids[2];
>>>
>>> +     bool disabled;
>>> +
>>>       const struct uvc_control_mapping *(*filter_mapping)
>>>                               (struct uvc_video_chain *chain,
>>>                               struct uvc_control *ctrl);
>>>
>>> ---
>>> base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
>>> change-id: 20250403-uvc-eaccess-8f3666151830
>>>
>>> Best regards,
>>
>> Regards,
>>
>>         Hans
> 
> 
> 


