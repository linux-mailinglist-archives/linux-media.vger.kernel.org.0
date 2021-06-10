Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8483A320F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 19:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhFJRaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 13:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhFJRaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 13:30:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A638FC061574;
        Thu, 10 Jun 2021 10:28:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DADC28D4;
        Thu, 10 Jun 2021 19:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623346135;
        bh=sB/vPmsUpxNwX3o7X6dukEKBxTdhaGoLN9eEvahqVTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qw2KxzdqcoipsyoNzLGyrhmA9Vr6EGsXuUVG2KueYrN7FxLm2NKrm5fGktJV1ifT5
         DseUl+fluUP9G8uXvA+w22FpPoRX4kC/u1zxTR+rSSxUWjZt/c/K42eRQECv2rRGKe
         UfLJSplr1jokw/rZDegAZQBTeOe+LUF9dZVpmQmA=
Date:   Thu, 10 Jun 2021 20:28:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 16/22] media: uvcvideo: Return -EACCES to inactive
 controls
Message-ID: <YMJLxPgH756t+4qY@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-17-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-17-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:34AM +0100, Ricardo Ribalda wrote:
> If a control is inactive return -EACCES to let the userspace know that
> the value will not be applied automatically when the control is active
> again.

Isn't the device supposed to stall the control set in that case, with
the bRequestErrorCode set to "Wrong state", which uvc_query_ctrl()
translates to -EACCES already ? Could you elaborate on why this patch is
needed ?

> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 71 +++++++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index bcebf9d1a46f..d9d4add1e813 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1082,13 +1082,36 @@ static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
>  	return "Unknown Control";
>  }
>  
> +static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
> +				 struct uvc_control *ctrl,
> +				 struct uvc_control_mapping *mapping)
> +{
> +	struct uvc_control_mapping *master_map = NULL;
> +	struct uvc_control *master_ctrl = NULL;
> +	s32 val;
> +	int ret;
> +
> +	if (!mapping->master_id)
> +		return false;
> +
> +	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> +			   &master_ctrl, 0);
> +
> +	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> +		return false;
> +
> +	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +	if (ret < 0 || val == mapping->master_manual)
> +		return false;
> +
> +	return true;
> +}
> +
>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl,
>  	struct uvc_control_mapping *mapping,
>  	struct v4l2_queryctrl *v4l2_ctrl)
>  {
> -	struct uvc_control_mapping *master_map = NULL;
> -	struct uvc_control *master_ctrl = NULL;
>  	const struct uvc_menu_info *menu;
>  	unsigned int i;
>  
> @@ -1104,18 +1127,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> -	if (mapping->master_id)
> -		__uvc_find_control(ctrl->entity, mapping->master_id,
> -				   &master_map, &master_ctrl, 0);
> -	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> -		s32 val;
> -		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> -		if (ret < 0)
> -			return ret;

There's a small change in behaviour here, the driver used to return an
error, now it will ignore it. Is it intentional ?

> -
> -		if (val != mapping->master_manual)
> -				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> -	}
> +	if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>  
>  	if (!ctrl->cached) {
>  		int ret = uvc_ctrl_populate_cache(chain, ctrl);
> @@ -1638,25 +1651,37 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  	return 0;
>  }
>  
> -static int uvc_ctrl_find_ctrlidx(struct uvc_entity *entity,
> +static int uvc_ctrl_commit_error(struct uvc_video_chain *chain,
> +				 struct uvc_entity *entity,
>  				 struct v4l2_ext_controls *ctrls,
> -				 struct uvc_control *uvc_control)
> +				 struct uvc_control *err_control,
> +				 int ret)
>  {
>  	struct uvc_control_mapping *mapping;
>  	struct uvc_control *ctrl_found;
>  	unsigned int i;
>  
> -	if (!entity)
> -		return ctrls->count;
> +	if (!entity) {
> +		ctrls->error_idx = ctrls->count;
> +		return ret;
> +	}
>  
>  	for (i = 0; i < ctrls->count; i++) {
>  		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
>  				   &ctrl_found, 0);
> -		if (uvc_control == ctrl_found)
> -			return i;
> +		if (err_control == ctrl_found)
> +			break;
>  	}
> +	ctrls->error_idx = i;

I think this line should be moved after the next check.

> +
> +	/* We could not find the control that failed. */
> +	if (i == ctrls->count)
> +		return ret;
>  
> -	return ctrls->count;
> +	if (uvc_ctrl_is_inactive(chain, err_control, mapping))
> +		return -EACCES;
> +
> +	return ret;
>  }
>  
>  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> @@ -1679,8 +1704,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
>  done:
>  	if (ret < 0 && ctrls)
> -		ctrls->error_idx = uvc_ctrl_find_ctrlidx(entity, ctrls,
> -							 err_ctrl);
> +		ret = uvc_ctrl_commit_error(chain, entity, ctrls, err_ctrl,
> +					    ret);
>  	mutex_unlock(&chain->ctrl_mutex);
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
