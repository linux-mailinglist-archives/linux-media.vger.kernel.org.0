Return-Path: <linux-media+bounces-41977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A5B489C2
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D35DD3C2704
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585842FAC09;
	Mon,  8 Sep 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TUbpeHYS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271582F83C3;
	Mon,  8 Sep 2025 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757326438; cv=none; b=bpIEmRA0j7qFSq71BQH8FA0Zi5uQ7Y7lU8tf+t5IjmiP/58t1wy07r7sIQcvcwwM+AERzlcpucYDzbrZAUQSVyUa6/jQ4MAnGW2V4d/1pPEWRzpvGpGr7R7o6FwkcdcyvulFztiK1PA+CS1tmUfTdZn1DPYY0b1bWm0JV4QPp6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757326438; c=relaxed/simple;
	bh=Gb1ubu2ZH+sJL4BUrJTTK5x/BmpDb5gljBQqUFz29r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1+iTDM11zinqoOtZYxEBfupKhbdubvwPZyNYadEB8DG4bK+FzmSvQQcEZV71JUfzkw6ZjYrpYspNEqg2SVx+/tow7UhcKD/t3u5RAebDLnFf1RoVV5sSm7nMLV4jykvw8Pyez3NDKyrWBQhTi0XYlS1z9xl1DDSX1zGIBG2jaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TUbpeHYS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B7E6099F;
	Mon,  8 Sep 2025 12:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757326361;
	bh=Gb1ubu2ZH+sJL4BUrJTTK5x/BmpDb5gljBQqUFz29r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUbpeHYSJTUxSChj3hDuZ8T+PW7d/Cx9u823Es8r2kEohxUaJVJyOkqKx0hFHUb00
	 sk8CkznjcI8JK9SafLTjEmiJ89Vc7s95Zw5ogJiuDcqDVq68i2KVt3Boy3aJujYxYr
	 0CcBDvhCCejQBq4E6M9VPNkc3vHELe+GcgD6eX1c=
Date: Mon, 8 Sep 2025 12:13:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 10/12] media: uvcvideo: Add get_* functions to
 uvc_entity
Message-ID: <20250908101332.GB26062@pendragon.ideasonboard.com>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org>
 <20250629181246.GE6260@pendragon.ideasonboard.com>
 <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
 <20250714142926.GI8243@pendragon.ideasonboard.com>
 <CANiDSCvFe23xmrJ0-qbWWa6+vKGb+QdDFV8VSLkmWdAnfsFtzw@mail.gmail.com>
 <20250715193505.GB19299@pendragon.ideasonboard.com>
 <CANiDSCtvt6qnROQ0_-0iG5hqkU_uHZABujZPN7xuh7pUASSGyw@mail.gmail.com>
 <CANiDSCsNjBEWR5HA9bhFNnXB7Cazj7o0wBnn53gzpoBBcYFkFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsNjBEWR5HA9bhFNnXB7Cazj7o0wBnn53gzpoBBcYFkFw@mail.gmail.com>

A question for Hans Verkuil below.

On Thu, Aug 07, 2025 at 09:35:14AM +0200, Ricardo Ribalda wrote:
> On Wed, 16 Jul 2025 at 12:32, Ricardo Ribalda wrote:
> > On Tue, 15 Jul 2025 at 21:35, Laurent Pinchart wrote:
> > > On Mon, Jul 14, 2025 at 05:46:40PM +0200, Ricardo Ribalda wrote:
> > > > On Mon, 14 Jul 2025 at 16:30, Laurent Pinchart wrote:
> > > > > On Tue, Jul 01, 2025 at 01:13:10PM +0200, Ricardo Ribalda wrote:
> > > > > > On Sun, 29 Jun 2025 at 20:13, Laurent Pinchart wrote:
> > > > > > > On Thu, Jun 05, 2025 at 05:53:03PM +0000, Ricardo Ribalda wrote:
> > > > > > > > Virtual entities need to provide more values than get_cur and get_cur
> > > > > > >
> > > > > > > I think you meant "get_info and get_cur".
> > > > > > >
> > > > > > > > for their controls. Add support for get_def, get_min, get_max and
> > > > > > > > get_res.
> > > > > > >
> > > > > > > Do they ? The UVC specification defines controls that don't list
> > > > > > > GET_DEF, GET_MIN, GET_MAX and GET_RES as mandatory requests. Can't we do
> > > > > > > the same for the software controls ? This patch is meant to support the
> > > > > > > UVC_SWENTITY_ORIENTATION and UVC_SWENTITY_ROTATION control in the next
> > > > > > > patch, and those are read-only controls. Aren't GET_INFO and GET_CUR
> > > > > > > enough ?
> > > > > >
> > > > > > V4L2_CID_CAMERA_ROTATION has the type UVC_CTRL_DATA_TYPE_UNSIGNED,
> > > > > > that time requires get_min and get_max.
> > > > >
> > > > > Where does that requirement come from ? Is it because how the
> > > > > corresponding V4L2 type (V4L2_CTRL_TYPE_INTEGER) is handled in
> > > > > uvc_ctrl_clamp() ? uvc_ctrl_clamp() is only called when setting a
> > > > > control, from uvc_ctrl_set(), and V4L2_CID_CAMERA_ROTATION should be
> > > > > read-only.
> > > >
> > > > It its for VIDIOC_QUERY_EXT_CTRL
> > > >
> > > > uvc_query_v4l2_ctrl -> __uvc_query_v4l2_ctrl -> __uvc_queryctrl_boundaries
> > > >
> > > > We need to list the min, max, def and step for every control. They are
> > > > fetched with uvc_ctrl_populate_cache()
> > >
> > > Ah, I see, thanks.
> > >
> > > For GET_RES, I think we can leave it unimplemented.
> > > __uvc_queryctrl_boundaries() will set v4l2_ctrl->step = 0 which seems to
> > > be the right behaviour for a read-only control whose value never
> > > changes.
> >
> > That will break v4l2-compatiblity. Step needs to be != 0
> > https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-controls.cpp#n77
> >
> > Control ioctls (Input 0):
> >                 fail: v4l2-test-controls.cpp(77): step == 0
> >                 fail: v4l2-test-controls.cpp(201): invalid control 009a0923

Is that an issue in v4l2-compliance ? For integer controls,
https://docs.kernel.org/userspace-api/media/v4l/vidioc-queryctrl.html#c.V4L.v4l2_ctrl_type
documents the step value as "any". For a read-only control whose value
is constant, do we want to enforce a non-zero value ? If so we should
update the specification.

Hans, what's your opinion ?

In any case, if GET_RES isn't implemented, we could update
__uvc_queryctrl_boundaries() to set step to 1 instead of 0. That would
fix v4l2-compliance for real controls that don't implement GET_RES.

> > > As for the minimum and maximum, they are currently set to 0 if the
> > > corresponding operations are not supported. I wonder if we should set
> > > them to the current value instead for read-only controls (as in controls
> > > whose flags report support for GET_CUR only)..
> >
> > I am not sure that I like that approach IMO the code looks worse...
> > but if you prefer that, we can go that way
> 
> I am almost ready to send a new version.
> 
> What approach do you prefer?

I particularly like the change in __uvc_queryctrl_boundaries(). That
could probably be done without the rest of the changes though, as
ctrl->uvc_data is already allocated with kzalloc().

I also like the fact that the driver can rely on the min/max values to
always be populated in the control data. This could be useful for real
read-only UVC controls.

Thinking a bit more about this, for read-only controls whose value never
changes, min, max and step are meaningless. V4L2 requires their value to
be set, that's a decision we made in the V4L2 API, but I think a model
where min, max and step would be undefined (or 0) wouldn't be worse. So
maybe it makes sense to handle this in __uvc_queryctrl_boundaries(),
which is where the adaptation between UVC and V4L2 is handled, instead
of storing CUR in the ctrl->uvc_data DEF/MIN/MAX in
uvc_ctrl_populate_cache() ? I think the code could look cleaner.

> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
u> > index ec472e111248..47224437018b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -35,6 +35,8 @@
> >  /* ------------------------------------------------------------------------
> >   * Controls
> >   */
> > +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> > +                              struct uvc_control *ctrl);

I think you can move the function up instead of adding a forward
declaration.

> >
> >  static const struct uvc_control_info uvc_ctrls[] = {
> >         {
> > @@ -1272,6 +1274,13 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
> >                                         uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> >                 if (ret < 0)
> >                         return ret;
> > +       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {

A comment (probably at the top of the function) to explain the fallback
would be useful.

> > +               ret = __uvc_ctrl_load_cur(chain, ctrl);
> > +               if (!ret) {
> > +                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> > +                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > +                              ctrl->info.size);
> > +               }
> >         }
> >
> >         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> > @@ -1279,14 +1288,31 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
> >                                         uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> >                 if (ret < 0)
> >                         return ret;
> > +       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {
> > +               ret = __uvc_ctrl_load_cur(chain, ctrl);
> > +               if (!ret) {
> > +                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN),
> > +                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > +                              ctrl->info.size);
> > +               }
> >         }
> > +
> >         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) {
> >                 ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_MAX,
> >                                         uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> >                 if (ret < 0)
> >                         return ret;
> > +       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {
> > +               ret = __uvc_ctrl_load_cur(chain, ctrl);
> > +               if (!ret) {
> > +                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX),
> > +                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > +                              ctrl->info.size);
> > +               }
> >         }
> > +
> >         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES) {
> > +               u8 *res;
> >                 ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_RES,
> >                                         uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> >                 if (ret < 0) {
> > @@ -1304,7 +1330,13 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
> >                                       "an XU control. Enabling workaround.\n");
> >                         memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES), 0,
> >                                ctrl->info.size);
> > +                       res = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES);
> > +                       *res = 1
> >                 }
> > +       } else {
> > +               memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES), 0, ctrl->info.size);
> > +               res = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES);
> > +               *res = 1;
> >         }
> >
> >         ctrl->cached = 1;
> > @@ -1541,11 +1573,8 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
> >                         return ret;
> >         }
> >
> > -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF)
> >                 v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
> >                                 UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));

You forgot to reduce the indentation here.

> > -       else
> > -               v4l2_ctrl->default_value = 0;
> >
> >         switch (mapping->v4l2_type) {
> >         case V4L2_CTRL_TYPE_MENU:
> > @@ -1576,23 +1605,14 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
> >                 break;
> >         }
> >
> > -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> > -               v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> > -       else
> > -               v4l2_ctrl->minimum = 0;
> > +       v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> > +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> >
> > -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
> > -               v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
> > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> > -       else
> > -               v4l2_ctrl->maximum = 0;
> > +       v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
> > +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> >
> > -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
> > -               v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
> > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> > -       else
> > -               v4l2_ctrl->step = 0;
> > +       v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
> > +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> >
> >         return 0;
> >  }
> >
> > > > > > We can create a new type UVC_CTRL_DATA_TYPE_UNSIGNED_READ_ONLY that
> > > > > > fakes min, max and res, but I think that it is cleaner this approach.
> > > > > >
> > > > > > > > This is a preparation patch.
> > > > > > > >
> > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> > > > > > > >  drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
> > > > > > > >  2 files changed, 20 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
> > > > > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > @@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
> > > > > > > >       if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> > > > > > > >               return ctrl->entity->get_cur(dev, ctrl->entity,
> > > > > > > >                                            ctrl->info.selector, data, len);
> > > > > > > > +     if (query == UVC_GET_DEF && ctrl->entity->get_def)
> > > > > > > > +             return ctrl->entity->get_def(dev, ctrl->entity,
> > > > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > > > +     if (query == UVC_GET_MIN && ctrl->entity->get_min)
> > > > > > > > +             return ctrl->entity->get_min(dev, ctrl->entity,
> > > > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > > > +     if (query == UVC_GET_MAX && ctrl->entity->get_max)
> > > > > > > > +             return ctrl->entity->get_max(dev, ctrl->entity,
> > > > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > > > +     if (query == UVC_GET_RES && ctrl->entity->get_res)
> > > > > > > > +             return ctrl->entity->get_res(dev, ctrl->entity,
> > > > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > > >       if (query == UVC_GET_INFO && ctrl->entity->get_info)
> > > > > > > >               return ctrl->entity->get_info(dev, ctrl->entity,
> > > > > > > >                                             ctrl->info.selector, data);
> > > > > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > > index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
> > > > > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > > @@ -261,6 +261,14 @@ struct uvc_entity {
> > > > > > > >                       u8 cs, u8 *caps);
> > > > > > > >       int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > >                      u8 cs, void *data, u16 size);
> > > > > > > > +     int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > > > +     int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > > > +     int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > > > +     int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > > >
> > > > > > > >       unsigned int ncontrols;
> > > > > > > >       struct uvc_control *controls;

-- 
Regards,

Laurent Pinchart

