Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72823416D7
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 08:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbhCSHq6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 03:46:58 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:38301 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233819AbhCSHqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 03:46:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id N9q9lKba2GEYcN9qClQw37; Fri, 19 Mar 2021 08:46:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616140001; bh=3ae83h17n3pC3v5WqYJtdC9LgBQTN7BkE8Nh1fXnTzw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fldBBD7oQcp6z6bu1mPjQhPbEsxaUYoEPRLzhYIYXgUSg5Sp1tzylmMXbSl6Qi0Zv
         VgunNR3zg/GYZCSK4AW74dnoBfSSCMGnA0ob/ojd+AsLxOyHz6Ufr5CUkAfiEh1psq
         pgvVZ2V7bQNbY55xzHo6ky6QoJ3oTJnVEO2obOz59YBITXE3OImkmzdFnBrs6rkqH/
         EQJ5EzMOQwusPACmzBSPGdGv+eiJR0SIiktAQMQ4NMWkn+iKf218F9CduYJXGMUZg/
         hNNvpGJEM7bqyOgwoJh+ouhFdzgvSboKiLgIglJnMU6hGekX47ZfUcZ/KKtjP5l3ae
         A/Kyxwpk2uh6Q==
Subject: Re: [PATCH v7 07/17] media: uvcvideo: Add support for
 V4L2_CTRL_TYPE_CTRL_CLASS
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210318202928.166955-1-ribalda@chromium.org>
 <20210318202928.166955-8-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e80497a1-8737-f0f8-d7ed-f446926e38f7@xs4all.nl>
Date:   Fri, 19 Mar 2021 08:46:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318202928.166955-8-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ79jaNrNQFjM4ScYBBxG/xMSB5d/w1hm2MwcMrx96yjFQWraaipj3lYaeteIzkRvLk1sZyjqrmvCTyXouv39sYWqXVaKlky8ufZ+2ilo9AoCO5Y8Yzt
 PGc4lNrkK0LXBjU21m1zno5M6UhBk7hzujsNGpNLiWmMbRaT74CGSyFvO2A7H0ImUalLP8bTGdjHHuAFpy34tnqqaKYLaZqbJN267Zph7pUk+VpIf68xRoKT
 HI+ozc/v/zhLCKK9dgDlNVQ0p3T/j4+pqK0ThOVT3VqnokoQkFjqcYYFGkKywBw/U6MS5EqRiMbVuRmVDq+zhZV5gngnuweKq2/yx5CX44xZe038f2oknKPO
 Pp3y4U4D6iZnyw0LBmx1Tzbv0o1NMudB7J2IbtWk5riQjJy11UXm4YZskJIlJIQQfluyyXNv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/03/2021 21:29, Ricardo Ribalda wrote:
> Create all the class controls for the device defined controls.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
> 		fail: v4l2-test-controls.cpp(216): missing control class for class 00980000
> 		fail: v4l2-test-controls.cpp(216): missing control tclass for class 009a0000
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

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
> 

