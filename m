Return-Path: <linux-media+bounces-22054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72A9D8E2A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 22:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B80286A84
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 21:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4BE1CB528;
	Mon, 25 Nov 2024 21:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jk07RcnT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A57170A13;
	Mon, 25 Nov 2024 21:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732571137; cv=none; b=fbUtxDnZOGsevSaNratnR2AdH/6+sFzsK6Q8+GG8LvVYNPsLh8gOtmy1OjPB/HsBu9PKAYef+wGzlI5xqYdqfoJWHWeA3/Z3n1zw6eBxeKzmnQtGTZ1SvGgUeoWh/IRI7h608/MuDbQSUTTQ2Biy0Y2oyRDnwGjskhJwvIBpEuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732571137; c=relaxed/simple;
	bh=OrMs8lEhcqXUeK33oxxahSi8bwqqYvqLvxUh5RyWMUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CchHxXgWSyL+9VlafIiUK259G58XwPyoHcgwqefdrgJT0VrJTuaY3aojfka1uBXrgXlEJAB9R1lSZZcpBn+72powWtmSSS29oVBivnflg+d9A9boMsuJXvZr6NBsOehRIga8n0j6/o/5q9n3yCivM1bkhiL5SCGjyH1XY8jP5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jk07RcnT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC5574AD;
	Mon, 25 Nov 2024 22:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732571111;
	bh=OrMs8lEhcqXUeK33oxxahSi8bwqqYvqLvxUh5RyWMUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jk07RcnTtEglS9cQPq/G4Rr14ybxfJecda+aVXqfhAHjRi46In2LBi/1/k3677ECN
	 WNBZzG0BEhGoklh98zi/Y0PQjgVgosDxRnI4FB8yXmLNfpnKthL8V+gfLaasoucsg8
	 JF96f1ywbxgpNaBSz7YQ4CHG2EIJvbPWeoxIcOxI=
Date: Mon, 25 Nov 2024 23:45:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 2/8] media: uvcvideo: Factor out gpio functions to its
 own file
Message-ID: <20241125214523.GW19381@pendragon.ideasonboard.com>
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
 <20241112-uvc-subdev-v3-2-0ea573d41a18@chromium.org>
 <7da09249-f2ff-4a0c-8a06-1594b02ce87a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7da09249-f2ff-4a0c-8a06-1594b02ce87a@redhat.com>

On Mon, Nov 25, 2024 at 03:45:38PM +0100, Hans de Goede wrote:
> Hi Ricardo,
> 
> On 12-Nov-24 6:30 PM, Ricardo Ribalda wrote:
> > This is just a refactor patch, no new functionality is added.
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> I guess this patch may need to change depending on if we want
> to keep the GPIO handling as a UVC entity or not.
> 
> Laurent what is your take on this, should this stay as
> a struct uvc_entity; or should the gpio_desc and input_device
> be stored directly inside struct uvc_device as is done for
> the snapshot-button input_device?

If we stop exposing it as a subdev I'd rather not create a uvc_entity.

> Also de we want a separate input_device for this or do
> we re-use the snapshot button one ?
> 
> Since my plan is to open-up the permission on the device with
> the SW_CAMERA_LENS_COVER to be equal to the /dev/video#
> permissions sharing has the downside of allowing keylogging
> of the snapshot button.

Given that the only standardized usage of the button is to inform
applications they should capture a still image, I don't think that's
much of a problem. Devices can also report that their button is a
generic purpose button, but I would still expect its function to be
camera-related.

Can anyone think of an attack vector ?

> Either way (one or 2 input-devices) I don't have a strong
> preference.
> 
> > ---
> >  drivers/media/usb/uvc/Makefile     |   3 +-
> >  drivers/media/usb/uvc/uvc_driver.c | 119 +------------------------------------
> >  drivers/media/usb/uvc/uvc_gpio.c   | 118 ++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |   8 +++
> >  4 files changed, 131 insertions(+), 117 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> > index 4f9eee4f81ab..85514b6e538f 100644
> > --- a/drivers/media/usb/uvc/Makefile
> > +++ b/drivers/media/usb/uvc/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> > -		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
> > +		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> > +		  uvc_gpio.o
> >  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
> >  uvcvideo-objs  += uvc_entity.o
> >  endif
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index cd13bf01265d..5b48768a4f7f 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -8,7 +8,6 @@
> >  
> >  #include <linux/atomic.h>
> >  #include <linux/bits.h>
> > -#include <linux/gpio/consumer.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> > @@ -775,9 +774,9 @@ static const u8 uvc_media_transport_input_guid[16] =
> >  	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> >  
> > -static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > -					       u16 id, unsigned int num_pads,
> > -					       unsigned int extra_size)
> > +struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > +					u16 id, unsigned int num_pads,
> > +					unsigned int extra_size)
> >  {
> >  	struct uvc_entity *entity;
> >  	unsigned int num_inputs;
> > @@ -1240,118 +1239,6 @@ static int uvc_parse_control(struct uvc_device *dev)
> >  	return 0;
> >  }
> >  
> > -/* -----------------------------------------------------------------------------
> > - * Privacy GPIO
> > - */
> > -
> > -static void uvc_gpio_event(struct uvc_device *dev)
> > -{
> > -	struct uvc_entity *unit = dev->gpio_unit;
> > -	struct uvc_video_chain *chain;
> > -	u8 new_val;
> > -
> > -	if (!unit)
> > -		return;
> > -
> > -	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > -
> > -	/* GPIO entities are always on the first chain. */
> > -	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > -	uvc_ctrl_status_event(chain, unit->controls, &new_val);
> > -}
> > -
> > -static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > -			    u8 cs, void *data, u16 size)
> > -{
> > -	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > -		return -EINVAL;
> > -
> > -	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> > -
> > -	return 0;
> > -}
> > -
> > -static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > -			     u8 cs, u8 *caps)
> > -{
> > -	if (cs != UVC_CT_PRIVACY_CONTROL)
> > -		return -EINVAL;
> > -
> > -	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > -	return 0;
> > -}
> > -
> > -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > -{
> > -	struct uvc_device *dev = data;
> > -
> > -	uvc_gpio_event(dev);
> > -	return IRQ_HANDLED;
> > -}
> > -
> > -static int uvc_gpio_parse(struct uvc_device *dev)
> > -{
> > -	struct uvc_entity *unit;
> > -	struct gpio_desc *gpio_privacy;
> > -	int irq;
> > -
> > -	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> > -					       GPIOD_IN);
> > -	if (IS_ERR_OR_NULL(gpio_privacy))
> > -		return PTR_ERR_OR_ZERO(gpio_privacy);
> > -
> > -	irq = gpiod_to_irq(gpio_privacy);
> > -	if (irq < 0)
> > -		return dev_err_probe(&dev->intf->dev, irq,
> > -				     "No IRQ for privacy GPIO\n");
> > -
> > -	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> > -				    UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > -	if (IS_ERR(unit))
> > -		return PTR_ERR(unit);
> > -
> > -	unit->gpio.gpio_privacy = gpio_privacy;
> > -	unit->gpio.irq = irq;
> > -	unit->gpio.bControlSize = 1;
> > -	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > -	unit->gpio.bmControls[0] = 1;
> > -	unit->get_cur = uvc_gpio_get_cur;
> > -	unit->get_info = uvc_gpio_get_info;
> > -	strscpy(unit->name, "GPIO", sizeof(unit->name));
> > -
> > -	list_add_tail(&unit->list, &dev->entities);
> > -
> > -	dev->gpio_unit = unit;
> > -
> > -	return 0;
> > -}
> > -
> > -static int uvc_gpio_init_irq(struct uvc_device *dev)
> > -{
> > -	struct uvc_entity *unit = dev->gpio_unit;
> > -	int ret;
> > -
> > -	if (!unit || unit->gpio.irq < 0)
> > -		return 0;
> > -
> > -	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> > -				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > -				   IRQF_TRIGGER_RISING,
> > -				   "uvc_privacy_gpio", dev);
> > -
> > -	unit->gpio.initialized = !ret;
> > -
> > -	return ret;
> > -}
> > -
> > -static void uvc_gpio_deinit(struct uvc_device *dev)
> > -{
> > -	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> > -		return;
> > -
> > -	free_irq(dev->gpio_unit->gpio.irq, dev);
> > -}
> > -
> >  /* ------------------------------------------------------------------------
> >   * UVC device scan
> >   */
> > diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
> > new file mode 100644
> > index 000000000000..453739acbe8f
> > --- /dev/null
> > +++ b/drivers/media/usb/uvc/uvc_gpio.c
> > @@ -0,0 +1,118 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *      uvc_gpio.c  --  USB Video Class driver
> > + *
> > + *      Copyright 2024 Google LLC
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/gpio/consumer.h>
> > +#include "uvcvideo.h"
> > +
> > +static void uvc_gpio_event(struct uvc_device *dev)
> > +{
> > +	struct uvc_entity *unit = dev->gpio_unit;
> > +	struct uvc_video_chain *chain;
> > +	u8 new_val;
> > +
> > +	if (!unit)
> > +		return;
> > +
> > +	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > +
> > +	/* GPIO entities are always on the first chain. */
> > +	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > +	uvc_ctrl_status_event(chain, unit->controls, &new_val);
> > +}
> > +
> > +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > +			    u8 cs, void *data, u16 size)
> > +{
> > +	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > +		return -EINVAL;
> > +
> > +	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> > +
> > +	return 0;
> > +}
> > +
> > +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > +			     u8 cs, u8 *caps)
> > +{
> > +	if (cs != UVC_CT_PRIVACY_CONTROL)
> > +		return -EINVAL;
> > +
> > +	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > +	return 0;
> > +}
> > +
> > +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > +{
> > +	struct uvc_device *dev = data;
> > +
> > +	uvc_gpio_event(dev);
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +int uvc_gpio_parse(struct uvc_device *dev)
> > +{
> > +	struct uvc_entity *unit;
> > +	struct gpio_desc *gpio_privacy;
> > +	int irq;
> > +
> > +	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> > +					       GPIOD_IN);
> > +	if (IS_ERR_OR_NULL(gpio_privacy))
> > +		return PTR_ERR_OR_ZERO(gpio_privacy);
> > +
> > +	irq = gpiod_to_irq(gpio_privacy);
> > +	if (irq < 0)
> > +		return dev_err_probe(&dev->udev->dev, irq,
> > +				     "No IRQ for privacy GPIO\n");
> > +
> > +	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> > +				    UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > +	if (IS_ERR(unit))
> > +		return PTR_ERR(unit);
> > +
> > +	unit->gpio.gpio_privacy = gpio_privacy;
> > +	unit->gpio.irq = irq;
> > +	unit->gpio.bControlSize = 1;
> > +	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > +	unit->gpio.bmControls[0] = 1;
> > +	unit->get_cur = uvc_gpio_get_cur;
> > +	unit->get_info = uvc_gpio_get_info;
> > +	strscpy(unit->name, "GPIO", sizeof(unit->name));
> > +
> > +	list_add_tail(&unit->list, &dev->entities);
> > +
> > +	dev->gpio_unit = unit;
> > +
> > +	return 0;
> > +}
> > +
> > +int uvc_gpio_init_irq(struct uvc_device *dev)
> > +{
> > +	struct uvc_entity *unit = dev->gpio_unit;
> > +	int ret;
> > +
> > +	if (!unit || unit->gpio.irq < 0)
> > +		return 0;
> > +
> > +	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> > +				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > +				   IRQF_TRIGGER_RISING,
> > +				   "uvc_privacy_gpio", dev);
> > +
> > +	unit->gpio.initialized = !ret;
> > +
> > +	return ret;
> > +}
> > +
> > +void uvc_gpio_deinit(struct uvc_device *dev)
> > +{
> > +	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> > +		return;
> > +
> > +	free_irq(dev->gpio_unit->gpio.irq, dev);
> > +}
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 965a789ed03e..91ed59b54d9a 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -673,6 +673,9 @@ do {									\
> >  extern struct uvc_driver uvc_driver;
> >  
> >  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> > +struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > +					u16 id, unsigned int num_pads,
> > +					unsigned int extra_size);
> >  
> >  /* Video buffers queue management. */
> >  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
> > @@ -817,4 +820,9 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
> >  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> >  			    size_t size);
> >  
> > +/* gpio */
> > +int uvc_gpio_parse(struct uvc_device *dev);
> > +int uvc_gpio_init_irq(struct uvc_device *dev);
> > +void uvc_gpio_deinit(struct uvc_device *dev);
> > +
> >  #endif
> > 

-- 
Regards,

Laurent Pinchart

