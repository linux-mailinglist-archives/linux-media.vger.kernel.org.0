Return-Path: <linux-media+bounces-37640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9237EB04192
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40D154A55E8
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC09258CED;
	Mon, 14 Jul 2025 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RtvcdtIB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA6D24EF7F;
	Mon, 14 Jul 2025 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503036; cv=none; b=Av0OI+UHquJGEQ+s6P/NhDnLd0GLBbZ9N028q1Q437JXib3AARmOY/G1wZv1H4LPNoYy82vIpZOWF/V++5o15VCu+6UoFauGwOkqTe1cITYdNAJHfLTHtvk+5/Q4V+wW96ViXvigxS7AbUP5tdBRPuigvoFVRIYOtb8tbRseQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503036; c=relaxed/simple;
	bh=N9VHZASYwxFfZKq/JsLiJLi5iRWvIZmBNvHZTlSVGMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv8+OvX5GMF1642FGSrywyOlR8Nc56DrQ19Yl2ADgJaPzSwwUuqPqPjmgjDx6OyuD+paU3f5vkBPZ9XCMeTqI8nYl24/kY9RoyF3rLMPfvLNI/zUaYEYQK1Xc0fP7gDhzYhBpCPt6cWFiFWZ6y/4bsn567oZ/0VURCnBM+h0+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RtvcdtIB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 80D68109A;
	Mon, 14 Jul 2025 16:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752503000;
	bh=N9VHZASYwxFfZKq/JsLiJLi5iRWvIZmBNvHZTlSVGMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RtvcdtIBV0iRkQulKq5L3GPZaXFSxHqKBBh3dPfUMaMje0/NqmGZB9D6UROrA7Kua
	 aGCEgtY7zgEFpiFYuESCF1fJBriz/MVMkv5lVk1pJLoxiRi61wDKdOQY85w3KEgVhT
	 aroAvlubb1Q1hZrNJLwcCsO0R12cQkfE59UBmPuc=
Date: Mon, 14 Jul 2025 17:23:20 +0300
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
Subject: Re: [PATCH v2 08/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ORIENTATION
Message-ID: <20250714142320.GH8243@pendragon.ideasonboard.com>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org>
 <20250629175045.GC6260@pendragon.ideasonboard.com>
 <CANiDSCuUFUtwenuefqf__=bpyNr0jxFML0hq5spktA+w441Jjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuUFUtwenuefqf__=bpyNr0jxFML0hq5spktA+w441Jjw@mail.gmail.com>

On Tue, Jul 01, 2025 at 11:22:10AM +0200, Ricardo Ribalda wrote:
> On Sun, 29 Jun 2025 at 19:51, Laurent Pinchart wrote:
> > On Thu, Jun 05, 2025 at 05:53:01PM +0000, Ricardo Ribalda wrote:
> > > Fetch the orientation from the fwnode and map it into a control.
> > >
> > > The uvc driver does not use the media controller, so we need to create a
> > > virtual entity, like we previously did with the external gpio.
> > >
> > > We do not re-purpose the external gpio entity because its is planned to
> > > remove it.
> >
> > Comparing the GUIDs for the EXT_GPIO_CONTROLLER and SWENTITY, we have
> >
> > #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >         {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > #define UVC_GUID_SWENTITY \
> >         {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
> >
> > The GUIDs don't carry any special meaning in their values. I agree with
> > the plan to drop the existing features of the GPIO entity, but wouldn't
> > it be easier to rename UVC_GUID_EXT_GPIO_CONTROLLER to UVC_GUID_SWENTITY
> > and UVC_EXT_GPIO_UNIT* to UVC_SWENTITY_UNIT* (the macros are not exposed
> > to userspace), and later drop the existing GPIO controls from the entity
> 
> It would make my life easier if we keep the naming as is, the final
> result will be identical.
> 
> Maybe you want to take a look into
> https://patchwork.linuxtv.org/project/linux-media/list/?series=14066 ?

It seems the series doesn't drop UVC_GUID_EXT_GPIO_CONTROLLER, is that
an oversight ?

> Will it help if I rebase it to the current media-committers/next. It
> has been hanging around since november.

If there are conflicts it could help. There were multiple patch series
conflicting with each other, but I don't know if that's the case of that
one.

> > ?
> >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/Makefile       |  3 +-
> > >  drivers/media/usb/uvc/uvc_ctrl.c     | 21 +++++++++++
> > >  drivers/media/usb/uvc/uvc_driver.c   | 14 +++++--
> > >  drivers/media/usb/uvc/uvc_entity.c   |  1 +
> > >  drivers/media/usb/uvc/uvc_swentity.c | 73 ++++++++++++++++++++++++++++++++++++
> > >  drivers/media/usb/uvc/uvcvideo.h     | 14 +++++++
> > >  include/linux/usb/uvc.h              |  3 ++
> > >  7 files changed, 125 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> > > index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..b4398177c4bb0a9bd49dfd4ca7f2e933b4a1d7df 100644
> > > --- a/drivers/media/usb/uvc/Makefile
> > > +++ b/drivers/media/usb/uvc/Makefile
> > > @@ -1,6 +1,7 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> > > -               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
> > > +               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> > > +               uvc_swentity.o
> > >  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
> > >  uvcvideo-objs  += uvc_entity.o
> > >  endif
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 47e8ccc39234d1769384b55539a21df07f3d57c7..b2768080c08aafa85acb9b7f318672c043d84e55 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -376,6 +376,13 @@ static const struct uvc_control_info uvc_ctrls[] = {
> > >                               | UVC_CTRL_FLAG_GET_DEF
> > >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> > >       },
> > > +     {
> > > +             .entity         = UVC_GUID_SWENTITY,
> > > +             .selector       = 0,
> > > +             .index          = 0,
> > > +             .size           = 1,
> > > +             .flags          = UVC_CTRL_FLAG_GET_CUR,
> > > +     },
> > >  };
> > >
> > >  static const u32 uvc_control_classes[] = {
> > > @@ -975,6 +982,17 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> > >               .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> > >               .name           = "Region of Interest Auto Ctrls",
> > >       },
> > > +     {
> > > +             .id             = V4L2_CID_CAMERA_ORIENTATION,
> > > +             .entity         = UVC_GUID_SWENTITY,
> > > +             .selector       = 0,
> > > +             .size           = 8,
> > > +             .offset         = 0,
> > > +             .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > > +             .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> > > +             .menu_mask      = GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
> > > +                                       V4L2_CAMERA_ORIENTATION_FRONT),
> > > +     },
> > >  };
> > >
> > >  /* ------------------------------------------------------------------------
> > > @@ -3210,6 +3228,9 @@ static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
> > >               } else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
> > >                       bmControls = entity->gpio.bmControls;
> > >                       bControlSize = entity->gpio.bControlSize;
> > > +             } else if (UVC_ENTITY_TYPE(entity) == UVC_SWENTITY_UNIT) {
> > > +                     bmControls = entity->swentity.bmControls;
> > > +                     bControlSize = entity->swentity.bControlSize;
> > >               }
> > >
> > >               /* Remove bogus/blacklisted controls */
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index bcc97f71fa1703aea1119469fb32659c17d9409a..96eeb3aee546487d15f3c30dfe1775189ddf7e47 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1869,11 +1869,15 @@ static int uvc_scan_device(struct uvc_device *dev)
> > >               return -1;
> > >       }
> > >
> > > -     /* Add GPIO entity to the first chain. */
> > > -     if (dev->gpio_unit) {
> > > +     /* Add virtual entities to the first chain. */
> > > +     if (dev->gpio_unit || dev->swentity_unit) {
> > >               chain = list_first_entry(&dev->chains,
> > >                                        struct uvc_video_chain, list);
> > > -             list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> > > +             if (dev->gpio_unit)
> > > +                     list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> > > +             if (dev->swentity_unit)
> > > +                     list_add_tail(&dev->swentity_unit->chain,
> > > +                                   &chain->entities);
> > >       }
> > >
> > >       return 0;
> > > @@ -2249,6 +2253,10 @@ static int uvc_probe(struct usb_interface *intf,
> > >       if (ret < 0)
> > >               goto error;
> > >
> > > +     ret = uvc_swentity_init(dev);
> > > +     if (ret < 0)
> > > +             goto error;
> > > +
> > >       dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> > >                dev->uvc_version >> 8, dev->uvc_version & 0xff,
> > >                udev->product ? udev->product : "<unnamed>",
> > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..d1a652ef35ec34801bd39a5124b834edf838a79e 100644
> > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > @@ -106,6 +106,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> > >               case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
> > >               case UVC_EXTERNAL_VENDOR_SPECIFIC:
> > >               case UVC_EXT_GPIO_UNIT:
> > > +             case UVC_SWENTITY_UNIT:
> > >               default:
> > >                       function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
> > >                       break;
> > > diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..702a2c26e029a0655dade177ed2a9b88d7a4136d
> > > --- /dev/null
> > > +++ b/drivers/media/usb/uvc/uvc_swentity.c
> > > @@ -0,0 +1,73 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + *      uvc_swentity.c  --  USB Video Class driver
> > > + *
> > > + *      Copyright 2025 Google LLC
> > > + */
> > > +
> > > +#include <linux/kernel.h>
> > > +#include <linux/usb/uvc.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include "uvcvideo.h"
> >
> > Blank lines between header groups would be nice.
> ack
> >
> > > +
> > > +static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > +                             u8 cs, void *data, u16 size)
> > > +{
> > > +     if (size < 1)
> > > +             return -EINVAL;
> > > +
> > > +     switch (entity->swentity.props.orientation) {
> > > +     case V4L2_FWNODE_ORIENTATION_FRONT:
> > > +             *(u8 *)data = V4L2_CAMERA_ORIENTATION_FRONT;
> > > +             break;
> > > +     case V4L2_FWNODE_ORIENTATION_BACK:
> > > +             *(u8 *)data = V4L2_CAMERA_ORIENTATION_BACK;
> > > +             break;
> > > +     default:
> > > +             *(u8 *)data = V4L2_CAMERA_ORIENTATION_EXTERNAL;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int uvc_swentity_get_info(struct uvc_device *dev,
> > > +                              struct uvc_entity *entity, u8 cs, u8 *caps)
> > > +{
> > > +     *caps = UVC_CONTROL_CAP_GET;
> > > +     return 0;
> > > +}
> > > +
> > > +int uvc_swentity_init(struct uvc_device *dev)
> > > +{
> > > +     static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
> > > +     struct v4l2_fwnode_device_properties props;
> > > +     struct uvc_entity *unit;
> > > +     int ret;
> > > +
> > > +     ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
> > > +     if (ret)
> > > +             return dev_err_probe(&dev->intf->dev, ret,
> > > +                                  "Can't parse fwnode\n");
> > > +
> > > +     if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
> > > +             return 0;
> > > +
> > > +     unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
> > > +     if (!unit)
> > > +             return -ENOMEM;
> > > +
> > > +     memcpy(unit->guid, uvc_swentity_guid, sizeof(unit->guid));
> > > +     unit->swentity.props = props;
> > > +     unit->swentity.bControlSize = 1;
> > > +     unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
> > > +     unit->swentity.bmControls[0] = 1;
> > > +     unit->get_cur = uvc_swentity_get_cur;
> > > +     unit->get_info = uvc_swentity_get_info;
> > > +     strscpy(unit->name, "SWENTITY", sizeof(unit->name));
> > > +
> > > +     list_add_tail(&unit->list, &dev->entities);
> > > +
> > > +     dev->swentity_unit = unit;
> > > +
> > > +     return 0;
> > > +}
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index dc23d8a97340dc4615d4182232d395106e6d9ed5..a931750bdea25b9062dcc7644bf5f2ed89c1cb4c 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -19,6 +19,7 @@
> > >  #include <media/v4l2-event.h>
> > >  #include <media/v4l2-fh.h>
> > >  #include <media/videobuf2-v4l2.h>
> > > +#include <media/v4l2-fwnode.h>
> >
> > Alphabetical order.
> >
> > >
> > >  /* --------------------------------------------------------------------------
> > >   * UVC constants
> > > @@ -41,6 +42,9 @@
> > >  #define UVC_EXT_GPIO_UNIT            0x7ffe
> > >  #define UVC_EXT_GPIO_UNIT_ID         0x100
> > >
> > > +#define UVC_SWENTITY_UNIT            0x7ffd
> > > +#define UVC_SWENTITY_UNIT_ID         0x101
> > > +
> > >  /* ------------------------------------------------------------------------
> > >   * Driver specific constants.
> > >   */
> > > @@ -242,6 +246,12 @@ struct uvc_entity {
> > >                       int irq;
> > >                       bool initialized;
> > >               } gpio;
> > > +
> > > +             struct {
> > > +                     u8  bControlSize;
> > > +                     u8  *bmControls;
> > > +                     struct v4l2_fwnode_device_properties props;
> > > +             } swentity;
> > >       };
> > >
> > >       u8 bNrInPins;
> > > @@ -617,6 +627,7 @@ struct uvc_device {
> > >       } async_ctrl;
> > >
> > >       struct uvc_entity *gpio_unit;
> > > +     struct uvc_entity *swentity_unit;
> > >  };
> > >
> > >  enum uvc_handle_state {
> > > @@ -836,4 +847,7 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
> > >  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> > >                           size_t size);
> > >
> > > +/* swentity */
> > > +int uvc_swentity_init(struct uvc_device *dev);
> > > +
> > >  #endif
> > > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > > index bce95153e5a65613a710d7316fc17cf5462b5bce..88a23e8919d1294da4308e0e3ca0eccdc66a318f 100644
> > > --- a/include/linux/usb/uvc.h
> > > +++ b/include/linux/usb/uvc.h
> > > @@ -29,6 +29,9 @@
> > >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> > >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > > +#define UVC_GUID_SWENTITY \
> > > +     {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > > +      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
> > >
> > >  #define UVC_GUID_FORMAT_MJPEG \
> > >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
Regards,

Laurent Pinchart

