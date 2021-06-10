Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8653A3122
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhFJQpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:45:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47984 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhFJQoU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:44:20 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 454CB8D4;
        Thu, 10 Jun 2021 18:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623343342;
        bh=WxUgekAYwUyYPC/c4uEN/Z7IcSqFvq6TtpDB1rza83A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PGUpR+favqqQh+xWTtfzmCkvi0px76HpZ1przHhxx3jpzI+uc5Tv9vhMLXqlvl3qA
         x8KCM3lBqyi4+5WSmDFlwqJHyvwuJGvR0xzJzlYjyDRAcDTkAJVEXTdZOpEYFlJp30
         3GXkFO2/4NSa4NGx6nAi9SliirN9xUHbm8iIyWAs=
Date:   Thu, 10 Jun 2021 19:42:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 09/22] media: uvcvideo: Add support for
 V4L2_CTRL_TYPE_CTRL_CLASS
Message-ID: <YMJA29Gc8R+jlE6Q@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-10-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-10-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:27AM +0100, Ricardo Ribalda wrote:
> Create all the class controls for the device defined controls.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
> 		fail: v4l2-test-controls.cpp(216): missing control class for class 00980000
> 		fail: v4l2-test-controls.cpp(216): missing control tclass for class 009a0000
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 94 ++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h |  5 ++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b75da65115ef..ba14733db757 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -357,6 +357,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  	},
>  };
>  
> +static const struct uvc_control_class uvc_control_class[] = {

Nitpicking, I'd name the array (not the struct) uvc_control_classes. And
as the structure only contains a single field, could we make this an
array of u32 ?

> +	{
> +		.id		= V4L2_CID_CAMERA_CLASS,
> +	},
> +	{
> +		.id		= V4L2_CID_USER_CLASS,
> +	},
> +};
> +
>  static const struct uvc_menu_info power_line_frequency_controls[] = {
>  	{ 0, "Disabled" },
>  	{ 1, "50 Hz" },
> @@ -1024,6 +1033,49 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
> +				  u32 found_id)
> +{
> +	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> +	unsigned int i;
> +
> +	req_id &= V4L2_CTRL_ID_MASK;
> +
> +	for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
> +		if (!(chain->ctrl_class_bitmap & BIT(i)))
> +			continue;
> +		if (!find_next) {
> +			if (uvc_control_class[i].id == req_id)
> +				return i;
> +			continue;
> +		}
> +		if (uvc_control_class[i].id > req_id &&
> +		    uvc_control_class[i].id < found_id)
> +			return i;
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
> +				u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
> +{
> +	int idx;
> +
> +	idx = __uvc_query_v4l2_class(chain, req_id, found_id);
> +	if (idx < 0)
> +		return -ENODEV;
> +
> +	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
> +	v4l2_ctrl->id = uvc_control_class[idx].id;
> +	strscpy(v4l2_ctrl->name, v4l2_ctrl_get_name(v4l2_ctrl->id),
> +		sizeof(v4l2_ctrl->name));
> +	v4l2_ctrl->type = V4L2_CTRL_TYPE_CTRL_CLASS;
> +	v4l2_ctrl->flags = V4L2_CTRL_FLAG_WRITE_ONLY
> +			   | V4L2_CTRL_FLAG_READ_ONLY;

Could you align the | below the = ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	return 0;
> +}
> +
>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl,
>  	struct uvc_control_mapping *mapping,
> @@ -1127,12 +1179,31 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	if (ret < 0)
>  		return -ERESTARTSYS;
>  
> +	/* Check if the ctrl is a know class */
> +	if (!(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL)) {
> +		ret = uvc_query_v4l2_class(chain, v4l2_ctrl->id, 0, v4l2_ctrl);
> +		if (!ret)
> +			goto done;
> +	}
> +
>  	ctrl = uvc_find_control(chain, v4l2_ctrl->id, &mapping);
>  	if (ctrl == NULL) {
>  		ret = -EINVAL;
>  		goto done;
>  	}
>  
> +	/*
> +	 * If we're enumerating control with V4L2_CTRL_FLAG_NEXT_CTRL, check if
> +	 * a class should be inserted between the previous control and the one
> +	 * we have just found.
> +	 */
> +	if (v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL) {
> +		ret = uvc_query_v4l2_class(chain, v4l2_ctrl->id, mapping->id,
> +					   v4l2_ctrl);
> +		if (!ret)
> +			goto done;
> +	}
> +
>  	ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
>  done:
>  	mutex_unlock(&chain->ctrl_mutex);
> @@ -1426,6 +1497,11 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>  	if (ret < 0)
>  		return -ERESTARTSYS;
>  
> +	if (__uvc_query_v4l2_class(handle->chain, sev->id, 0) >= 0) {
> +		ret = 0;
> +		goto done;
> +	}
> +
>  	ctrl = uvc_find_control(handle->chain, sev->id, &mapping);
>  	if (ctrl == NULL) {
>  		ret = -EINVAL;
> @@ -1459,7 +1535,10 @@ static void uvc_ctrl_del_event(struct v4l2_subscribed_event *sev)
>  	struct uvc_fh *handle = container_of(sev->fh, struct uvc_fh, vfh);
>  
>  	mutex_lock(&handle->chain->ctrl_mutex);
> +	if (__uvc_query_v4l2_class(handle->chain, sev->id, 0) >= 0)
> +		goto done;
>  	list_del(&sev->node);
> +done:
>  	mutex_unlock(&handle->chain->ctrl_mutex);
>  }
>  
> @@ -1577,6 +1656,9 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl;
>  	struct uvc_control_mapping *mapping;
>  
> +	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> +		return -EACCES;
> +
>  	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
>  	if (ctrl == NULL)
>  		return -EINVAL;
> @@ -1596,6 +1678,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	s32 max;
>  	int ret;
>  
> +	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> +		return -EACCES;
> +
>  	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
>  	if (ctrl == NULL)
>  		return -EINVAL;
> @@ -2062,6 +2147,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  {
>  	struct uvc_control_mapping *map;
>  	unsigned int size;
> +	unsigned int i;
>  
>  	/* Most mappings come from static kernel data and need to be duplicated.
>  	 * Mappings that come from userspace will be unnecessarily duplicated,
> @@ -2085,6 +2171,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	if (map->set == NULL)
>  		map->set = uvc_set_le_value;
>  
> +	for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
> +		if (V4L2_CTRL_ID2WHICH(uvc_control_class[i].id) ==
> +						V4L2_CTRL_ID2WHICH(map->id)) {
> +			chain->ctrl_class_bitmap |= BIT(i);
> +			break;
> +		}
> +	}
> +
>  	list_add_tail(&map->list, &ctrl->info.mappings);
>  	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
>  		map->name, ctrl->info.entity, ctrl->info.selector);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 97df5ecd66c9..b81d3f65e52e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -262,6 +262,10 @@ struct uvc_control_mapping {
>  		    u8 *data);
>  };
>  
> +struct uvc_control_class {
> +	u32 id;
> +};
> +
>  struct uvc_control {
>  	struct uvc_entity *entity;
>  	struct uvc_control_info info;
> @@ -475,6 +479,7 @@ struct uvc_video_chain {
>  
>  	struct v4l2_prio_state prio;		/* V4L2 priority state */
>  	u32 caps;				/* V4L2 chain-wide caps */
> +	u8 ctrl_class_bitmap;			/* Bitmap of valid classes */
>  };
>  
>  struct uvc_stats_frame {

-- 
Regards,

Laurent Pinchart
