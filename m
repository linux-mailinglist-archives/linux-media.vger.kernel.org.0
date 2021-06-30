Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F133B7F95
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 11:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233561AbhF3JF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 05:05:28 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55055 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233507AbhF3JF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 05:05:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yW7SlqV6Z48ZvyW7VlDO7K; Wed, 30 Jun 2021 11:02:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1625043778; bh=kLqTnNexCB6fTK7nPEzT8viHzrVrXE6+D8yDou5lhOU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZbXtK5LXBSsAAibQzQh6V6ZE9J3+MTrAKjrzFyKWARk76GSON2T2Pc4wdYlGvxDv4
         z4YS8X43cYfJ2H+oURG7Nfhf90j49VEPBhPq0+SJOCvmT6SXBHeWrM4awTHyHPxHP9
         3rGsj4w61a0ehFqkDz7AmHivgPFLdaxVWbijbVx7cvSqZZ7xDg3cZgQQG290MwniSc
         TkPVJcUs+GFqSvZ0dduO1UKujHJX3ZwZ7D8EJYoteVlO1a22WqmyYjRO8KBx70Z/NW
         tgfZz5TD73fcfeH4tZbJZvoFcmZhOwo5T0vvM9YwNheqrAG4F4HqO/mt7a/FZzTpSd
         Hg0/6VY/r+0/g==
Subject: Re: [PATCH v10 21/21] media: uvcvideo: Return -EACCES to inactive
 controls
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, tfiga@chromium.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20210618122923.385938-1-ribalda@chromium.org>
 <20210618122923.385938-22-ribalda@chromium.org>
 <CANiDSCvNvJ_xyuqgvvFv6aZGSm=H-9=SeV6wp5C_0-acm+wC=A@mail.gmail.com>
 <820809c2-a564-8a79-c279-7570c3bcc801@xs4all.nl>
 <CANiDSCvwQvDYKNqxAZjtAKY6CGNrnn21LMoNnsg7FrrDiooi-A@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d65ab386-370e-b2e9-dbac-a981993d9da7@xs4all.nl>
Date:   Wed, 30 Jun 2021 11:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CANiDSCvwQvDYKNqxAZjtAKY6CGNrnn21LMoNnsg7FrrDiooi-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHcD+wAsxCIziwQ9XTKeVORS/waeX5ykmUVMCqnGGSHUPFa01e9ytKVz467l/xAmxriwbsKHa/x+ICOuKGzXlkpPX44+I+bHYX2Ppb5meoDZcYlzJH/l
 msbIaOsZx/L/i96JRr7YOc031+2q2GvqY9LIxfEsPotDYqfIy8UYSWA6CzQ6MQbkK/bvTD4XWdVWKroFiK3dd4BzwtQOoWE9vEzu3fl8a7mtk7iSToW7iP2Q
 Ppa9i57xFg3I54/8tr1aJPlrHklblsaIua0//PoEpQAZC5qPtIE0egSgnYbrJIDzKPxV1qz0FINb1Yh9zYs1Oneq//x9pn9jbWVbuT5bwnrh91L6DMA3pzc1
 JaFLFPQUsQuEiiyjJJfovm9L5rtMwjkP7xG+b6RmYISGXLcgdJqQa/vtcSBn7sAEqTfONtp2oBjDoIG4DXYFc3LIkt1teH4S/J4nlQc9SbJlu9QRtLA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On 25/06/2021 15:55, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Fri, 25 Jun 2021 at 13:07, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 25/06/2021 12:29, Ricardo Ribalda wrote:
>>> Hi Hans
>>>
>>> Did you have some hardware that did not work fine without this patch?
>>> Am I remembering correctly?
>>
>> Yes, that's correct. It's one of my webcams, but I can't remember which one
>> it is. You probably want me to test this v10?
>>
>> Regards,
> 
> That would be awesome. Thanks!

You can add my:

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

to this series.

I do get these warnings (depends on the webcam model, though, some do, some don't):

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
                warn: v4l2-test-buffers.cpp(438): got sequence number 1, expected 0
        test MMAP (no poll): OK
                warn: v4l2-test-buffers.cpp(438): got sequence number 1, expected 0
        test MMAP (select): OK
                warn: v4l2-test-buffers.cpp(438): got sequence number 1, expected 0
        test MMAP (epoll): OK
                warn: v4l2-test-buffers.cpp(438): got sequence number 1, expected 0
        test USERPTR (no poll): OK
                warn: v4l2-test-buffers.cpp(438): got sequence number 1, expected 0
        test USERPTR (select): OK
        test DMABUF: Cannot test, specify --expbuf-device

It's something to do with the Field ID, but I'm not sure if this is really correctly
reporting a dropped frame, or if it is a false report and the sequence counter was
wrongly incremented.

This is a separate issue, though, and doesn't block this series.

Regards,

	Hans

> 
>>
>>         Hans
>>
>>>
>>> Thanks!
>>>
>>> On Fri, 18 Jun 2021 at 14:29, Ricardo Ribalda <ribalda@chromium.org> wrote:
>>>>
>>>> If a control is inactive return -EACCES to let the userspace know that
>>>> the value will not be applied automatically when the control is active
>>>> again.
>>>>
>>>> Also make sure that query_v4l2_ctrl doesn't return an error.
>>>>
>>>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>> ---
>>>>  drivers/media/usb/uvc/uvc_ctrl.c | 73 +++++++++++++++++++++-----------
>>>>  1 file changed, 49 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>>> index da44d5c0b9ad..4f80c06d3c43 100644
>>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>>> @@ -1104,13 +1104,36 @@ static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
>>>>         return "Unknown Control";
>>>>  }
>>>>
>>>> +static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
>>>> +                                struct uvc_control *ctrl,
>>>> +                                struct uvc_control_mapping *mapping)
>>>> +{
>>>> +       struct uvc_control_mapping *master_map = NULL;
>>>> +       struct uvc_control *master_ctrl = NULL;
>>>> +       s32 val;
>>>> +       int ret;
>>>> +
>>>> +       if (!mapping->master_id)
>>>> +               return false;
>>>> +
>>>> +       __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
>>>> +                          &master_ctrl, 0);
>>>> +
>>>> +       if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
>>>> +               return false;
>>>> +
>>>> +       ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>>>> +       if (ret < 0 || val == mapping->master_manual)
>>>> +               return false;
>>>> +
>>>> +       return true;
>>>> +}
>>>> +
>>>>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>>         struct uvc_control *ctrl,
>>>>         struct uvc_control_mapping *mapping,
>>>>         struct v4l2_queryctrl *v4l2_ctrl)
>>>>  {
>>>> -       struct uvc_control_mapping *master_map = NULL;
>>>> -       struct uvc_control *master_ctrl = NULL;
>>>>         const struct uvc_menu_info *menu;
>>>>         unsigned int i;
>>>>
>>>> @@ -1126,18 +1149,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>>>         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>>>>                 v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>
>>>> -       if (mapping->master_id)
>>>> -               __uvc_find_control(ctrl->entity, mapping->master_id,
>>>> -                                  &master_map, &master_ctrl, 0);
>>>> -       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>>>> -               s32 val;
>>>> -               int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>>>> -               if (ret < 0)
>>>> -                       return ret;
>>>> -
>>>> -               if (val != mapping->master_manual)
>>>> -                               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>>> -       }
>>>> +       if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
>>>> +               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>>>
>>>>         if (!ctrl->cached) {
>>>>                 int ret = uvc_ctrl_populate_cache(chain, ctrl);
>>>> @@ -1660,25 +1673,37 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>>>>         return 0;
>>>>  }
>>>>
>>>> -static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
>>>> -                                 struct v4l2_ext_controls *ctrls,
>>>> -                                 struct uvc_control *uvc_control)
>>>> +static int uvc_ctrl_commit_error(struct uvc_video_chain *chain,
>>>> +                                struct uvc_entity *entity,
>>>> +                                struct v4l2_ext_controls *ctrls,
>>>> +                                struct uvc_control *err_control,
>>>> +                                int ret)
>>>>  {
>>>>         struct uvc_control_mapping *mapping;
>>>>         struct uvc_control *ctrl_found;
>>>>         unsigned int i;
>>>>
>>>> -       if (!entity)
>>>> -               return ctrls->count;
>>>> +       if (!entity) {
>>>> +               ctrls->error_idx = ctrls->count;
>>>> +               return ret;
>>>> +       }
>>>>
>>>>         for (i = 0; i < ctrls->count; i++) {
>>>>                 __uvc_find_control(entity, ctrls->controls[i].id, &mapping,
>>>>                                    &ctrl_found, 0);
>>>> -               if (uvc_control == ctrl_found)
>>>> -                       return i;
>>>> +               if (err_control == ctrl_found)
>>>> +                       break;
>>>>         }
>>>> +       ctrls->error_idx = i;
>>>> +
>>>> +       /* We could not find the control that failed. */
>>>> +       if (i == ctrls->count)
>>>> +               return ret;
>>>> +
>>>> +       if (uvc_ctrl_is_inactive(chain, err_control, mapping))
>>>> +               return -EACCES;
>>>>
>>>> -       return ctrls->count;
>>>> +       return ret;
>>>>  }
>>>>
>>>>  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>>>> @@ -1701,8 +1726,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>>>>                 uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
>>>>  done:
>>>>         if (ret < 0 && ctrls)
>>>> -               ctrls->error_idx = uvc_ctrl_find_ctrl_idx(entity, ctrls,
>>>> -                                                         err_ctrl);
>>>> +               ret = uvc_ctrl_commit_error(chain, entity, ctrls, err_ctrl,
>>>> +                                           ret);
>>>>         mutex_unlock(&chain->ctrl_mutex);
>>>>         return ret;
>>>>  }
>>>> --
>>>> 2.32.0.288.g62a8d224e6-goog
>>>>
>>>
>>>
>>
> 
> 

