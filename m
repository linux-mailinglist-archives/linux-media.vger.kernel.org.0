Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED73338ACD
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 11:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbhCLK5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 05:57:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbhCLK52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 05:57:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E441C061574;
        Fri, 12 Mar 2021 02:57:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 302148F9;
        Fri, 12 Mar 2021 11:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615546645;
        bh=pMFbFlzPtajjNOMl0XILTPI3+jFreqhFTNAEJ8F4VLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pVpQCum/7k0zRR8e0YLl2NuH5WGhNoEY8TLiz7DhFnL8jMGHqXsW/EprDjpLHW6qu
         BETommksJDwlnavXx9FB4envQ51W+pRMTwGkYH+tCsEIOofvKPXCbBubuHCoXLgRVy
         ZCWcaFZp/fE2PJc4DM+nOPlMqpKWqGp43ebSbO5A=
Date:   Fri, 12 Mar 2021 12:56:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2 5/6] media: uvcvideo: Add support for
 V4L2_CTRL_TYPE_CTRL_CLASS
Message-ID: <YEtI8gvuNqxL3RT5@pendragon.ideasonboard.com>
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-6-ribalda@chromium.org>
 <YErCElYk7YhB7dvp@pendragon.ideasonboard.com>
 <CAPybu_2tu_=1HtC1Cfr86uP1A367hnfvO0KXmCbGaYUJ1A2X2Q@mail.gmail.com>
 <YEs+3fh2zUAeeBQy@pendragon.ideasonboard.com>
 <3e03ae6c-b586-c314-b015-9b3b5de8fd04@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e03ae6c-b586-c314-b015-9b3b5de8fd04@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 12, 2021 at 11:22:07AM +0100, Hans Verkuil wrote:
> On 12/03/2021 11:13, Laurent Pinchart wrote:
> > On Fri, Mar 12, 2021 at 10:57:33AM +0100, Ricardo Ribalda Delgado wrote:
> >> On Fri, Mar 12, 2021 at 2:25 AM Laurent Pinchart wrote:
> >>> On Thu, Mar 11, 2021 at 11:19:45PM +0100, Ricardo Ribalda wrote:
> >>>> Create all the class controls for the device defined controls.
> >>>>
> >>>> Fixes v4l2-compliance:
> >>>> Control ioctls (Input 0):
> >>>>               fail: v4l2-test-controls.cpp(216): missing control class for class 00980000
> >>>>               fail: v4l2-test-controls.cpp(216): missing control tclass for class 009a0000
> >>>>       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> >>>>
> >>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>> ---
> >>>>  drivers/media/usb/uvc/uvc_ctrl.c | 90 ++++++++++++++++++++++++++++++++
> >>>>  drivers/media/usb/uvc/uvcvideo.h |  7 +++
> >>>>  2 files changed, 97 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> index b3dde98499f4..4e0ed2595ae9 100644
> >>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> @@ -357,6 +357,17 @@ static const struct uvc_control_info uvc_ctrls[] = {
> >>>>       },
> >>>>  };
> >>>>
> >>>> +static const struct uvc_control_class uvc_control_class[] = {
> >>>> +     {
> >>>> +             .id             = V4L2_CID_CAMERA_CLASS,
> >>>> +             .name           = "Camera Controls",
> >>>> +     },
> >>>> +     {
> >>>> +             .id             = V4L2_CID_USER_CLASS,
> >>>> +             .name           = "User Controls",
> >>>> +     },
> >>>> +};
> >>>> +
> >>>>  static const struct uvc_menu_info power_line_frequency_controls[] = {
> >>>>       { 0, "Disabled" },
> >>>>       { 1, "50 Hz" },
> >>>> @@ -1024,6 +1035,49 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> >>>>       return 0;
> >>>>  }
> >>>>
> >>>> +static int __uvc_query_v4l2_class(struct uvc_device *dev, u32 req_id,
> >>>> +                               u32 found_id)
> >>>> +{
> >>>> +     bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> >>>> +     int i;
> >>>
> >>> unsigned int as i will never be negative.
> >>
> >> Sometimes you are a bit negative with my patches... :)
> >>
> >> (sorry, it is Friday)
> >>
> >>>> +
> >>>> +     req_id &= V4L2_CTRL_ID_MASK;
> >>>> +
> >>>> +     for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
> >>>> +             if (!(dev->ctrl_class_bitmap & BIT(i)))
> >>>> +                     continue;
> >>>> +             if (!find_next) {
> >>>> +                     if (uvc_control_class[i].id == req_id)
> >>>> +                             return i;
> >>>> +                     continue;
> >>>> +             }
> >>>> +             if ((uvc_control_class[i].id > req_id) &&
> >>>> +                 (uvc_control_class[i].id < found_id))
> >>>
> >>> No need for the inner parentheses.
> >>>
> >>>> +                     return i;
> >>>> +     }
> >>>> +
> >>>> +     return -ENODEV;
> >>>> +}
> >>>> +
> >>>> +static int uvc_query_v4l2_class(struct uvc_device *dev, u32 req_id,
> >>>> +                             u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
> >>>> +{
> >>>> +     int idx;
> >>>> +
> >>>> +     idx = __uvc_query_v4l2_class(dev, req_id, found_id);
> >>>> +     if (idx < 0)
> >>>> +             return -ENODEV;
> >>>> +
> >>>> +     memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
> >>>> +     v4l2_ctrl->id = uvc_control_class[idx].id;
> >>>> +     strscpy(v4l2_ctrl->name, uvc_control_class[idx].name,
> >>>> +             sizeof(v4l2_ctrl->name));
> >>>> +     v4l2_ctrl->type = V4L2_CTRL_TYPE_CTRL_CLASS;
> >>>> +     v4l2_ctrl->flags = V4L2_CTRL_FLAG_WRITE_ONLY |
> >>>> +                                     V4L2_CTRL_FLAG_READ_ONLY;
> >>>
> >>>         v4l2_ctrl->flags = V4L2_CTRL_FLAG_WRITE_ONLY
> >>>                          | V4L2_CTRL_FLAG_READ_ONLY;
> >>>
> >>>> +     return 0;
> >>>> +}
> >>>
> >>> If you agree with the comments below, you could inline
> >>> __uvc_query_v4l2_class() in uvc_query_v4l2_class() as it won't be called
> >>> separately.
> >>>
> >>>> +
> >>>>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >>>>       struct uvc_control *ctrl,
> >>>>       struct uvc_control_mapping *mapping,
> >>>> @@ -1123,6 +1177,14 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >>>>       struct uvc_control_mapping *mapping;
> >>>>       int ret;
> >>>>
> >>>> +     /* Check if the ctrl is a know class */
> >>>> +     if (!(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL)) {
> >>>> +             ret = uvc_query_v4l2_class(chain->dev, v4l2_ctrl->id,
> >>>> +                                        v4l2_ctrl->id, v4l2_ctrl);
> >>>
> >>> You could pass 0 for found_id here.
> >>>
> >>>> +             if (!ret)
> >>>> +                     return 0;
> >>>> +     }
> >>>> +
> >>>
> >>> Should this be done with the chain->ctrl_mutex locked, as
> >>> __uvc_query_v4l2_class() accesses dev->ctrl_class_bitmap that could be
> >>> modified concurrently ?
> >>>
> >>>>       ret = mutex_lock_interruptible(&chain->ctrl_mutex);
> >>>>       if (ret < 0)
> >>>>               return -ERESTARTSYS;
> >>>> @@ -1133,6 +1195,13 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >>>>               goto done;
> >>>>       }
> >>>>
> >>>
> >>> A comment here along the lines of
> >>>
> >>>         /*
> >>>          * If we're enumerating control with V4L2_CTRL_FLAG_NEXT_CTRL, check if
> >>>          * a class should be inserted between the previous control and the one
> >>>          * we have just found.
> >>>          */
> >>>
> >>> could be useful, as it's not trivial.
> >>
> >> yes, it looks better thanks!
> >>
> >>>> +     if (v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL) {
> >>>> +             ret = uvc_query_v4l2_class(chain->dev, v4l2_ctrl->id,
> >>>> +                                        mapping->id, v4l2_ctrl);
> >>>> +             if (!ret)
> >>>> +                     goto done;
> >>>> +     }
> >>>> +
> >>>>       ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
> >>>>  done:
> >>>>       mutex_unlock(&chain->ctrl_mutex);
> >>>> @@ -1422,6 +1491,9 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
> >>>>       struct uvc_control *ctrl;
> >>>>       int ret;
> >>>>
> >>>> +     if (__uvc_query_v4l2_class(handle->chain->dev, sev->id, 0) >= 0)
> >>>> +             return 0;
> >>>
> >>> Do we really need to succeed ? What's the point in subscribing for
> >>> control change events on a class ? Can't we just check if sev->id is a
> >>> class, and return -EINVAL in that case ?
> >>
> >> Unfortunately it is expected that you can subscribe to all the events,
> >> even the ctrl_classes
> >>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >>                 fail: v4l2-test-controls.cpp(835): subscribe event for
> >> control 'User Controls' failed
> >>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> > 
> > Looks like something that should be dropped from v4l2-compliance,
> > there's no use case for subscribing to a class.
> 
> It's allowed in the API. You never get an event, since it doesn't change, but
> you can subscribe to it. I chose to allow it to avoid exceptions. Basically if
> a control never changes, you just never get an event. Whether it is a control
> class or a read-only control or a control with just a fixed value, it doesn't
> matter for the event control API.

Why do we inflict such pain upon ourselves, designing APIs that force us
to support features that we know from the start are useless and will
never be used ? :-(

> >>>> +
> >>>>       ret = mutex_lock_interruptible(&handle->chain->ctrl_mutex);
> >>>>       if (ret < 0)
> >>>>               return -ERESTARTSYS;
> >>>> @@ -1458,6 +1530,9 @@ static void uvc_ctrl_del_event(struct v4l2_subscribed_event *sev)
> >>>>  {
> >>>>       struct uvc_fh *handle = container_of(sev->fh, struct uvc_fh, vfh);
> >>>>
> >>>> +     if (__uvc_query_v4l2_class(handle->chain->dev, sev->id, 0) >= 0)
> >>>> +             return;
> >>>
> >>> And this could then be dropped, as this function won't be called if the
> >>> subscription failed.
> >>>
> >>>> +
> >>>>       mutex_lock(&handle->chain->ctrl_mutex);
> >>>>       list_del(&sev->node);
> >>>>       mutex_unlock(&handle->chain->ctrl_mutex);
> >>>> @@ -1577,6 +1652,9 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
> >>>>       struct uvc_control *ctrl;
> >>>>       struct uvc_control_mapping *mapping;
> >>>>
> >>>> +     if (__uvc_query_v4l2_class(chain->dev, xctrl->id, 0) >= 0)
> >>>> +             return -EACCES;
> >>>> +
> >>>>       ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> >>>>       if (ctrl == NULL)
> >>>>               return -EINVAL;
> >>>> @@ -1596,6 +1674,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >>>>       s32 max;
> >>>>       int ret;
> >>>>
> >>>> +     if (__uvc_query_v4l2_class(chain->dev, xctrl->id, 0) >= 0)
> >>>> +             return -EACCES;
> >>>> +
> >>>
> >>> Similarly as in patch 1/6, should these two checks be moved to
> >>> v4l_s_ctrl() and v4l_s_ext_ctrls(), as it's never valid to get/set a
> >>> class ?
> >>
> >> I do not think that it is possible, you need to return -EACCESS if the
> >> control exists and -EINVAL if it does not exist.
> >> v4l_s_ext_ctrls does not know if the ctrl exists.
> > 
> > *sigh* I'm sad that we need this kind of complexity in drivers because
> > the API requires us to implement a behaviour that nobody actually cares
> > about :-( The way classes are implemented is really a big hack.
> > 
> >>>>       ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> >>>>       if (ctrl == NULL)
> >>>>               return -EINVAL;
> >>>> @@ -2062,6 +2143,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
> >>>>  {
> >>>>       struct uvc_control_mapping *map;
> >>>>       unsigned int size;
> >>>> +     int i;
> >>>
> >>> This can be unsigned as i never takes negative values.
> >> I cannot repeat the same joke... even if it is a bad joke
> >>>
> >>>>
> >>>>       /* Most mappings come from static kernel data and need to be duplicated.
> >>>>        * Mappings that come from userspace will be unnecessarily duplicated,
> >>>> @@ -2085,6 +2167,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
> >>>>       if (map->set == NULL)
> >>>>               map->set = uvc_set_le_value;
> >>>>
> >>>> +     for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
> >>>> +             if (V4L2_CTRL_ID2WHICH(uvc_control_class[i].id) ==
> >>>> +                                             V4L2_CTRL_ID2WHICH(map->id)) {
> >>>
> >>> You can write this
> >>>
> >>>                 if (uvc_control_class[i].id == V4L2_CTRL_ID2WHICH(map->id)) {
> >>>
> >>> as the uvc_control_class array contains control classes only.
> >>
> >> Are you sure?
> >> #define V4L2_CID_CAMERA_CLASS                (V4L2_CTRL_CLASS_CAMERA | 1)
> >>
> >> we are sasing the cid, not the class.
> > 
> > Indeed, my bad.
> > 
> >>>> +                     dev->ctrl_class_bitmap |= BIT(i);
> >>>> +                     break;
> >>>> +             }
> >>>> +     }
> >>>> +
> >>>>       list_add_tail(&map->list, &ctrl->info.mappings);
> >>>>       uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
> >>>>               map->name, ctrl->info.entity, ctrl->info.selector);
> >>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >>>> index 97df5ecd66c9..63b5d697a438 100644
> >>>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>>> @@ -262,6 +262,11 @@ struct uvc_control_mapping {
> >>>>                   u8 *data);
> >>>>  };
> >>>>
> >>>> +struct uvc_control_class {
> >>>> +     u32 id;
> >>>> +     char name[32];
> >>>> +};
> >>>> +
> >>>>  struct uvc_control {
> >>>>       struct uvc_entity *entity;
> >>>>       struct uvc_control_info info;
> >>>> @@ -707,6 +712,8 @@ struct uvc_device {
> >>>>       } async_ctrl;
> >>>>
> >>>>       struct uvc_entity *gpio_unit;
> >>>> +
> >>>> +     u8 ctrl_class_bitmap;
> >>>
> >>> Should this be stored in the chain, as different chains can have
> >>> different controls ?
> >>>
> >>>>  };
> >>>>
> >>>>  enum uvc_handle_state {

-- 
Regards,

Laurent Pinchart
