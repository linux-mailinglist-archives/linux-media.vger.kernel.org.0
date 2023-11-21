Return-Path: <linux-media+bounces-681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A597F37B0
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 21:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D12AB21894
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 20:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B458E487BC;
	Tue, 21 Nov 2023 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1195055767
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 20:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0132BC433C7;
	Tue, 21 Nov 2023 20:46:43 +0000 (UTC)
Message-ID: <2c3b9073-3f7e-43f1-aa61-c75a6ee59144@xs4all.nl>
Date: Tue, 21 Nov 2023 21:46:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] media: uvcvideo: reimplement privacy GPIO as a
 separate subdevice
Content-Language: en-US, nl
To: Yunke Cao <yunkec@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org>
 <20230111-uvc_privacy_subdev-v1-3-f859ac9a01e3@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230111-uvc_privacy_subdev-v1-3-f859ac9a01e3@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yunke,

A comment below:

On 11/01/2023 09:52, Yunke Cao wrote:
> Reimplement privacy GPIO as a v4l2 subdev with a volatile privacy control.
> A v4l2 control event is sent in irq when privacy control value changes.
> 
> The behavior matches the original implementation, except that the
> control is of a separate subdevice.
> 
> V4L2 control kAPI is used for simplicity.
> 
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 44 +++-------------------
>  drivers/media/usb/uvc/uvc_entity.c | 76 ++++++++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   | 19 +++++++---
>  3 files changed, 94 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e4bcb5011360..25848f4dbce0 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1209,43 +1209,6 @@ static int uvc_parse_control(struct uvc_device *dev)
>   * Privacy GPIO
>   */
>  
> -static void uvc_gpio_event(struct uvc_device *dev)
> -{
> -	struct uvc_entity *unit = dev->gpio_unit;
> -	struct uvc_video_chain *chain;
> -	u8 new_val;
> -
> -	if (!unit)
> -		return;
> -
> -	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> -
> -	/* GPIO entities are always on the first chain. */
> -	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> -	uvc_ctrl_status_event(chain, unit->controls, &new_val);
> -}
> -
> -static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> -			    u8 cs, void *data, u16 size)
> -{
> -	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> -		return -EINVAL;
> -
> -	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> -
> -	return 0;
> -}
> -
> -static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> -			     u8 cs, u8 *caps)
> -{
> -	if (cs != UVC_CT_PRIVACY_CONTROL)
> -		return -EINVAL;
> -
> -	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> -	return 0;
> -}
> -
>  static irqreturn_t uvc_gpio_irq(int irq, void *data)
>  {
>  	struct uvc_device *dev = data;
> @@ -1279,8 +1242,6 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  	unit->gpio.bControlSize = 1;
>  	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
>  	unit->gpio.bmControls[0] = 1;
> -	unit->get_cur = uvc_gpio_get_cur;
> -	unit->get_info = uvc_gpio_get_info;
>  	strscpy(unit->name, "GPIO", sizeof(unit->name));
>  
>  	list_add_tail(&unit->list, &dev->entities);
> @@ -2202,6 +2163,11 @@ static int uvc_probe(struct usb_interface *intf,
>  	if (media_device_register(&dev->mdev) < 0)
>  		goto error;
>  #endif
> +
> +	/* Expose all subdev's nodes*/
> +	if (v4l2_device_register_subdev_nodes(&dev->vdev) < 0)
> +		goto error;
> +
>  	/* Save our data pointer in the interface data. */
>  	usb_set_intfdata(intf, dev);
>  
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index 7c4d2f93d351..c8e41b42ffd8 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -56,17 +56,90 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +static const struct v4l2_subdev_core_ops uvc_subdev_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_ops uvc_subdev_ops = {
> +	.core = &uvc_subdev_core_ops,
>  };
>  
>  void uvc_mc_cleanup_entity(struct uvc_entity *entity)
>  {
> +	if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT)
> +		v4l2_ctrl_handler_free(&entity->gpio.hdl);
> +
>  	if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING)
>  		media_entity_cleanup(&entity->subdev.entity);
>  	else if (entity->vdev != NULL)
>  		media_entity_cleanup(&entity->vdev->entity);
>  }
>  
> +static int uvc_gpio_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct uvc_gpio *gpio =
> +		container_of(ctrl->handler, struct uvc_gpio, hdl);
> +
> +	ctrl->cur.val = gpiod_get_value_cansleep(gpio->gpio_privacy);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops uvc_gpio_ctrl_ops = {
> +	.g_volatile_ctrl = uvc_gpio_g_volatile_ctrl,
> +};
> +
> +void uvc_gpio_event(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit = dev->gpio_unit;
> +	struct v4l2_ctrl *ctrl;
> +	struct v4l2_event ev;
> +	s32 old_val;
> +	int ret;
> +
> +	if (!unit)
> +		return;
> +
> +	ctrl = unit->gpio.privacy_ctrl;
> +	old_val = ctrl->cur.val;
> +
> +	v4l2_ctrl_lock(ctrl);
> +
> +	ret = uvc_gpio_g_volatile_ctrl(ctrl);
> +	if (ret < 0 || old_val == ctrl->cur.val) {
> +		v4l2_ctrl_unlock(ctrl);
> +		return;
> +	}
> +
> +	v4l2_ctrl_fill_event(&ev, ctrl, V4L2_EVENT_CTRL_CH_VALUE);
> +	v4l2_ctrl_unlock(ctrl);
> +
> +	v4l2_event_queue(unit->subdev.devnode, &ev);
> +}
> +
> +static void uvc_gpio_init_ctrl(struct uvc_entity *entity)
> +{
> +	struct v4l2_ctrl *ctrl;
> +	struct v4l2_ctrl_handler *hdl = &entity->gpio.hdl;
> +
> +	entity->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			       V4L2_SUBDEV_FL_HAS_EVENTS;
> +
> +	v4l2_ctrl_handler_init(hdl, 1);
> +	entity->subdev.ctrl_handler = hdl;
> +	ctrl = v4l2_ctrl_new_std(hdl, &uvc_gpio_ctrl_ops, V4L2_CID_PRIVACY,
> +				 0, 1, 1, 0);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE |
> +			       V4L2_CTRL_FLAG_READ_ONLY;

This is not a volatile control. You know exactly what the value is
and when it changes since a gpio interrupt is issued.

So this is just a regular read-only control, and when uvc_gpio_event
is called you can just call v4l2_ctrl_s_ctrl with the new value
from gpiod_get_value_cansleep().

No need to expose v4l2_ctrl_fill_event either since the call above
will take care of the control event.

Regards,

	Hans

> +
> +	/* Read GPIO value to initialize the control. */
> +	uvc_gpio_g_volatile_ctrl(ctrl);
> +
> +	entity->gpio.privacy_ctrl = ctrl;
> +}
> +
>  static int uvc_mc_init_entity(struct uvc_video_chain *chain,
>  			      struct uvc_entity *entity)
>  {
> @@ -113,6 +186,9 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
>  
>  		entity->subdev.entity.function = function;
>  
> +		if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT)
> +			uvc_gpio_init_ctrl(entity);
> +
>  		ret = media_entity_pads_init(&entity->subdev.entity,
>  					entity->num_pads, entity->pads);
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index df93db259312..19ca2896c398 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -15,6 +15,7 @@
>  #include <linux/videodev2.h>
>  #include <linux/workqueue.h>
>  #include <media/media-device.h>
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fh.h>
> @@ -163,6 +164,15 @@ struct uvc_control {
>  
>  #define UVC_ENTITY_FLAG_DEFAULT		(1 << 0)
>  
> +struct uvc_gpio {
> +	u8  bControlSize;
> +	u8  *bmControls;
> +	struct gpio_desc *gpio_privacy;
> +	int irq;
> +	struct v4l2_ctrl_handler hdl;
> +	struct v4l2_ctrl *privacy_ctrl;
> +};
> +
>  struct uvc_entity {
>  	struct list_head list;		/* Entity as part of a UVC device. */
>  	struct list_head chain;		/* Entity as part of a video device chain. */
> @@ -221,12 +231,7 @@ struct uvc_entity {
>  			u8  *bmControlsType;
>  		} extension;
>  
> -		struct {
> -			u8  bControlSize;
> -			u8  *bmControls;
> -			struct gpio_desc *gpio_privacy;
> -			int irq;
> -		} gpio;
> +		struct uvc_gpio gpio;
>  	};
>  
>  	u8 bNrInPins;
> @@ -766,6 +771,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);
>  
> +void uvc_gpio_event(struct uvc_device *dev);
> +
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>  					    u8 epaddr);
> 


