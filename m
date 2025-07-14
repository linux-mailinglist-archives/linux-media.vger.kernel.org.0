Return-Path: <linux-media+bounces-37645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E6B041B7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A66178253
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1270F258CF1;
	Mon, 14 Jul 2025 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YzsfI8UQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D712571C6;
	Mon, 14 Jul 2025 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503515; cv=none; b=YVTFHsOHh4WR8WEW2ZrwdpA2ekQ2vI7ak+8NFE5fTKmmS14Smou9o5UN2BIQiq6scAMB3+2jt/DB6Tf0v+trUi0arxWt7/t1kQbkZ/6AW3sosq2sUlixcYpX2KbaJWzJ8T5EdrS3RJm9HJ8CNyltqGBeyQyUMcYv19vG5P0iCpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503515; c=relaxed/simple;
	bh=NxGpWE5smTe6pD4h2sPhZMmxtHdGB2n2GfpRvK3iYbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VN2qLNxtx5JvFAKhYCe1XljaVPOW4h8PBcC+jIo9X7p3kj0FdSQ91yI7vhGhhG/v+fDEytya+KyoRtjYZxOJzG2Lop8yPLD5fNUIjjAXW6lYZGGr9BrqfHJ/Vd0tbwC/T0z2rVtGtyDsvHPsM6ZHnKX5JofsyJ2u2VumP6zEyM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YzsfI8UQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0AE1A166D;
	Mon, 14 Jul 2025 16:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752503480;
	bh=NxGpWE5smTe6pD4h2sPhZMmxtHdGB2n2GfpRvK3iYbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YzsfI8UQCqjLW5R/Hhsvgrzqg/jqBh9260WBd23z9uSpFubnKCpOb77PmLwGg6sjb
	 n4CiIxoaYo9vNZnu8w8K5hbRloKi42GBQxTjoqV3ZKSTGUIQDbXkuuW4KzkpX2ukzY
	 SfNhtFffsogguI96KSe5mLqo7HYFxg33thwEMJ1g=
Date: Mon, 14 Jul 2025 17:31:20 +0300
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
Subject: Re: [PATCH v2 11/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ROTATION
Message-ID: <20250714143120.GJ8243@pendragon.ideasonboard.com>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-11-5710f9d030aa@chromium.org>
 <20250629181440.GO24912@pendragon.ideasonboard.com>
 <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>

Hi Ricardo,

On Tue, Jul 01, 2025 at 01:26:51PM +0200, Ricardo Ribalda wrote:
> On Sun, 29 Jun 2025 at 20:15, Laurent Pinchart wrote:
> > On Thu, Jun 05, 2025 at 05:53:04PM +0000, Ricardo Ribalda wrote:
> > > Fetch the rotation from the fwnode and map it into a control.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c     | 22 +++++++++++++--
> > >  drivers/media/usb/uvc/uvc_swentity.c | 55 ++++++++++++++++++++++++++++++++----
> > >  drivers/media/usb/uvc/uvcvideo.h     |  5 ++++
> > >  3 files changed, 74 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 59be62ae24a4219fa9d7aacf2ae7382c95362178..5788f0c0f6604da06a7bca1b9999d0957817e75e 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -378,11 +378,18 @@ static const struct uvc_control_info uvc_ctrls[] = {
> > >       },
> > >       {
> > >               .entity         = UVC_GUID_SWENTITY,
> > > -             .selector       = 0,
> > > -             .index          = 0,
> > > +             .selector       = UVC_SWENTITY_ORIENTATION,
> > > +             .index          = UVC_SWENTITY_ORIENTATION,
> > >               .size           = 1,
> > >               .flags          = UVC_CTRL_FLAG_GET_CUR,
> > >       },
> > > +     {
> > > +             .entity         = UVC_GUID_SWENTITY,
> > > +             .selector       = UVC_SWENTITY_ROTATION,
> > > +             .index          = UVC_SWENTITY_ROTATION,
> > > +             .size           = 2,
> > > +             .flags          = UVC_CTRL_FLAG_GET_RANGE,
> > > +     },
> > >  };
> > >
> > >  static const u32 uvc_control_classes[] = {
> > > @@ -1025,7 +1032,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> > >       {
> > >               .id             = V4L2_CID_CAMERA_ORIENTATION,
> > >               .entity         = UVC_GUID_SWENTITY,
> > > -             .selector       = 0,
> > > +             .selector       = UVC_SWENTITY_ORIENTATION,
> > >               .size           = 8,
> > >               .offset         = 0,
> > >               .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > > @@ -1033,6 +1040,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> > >               .menu_mask      = GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
> > >                                         V4L2_CAMERA_ORIENTATION_FRONT),
> > >       },
> > > +     {
> > > +             .id             = V4L2_CID_CAMERA_SENSOR_ROTATION,
> > > +             .entity         = UVC_GUID_SWENTITY,
> > > +             .selector       = UVC_SWENTITY_ROTATION,
> > > +             .size           = 16,
> > > +             .offset         = 0,
> > > +             .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> > > +             .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> > > +     },
> > >  };
> > >
> > >  /* ------------------------------------------------------------------------
> > > diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
> > > index 702a2c26e029a0655dade177ed2a9b88d7a4136d..60f3166addbeb7d2e431d107b23034d2d11a1812 100644
> > > --- a/drivers/media/usb/uvc/uvc_swentity.c
> > > +++ b/drivers/media/usb/uvc/uvc_swentity.c
> > > @@ -10,10 +10,11 @@
> > >  #include <media/v4l2-fwnode.h>
> > >  #include "uvcvideo.h"
> > >
> > > -static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > -                             u8 cs, void *data, u16 size)
> > > +static int uvc_swentity_get_orientation(struct uvc_device *dev,
> > > +                                     struct uvc_entity *entity, u8 cs,
> > > +                                     void *data, u16 size)
> > >  {
> > > -     if (size < 1)
> > > +     if (cs != UVC_SWENTITY_ORIENTATION || size != 1)
> > >               return -EINVAL;
> > >
> > >       switch (entity->swentity.props.orientation) {
> > > @@ -30,6 +31,31 @@ static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entit
> > >       return 0;
> > >  }
> > >
> > > +static int uvc_swentity_get_rotation(struct uvc_device *dev,
> > > +                                  struct uvc_entity *entity, u8 cs, void *data,
> > > +                                  u16 size)
> > > +{
> > > +     if (cs != UVC_SWENTITY_ROTATION || size != 2)
> > > +             return -EINVAL;
> > > +
> > > +     ((u8 *)data)[0] = entity->swentity.props.rotation;
> > > +     ((u8 *)data)[1] = entity->swentity.props.rotation >> 8;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > +                             u8 cs, void *data, u16 size)
> > > +{
> > > +     switch (cs) {
> > > +     case UVC_SWENTITY_ORIENTATION:
> > > +             return uvc_swentity_get_orientation(dev, entity, cs, data, size);
> > > +     case UVC_SWENTITY_ROTATION:
> > > +             return uvc_swentity_get_rotation(dev, entity, cs, data, size);
> > > +     }
> > > +     return -EINVAL;
> > > +}
> > > +
> > >  static int uvc_swentity_get_info(struct uvc_device *dev,
> > >                                struct uvc_entity *entity, u8 cs, u8 *caps)
> > >  {
> > > @@ -37,11 +63,22 @@ static int uvc_swentity_get_info(struct uvc_device *dev,
> > >       return 0;
> > >  }
> > >
> > > +static int uvc_swentity_get_res(struct uvc_device *dev, struct uvc_entity *entity,
> > > +                             u8 cs, void *res, u16 size)
> > > +{
> > > +     if (size == 0)
> > > +             return -EINVAL;
> >
> > The get_cur functions return an error if the size doesn't match the
> > expected size. I think you can return -EINVAL if size != 1.
> >
> > > +     ((u8 *)res)[0] = 1;
> > > +     memset(res + 1, 0, size - 1);
> >
> > And drop the memset.
> >
> > > +     return 0;
> > > +}
> > > +
> > >  int uvc_swentity_init(struct uvc_device *dev)
> > >  {
> > >       static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
> > >       struct v4l2_fwnode_device_properties props;
> > >       struct uvc_entity *unit;
> > > +     u8 controls = 0;
> > >       int ret;
> > >
> > >       ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
> > > @@ -49,7 +86,11 @@ int uvc_swentity_init(struct uvc_device *dev)
> > >               return dev_err_probe(&dev->intf->dev, ret,
> > >                                    "Can't parse fwnode\n");
> > >
> > > -     if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
> > > +     if (props.orientation != V4L2_FWNODE_PROPERTY_UNSET)
> > > +             controls |= BIT(UVC_SWENTITY_ORIENTATION);
> > > +     if (props.rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > > +             controls |= BIT(UVC_SWENTITY_ROTATION);
> > > +     if (!controls)
> > >               return 0;
> > >
> > >       unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
> > > @@ -60,9 +101,13 @@ int uvc_swentity_init(struct uvc_device *dev)
> > >       unit->swentity.props = props;
> > >       unit->swentity.bControlSize = 1;
> > >       unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
> > > -     unit->swentity.bmControls[0] = 1;
> > > +     unit->swentity.bmControls[0] = controls;
> > >       unit->get_cur = uvc_swentity_get_cur;
> > >       unit->get_info = uvc_swentity_get_info;
> > > +     unit->get_res = uvc_swentity_get_res;
> > > +     unit->get_def = uvc_swentity_get_rotation;
> > > +     unit->get_min = uvc_swentity_get_rotation;
> > > +     unit->get_max = uvc_swentity_get_rotation;
> >
> > Why do you support GET_DEF, GET_MIN and GET_MAX for rotation only ?
> 
> Orientation has enum type. It does not require min or max.
> 
> For get_def I could use get_cur, but 0 is as good as any other value
> within range.

Both the orientation and rotation are read-only, and should report min
== max == def == cur. What am I missing ?

> > >       strscpy(unit->name, "SWENTITY", sizeof(unit->name));
> > >
> > >       list_add_tail(&unit->list, &dev->entities);
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index d6da8ed3ad4cf3377df49923e051fe04d83d2e38..7cca0dc75d11f6a13bc4f09676a5a00e80cb38f7 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -45,6 +45,11 @@
> > >  #define UVC_SWENTITY_UNIT            0x7ffd
> > >  #define UVC_SWENTITY_UNIT_ID         0x101
> > >
> > > +enum {
> > > +     UVC_SWENTITY_ORIENTATION,
> > > +     UVC_SWENTITY_ROTATION
> > > +};
> > > +
> > >  /* ------------------------------------------------------------------------
> > >   * Driver specific constants.
> > >   */

-- 
Regards,

Laurent Pinchart

