Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF28D3491EC
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 13:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhCYM15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 08:27:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36509 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231179AbhCYM1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 08:27:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PP5Ylc6odFRvvPP5clTFz8; Thu, 25 Mar 2021 13:27:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616675272; bh=q8yxGTvks7KlXC3n9I9su7D52645HX4CMsTOzP35TRQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=b2QjOaTzqeNdKleLs+XGUoBSN6V2jcdb7oTKrDO0Vpx7V9rmxbxWslyFs6DLtajbh
         +676uBU++MS9E09CGfS7XO6716XIHFvVjzITMOG7Ag2bRn/r91uBGuQbXawLxX+Q+k
         VGSys77/T2JqH3ovExl0Mred178+9K8jGjLFkTetvTTO1HbykjlLodTmgnyyV4ZOpz
         LCb/WffV9psHvIQLAYxt/FTB9ukLO+Ji+6makNvYlyhtud8gDdQ/mOtIXOhv7MIX/N
         lFM74+M22EYVFkecaX3mtXQ3QXno54BoGnEPVouNJ4d9NWRSusR+IfoNI+tVVO3879
         C/7Q5NurzB0GQ==
Subject: Re: [PATCH] uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <b1c94f21-4ae1-148c-fa5f-f9e4719049b9@xs4all.nl>
 <CAPybu_1qv67P6WQqXM6g1qr5=n7PPre3u0TJkkhk0wpWEG7F3Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ffaa3e0c-9137-91ee-b4e2-e64a3402aff8@xs4all.nl>
Date:   Thu, 25 Mar 2021 13:27:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAPybu_1qv67P6WQqXM6g1qr5=n7PPre3u0TJkkhk0wpWEG7F3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPEBEH65nqE5vy3Wz79uxyx0AU4/ZwHJujs5rVESidX8TbT1opu+lNry9pqARuVeGlIQBG1c2Bxdz+dR7JbXCk+czVzz3aoglxSnUrJG61YaA9jYK3MW
 Nijywl6G+uN68PXF6XnKPrlXJAUGjmqR0q4sxdtdS9gFbXe6n2/sDgDt1Fg0Ci5mGW1JqgTSwcwElTDrmpz9IV18/JS2H308kevmhgtnBYmXp0u/+zU17SY4
 S8lrhJIYydGZ5qEGABGrdr8Mtd90J+Yz1Ft5zHH0fXQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2021 16:29, Ricardo Ribalda Delgado wrote:
> Hi Hans
> 
> On Mon, Mar 22, 2021 at 1:06 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Check for inactive controls in uvc_ctrl_is_accessible().
>> Use the new value for the master_id controls if present,
>> otherwise use the existing value to determine if it is OK
>> to set the control. Doing this here avoids attempting to
>> set an inactive control, which will return an error from the
>> USB device.
> 
> Dont you think that this patch is not needed if this is used:
> https://patchwork.linuxtv.org/project/linux-media/patch/20210319170906.278238-17-ribalda@chromium.org/
> ?

That might well be the case :-)

I haven't really looked at that.

> 
> 
> Also Maybe it is wrong. (Maybe it is the keyword here ;).
> I think the initial assumption was that uvc_ctrl_is_accessible shall
> not access the hardware, but with this patch it is accessing it.

It's only accessing it if master_ctrl->loaded is 0 (see __uvc_ctrl_get()).
If loaded is 0, and __uvc_ctrl_get() returns an error, then that error is
ignored and the code will assume that the control is accessible.

Note that what we try to avoid is *setting* an inactive control. In this
case we're reading the master control, which should be safe except for
USB hardware problems that can return an error.

Regards,

	Hans

>>
>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>> ---
>> Ricardo: this can be added to your uvc series. It avoids attempts to set
>> inactive controls.
>> ---
>>  drivers/media/usb/uvc/uvc_ctrl.c | 28 +++++++++++++++++++++++++++-
>>  drivers/media/usb/uvc/uvc_v4l2.c |  4 ++--
>>  drivers/media/usb/uvc/uvcvideo.h |  3 ++-
>>  3 files changed, 31 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>> index d9d4add1e813..6e7b904bc33d 100644
>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>> @@ -1047,10 +1047,18 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>>  }
>>
>>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>> -                          bool read)
>> +                          const struct v4l2_ext_controls *ctrls,
>> +                          unsigned long ioctl)
>>  {
>> +       struct uvc_control_mapping *master_map = NULL;
>> +       struct uvc_control *master_ctrl = NULL;
>>         struct uvc_control_mapping *mapping;
>>         struct uvc_control *ctrl;
>> +       bool read = ioctl == VIDIOC_G_EXT_CTRLS;
>> +       bool try = ioctl == VIDIOC_TRY_EXT_CTRLS;
>> +       s32 val;
>> +       int ret;
>> +       int i;
>>
>>         if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
>>                 return -EACCES;
>> @@ -1065,6 +1073,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>>         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
>>                 return -EACCES;
>>
>> +       if (read || try || !mapping->master_id)
>> +               return 0;
>> +
>> +       for (i = ctrls->count - 1; i >= 0; i--)
>> +               if (ctrls->controls[i].id == mapping->master_id)
>> +                       return ctrls->controls[i].value ==
>> +                                       mapping->master_manual ? 0 : -EACCES;
>> +
>> +       __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
>> +                          &master_ctrl, 0);
>> +
>> +       if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
>> +               return 0;
>> +
>> +       ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>> +       if (ret >= 0 && val != mapping->master_manual)
>> +               return -EACCES;
>> +
>>         return 0;
>>  }
>>
>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>> index 12362e0f9870..e40db7ae18b1 100644
>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>> @@ -803,8 +803,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>>         int ret = 0;
>>
>>         for (i = 0; i < ctrls->count; ++ctrl, ++i) {
>> -               ret = uvc_ctrl_is_accessible(chain, ctrl->id,
>> -                                           ioctl == VIDIOC_G_EXT_CTRLS);
>> +               ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls,
>> +                                           ioctl);
>>                 if (ret)
>>                         break;
>>         }
>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>> index aedb4d3d4db9..8849d7953767 100644
>> --- a/drivers/media/usb/uvc/uvcvideo.h
>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>> @@ -869,7 +869,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>> -                          bool read);
>> +                          const struct v4l2_ext_controls *ctrls,
>> +                          unsigned long ioctl);
>>
>>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>>                       struct uvc_xu_control_query *xqry);
>> --
>> 2.30.0
>>
>>
> 
> 

