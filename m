Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF523389F8
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 11:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbhCLKWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 05:22:41 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40345 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233115AbhCLKWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 05:22:12 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Kevnl0ia94ywlKevql2hzR; Fri, 12 Mar 2021 11:22:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615544531; bh=hQ+mvPTmQ0oWMVkgCyVT/37yrCrRXvi436NretDxUb8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BkIlDsBSXEz6NexgSd9yi9uf7m8rKUhjYNskCDnGU+Zgy8hIjEb6NovdtxgPJhM5/
         1OsYfBFBl31UoyTgcOypxE3XYCke5JCc/YKAuNsk8QmNhHV8gyPFMoHkEuI8UnX09X
         GdVut2wJvyFvszVAZZ1JJNFNxhhooc6zd8hD3Np3+tI1DNkqndVQSrUOO/P/lZStEp
         UwPE6R9X1cUgH47JWqxyqZZaSRmge/KEiXnrbqMjRLle+WvMbn9SzmWMEHYD2+4YAZ
         TNXQwcTmqwFPn3Zni5rYr1MLsESgm+vKn/9vqSuZ/PGbIkttVpkRlF7kRTaYwsiW6D
         FdWSqk4UbBcPQ==
Subject: Re: [PATCH v2 5/6] media: uvcvideo: Add support for
 V4L2_CTRL_TYPE_CTRL_CLASS
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-6-ribalda@chromium.org>
 <YErCElYk7YhB7dvp@pendragon.ideasonboard.com>
 <CAPybu_2tu_=1HtC1Cfr86uP1A367hnfvO0KXmCbGaYUJ1A2X2Q@mail.gmail.com>
 <YEs+3fh2zUAeeBQy@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3e03ae6c-b586-c314-b015-9b3b5de8fd04@xs4all.nl>
Date:   Fri, 12 Mar 2021 11:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEs+3fh2zUAeeBQy@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBjvHC2dXgRtJBa7KPt7Mxw9Ub9WiRzTFWjfCD3YYzPi0ro1pHSNl59rwya1HFQIkc6OdmmkJEXsjEQqdxH27+V4726AteajROe9C4Fg7K8f7lvli1QL
 ElAazrrrIeSEbu2ffMaZePQ2VxmrTDn8syPRV7aYY2PARvIV2Z7L2MfnWBh0ZLKBa6k96f9M/FXWOOk/RN1LrICvibnusKwoehTqNA5d84nr8nXtnLUIz9oP
 +B8OPNaOdh6KuFvqiwvmJpow5xmB78duil4N0jdiT/vUDpcGLjFmqWHN3Z82y8xVda04fjHyFJM3pxsf3sDECB10E4wtcQpWxJknaTF2JQFhSCXvdALof2+c
 79lpmrqYBeoa/gzvenkFnRXnKob7RLb7V5/uxtZ8QkxpF2Yj1DsdvQTIRMUZjgkXZBSFQk1aEItd4m1dAHBXacgkak9MAw9BYTajWDrU5nY6ygN3a44=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/03/2021 11:13, Laurent Pinchart wrote:
> Hi Ricardo,
> 
> On Fri, Mar 12, 2021 at 10:57:33AM +0100, Ricardo Ribalda Delgado wrote:
>> On Fri, Mar 12, 2021 at 2:25 AM Laurent Pinchart wrote:
>>> On Thu, Mar 11, 2021 at 11:19:45PM +0100, Ricardo Ribalda wrote:
>>>> Create all the class controls for the device defined controls.
>>>>
>>>> Fixes v4l2-compliance:
>>>> Control ioctls (Input 0):
>>>>               fail: v4l2-test-controls.cpp(216): missing control class for class 00980000
>>>>               fail: v4l2-test-controls.cpp(216): missing control tclass for class 009a0000
>>>>       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
>>>>
>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>> ---
>>>>  drivers/media/usb/uvc/uvc_ctrl.c | 90 ++++++++++++++++++++++++++++++++
>>>>  drivers/media/usb/uvc/uvcvideo.h |  7 +++
>>>>  2 files changed, 97 insertions(+)
>>>>
>>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>>> index b3dde98499f4..4e0ed2595ae9 100644
>>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>>> @@ -357,6 +357,17 @@ static const struct uvc_control_info uvc_ctrls[] = {
>>>>       },
>>>>  };
>>>>
>>>> +static const struct uvc_control_class uvc_control_class[] = {
>>>> +     {
>>>> +             .id             = V4L2_CID_CAMERA_CLASS,
>>>> +             .name           = "Camera Controls",
>>>> +     },
>>>> +     {
>>>> +             .id             = V4L2_CID_USER_CLASS,
>>>> +             .name           = "User Controls",
>>>> +     },
>>>> +};
>>>> +
>>>>  static const struct uvc_menu_info power_line_frequency_controls[] = {
>>>>       { 0, "Disabled" },
>>>>       { 1, "50 Hz" },
>>>> @@ -1024,6 +1035,49 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>>>>       return 0;
>>>>  }
>>>>
>>>> +static int __uvc_query_v4l2_class(struct uvc_device *dev, u32 req_id,
>>>> +                               u32 found_id)
>>>> +{
>>>> +     bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
>>>> +     int i;
>>>
>>> unsigned int as i will never be negative.
>>
>> Sometimes you are a bit negative with my patches... :)
>>
>> (sorry, it is Friday)
>>
>>>> +
>>>> +     req_id &= V4L2_CTRL_ID_MASK;
>>>> +
>>>> +     for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
>>>> +             if (!(dev->ctrl_class_bitmap & BIT(i)))
>>>> +                     continue;
>>>> +             if (!find_next) {
>>>> +                     if (uvc_control_class[i].id == req_id)
>>>> +                             return i;
>>>> +                     continue;
>>>> +             }
>>>> +             if ((uvc_control_class[i].id > req_id) &&
>>>> +                 (uvc_control_class[i].id < found_id))
>>>
>>> No need for the inner parentheses.
>>>
>>>> +                     return i;
>>>> +     }
>>>> +
>>>> +     return -ENODEV;
>>>> +}
>>>> +
>>>> +static int uvc_query_v4l2_class(struct uvc_device *dev, u32 req_id,
>>>> +                             u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
>>>> +{
>>>> +     int idx;
>>>> +
>>>> +     idx = __uvc_query_v4l2_class(dev, req_id, found_id);
>>>> +     if (idx < 0)
>>>> +             return -ENODEV;
>>>> +
>>>> +     memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
>>>> +     v4l2_ctrl->id = uvc_control_class[idx].id;
>>>> +     strscpy(v4l2_ctrl->name, uvc_control_class[idx].name,
>>>> +             sizeof(v4l2_ctrl->name));
>>>> +     v4l2_ctrl->type = V4L2_CTRL_TYPE_CTRL_CLASS;
>>>> +     v4l2_ctrl->flags = V4L2_CTRL_FLAG_WRITE_ONLY |
>>>> +                                     V4L2_CTRL_FLAG_READ_ONLY;
>>>
>>>         v4l2_ctrl->flags = V4L2_CTRL_FLAG_WRITE_ONLY
>>>                          | V4L2_CTRL_FLAG_READ_ONLY;
>>>
>>>> +     return 0;
>>>> +}
>>>
>>> If you agree with the comments below, you could inline
>>> __uvc_query_v4l2_class() in uvc_query_v4l2_class() as it won't be called
>>> separately.
>>>
>>>> +
>>>>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>>       struct uvc_control *ctrl,
>>>>       struct uvc_control_mapping *mapping,
>>>> @@ -1123,6 +1177,14 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>>       struct uvc_control_mapping *mapping;
>>>>       int ret;
>>>>
>>>> +     /* Check if the ctrl is a know class */
>>>> +     if (!(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL)) {
>>>> +             ret = uvc_query_v4l2_class(chain->dev, v4l2_ctrl->id,
>>>> +                                        v4l2_ctrl->id, v4l2_ctrl);
>>>
>>> You could pass 0 for found_id here.
>>>
>>>> +             if (!ret)
>>>> +                     return 0;
>>>> +     }
>>>> +
>>>
>>> Should this be done with the chain->ctrl_mutex locked, as
>>> __uvc_query_v4l2_class() accesses dev->ctrl_class_bitmap that could be
>>> modified concurrently ?
>>>
>>>>       ret = mutex_lock_interruptible(&chain->ctrl_mutex);
>>>>       if (ret < 0)
>>>>               return -ERESTARTSYS;
>>>> @@ -1133,6 +1195,13 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>>               goto done;
>>>>       }
>>>>
>>>
>>> A comment here along the lines of
>>>
>>>         /*
>>>          * If we're enumerating control with V4L2_CTRL_FLAG_NEXT_CTRL, check if
>>>          * a class should be inserted between the previous control and the one
>>>          * we have just found.
>>>          */
>>>
>>> could be useful, as it's not trivial.
>>
>> yes, it looks better thanks!
>>
>>>> +     if (v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL) {
>>>> +             ret = uvc_query_v4l2_class(chain->dev, v4l2_ctrl->id,
>>>> +                                        mapping->id, v4l2_ctrl);
>>>> +             if (!ret)
>>>> +                     goto done;
>>>> +     }
>>>> +
>>>>       ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
>>>>  done:
>>>>       mutex_unlock(&chain->ctrl_mutex);
>>>> @@ -1422,6 +1491,9 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>>>>       struct uvc_control *ctrl;
>>>>       int ret;
>>>>
>>>> +     if (__uvc_query_v4l2_class(handle->chain->dev, sev->id, 0) >= 0)
>>>> +             return 0;
>>>
>>> Do we really need to succeed ? What's the point in subscribing for
>>> control change events on a class ? Can't we just check if sev->id is a
>>> class, and return -EINVAL in that case ?
>>
>> Unfortunately it is expected that you can subscribe to all the events,
>> even the ctrl_classes
>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>                 fail: v4l2-test-controls.cpp(835): subscribe event for
>> control 'User Controls' failed
>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> 
> Looks like something that should be dropped from v4l2-compliance,
> there's no use case for subscribing to a class.

It's allowed in the API. You never get an event, since it doesn't change, but
you can subscribe to it. I chose to allow it to avoid exceptions. Basically if
a control never changes, you just never get an event. Whether it is a control
class or a read-only control or a control with just a fixed value, it doesn't
matter for the event control API.

Regards,

	Hans

> 
>>>> +
>>>>       ret = mutex_lock_interruptible(&handle->chain->ctrl_mutex);
>>>>       if (ret < 0)
>>>>               return -ERESTARTSYS;
>>>> @@ -1458,6 +1530,9 @@ static void uvc_ctrl_del_event(struct v4l2_subscribed_event *sev)
>>>>  {
>>>>       struct uvc_fh *handle = container_of(sev->fh, struct uvc_fh, vfh);
>>>>
>>>> +     if (__uvc_query_v4l2_class(handle->chain->dev, sev->id, 0) >= 0)
>>>> +             return;
>>>
>>> And this could then be dropped, as this function won't be called if the
>>> subscription failed.
>>>
>>>> +
>>>>       mutex_lock(&handle->chain->ctrl_mutex);
>>>>       list_del(&sev->node);
>>>>       mutex_unlock(&handle->chain->ctrl_mutex);
>>>> @@ -1577,6 +1652,9 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>>>>       struct uvc_control *ctrl;
>>>>       struct uvc_control_mapping *mapping;
>>>>
>>>> +     if (__uvc_query_v4l2_class(chain->dev, xctrl->id, 0) >= 0)
>>>> +             return -EACCES;
>>>> +
>>>>       ctrl = uvc_find_control(chain, xctrl->id, &mapping);
>>>>       if (ctrl == NULL)
>>>>               return -EINVAL;
>>>> @@ -1596,6 +1674,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>>>>       s32 max;
>>>>       int ret;
>>>>
>>>> +     if (__uvc_query_v4l2_class(chain->dev, xctrl->id, 0) >= 0)
>>>> +             return -EACCES;
>>>> +
>>>
>>> Similarly as in patch 1/6, should these two checks be moved to
>>> v4l_s_ctrl() and v4l_s_ext_ctrls(), as it's never valid to get/set a
>>> class ?
>>
>> I do not think that it is possible, you need to return -EACCESS if the
>> control exists and -EINVAL if it does not exist.
>> v4l_s_ext_ctrls does not know if the ctrl exists.
> 
> *sigh* I'm sad that we need this kind of complexity in drivers because
> the API requires us to implement a behaviour that nobody actually cares
> about :-( The way classes are implemented is really a big hack.
> 
>>>>       ctrl = uvc_find_control(chain, xctrl->id, &mapping);
>>>>       if (ctrl == NULL)
>>>>               return -EINVAL;
>>>> @@ -2062,6 +2143,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
>>>>  {
>>>>       struct uvc_control_mapping *map;
>>>>       unsigned int size;
>>>> +     int i;
>>>
>>> This can be unsigned as i never takes negative values.
>> I cannot repeat the same joke... even if it is a bad joke
>>>
>>>>
>>>>       /* Most mappings come from static kernel data and need to be duplicated.
>>>>        * Mappings that come from userspace will be unnecessarily duplicated,
>>>> @@ -2085,6 +2167,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
>>>>       if (map->set == NULL)
>>>>               map->set = uvc_set_le_value;
>>>>
>>>> +     for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
>>>> +             if (V4L2_CTRL_ID2WHICH(uvc_control_class[i].id) ==
>>>> +                                             V4L2_CTRL_ID2WHICH(map->id)) {
>>>
>>> You can write this
>>>
>>>                 if (uvc_control_class[i].id == V4L2_CTRL_ID2WHICH(map->id)) {
>>>
>>> as the uvc_control_class array contains control classes only.
>>
>> Are you sure?
>> #define V4L2_CID_CAMERA_CLASS                (V4L2_CTRL_CLASS_CAMERA | 1)
>>
>> we are sasing the cid, not the class.
> 
> Indeed, my bad.
> 
>>>> +                     dev->ctrl_class_bitmap |= BIT(i);
>>>> +                     break;
>>>> +             }
>>>> +     }
>>>> +
>>>>       list_add_tail(&map->list, &ctrl->info.mappings);
>>>>       uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
>>>>               map->name, ctrl->info.entity, ctrl->info.selector);
>>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>>> index 97df5ecd66c9..63b5d697a438 100644
>>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>>> @@ -262,6 +262,11 @@ struct uvc_control_mapping {
>>>>                   u8 *data);
>>>>  };
>>>>
>>>> +struct uvc_control_class {
>>>> +     u32 id;
>>>> +     char name[32];
>>>> +};
>>>> +
>>>>  struct uvc_control {
>>>>       struct uvc_entity *entity;
>>>>       struct uvc_control_info info;
>>>> @@ -707,6 +712,8 @@ struct uvc_device {
>>>>       } async_ctrl;
>>>>
>>>>       struct uvc_entity *gpio_unit;
>>>> +
>>>> +     u8 ctrl_class_bitmap;
>>>
>>> Should this be stored in the chain, as different chains can have
>>> different controls ?
>>>
>>>>  };
>>>>
>>>>  enum uvc_handle_state {
> 

