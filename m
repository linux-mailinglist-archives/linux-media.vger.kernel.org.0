Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0E733EF91
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 12:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhCQL30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 07:29:26 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56167 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229979AbhCQL3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 07:29:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id MUMJlAQyLGEYcMUMMlNHor; Wed, 17 Mar 2021 12:29:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615980546; bh=GXcEXJF6bYyBibmeQ9bM+aRtI5FOI5oUgoGxcHFPdqY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FBoQMyxxZipy9mKGRRcbGNUNhDxf8L6k9/kezR2X7E7YOu5oySTCXPp1a+8tRPUtQ
         G6dNay8EbhXxLidGHVUTekSMMNnz8bJGqMY3/LWRAO5Sou+OWc5S5TXuobu2yPnB1G
         WzG56nmJkTb/TKQdrbzVQxnHRhMCYLBnZyJM0sCCxLcBkVSBT/0x7MXK5+vqQtlojD
         QPW0rJO/Nv2f98cBJmG2nt/I/9jKUroU3EgOXI2tOhRTJvYTTgM1meTO68Db0tJv+L
         +C/ixwTv/BhTsmc3+5lQJkkaIpnAouzJxrTJAuGBcbz4zLk9w8gcQshMcSBSCE3feV
         p4YlxPqow6SBQ==
Subject: Re: [PATCH v5 11/13] media: uvcvideo: Use control names from
 framework
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
References: <20210316180004.1605727-1-ribalda@chromium.org>
 <20210316180004.1605727-12-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3d9c1964-330e-1fc6-bd5b-932619eb5bc3@xs4all.nl>
Date:   Wed, 17 Mar 2021 12:29:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316180004.1605727-12-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBWblWgm1EvsX4UbLfQADhJU13kc5RLxxoxUXE3tOB7w2x4cBpIkKjpQlJfvwLJ20dXsVUZDByhK9xXT+UHK5UljB4zRIUea783xtjUr41NUkIoJMhhw
 9yHegc+2O29uwAZWude96x0pdzu42cwMHrSDGit5i3lsACB6sgwmphfzW6YVOP/8MF6ES5eADru23PRYAvDJjVmRRLhih0cHhlMsPsrqcqMpuhVAbepHBXnU
 +/T3t+8DI/OEuyd6c3tI2Q8VlEmZtFE1wvEzbpH7G57WtfB3Flfwaf2bsKzO9qoIjbawiwxfFA6CFaN4PRhf0Ekjpw0fwM0nlg7dVukmPDQ+LeLUIoPt1LiG
 ubYP0yVKWh59kpH+F1ZdHK9gEZMnfVSa5ehM75FJfsJ8XVD0pG6O35/0WdGa/20jj3zK0dMo0K2tgwAW9ng9Ni56okPLTha9/C2M07GCdHChlIOhfyI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2021 19:00, Ricardo Ribalda wrote:
> The framework already contains a map of IDs to names, lets use it when
> possible.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 57 ++++++++++++--------------------
>  drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++-
>  drivers/media/usb/uvc/uvcvideo.h |  2 +-
>  3 files changed, 30 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 98614e1be829..efbdd49ad8ec 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -436,7 +436,6 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	{
>  		.id		= V4L2_CID_BRIGHTNESS,
> -		.name		= "Brightness",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_BRIGHTNESS_CONTROL,
>  		.size		= 16,
> @@ -446,7 +445,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_CONTRAST,
> -		.name		= "Contrast",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_CONTRAST_CONTROL,
>  		.size		= 16,
> @@ -456,7 +454,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_HUE,
> -		.name		= "Hue",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_HUE_CONTROL,
>  		.size		= 16,
> @@ -468,7 +465,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_SATURATION,
> -		.name		= "Saturation",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_SATURATION_CONTROL,
>  		.size		= 16,
> @@ -478,7 +474,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_SHARPNESS,
> -		.name		= "Sharpness",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_SHARPNESS_CONTROL,
>  		.size		= 16,
> @@ -488,7 +483,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_GAMMA,
> -		.name		= "Gamma",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_GAMMA_CONTROL,
>  		.size		= 16,
> @@ -498,7 +492,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_BACKLIGHT_COMPENSATION,
> -		.name		= "Backlight Compensation",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_BACKLIGHT_COMPENSATION_CONTROL,
>  		.size		= 16,
> @@ -508,7 +501,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_GAIN,
> -		.name		= "Gain",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_GAIN_CONTROL,
>  		.size		= 16,
> @@ -518,7 +510,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
> -		.name		= "Power Line Frequency",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
>  		.size		= 2,
> @@ -530,7 +521,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_HUE_AUTO,
> -		.name		= "Hue, Auto",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_HUE_AUTO_CONTROL,
>  		.size		= 1,
> @@ -541,7 +531,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_EXPOSURE_AUTO,
> -		.name		= "Exposure, Auto",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_AE_MODE_CONTROL,
>  		.size		= 4,
> @@ -554,7 +543,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_EXPOSURE_AUTO_PRIORITY,
> -		.name		= "Exposure, Auto Priority",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_AE_PRIORITY_CONTROL,
>  		.size		= 1,
> @@ -564,7 +552,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_EXPOSURE_ABSOLUTE,
> -		.name		= "Exposure (Absolute)",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL,
>  		.size		= 32,
> @@ -576,7 +563,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
> -		.name		= "White Balance Temperature, Auto",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO_CONTROL,
>  		.size		= 1,
> @@ -587,7 +573,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_WHITE_BALANCE_TEMPERATURE,
> -		.name		= "White Balance Temperature",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_CONTROL,
>  		.size		= 16,
> @@ -599,7 +584,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
> -		.name		= "White Balance Component, Auto",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_CONTROL,
>  		.size		= 1,
> @@ -611,7 +595,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_BLUE_BALANCE,
> -		.name		= "White Balance Blue Component",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
>  		.size		= 16,
> @@ -623,7 +606,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_RED_BALANCE,
> -		.name		= "White Balance Red Component",
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
>  		.size		= 16,
> @@ -635,7 +617,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_FOCUS_ABSOLUTE,
> -		.name		= "Focus (absolute)",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_FOCUS_ABSOLUTE_CONTROL,
>  		.size		= 16,
> @@ -647,7 +628,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_FOCUS_AUTO,
> -		.name		= "Focus, Auto",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_FOCUS_AUTO_CONTROL,
>  		.size		= 1,
> @@ -658,7 +638,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_IRIS_ABSOLUTE,
> -		.name		= "Iris, Absolute",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_IRIS_ABSOLUTE_CONTROL,
>  		.size		= 16,
> @@ -668,7 +647,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_IRIS_RELATIVE,
> -		.name		= "Iris, Relative",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_IRIS_RELATIVE_CONTROL,
>  		.size		= 8,
> @@ -678,7 +656,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_ZOOM_ABSOLUTE,
> -		.name		= "Zoom, Absolute",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_ZOOM_ABSOLUTE_CONTROL,
>  		.size		= 16,
> @@ -688,7 +665,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_ZOOM_CONTINUOUS,
> -		.name		= "Zoom, Continuous",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
>  		.size		= 0,
> @@ -700,7 +676,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_PAN_ABSOLUTE,
> -		.name		= "Pan (Absolute)",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
>  		.size		= 32,
> @@ -710,7 +685,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_TILT_ABSOLUTE,
> -		.name		= "Tilt (Absolute)",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
>  		.size		= 32,
> @@ -720,7 +694,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_PAN_SPEED,
> -		.name		= "Pan (Speed)",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
>  		.size		= 16,
> @@ -732,7 +705,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_TILT_SPEED,
> -		.name		= "Tilt (Speed)",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
>  		.size		= 16,
> @@ -744,7 +716,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_PRIVACY,
> -		.name		= "Privacy",
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PRIVACY_CONTROL,
>  		.size		= 1,
> @@ -754,7 +725,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  	{
>  		.id		= V4L2_CID_PRIVACY,
> -		.name		= "Privacy",
>  		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
>  		.selector	= UVC_CT_PRIVACY_CONTROL,
>  		.size		= 1,
> @@ -1076,6 +1046,20 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  	return 0;
>  }
>  
> +static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
> +{
> +	const char *name;
> +
> +	if (map->name)
> +		return map->name;
> +
> +	name = v4l2_ctrl_get_name(map->id);
> +	if (name)
> +		return name;
> +
> +	return "Unknown Control";
> +}
> +
>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl,
>  	struct uvc_control_mapping *mapping,
> @@ -1089,7 +1073,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
>  	v4l2_ctrl->id = mapping->id;
>  	v4l2_ctrl->type = mapping->v4l2_type;
> -	strscpy(v4l2_ctrl->name, mapping->name, sizeof(v4l2_ctrl->name));
> +	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
> +		sizeof(v4l2_ctrl->name));
>  	v4l2_ctrl->flags = 0;
>  
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> @@ -2196,7 +2181,8 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  
>  	list_add_tail(&map->list, &ctrl->info.mappings);
>  	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
> -		map->name, ctrl->info.entity, ctrl->info.selector);
> +		uvc_map_get_name(map), ctrl->info.entity,
> +		ctrl->info.selector);
>  
>  	return 0;
>  }
> @@ -2214,7 +2200,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	if (mapping->id & ~V4L2_CTRL_ID_MASK) {
>  		uvc_dbg(dev, CONTROL,
>  			"Can't add mapping '%s', control id 0x%08x is invalid\n",
> -			mapping->name, mapping->id);
> +			uvc_map_get_name(mapping), mapping->id);
>  		return -EINVAL;
>  	}
>  
> @@ -2261,7 +2247,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  		if (mapping->id == map->id) {
>  			uvc_dbg(dev, CONTROL,
>  				"Can't add mapping '%s', control id 0x%08x already exists\n",
> -				mapping->name, mapping->id);
> +				uvc_map_get_name(mapping), mapping->id);
>  			ret = -EEXIST;
>  			goto done;
>  		}
> @@ -2272,7 +2258,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  		atomic_dec(&dev->nmappings);
>  		uvc_dbg(dev, CONTROL,
>  			"Can't add mapping '%s', maximum mappings count (%u) exceeded\n",
> -			mapping->name, UVC_MAX_CONTROL_MAPPINGS);
> +			uvc_map_get_name(mapping), UVC_MAX_CONTROL_MAPPINGS);
>  		ret = -ENOMEM;
>  		goto done;
>  	}
> @@ -2481,6 +2467,7 @@ static void uvc_ctrl_cleanup_mappings(struct uvc_device *dev,
>  	list_for_each_entry_safe(mapping, nm, &ctrl->info.mappings, list) {
>  		list_del(&mapping->list);
>  		kfree(mapping->menu_info);
> +		kfree(mapping->name);
>  		kfree(mapping);
>  	}
>  }
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index d780065f3716..74d862c358fd 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -40,7 +40,13 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  		return -ENOMEM;
>  
>  	map->id = xmap->id;
> -	memcpy(map->name, xmap->name, sizeof(map->name));
> +	/* Non standard control id. */
> +	if (v4l2_ctrl_get_name(map->id) == NULL) {
> +		map->name = kmemdup(xmap->name, sizeof(xmap->name),
> +				    GFP_KERNEL);
> +		if (!map->name)
> +			return -ENOMEM;
> +	}
>  	memcpy(map->entity, xmap->entity, sizeof(map->entity));
>  	map->selector = xmap->selector;
>  	map->size = xmap->size;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a26bbec8d37b..dc20021f7ee0 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -240,7 +240,7 @@ struct uvc_control_mapping {
>  	struct list_head ev_subs;
>  
>  	u32 id;
> -	u8 name[32];
> +	char *name;
>  	u8 entity[16];
>  	u8 selector;
>  
> 

