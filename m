Return-Path: <linux-media+bounces-1984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 061AA80A74C
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0F9028159C
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFDB30340;
	Fri,  8 Dec 2023 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H+KptyXU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12182FB
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:26:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 951E1512;
	Fri,  8 Dec 2023 16:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702049131;
	bh=3rBadglg6jke8KYa4FSssJ8I2QNcKrXEQM8ydeIikXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+KptyXUV4JeSvRK4/MsJkGEL7px5JAW/gqhisgYJdihielJRRfY2TQ5pKCweECkH
	 gvNjpYTHj7+DlGFDjhuxtQEVlRoXQxdU4IsywRJODX0YoWdUZDoTVvHFE9xa4MxGsz
	 H825hqopI40tv9Hg6mtlc41wv7go7eS0gTtXwXaQ=
Date: Fri, 8 Dec 2023 17:26:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunke Cao <yunkec@google.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 08/11] media: uvcvideo: support
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Message-ID: <20231208152620.GI25616@pendragon.ideasonboard.com>
References: <20231201071907.3080126-1-yunkec@google.com>
 <20231201071907.3080126-9-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-9-yunkec@google.com>

Hi Yunke,

Thank you for the patch.

On Fri, Dec 01, 2023 at 04:18:59PM +0900, Yunke Cao wrote:
> Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
> It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v11:
> - No change.
> Changelog since v10:
> - Added Reviewed-by from Sergey.
> Changelog since v9:
> - Revert a change in v7 that causes v4l2-compliance failure:
> - In uvc_ioctl_g_ext_ctrls(), when v4l2_which is not V4L2_CTRL_WHICH_*_VAL,
> - treat it the same as cur instead of returning EINVAL. This is the existing
> - behavior.
> - The change in v7 of returning EINVAL fails the check in
> - v4l2-compliance/v4l2-test-controls.cpp#L834.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Address some comments.
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 64 +++++++++++++++++++++++++++-----
>  drivers/media/usb/uvc/uvc_v4l2.c |  7 +++-
>  drivers/media/usb/uvc/uvcvideo.h |  3 +-
>  3 files changed, 61 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index aae2480496b7..c073c2a02102 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1247,11 +1247,18 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	if (!ctrl)
>  		return -EINVAL;
>  
> -	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
> -		return -EACCES;
> -
> -	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
> -		return -EACCES;
> +	if (read) {
> +		if (ctrls->which == V4L2_CTRL_WHICH_MIN_VAL ||
> +		    ctrls->which == V4L2_CTRL_WHICH_MAX_VAL) {
> +			if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) ||
> +			    !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX))
> +				return -EINVAL;

Shouldn't this be

		if (ctrls->which == V4L2_CTRL_WHICH_MIN_VAL &&
		    !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
			return -EINVAL;

		if (ctrls->which == V4L2_CTRL_WHICH_MAX_VAL &&
		    !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX))
			return -EINVAL;

> +		} else if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> +			return -EACCES;

		if (ctrls->which == V4L2_CTRL_WHICH_CUR_VAL &&
		    !(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
			return -EACCES;

> +	} else {
> +		if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> +			return -EACCES;
> +	}
>  
>  	if (ioctl != VIDIOC_S_EXT_CTRLS || !mapping->master_id)
>  		return 0;
> @@ -1332,6 +1339,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
> +	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>  
>  	if (mapping->master_id)
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
> @@ -1981,6 +1991,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
>  				       struct uvc_control *ctrl,
>  				       struct uvc_control_mapping *mapping,
> +				       u32 v4l2_which,
>  				       struct v4l2_ext_control *xctrl)
>  {
>  	struct v4l2_queryctrl qc = { .id = xctrl->id };
> @@ -1990,28 +2001,59 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
>  	if (ret < 0)
>  		return ret;
>  
> -	xctrl->value = qc.default_value;
> +	switch (v4l2_which) {
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +		xctrl->value = qc.default_value;
> +		break;
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +		xctrl->value = qc.minimum;
> +		break;
> +	case V4L2_CTRL_WHICH_MAX_VAL:
> +		xctrl->value = qc.maximum;
> +		break;
> +	}
> +
>  	return 0;
>  }
>  
>  static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
>  					    struct uvc_control *ctrl,
>  					    struct uvc_control_mapping *mapping,
> +					    u32 v4l2_which,
>  					    struct v4l2_ext_control *xctrl)
>  {
> +	u32 flag, id;
>  	int ret;
>  
> +	switch (v4l2_which) {
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +		flag = UVC_CTRL_FLAG_GET_DEF;
> +		id = UVC_CTRL_DATA_DEF;
> +		break;
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +		flag = UVC_CTRL_FLAG_GET_MIN;
> +		id = UVC_CTRL_DATA_MIN;
> +		break;
> +	case V4L2_CTRL_WHICH_MAX_VAL:
> +		flag = UVC_CTRL_FLAG_GET_MAX;
> +		id = UVC_CTRL_DATA_MAX;
> +		break;
> +	}
> +
> +	if (!(ctrl->info.flags & flag) && flag != UVC_CTRL_FLAG_GET_DEF)
> +		return -EINVAL;
> +
>  	if (!ctrl->cached) {
>  		ret = uvc_ctrl_populate_cache(chain, ctrl);
>  		if (ret < 0)
>  			return ret;
>  	}
>  
> -	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_DEF, xctrl);
> +	return __uvc_ctrl_get_compound(mapping, ctrl, id, xctrl);
>  }
>  
>  int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> -			  struct v4l2_ext_control *xctrl)
> +			  struct v4l2_ext_control *xctrl, u32 v4l2_which)
>  {
>  	struct uvc_control *ctrl;
>  	struct uvc_control_mapping *mapping;
> @@ -2028,9 +2070,11 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>  
>  	if (uvc_ctrl_mapping_is_compound(mapping))
>  		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
> -						       xctrl);
> +						       v4l2_which, xctrl);
>  	else
> -		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
> +		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping,
> +						  v4l2_which, xctrl);
> +
>  
>  done:
>  	mutex_unlock(&chain->ctrl_mutex);
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index ff72caf7bc9e..352f62ef02f2 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1094,9 +1094,12 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  	if (ret < 0)
>  		return ret;
>  
> -	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
> +	switch (ctrls->which) {
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +	case V4L2_CTRL_WHICH_MAX_VAL:
>  		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -			ret = uvc_ctrl_get_boundary(chain, ctrl);
> +			ret = uvc_ctrl_get_boundary(chain, ctrl, ctrls->which);
>  			if (ret < 0) {
>  				ctrls->error_idx = i;
>  				return ret;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 11805b729c22..6fda40919e7f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -790,7 +790,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> -			  struct v4l2_ext_control *xctrl);
> +			  struct v4l2_ext_control *xctrl,
> +			  u32 v4l2_which);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  			   const struct v4l2_ext_controls *ctrls,

-- 
Regards,

Laurent Pinchart

