Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450D4341E8E
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 14:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhCSNkz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 09:40:55 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40399 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229736AbhCSNk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 09:40:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id NFMTlY1KQ4XAGNFMXlNHmp; Fri, 19 Mar 2021 14:40:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616161225; bh=mF8H1HE6b/1XaRa5iajdbSqj9BvOGOGqp1iPW3aJqwU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZEh9dmTXR1l8rBs/ZwQI3446zGdLzIyV9vtt/k3FU8L7wd+E1b/4hmx0qP33wbd3Y
         ZgK/Oxj1XbF9+E4nRbZ/NyO1+/0erlaeaQP0uQTWfUtxNHLV7iQ8VgKuSgZE7NQNa2
         WZN6wS3ge4Y+K8FC74xe/iRst30s496bQNKAvbWrGAMqtm0TZRAMc4w4bvlbhNibxg
         iaDZiaBJ7jSpqKKJf8XvnN9Fz9RWis46d957tMN3w2chFS/8xGM4q5OIM0DC/8fftc
         qbU3oL/Pd1oCgVq/uIb5d4PqUTzIJRj5Bclp8+muQaP1tRb65sMyxZj+Gt340rluz6
         kk3NN/gxUCnkw==
Subject: Re: [PATCH v7 13/17] media: uvcvideo: Return -EACCES to inactive
 controls
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
 <20210318202928.166955-14-ribalda@chromium.org>
 <21b313b4-dbdf-c1bd-450d-723c601cb61a@xs4all.nl>
 <CANiDSCu2__2Ta6BcF24DC=+Cir1aO=QF5xsVK4-vkephbAXiSg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <03b2c4ff-5799-2bc8-38ec-49c37c2e311a@xs4all.nl>
Date:   Fri, 19 Mar 2021 14:40:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANiDSCu2__2Ta6BcF24DC=+Cir1aO=QF5xsVK4-vkephbAXiSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEpLv2GpF5iHm5BOehDmbrnzAbb+rLDm5MWhI378Gqk/BkFPBBBlHO4EtelaSNb227kwKJejJYytte4A9fuSLZ4sERvhDKZVRyo48Pq7DAh4qsfHgp9k
 RshaJvUTnzU/el5gOJgvgaGJukn64r7FMPDwsIaRgTQnTCAJbSB773oq+DJV9o2q/ujYQvX/b9suaNjZmp/3o+5O0eCkl2gK8/mDAM7KCyr3fqjvc3AP4+xK
 91YDysrVOm592kI7iLIVLG8UNx1dH2+1Qr2xi9IA8tG158ZxOW1+Z5pm7ISfomg5GL2GbhdpbwXFD5BIgEk9Fm8f1k/wsb7tFz5KshBi+SK/Su1M0Mex7cs2
 FNhdlZOOzqzhcO7qre82/5MlzgLY1JioYVfVwW08p7bmkunPUc77ypGrlu583ijNlKsp1deI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/03/2021 10:49, Ricardo Ribalda wrote:
> Hi Hans
> 
> Thanks for testing this.
> 
> 
> 
> 
> On Fri, Mar 19, 2021 at 10:10 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 18/03/2021 21:29, Ricardo Ribalda wrote:
>>> If a control is inactive return -EACCES to let the userspace know that
>>> the value will not be applied automatically when the control is active
>>> again.
>>>
>>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_ctrl.c | 68 ++++++++++++++++++++++----------
>>>  drivers/media/usb/uvc/uvc_v4l2.c | 11 +++++-
>>>  drivers/media/usb/uvc/uvcvideo.h |  2 +-
>>>  3 files changed, 58 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>> index 24fd5afc4e4f..1ec8333811bc 100644
>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>> @@ -1046,8 +1046,33 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>>>       return 0;
>>>  }
>>>
>>> +static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
>>> +                              struct uvc_control *ctrl,
>>> +                              struct uvc_control_mapping *mapping)
>>> +{
>>> +     struct uvc_control_mapping *master_map = NULL;
>>> +     struct uvc_control *master_ctrl = NULL;
>>> +     s32 val;
>>> +     int ret;
>>> +
>>> +     if (!mapping->master_id)
>>> +             return false;
>>> +
>>> +     __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
>>> +                        &master_ctrl, 0);
>>> +
>>> +     if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
>>> +             return false;
>>> +
>>> +     ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>>> +     if (ret < 0 || val == mapping->master_manual)
>>> +             return false;
>>> +
>>> +     return true;
>>> +}
>>
>> This doesn't work. The problem is that you need to test the new value for the
>> master control against master_manual, and you are testing against the old value.
>>
>> So for my uvc camera I have this situation after boot:
>>
>>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>>                                 1: Manual Mode
>>                                 3: Aperture Priority Mode
>>          exposure_time_absolute 0x009a0902 (int)    : min=3 max=2047 step=1 default=250 value=250 flags=inactive
>>
>> But trying to change both auto_exposure to manual AND set the new exposure_time_absolute
>> will fail:
>>
>> $ v4l2-ctl -c auto_exposure=1,exposure_time_absolute=251
>> VIDIOC_S_EXT_CTRLS: failed: Permission denied
>> Error setting controls: Permission denied
>>
>> This works though with the uvc driver as is currently in the kernel.
>>
>> Unfortunately, this is not something that is explicitly tested in v4l2-compliance.
>>
> 
> Can you try dropping this patch and relaying on  media: uvcvideo: Set
> error_idx during ctrl_commit errors ?

That doesn't work all that well. The uvc_query_ctrl() function is problematic:

1) It can return -EILSEQ where -EACCES is expected. Not a big deal, EACCES makes
   more sense here anyway.

2) It can return error code 6 (Invalid control), and then it returns -EIO. I'm not
   entirely clear why I get code 6, I haven't dug deep enough for that. If I
   change that to EACCES, then v4l2-compliance passes, but...

3) This function keeps spamming the "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n"
   error in the kernel log. In all fairness, the current kernel driver does the same, but
   with this patch it no longer does.

I think the uvc driver really has to check this. It doesn't have to be during the
validation step in uvc_ctrl_check_access(), it is fine if this check happens during
the commit phase.

I checked the UVC 1.5 spec and in 4.2.2.1.4 (Exposure Time (Absolute) Control) it says:

  When the Auto-Exposure Mode control is in Auto mode or Aperture Priority mode attempts
  to programmatically set this control shall result in a protocol STALL and an error code
  of bRequestErrorCode = “Wrong state”.

So the uvc driver should just detect this and avoid writing this control in such a case.

Regards,

	Hans

> 
> thanks!
> 
>> Regards,
>>
>>         Hans
>>
>>> +
>>>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>>> -                        bool read)
>>> +                        unsigned long ioctl)
>>>  {
>>>       struct uvc_control_mapping *mapping;
>>>       struct uvc_control *ctrl;
>>> @@ -1059,11 +1084,26 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>>>       if (!ctrl)
>>>               return -EINVAL;
>>>
>>> -     if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
>>> -             return -EACCES;
>>> -
>>> -     if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
>>> -             return -EACCES;
>>> +     switch (ioctl) {
>>> +     case VIDIOC_G_CTRL:
>>> +     case VIDIOC_G_EXT_CTRLS:
>>> +             if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
>>> +                     return -EACCES;
>>> +             break;
>>> +     case VIDIOC_S_EXT_CTRLS:
>>> +     case VIDIOC_S_CTRL:
>>> +             if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>>> +                     return -EACCES;
>>> +             if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
>>> +                     return -EACCES;
>>> +             break;
>>> +     case VIDIOC_TRY_EXT_CTRLS:
>>> +             if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>>> +                     return -EACCES;
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>>
>>>       return 0;
>>>  }
>>> @@ -1087,8 +1127,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>       struct uvc_control_mapping *mapping,
>>>       struct v4l2_queryctrl *v4l2_ctrl)
>>>  {
>>> -     struct uvc_control_mapping *master_map = NULL;
>>> -     struct uvc_control *master_ctrl = NULL;
>>>       const struct uvc_menu_info *menu;
>>>       unsigned int i;
>>>
>>> @@ -1104,18 +1142,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>>>               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>
>>> -     if (mapping->master_id)
>>> -             __uvc_find_control(ctrl->entity, mapping->master_id,
>>> -                                &master_map, &master_ctrl, 0);
>>> -     if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>>> -             s32 val;
>>> -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> -
>>> -             if (val != mapping->master_manual)
>>> -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>> -     }
>>> +     if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
>>> +             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>>
>>>       if (!ctrl->cached) {
>>>               int ret = uvc_ctrl_populate_cache(chain, ctrl);
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index fbb99f3c2fb4..ddebdeb5a81b 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -999,6 +999,10 @@ static int uvc_ioctl_g_ctrl(struct file *file, void *fh,
>>>       struct v4l2_ext_control xctrl;
>>>       int ret;
>>>
>>> +     ret = uvc_ctrl_is_accessible(chain, ctrl->id, VIDIOC_G_CTRL);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>       memset(&xctrl, 0, sizeof(xctrl));
>>>       xctrl.id = ctrl->id;
>>>
>>> @@ -1023,6 +1027,10 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
>>>       struct v4l2_ext_control xctrl;
>>>       int ret;
>>>
>>> +     ret = uvc_ctrl_is_accessible(chain, ctrl->id, VIDIOC_S_CTRL);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>       memset(&xctrl, 0, sizeof(xctrl));
>>>       xctrl.id = ctrl->id;
>>>       xctrl.value = ctrl->value;
>>> @@ -1054,8 +1062,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>>>       int ret = 0;
>>>
>>>       for (i = 0; i < ctrls->count; ++ctrl, ++i) {
>>> -             ret = uvc_ctrl_is_accessible(chain, ctrl->id,
>>> -                                         ioctl == VIDIOC_G_EXT_CTRLS);
>>> +             ret = uvc_ctrl_is_accessible(chain, ctrl->id, ioctl);
>>>               if (ret)
>>>                       break;
>>>       }
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index 9471c342a310..a93aeedb5499 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -903,7 +903,7 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>>>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>>>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>>>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>>> -                        bool read);
>>> +                        unsigned long ioctl);
>>>
>>>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>>>                     struct uvc_xu_control_query *xqry);
>>>
>>
> 
> 

