Return-Path: <linux-media+bounces-1977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656980A6FD
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CAD51F2148F
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990DF23769;
	Fri,  8 Dec 2023 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XlnpxSrN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1951219BB
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:12:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84D00512;
	Fri,  8 Dec 2023 16:12:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702048326;
	bh=fFWdG19voDBRxZ1iLuayJ8WWh7J+bGXlhLuYpeFjJyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XlnpxSrNRCMUc7d+ZUi6/jnEQLdeTayJimFm1HHKCbE6no4dTCTcoSlRyL0MYEVcH
	 b1SfMFOp5uG8dnHHBADk7itk/p1eYwqGdWG0xMQM/AFgB7qyboNljQNPHMUlfXlcnN
	 qp2p/TKQTrfDDWBzvsRhzUBcgXxtCBQ/4WdHZ7sQ=
Date: Fri, 8 Dec 2023 17:12:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunke Cao <yunkec@google.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
Message-ID: <20231208151255.GD12450@pendragon.ideasonboard.com>
References: <20231201071907.3080126-1-yunkec@google.com>
 <20231201071907.3080126-4-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-4-yunkec@google.com>

Hi Yunke,

Thank you for the patch.

On Fri, Dec 01, 2023 at 04:18:54PM +0900, Yunke Cao wrote:
> Refactor uvc_ctrl to make adding compound control easier.
> 
> Currently __uvc_ctrl_get() only work for non-compound controls.
> Move the logic into __uvc_ctrl_std(), return error for compound
> controls.
> 
> Make __uvc_ctrl_get() call __uvc_ctrl_std() inside. Also modify some of the
> callers of __uvc_ctrl_get() to call __uvc_ctrl_get_std() instead.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v12:
> - No change.
> Changelog since v11:
> - Minor change to avoid negative if statement.
> Changelog since v10:
> - Better commit message.
> Changelog since v9:
> - No change.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Newly added patch. Split the refactoring of uvc_ctrl_get from v7 3/7.
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 42 +++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 8d8333786333..4a685532f7eb 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1081,15 +1081,15 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
>  	return ret;
>  }
>  
> -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> -			  struct uvc_control *ctrl,
> -			  struct uvc_control_mapping *mapping,
> -			  s32 *value)
> +static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
> +			      struct uvc_control *ctrl,
> +			      struct uvc_control_mapping *mapping,
> +			      s32 *value)
>  {
>  	int ret;
>  
> -	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> -		return -EACCES;
> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		return -EINVAL;

This duplicates the check that you have added in multiple callers. With
the whole series applied, this function is called without a compound
check from uvc_ctrl_is_accessible() only. I think it would be better to
explicitly handle compound controls there. Even better possible, you
could check at driver initialization time that V4L2 master controls are
never compound controls.

>  
>  	ret = __uvc_ctrl_load_cur(chain, ctrl);
>  	if (ret < 0)
> @@ -1199,7 +1199,7 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
>  		return 0;
>  
> -	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +	ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
>  	if (ret >= 0 && val != mapping->master_manual)
>  		return -EACCES;
>  
> @@ -1264,8 +1264,13 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
>  				   &master_map, &master_ctrl, 0);
>  	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> -		s32 val;
> -		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +		s32 val = 0;
> +		int ret;
> +
> +		if (uvc_ctrl_mapping_is_compound(master_map))
> +			return -EINVAL;
> +
> +		ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -1532,7 +1537,8 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	if (ctrl == NULL)
>  		return;
>  
> -	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
> +	if (uvc_ctrl_mapping_is_compound(mapping) ||
> +	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
>  		changes |= V4L2_EVENT_CTRL_CH_VALUE;
>  
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> @@ -1703,7 +1709,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>  		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>  		s32 val = 0;
>  
> -		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
> +		if (uvc_ctrl_mapping_is_compound(mapping) ||
> +		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
>  			changes |= V4L2_EVENT_CTRL_CH_VALUE;
>  
>  		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
> @@ -1883,7 +1890,10 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  	if (ctrl == NULL)
>  		return -EINVAL;
>  
> -	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		return -EINVAL;
> +	else
> +		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
>  }
>  
>  static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
> @@ -2042,8 +2052,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  		       ctrl->info.size);
>  	}
>  
> -	mapping->set(mapping, value,
> -		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		return -EINVAL;
> +	else
> +		mapping->set(mapping, value,
> +			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));

This seems unrelated to the commit message.

> +
>  
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>  		ctrl->handle = handle;

-- 
Regards,

Laurent Pinchart

