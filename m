Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5B533D267
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237045AbhCPLFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:05:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58988 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhCPLEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:04:39 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A7218CF;
        Tue, 16 Mar 2021 12:04:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615892678;
        bh=vMM1qz5QdPJfNACkZLnexqIgpqJUw/m0ldDH/uKisn4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rH/7yb41+APaREqvVMkhfumcnbi67VIRivBTG3f8fJT3qxcVuEqzNwQiptZHpqKoV
         lzGO8e/l8M1rveKIQzl8fIkvS1SFICKC/GKIETwv01itvp66Ta3xeVsTfFNZVaJjXt
         cnAiD7ynxJHtjRnT2nlxShqn847ysw12FnY5w6IE=
Date:   Tue, 16 Mar 2021 13:04:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 06/11] media: uvcvideo: Add support for
 V4L2_CTRL_TYPE_CTRL_CLASS
Message-ID: <YFCQovgkbXbJpuSC@pendragon.ideasonboard.com>
References: <20210315173609.1547857-1-ribalda@chromium.org>
 <20210315173609.1547857-7-ribalda@chromium.org>
 <59c2f8dd-db7d-f80c-88fe-0db00c15c741@xs4all.nl>
 <YFCDi6nSidMNHy52@pendragon.ideasonboard.com>
 <CANiDSCtdArTQ5CzKfk+P5R6+AQgPdZTk5nH6waF+z9+ys8+LTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtdArTQ5CzKfk+P5R6+AQgPdZTk5nH6waF+z9+ys8+LTA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Tue, Mar 16, 2021 at 11:12:57AM +0100, Ricardo Ribalda wrote:
> On Tue, Mar 16, 2021 at 11:08 AM Laurent Pinchart wrote:
> > On Tue, Mar 16, 2021 at 09:37:07AM +0100, Hans Verkuil wrote:
> > > On 15/03/2021 18:36, Ricardo Ribalda wrote:
> > > > Create all the class controls for the device defined controls.
> > > >
> > > > Fixes v4l2-compliance:
> > > > Control ioctls (Input 0):
> > > >             fail: v4l2-test-controls.cpp(216): missing control class for class 00980000
> > > >             fail: v4l2-test-controls.cpp(216): missing control tclass for class 009a0000
> > > >     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 96 ++++++++++++++++++++++++++++++++
> > > >  drivers/media/usb/uvc/uvcvideo.h |  6 ++
> > > >  2 files changed, 102 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index b75da65115ef..be0fadaf414c 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -357,6 +357,17 @@ static const struct uvc_control_info uvc_ctrls[] = {
> > > >     },
> > > >  };
> > > >
> > > > +static const struct uvc_control_class uvc_control_class[] = {
> > > > +   {
> > > > +           .id             = V4L2_CID_CAMERA_CLASS,
> > > > +           .name           = "Camera Controls",
> > > > +   },
> > > > +   {
> > > > +           .id             = V4L2_CID_USER_CLASS,
> > > > +           .name           = "User Controls",
> > >
> > > I noticed that uvc_ctrl.c has hardcoded strings for the control names and
> > > control menus.
> > >
> > > It would be good to drop that from the code and instead use v4l2_ctrl_get_menu()
> > > and v4l2_ctrl_get_name() to obtain the names. It ensures consistent naming and
> > > saves a bit of memory.
> > >
> > > This can be done in a separate patch before or after this one.
> >
> > https://git.linuxtv.org/pinchartl/media.git/commit/?h=uvc/dev&id=16a7d79d67cdd06a448d8c4c20e270d1c21828b1
> >
> > It's work in progress, the part that bothers me is the changes in
> > uvc_parse_format(). We lose the human-readable name in a debug message,
> > but maybe more importantly, we lose the distinction between different DV
> > formats. Maybe it's not a big deal.
> 
> That patch is for format descriptions. If you haven't started yet I
> can implement the change for the control names.

I should try to wake up before sending e-mails, to avoid making a fool
of myself :-S

I haven't done any work on control names in this area.

> > > > +   },
> > > > +};
> > > > +
> > > >  static const struct uvc_menu_info power_line_frequency_controls[] = {
> > > >     { 0, "Disabled" },
> > > >     { 1, "50 Hz" },
> > > > @@ -1024,6 +1035,49 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > >     return 0;
> > > >  }
> > > >
> > > > +static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
> > > > +                             u32 found_id)
> > > > +{
> > > > +   bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> > > > +   unsigned int i;
> > > > +
> > > > +   req_id &= V4L2_CTRL_ID_MASK;
> > > > +
> > > > +   for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
> > > > +           if (!(chain->ctrl_class_bitmap & BIT(i)))
> > > > +                   continue;
> > > > +           if (!find_next) {
> > > > +                   if (uvc_control_class[i].id == req_id)
> > > > +                           return i;
> > > > +                   continue;
> > > > +           }
> > > > +           if (uvc_control_class[i].id > req_id &&
> > > > +               uvc_control_class[i].id < found_id)
> > > > +                   return i;
> > > > +   }
> > > > +
> > > > +   return -ENODEV;
> > > > +}
> > > > +
> > > > +static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
> > > > +                           u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
> > > > +{
> > > > +   int idx;
> > > > +
> > > > +   idx = __uvc_query_v4l2_class(chain, req_id, found_id);
> > > > +   if (idx < 0)
> > > > +           return -ENODEV;
> > > > +
> > > > +   memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
> > > > +   v4l2_ctrl->id = uvc_control_class[idx].id;
> > > > +   strscpy(v4l2_ctrl->name, uvc_control_class[idx].name,
> > > > +           sizeof(v4l2_ctrl->name));
> > > > +   v4l2_ctrl->type = V4L2_CTRL_TYPE_CTRL_CLASS;
> > > > +   v4l2_ctrl->flags = V4L2_CTRL_FLAG_WRITE_ONLY
> > > > +                      | V4L2_CTRL_FLAG_READ_ONLY;
> > > > +   return 0;
> > > > +}
> > > > +
> > > >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > >     struct uvc_control *ctrl,
> > > >     struct uvc_control_mapping *mapping,
> > > > @@ -1127,12 +1181,31 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > >     if (ret < 0)
> > > >             return -ERESTARTSYS;
> > > >
> > > > +   /* Check if the ctrl is a know class */
> > > > +   if (!(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL)) {
> > > > +           ret = uvc_query_v4l2_class(chain, v4l2_ctrl->id, 0, v4l2_ctrl);
> > > > +           if (!ret)
> > > > +                   goto done;
> > > > +   }
> > > > +
> > > >     ctrl = uvc_find_control(chain, v4l2_ctrl->id, &mapping);
> > > >     if (ctrl == NULL) {
> > > >             ret = -EINVAL;
> > > >             goto done;
> > > >     }
> > > >
> > > > +   /*
> > > > +    * If we're enumerating control with V4L2_CTRL_FLAG_NEXT_CTRL, check if
> > > > +    * a class should be inserted between the previous control and the one
> > > > +    * we have just found.
> > > > +    */
> > > > +   if (v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL) {
> > > > +           ret = uvc_query_v4l2_class(chain, v4l2_ctrl->id, mapping->id,
> > > > +                                      v4l2_ctrl);
> > > > +           if (!ret)
> > > > +                   goto done;
> > > > +   }
> > > > +
> > > >     ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
> > > >  done:
> > > >     mutex_unlock(&chain->ctrl_mutex);
> > > > @@ -1426,6 +1499,11 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
> > > >     if (ret < 0)
> > > >             return -ERESTARTSYS;
> > > >
> > > > +   if (__uvc_query_v4l2_class(handle->chain, sev->id, 0) >= 0) {
> > > > +           ret = 0;
> > > > +           goto done;
> > > > +   }
> > > > +
> > > >     ctrl = uvc_find_control(handle->chain, sev->id, &mapping);
> > > >     if (ctrl == NULL) {
> > > >             ret = -EINVAL;
> > > > @@ -1459,7 +1537,10 @@ static void uvc_ctrl_del_event(struct v4l2_subscribed_event *sev)
> > > >     struct uvc_fh *handle = container_of(sev->fh, struct uvc_fh, vfh);
> > > >
> > > >     mutex_lock(&handle->chain->ctrl_mutex);
> > > > +   if (__uvc_query_v4l2_class(handle->chain, sev->id, 0) >= 0)
> > > > +           goto done;
> > > >     list_del(&sev->node);
> > > > +done:
> > > >     mutex_unlock(&handle->chain->ctrl_mutex);
> > > >  }
> > > >
> > > > @@ -1577,6 +1658,9 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
> > > >     struct uvc_control *ctrl;
> > > >     struct uvc_control_mapping *mapping;
> > > >
> > > > +   if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> > > > +           return -EACCES;
> > > > +
> > > >     ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> > > >     if (ctrl == NULL)
> > > >             return -EINVAL;
> > > > @@ -1596,6 +1680,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > > >     s32 max;
> > > >     int ret;
> > > >
> > > > +   if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> > > > +           return -EACCES;
> > > > +
> > > >     ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> > > >     if (ctrl == NULL)
> > > >             return -EINVAL;
> > > > @@ -2062,6 +2149,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> > > >  {
> > > >     struct uvc_control_mapping *map;
> > > >     unsigned int size;
> > > > +   unsigned int i;
> > > >
> > > >     /* Most mappings come from static kernel data and need to be duplicated.
> > > >      * Mappings that come from userspace will be unnecessarily duplicated,
> > > > @@ -2085,6 +2173,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> > > >     if (map->set == NULL)
> > > >             map->set = uvc_set_le_value;
> > > >
> > > > +   for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
> > > > +           if (V4L2_CTRL_ID2WHICH(uvc_control_class[i].id) ==
> > > > +                                           V4L2_CTRL_ID2WHICH(map->id)) {
> > > > +                   chain->ctrl_class_bitmap |= BIT(i);
> > > > +                   break;
> > > > +           }
> > > > +   }
> > > > +
> > > >     list_add_tail(&map->list, &ctrl->info.mappings);
> > > >     uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
> > > >             map->name, ctrl->info.entity, ctrl->info.selector);
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 97df5ecd66c9..1f17e4253673 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -262,6 +262,11 @@ struct uvc_control_mapping {
> > > >                 u8 *data);
> > > >  };
> > > >
> > > > +struct uvc_control_class {
> > > > +   u32 id;
> > > > +   char name[32];
> > > > +};
> > > > +
> > > >  struct uvc_control {
> > > >     struct uvc_entity *entity;
> > > >     struct uvc_control_info info;
> > > > @@ -475,6 +480,7 @@ struct uvc_video_chain {
> > > >
> > > >     struct v4l2_prio_state prio;            /* V4L2 priority state */
> > > >     u32 caps;                               /* V4L2 chain-wide caps */
> > > > +   u8 ctrl_class_bitmap;                   /* Bitmap of valid classes */
> > > >  };
> > > >
> > > >  struct uvc_stats_frame {
> > > >

-- 
Regards,

Laurent Pinchart
