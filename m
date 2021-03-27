Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E1C34B6CD
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 12:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbhC0LX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 07:23:27 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41691 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230288AbhC0LX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 07:23:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q72HlxHWPMxedQ72KlW1mZ; Sat, 27 Mar 2021 12:23:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616844205; bh=UXUdad1A3LIb3XrwfGJ+XWxG+i+vlNJ9CZMvbfopaf0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CGfN8p/ewsUmfjEp2qYjZY14eV5oFlnqfwOq1K4dgS0A7eBZtSS5Uwf2/2CNSBrBC
         iSVszpFOBrDkBdR8Dn5bzLEi7g93aMQxnUAfspnnfUszTyCj+9x9JAHaBjHlzxDZgk
         +dYwHisvc3MZt2u6RGodbATCVearuLB5jJAiEUBfz54PR/2Y+4FW9bp6AiL6R9Qfjr
         4rZVGMrxlgACGfcJSPQAjoAe4vVr7ypHAH1c6C+34iKAiKQIrarrrNCddfuU4SJUtq
         XesVAJTyQ71NNpV5rEfYdBeEVBUOHVxDFWYxfB3sSbIbQGbC247RZH69wxkYqq2UBV
         g9nrpZjP90bCQ==
Subject: Re: [PATCH v9 16/22] media: uvcvideo: Return -EACCES to inactive
 controls
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-17-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <055c0479-21ba-77a2-369a-7a8dadbb61cc@xs4all.nl>
Date:   Sat, 27 Mar 2021 12:23:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326095840.364424-17-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGfbBmKFntFzRILlQyfSX4xisQjgrKEaPHeMb3qE0PHj6NQALETRa347GlbdsOoLoL64vC8tRhMhM5eMdZtsC2sFuq2JfSCObLAee/lllqZiZiOprg7e
 Ec5E/2IudgiqQfMBEohAd1xpdcsrCBLV6FDf1MWHkb7jIYmZX5tXb0IDXvPjjMXx947RPxEwVQ9oBfDn0htJAuFSRoGmf7VwT3AUZdj60flgg5xmnzmVXMOh
 P/DQ9Ama11V1WqTzs4DA00yHZxMc1mEL0jI4XYuZcFGvTjCDJ37URpQvBwH+buWYEoE4/DrrN3kwoN/6fn8amX9efgT7CoedFv/t/8vhG8aJB62I9yodarJY
 OvlJGFzAxvzOwMrh0b5D3ZuhyV2iThmgpJvkDCjex9lGLVskcSkJy6nDYkOuW49SXk4CzWV7
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/03/2021 10:58, Ricardo Ribalda wrote:
> If a control is inactive return -EACCES to let the userspace know that
> the value will not be applied automatically when the control is active
> again.
> 
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

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
> 

